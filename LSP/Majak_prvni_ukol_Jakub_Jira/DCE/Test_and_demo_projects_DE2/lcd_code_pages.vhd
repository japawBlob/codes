-- Display content of code page with possibility cycle trought pages by NEXT_PAGE
-----------------------------------------------------------------------------------------
-- * Educational Library * that highlights design principles of circuits,
-- Richard Susta, CTU in Prague, Faculty of Electrical Eng., Department of Control Eng.
-- Published under GNU General Public License 
------------------------------------------------------------------------------------------ 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lcd_code_pages is
	port (
	   CLOCK_50 : in std_logic;
		NEXT_PAGE : in std_logic; -- show next code page
		ACKN : in std_logic;  -- active in '1', a command was acknowledged
		ACLRN : in std_logic;  -- power-up clear, active in '0', connect to any KEY[x] on DE
		ADDRESS : out std_logic_vector(4 downto 0); -- address of LCD character
		DATA :  out std_logic_vector(7 downto 0); -- ASCII character; 
		CLEARN_CMD : out std_logic;
		RDYN : out std_logic;  -- output data are ready
		PAGE0, PAGE1, PAGE2 : out std_logic -- to display_code_page module
	);
end entity;

architecture rtl of lcd_code_pages is

begin
 CLEARN_CMD<='1'; -- not used
			
send_chars : 
process(ACLRN, CLOCK_50)
	variable counter : integer range 0 to 32;
	variable start_code : unsigned(2 downto 0);
	variable last_next_page : std_logic;
	variable vrdyn : std_logic;
	begin 
   	if ACLRN='0' then 
		    counter:=0; start_code:="001"; -- space character
			 last_next_page:='1'; -- code rising edge detection
			 vrdyn:='1';
		elsif rising_edge(CLOCK_50) then 
          -- rising edge  of NEXT_PAGE detection in code with the aid of comparing with last value
		   if last_next_page='0' and NEXT_PAGE='1' then 
			 --- the rising edge was detected  
				counter:=0; 
				if start_code<7 then start_code:=start_code+1;
				else start_code:="000";
				end if;
				
		   elsif vrdyn='1' and ACKN='1' then 
				if(counter<32) then
				   DATA(4 downto 0)<=std_logic_vector(to_unsigned(counter,5));
				   DATA(7 downto 5)<=std_logic_vector(start_code);
				   ADDRESS<=std_logic_vector(to_unsigned(counter,5));
					counter:=counter+1;
					vrdyn:='0';
				end if;
			elsif vrdyn='0' and ACKN='0' then
			   vrdyn:='1';
			end if;
			-- update variable for rising edge detection
			last_next_page:=NEXT_PAGE;
		end if;
		RDYN<=vrdyn;
		PAGE0<=start_code(0); PAGE1<=start_code(1); PAGE2<=start_code(2);
end process;	

end architecture;
