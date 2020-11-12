-- Display static text on on textual 2x16 LCD display
-----------------------------------------------------------------------------------------
-- * Educational Library * that highlights design principles of circuits,
-- Richard Susta, CTU in Prague, Faculty of Electrical Eng., Department of Control Eng.
-- Published under GNU General Public License 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- Display text on textual 2x16 LCD display
entity lcd_text is
   generic( line1 : string:="0123456789ABCDEF";
		     line2 : string:="GHIJKLMNOPQRSTUV"	
	        ); 
	port (
	   CLOCK_50 : in std_logic;
		ACKN : in std_logic;  -- active in '1', a command was acknowledged
		ACLRN : in std_logic;  -- power-up clear, active in '0', 
		                       -- it can be connected to any KEY[x] on DE2 board, 
									  -- or to ACLRN_OUT output of LCD_controller
		ADDRESS : out std_logic_vector(4 downto 0); -- address of LCD character
		DATA :  out std_logic_vector(7 downto 0); -- ASCII character; 
		CLEARN_CMD : out std_logic; -- we do not use, so it is always in '1'
		RDYN : out std_logic  -- output data are ready
	);
end entity;

architecture rtl of lcd_text is
begin
   CLEARN_CMD<='1'; -- we do not use this command in this module.
			
read_text : process(CLOCK_50, ACLRN)
variable counter, ixchar : integer range 0 to 32; 
variable vrdyn:std_logic;
begin 
 	if ACLRN='0' then 
	   counter:=0;	vrdyn:='0';
   elsif rising_edge(CLOCK_50) then
     if vrdyn='1' and ACKN='1' then      
			if counter<16 then 
			   --VHDL string begin with index 1
				DATA <=  std_logic_vector(to_unsigned(character'pos(line1(counter+1)),8));
	      else 
			   ixchar:=counter-16+1;
			   DATA <=  std_logic_vector(to_unsigned(character'pos(line2(ixchar)),8));
			end if; 
		   ADDRESS<=std_logic_vector(to_unsigned(counter,5));
			if counter<32 then 
			   counter:=counter+1; -- increment AFTER sending data and address
			   vrdyn:='0';
			end if;
		elsif vrdyn='0' and ACKN='0' then
			   vrdyn:='1';
		end if;
	end if;
   RDYN<=vrdyn;	
end process;	

end architecture;
