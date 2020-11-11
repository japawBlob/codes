library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity audio_codec_controller is port(
	AClrn : in std_logic;
	audioClock : in std_logic;
	scl : out std_logic;
	sda : inout std_logic;
	stateOut : out integer range 0 to 7);
end audio_codec_controller;

architecture behavioral of audio_codec_controller is
	
	subtype	i2cDataType  is std_logic_vector(15 downto 0);
	constant LENGTH_OF_CODEC : integer := 11;
	type codecArray is array(0 to LENGTH_OF_CODEC) of i2cDataType;
 
    signal codec : codecArray := 
    ( (others=>'0'), -- 0 dummy data
	  (X"001F"),     -- 1 Left input volume is maximum
	  (X"021F"),     -- 2 Right input volume is maximum
	  (X"0479"),     -- 3 Left output volume is high
	  (X"0679"),      --4 -- Right output volume is high
	  (X"0810"),      --5, -- No sidetone, DAC: on, disable mic, line input to ADC: on
	  (X"0A06"),      --6, -- deemphasis to 48 KHz, enable high pass filter on ADC
	  (X"0C00"),      --7, -- no power down mode
	  (X"0E01"),      --8, -- MSB first, left-justified, slave mode
	  (X"1002"),      --9, -- 384 fs oversampling
	  (X"1201"),      --10, -- activate					  
	  (others=>'0')   --11 -- it should never occur
	); -- should never occur,

	signal muxSelect : integer range 0 to LENGTH_OF_CODEC+1;
	signal i2cData : i2cDataType := X"0000";
	signal i2cClock20KHz : std_logic := '0';
	constant DIV18m4to20khz : integer := 921; -- 18.421 Mhz to 20 kHz	
	signal i2cClockCounter : integer range 0 to DIV18m4to20khz := 0;
	
	signal i2cControllerData : std_logic_vector(23 downto 0);
	signal i2cRun,done,ack : std_logic;	
	
	signal incrementMuxSelect : std_logic := '0';
		
	type states is (resetState,transmit,checkAcknowledge,turnOffi2cControl,incrementMuxSelectBits,stop);
	signal currentState,nextState : states;	

COMPONENT I2C_Controller
	PORT
	(
		CLOCK		:	 IN STD_LOGIC;
		I2C_SCLK		:	 OUT STD_LOGIC;
		I2C_SDAT		:	 INOUT STD_LOGIC;
		I2C_DATA		:	 IN STD_LOGIC_VECTOR(23 DOWNTO 0);
		reset		:	 IN STD_LOGIC;
		start		:	 IN STD_LOGIC;
		done		:	 OUT STD_LOGIC;
		readWriteEnable		:	 IN STD_LOGIC;
		ACK		:	 OUT STD_LOGIC;
		SD_COUNTER		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		SDO		:	 OUT STD_LOGIC
	);
END COMPONENT;

begin
    
		-- 20 KHz i2c clock 
		process(audioClock,AClrn)
		begin
			if AClrn = '0' then
				i2cClockCounter <= 0;
				i2cClock20KHz <= '0';
			else
				if audioClock'event and audioClock = '1' then
						if i2cClockCounter < DIV18m4to20khz/2 then -- 1249 then
							i2cClock20KHz <= '0';
							i2cClockCounter <= i2cClockCounter + 1;
						elsif i2cClockCounter < DIV18m4to20khz then --2499 then
							i2cClock20KHz <= '1';
							i2cClockCounter <= i2cClockCounter + 1;
						else
							i2cClockCounter <= 0;
							i2cClock20KHz <= '0';
						end if;
				end if;
			end if;
		end process;
		
		-- mini FSM to send out right data to audio codec via i2c
		process(i2cClock20KHz)
		begin
			if i2cClock20KHz'event and i2cClock20Khz = '1' then
				currentState <= nextState;
			end if;
		end process;
				
		process(currentState,AClrn,muxSelect,done,ack)
		begin
			case currentState is
				when resetState =>										
					if AClrn = '0' then
						nextState <= resetState;
					else
						nextState <= transmit;
					end if;
					incrementMuxSelect <= '0';
					i2cRun <= '0';
					 
				when transmit =>
					if muxSelect >= LENGTH_OF_CODEC then					
						i2cRun <= '0';
						nextState <= stop;	
					else
						i2cRun <= '1';
						nextState <= checkAcknowledge;
					end if;		
					incrementMuxSelect <= '0';
					 
				when checkAcknowledge =>					
					if done = '1' then
						if ack = '0' then -- all the ACKs from codec better be low
							i2cRun <= '0';
							nextState <= turnOffi2cControl;
						else
							i2cRun <= '0';
							nextState <= transmit;
						end if;
					else					
						nextState <= checkAcknowledge;
					end if;					
					i2cRun <= '1';
					incrementMuxSelect <= '0';
					
				when turnOffi2cControl =>
					incrementMuxSelect <= '0';
					nextState <= incrementMuxSelectBits; 
					i2cRun <= '0';
 
				when incrementMuxSelectBits =>
					incrementMuxSelect <= '1';
					nextState <= transmit; 
					i2cRun <= '0';
 
				when stop =>
					nextState <= stop; -- don't need an others clause since all states have been accounted for
					i2cRun <= '0';
					incrementMuxSelect <= '0';					
 
			end case;
		end process;
		
		process(incrementMuxSelect,AClrn)
		begin
			if AClrn = '0' then
				muxSelect <= 0;
			else
				if incrementMuxSelect'event and incrementMuxSelect='1' then
					muxSelect <= muxSelect + 1;
				end if;				
			end if;
		end process;
		
		-- data to be sent to audio code obtained via a MUX
		-- the select bits for the MUX are obtained by the mini FSM above
		-- the 16-bit value for each setting can be found
		-- in table 29 and 30 on pp. 46-50 of the audio codec datasheet (on the DE1 system CD)

		i2cData <= codec(muxSelect);
					
		-- 0x34 is the base address of your device
		-- Refer to page 43 of the audio codec datasheet and the schematic
		-- on p. 38 of DE1 User's manual.  CSB is tied to ground so the 8-bit base address is
		-- b00110100 = 0x34.  		
		i2cControllerData <= X"34"&i2cData; 		
		
		-- instantiate i2c controller
		i2cController : i2c_controller port map (i2cClock20KHz,scl,sda,i2cControllerData,AClrn,i2cRun,done,'0',ack);
		
		-- User I/O
		with currentState select
			stateOut <= 0 when resetState,
						   1 when transmit,
							2 when checkAcknowledge,
							3 when turnOffi2cControl,
							4 when incrementMuxSelectBits,
							5 when stop;							
		
end behavioral;