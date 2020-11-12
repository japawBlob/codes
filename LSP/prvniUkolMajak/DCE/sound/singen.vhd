-- Library for A0B35SPS - Structures of Computers System
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;

ENTITY singen IS 
	PORT
	(   CLK :  IN  STD_LOGIC;
		ACLRN :  IN  STD_LOGIC;
		FREQ: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		Q :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END singen;

ARCHITECTURE rtl OF singen IS 

signal  q8 : std_logic_vector(7 downto 0);
    signal waveCounter : unsigned(4 downto 0);
   signal waveIX : integer range 0 to 15;
   signal sineWave0 : integer range -7 to 7;
   signal clk2 : std_logic;

BEGIN

process(clk, FREQ, ACLRN)

variable   cnt : integer range 0 to 31;
variable   f : integer range 0 to 31;
BEGIN 
		if ACLRN = '0' then
				-- Reset the counter to 0
				cnt := 0;
	    else
             if (rising_edge(CLK)) then
                    f:=to_integer(unsigned(FREQ))+1;             
			        if cnt>=f then cnt:=0; clk2<='1';
                    else cnt:=cnt+1; clk2<='0';
			        end if;
			 end if;
		end if;

END process;

	-- square wave address generator
	process(CLK2, ACLRN)
  	begin
		if ACLRN = '0' then
			waveCounter <= (others=>'0');
		else
			if CLK2'event and CLK2 = '1' then
				waveCounter <= waveCounter + 1;
		    end if;
		end if;
        waveIX <= to_integer(waveCounter(3 downto 0));
	end process;

with waveIX select  
  sineWave0  <= 0 when 0,
				1 when 1,
				3 when 2,
				4 when 3,
				5 when 4,
				6 when 5,
				7 when 6,
				7 when 7,
				7 when 8,
				7 when 9,
				7 when 10,
				6 when 11,
				5 when 12,
				4 when 13,
				3 when 14,
				1 when 15;
Q <= std_logic_vector(to_signed(sineWave0,4)) when wavecounter(4)='0' 
     else std_logic_vector(to_signed(-sineWave0,4)); 

END rtl;
 