-- Library for A0B35SPS - Structures of Computers System
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License

-- Module de2beep750Hz generates sound 750 Hz
-- ACLRN = 1 SoundON=1 enable sound, otherwise sound is disabled
-- ACLRN = 0 SoundOn=X  initilize
-- Other pins correspond to DE2 assignments 
-- The pins can be created by right-mouse on de2beeper and selection 
-- and selection "Generates Pins for Symbol Ports"
-- see de2beep750HzDemo 

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY de2beep750Hz IS 
	PORT
	(
		AUD_ADCDAT :  IN  STD_LOGIC;
		CLOCK_50 :  IN  STD_LOGIC;
		ACLRN :  IN  STD_LOGIC;
		SoundON :  IN  STD_LOGIC;
		I2C_SDAT :  INOUT  STD_LOGIC;
		AUD_ADCLRCK :  OUT  STD_LOGIC;
		AUD_DACLRCK :  OUT  STD_LOGIC;
		AUD_DACDAT :  OUT  STD_LOGIC;
		AUD_XCK :  OUT  STD_LOGIC;
		AUD_BCLK :  OUT  STD_LOGIC;
		I2C_SCLK :  OUT  STD_LOGIC
	);
END de2beep750Hz;

ARCHITECTURE structural OF de2beep750Hz IS 

COMPONENT de2beeper IS 
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
END COMPONENT;


begin

inst_de2beeper : de2beeper
PORT MAP(AUD_ADCDAT,	CLOCK_50, ACLRN, SoundON, I2C_SDAT, "0001",
			AUD_ADCLRCK,AUD_DACLRCK,AUD_DACDAT,AUD_XCK,AUD_BCLK,I2C_SCLK);

END ARCHITECTURE structural;