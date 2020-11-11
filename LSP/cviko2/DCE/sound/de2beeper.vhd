-- Library for A0B35SPS - Structures of Computers System
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License

-- Module de2beeper generates sound with sekectable frequenct
-- ACLRN = 1 SoundON=1 enable sound, otherwise sound is disabled
-- ACLRN = 0 SoundOn=X  initilize
-- Divider1500Hz - divider of base frequency 1500Hz - output sound is 1500/(Divider1500Hz_input_value+1)
-- /15=94Hz, /14=100 Hz, /13=107Hz... /6=214Hz, /5=250Hz,  /4=300Hz, /3=375Hz, /2=500Hz, /1=750Hz, /0=1500 Hz
-- Other pins correspond to DE2 assignments 

-- The pins can be created by right-mouse on de2beeper and selection 
-- and selection "Generates Pins for Symbol Ports"
-- see de2beepDemo 



LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY de2beeper IS 
	PORT
	(
		AUD_ADCDAT :  IN  STD_LOGIC;
		CLOCK_50 :  IN  STD_LOGIC;
		ACLRN :  IN  STD_LOGIC;
		SoundON :  IN  STD_LOGIC;
		I2C_SDAT :  INOUT  STD_LOGIC;
		Divider1500Hz :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		AUD_ADCLRCK :  OUT  STD_LOGIC;
		AUD_DACLRCK :  OUT  STD_LOGIC;
		AUD_DACDAT :  OUT  STD_LOGIC;
		AUD_XCK :  OUT  STD_LOGIC;
		AUD_BCLK :  OUT  STD_LOGIC;
		I2C_SCLK :  OUT  STD_LOGIC
	);
END de2beeper;

ARCHITECTURE bdf_type OF de2beeper IS 

COMPONENT adc_dac_controller
	PORT(ACLRN : IN STD_LOGIC;
		 selectAdcData : IN STD_LOGIC;
		 audioClock : IN STD_LOGIC;
		 adcData : IN STD_LOGIC;
		 leftDataIn : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 rightDataIn : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 bitClock : OUT STD_LOGIC;
		 adcLRSelect : OUT STD_LOGIC;
		 dacLRSelect : OUT STD_LOGIC;
		 dacData : OUT STD_LOGIC;
		 dataInClock : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT audio_codec_controller
	PORT(AClrn : IN STD_LOGIC;
		 audioClock : IN STD_LOGIC;
		 sda : INOUT STD_LOGIC;
		 scl : OUT STD_LOGIC;
		 stateOut : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT clockgenerator
	PORT(ACLRN : IN STD_LOGIC;
		 Clock_50 : IN STD_LOGIC;
		 AudioClock : OUT STD_LOGIC;
		 Delayed_Clrn : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT singen
	PORT(CLK : IN STD_LOGIC;
		 ACLRN : IN STD_LOGIC;
		 FREQ : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	aclrn_signal :  STD_LOGIC;
SIGNAL	delayedAclrn :  STD_LOGIC;
SIGNAL	f18_432MHz :  STD_LOGIC;
SIGNAL	f48kHz :  STD_LOGIC;
SIGNAL	sinGenOutput :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	soundOnNeg :  STD_LOGIC;


BEGIN 

soundOnNeg <= NOT(SoundON);

b2v_inst_adcDacController : adc_dac_controller
PORT MAP(ACLRN => delayedAclrn,
		 selectAdcData => soundOnNeg,
		 audioClock => f18_432MHz,
		 adcData => AUD_ADCDAT,
		 leftDataIn => sinGenOutput,
		 rightDataIn => sinGenOutput,
		 bitClock => AUD_BCLK,
		 adcLRSelect => AUD_ADCLRCK,
		 dacLRSelect => AUD_DACLRCK,
		 dacData => AUD_DACDAT,
		 dataInClock => f48kHz);


b2v_inst_audioCodecController : audio_codec_controller
PORT MAP(AClrn => aclrn_signal,
		 audioClock => f18_432MHz,
		 sda => I2C_SDAT,
		 scl => I2C_SCLK);


b2v_inst_clockGenrator : clockgenerator
PORT MAP(ACLRN => aclrn_signal,
		 Clock_50 => CLOCK_50,
		 AudioClock => f18_432MHz,
		 Delayed_Clrn => delayedAclrn);


b2v_inst_sinGen : singen
PORT MAP(CLK => f48kHz,
		 ACLRN => aclrn_signal,
		 FREQ => Divider1500Hz,
		 Q => sinGenOutput);

aclrn_signal <= ACLRN;
AUD_XCK <= f18_432MHz;

END bdf_type;