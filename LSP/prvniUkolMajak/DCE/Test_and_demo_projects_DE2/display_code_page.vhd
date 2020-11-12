-------------------------------------------------------
-- Auxiliary file for LCD demo - it displays selected code page range by hexadecimal numbers
-- For example: code page 20-3F is displayed as 20 3F
-----------------------------------------------------------------------------------------
-- * Educational Library * that highlights design principles of circuits,
-- Richard Susta, CTU in Prague, Faculty of Electrical Eng., Department of Control Eng.
-- Published under GNU General Public License 
-----------------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
ENTITY display_code_page IS 
	PORT( A0, A1, A2:IN STD_LOGIC; -- 
		   HEX0, HEX1, HEX2, HEX3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0) );-- HEXi[6..0] output to 7 segment display
END;

architecture Behavioral of display_code_page IS
-------------------------------------------------
-- conversion function between std_logic_vector(3 downto 0) nad hex display digit
function tohex(code:std_logic_vector) return std_logic_vector is
type hexarray_t is array(0 to 15) of std_logic_vector(6 downto 0);
constant hexarray : hexarray_t := 
             ("1000000","1111001","0100100","0110000",
				  "0011001","0010010","0000010","1111000",
				  "0000000","0010000","0001000","0000011",
				  "1000110","0100001","0000110","0001110");
variable result : std_logic_vector(6 downto 0);
variable index : integer range 0 to 15;
begin 
   index:=to_integer(unsigned(code)); -- conversion to integer
   result:=hexarray(index);
	return result;
end function;
--------------------------------------------------
begin	
---- end hex code of selected code page	
	HEX0 <= tohex("1111"); -- F
	HEX1 <= tohex(A2 & A1 & A0 & '1');
	
---- start hex code of selected code page	
	HEX2 <= tohex("0000"); -- 0
	HEX3 <= tohex(A2 & A1 & A0 & '0');
end Behavioral;