-------------------------------------------------------
-- Display hexadecimal number on 7segment display
-----------------------------------------------------------------------------------------
-- * Educational Library * that highlights design principles of circuits,
-- Richard Susta, CTU in Prague, Faculty of Electrical Eng., Department of Control Eng.
-- Published under GNU General Public License 
-----------------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY to7segment IS 
	PORT( A0, A1, A2, A3 :IN STD_LOGIC; -- A3.. A0 input hexadecimal number A3-MSB  A0-lSB
		   hex: OUT STD_LOGIC_VECTOR(6 DOWNTO 0) );-- HEX[6..0] output to 7 segment display
END to7segment;

architecture Behavioral of to7segment IS
BEGIN
	-- 7segment led is on when its input = '0'
	with STD_LOGIC_VECTOR'(A3 & A2 & A1 & A0) SELECT
	hex  <=	"1000000" WHEN "0000",		-- 0
				"1111001" WHEN "0001",		-- 1
				"0100100" WHEN "0010", 		-- 2
				"0110000" WHEN "0011", 		-- 3
				"0011001" WHEN "0100",		-- 4
				"0010010" WHEN "0101", 		-- 5
				"0000010" WHEN "0110", 		-- 6
				"1111000" WHEN "0111",		-- 7
				"0000000" WHEN "1000", 		-- 8
				"0010000" WHEN "1001",		-- 9
				"0001000" WHEN "1010",		-- A
				"0000011" WHEN "1011",		-- b
				"1000110" WHEN "1100",		-- C
				"0100001" WHEN "1101",		-- d
				"0000110" WHEN "1110",		-- E
				"0001110" WHEN others;		-- for F "1111"
END Behavioral;