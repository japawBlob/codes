-- Display characters with codes from 64 ('@') to 95 on textual 2x16 LCD display
-- with the possibility to send clear command after the first line 
--  It demonstrates the full integration of clear command with writing characters
-----------------------------------------------------------------------------------------
-- * Educational Library * that highlights design principles of circuits,
-- Richard Susta, CTU in Prague, Faculty of Electrical Eng., Department of Control Eng.
-- Published under GNU General Public License 
-----------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lcd_write_64to95 is
	port (
	   CLOCK_50 : in std_logic; -- 50 MHz clock
		EDNLESS_LOOP : in std_logic;
		CLEAR_TEST : in std_logic;
		ACKN : in std_logic;  -- active in '1', a command was acknowledged
		ACLRN : in std_logic;  -- power-up clear, active in '0', 
		                       -- it can be connected to any KEY[x] on DE2 board, 
									  -- or to ACLRN_OUT output of LCD_controller
		ADDRESS : out std_logic_vector(4 downto 0); -- address of LCD character
		DATA :  out std_logic_vector(7 downto 0); -- ASCII character; 
		CLEARN_CMD: out std_logic; 
		RDYN : out std_logic  -- output data are ready
		
	);
end entity;

architecture rtl of lcd_write_64to95 is

begin
			
send_chars : 
process(ACLRN, CLOCK_50)
	variable counter : integer range 0 to 32;
	variable vrdyn, vclrn : std_logic;
	constant FIRST_CHAR : integer:=64;
	variable clear_test_done : boolean;
	begin 
   	if ACLRN='0' then 
		    counter:=0; vclrn:='1'; vrdyn:='0'; clear_test_done:=false; -- initilize after power up
			 ADDRESS<=(others=>'0'); DATA<=(others=>'0');
		elsif rising_edge(CLOCK_50) then 
			if vrdyn='1' and ACKN='1' then 
				if CLEAR_TEST='1' and counter=16 and not clear_test_done then
					clear_test_done:=true;
					vclrn:='0'; -- send clear command
					vrdyn:='0'; -- activate data READY
				elsif counter<32 then 
					-- output data and address
					vclrn:='1'; -- write adress-data
					ADDRESS<=std_logic_vector(to_unsigned(counter,ADDRESS'LENGTH));
					DATA<=std_logic_vector(to_unsigned(counter+FIRST_CHAR,DATA'LENGTH));
					vrdyn:='0'; -- activate data READY
					-- we increment variable counter AFTER assigning address and data to assure set up times
					counter:=counter+1;
	         -- if EDNLESS_LOOP='0' then the text is sent only once
           	elsif EDNLESS_LOOP='1' then 
			      counter:=0;	clear_test_done:=false; -- run all again
				end if;
			elsif vrdyn='0' and ACKN='0' then
				vrdyn:='1'; -- deactivate ready
			end if;
		end if;
		RDYN<=vrdyn; -- set RDYN signal
		CLEARN_CMD <= vclrn;
end process;	


end architecture;
