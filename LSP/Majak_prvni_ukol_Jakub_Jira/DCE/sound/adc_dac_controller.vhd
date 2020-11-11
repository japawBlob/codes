library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adc_dac_controller is port (
		ACLRN : in std_logic;
		selectAdcData : in std_logic; -- connected to SW(9), default (down) means sine on lineout.  up is ADC-DAC loopback
		audioClock : in std_logic; -- 18.432 MHz sample clock
		bitClock : out std_logic;
		adcLRSelect : out std_logic;
		dacLRSelect : out std_logic;
		adcData : in std_logic;
		dacData : out std_logic;
		leftDataIn:in std_logic_vector(3 downto 0);
		rightDataIn:in std_logic_vector(3 downto 0);
		dataInClock:out std_logic);
		
end entity;

architecture behavioral of adc_dac_controller is
	signal internalBitClock : std_logic := '0';
	signal bitClockCounter : integer range 0 to 255;
	
	signal internalLRSelect : std_logic := '0';
	signal LRCounter : integer range 0 to 31; 
	signal leftOutCounter : integer range 0 to 15 :=15;
	signal rightOutCounter : integer range 0 to 15 :=15;
	
	-- ADC,DAC data registers
	signal adcDataLeftChannelRegister, adcDataRightChannelRegister: std_logic_vector(15 downto 0);
	signal dacDataLeftChannelRegister ,dacDataRightChannelRegister : std_logic_vector(15 downto 0);
			
	
	
begin
	-- generate bit clock
	-- we have an 18.432 MHz reference clock (refer to audio codec datasheet, this is the required frequency)
	-- we need to shift out 16 bits, 2 channels at 48 KHz.  Hence, the count value for flipping the clock bit is
	-- count = 18.432e6/(48000*16*2) - 1 = 11 (approx)
	
	process(audioClock,ACLRN)
	begin
		if ACLRN = '0' then
			bitClockCounter <= 0;
			internalBitClock <= '0';
		else
			if audioClock'event and audioClock = '1' then
				if bitClockCounter < 5 then					
					internalBitClock <= '0'; 
					bitClockCounter <= bitClockCounter + 1;
				elsif bitClockCounter >= 5 and bitClockCounter < 11 then
					internalBitClock <= '1'; 
					bitClockCounter <= bitClockCounter + 1;
				else
					internalBitClock <= '0'; 
					bitClockCounter <= 0;
				end if;
			end if;
		end if;
	end process;
	bitClock <= internalBitClock;
	

	
	-- generate LeftRight select signals 
	-- flip every 16 bits, starting on NEGATIVE edge
	process(internalBitClock,ACLRN)
	begin
		if ACLRN = '0' then					
			dacDataLeftChannelRegister <= X"0000";
			dacDataRightChannelRegister <= X"0000";
			LRCounter <= 0;
			internalLRSelect <= '0'; -- should start at low, fig. 26 on p. 33 of audio codec datasheet
			leftOutCounter <= 15;
			rightOutCounter <= 15;
		else
			if internalBitClock'event and internalBitClock = '0' then -- flip on negative edge								
				if LRCounter < 16 then	
					internalLRSelect <= '1';
					LRCounter <= LRCounter + 1;
					leftOutCounter <= leftOutCounter - 1;
					rightOutCounter <= 15;
			--		dataCount <= '0';
			        dataInClock<='0';					
				elsif LRCounter >= 16 and LRCounter < 32 then
					internalLRSelect <= '0';
					LRCounter <= LRCounter + 1;
			--		dataCount <= '0';
					leftOutCounter <= 15;
					rightOutCounter <= rightOutCounter - 1;
			        dataInClock<='1';					
					if LRCounter = 31 then
						LRCounter <= 0;
				        if leftDataIn(3)='1' then dacDataLeftChannelRegister <= (leftDataIn & X"FFF"); 
					       else dacDataLeftChannelRegister <=  (leftDataIn & X"000");
					    end if;
				        if rightDataIn(3)='1' then dacDataRightChannelRegister <= (rightDataIn & X"FFF"); 
					       else dacDataRightChannelRegister <=  (rightDataIn & X"000");
					    end if;
					end if;									
				end if;
			end if;
		end if;
	end process;

	adcLRSelect <= internalLRSelect;
	dacLRSelect <= internalLRSelect;
	
	-- sample adc data
	process(internalBitClock,ACLRN,internalLRSelect)
	begin
		if ACLRN = '0' then
			adcDataLeftChannelRegister <= X"0000";
			adcDataRightChannelRegister <= X"0000";
		else
			if internalBitClock'event and internalBitClock = '1' then
				if internalLRSelect = '1' then
					adcDataLeftChannelRegister(15 downto 0) <= adcDataLeftChannelRegister(14 downto 0) & adcData;
				else
					adcDataRightChannelRegister(15 downto 0) <= adcDataRightChannelRegister(14 downto 0) & adcData;
				end if;
			end if;
		end if;
	end process;
	
	
	-- dac data output
	process(internalBitClock,ACLRN,internalLRSelect)
	begin
		if ACLRN = '0' then
			 dacData <= '0';			 
		else
			-- start on falling edge of bit clock
			if internalBitClock'event and internalBitClock = '0' then 
				if internalLRSelect = '1' then		
					if selectAdcData = '1' then
						-- remember, you need to send MSb first.  So, we start at bit 15
						dacData <= adcDataLeftChannelRegister(leftOutCounter);
					else
						dacData <= dacDataRightChannelRegister(leftOutCounter);															
					end if;
				else
					if selectAdcData = '1' then
						dacData <= adcDataLeftChannelRegister(rightOutCounter);
					else
						dacData <= dacDataRightChannelRegister(rightOutCounter);														
					end if;
				end if;
			end if;
		end if;
	 end process;
	 
end behavioral;