-- Display content of external memory on textual 2x16 LCD display
-----------------------------------------------------------------------------------------
-- * Educational Library * that highlights design principles of circuits,
-- Richard Susta, CTU in Prague, Faculty of Electrical Eng., Department of Control Eng.
-- Published under GNU General Public License 
-----------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lcd_write_rom_controller is
	port (
	   CLOCK_50 : in std_logic;
		ACKN : in std_logic;  -- active in '1', a command was acknowledged
		ACLRN : in std_logic;  -- power-up clear, active in '0', connect to any KEY[x] on DE
		ADDRESS : out std_logic_vector(4 downto 0); -- address of ROM
		CLEARN_CMD : out std_logic;
		RDYN : out std_logic  -- output data are ready
	);
end entity;

architecture rtl of lcd_write_rom_controller is

begin
    CLEARN_CMD<='1'; -- it is always not active for 
			
send_chars : 
process(ACLRN, CLOCK_50)
	variable counter : integer range 0 to 32;
	variable vrdyn, vrdyn_next : std_logic;
	begin 
   	if ACLRN='0' then 
		    counter:=0; vrdyn:='1'; vrdyn_next:='1'; -- initilize after power up
		elsif rising_edge(CLOCK_50) then 
		      vrdyn:=vrdyn_next;
            if vrdyn='1' and ACKN='1' then 
				   if(counter<32) then
					   -- output address
						ADDRESS<=std_logic_vector(to_unsigned(counter,ADDRESS'LENGTH));
						-- output data
					   counter:=counter+1; -- increment counter variable AFTER sending ADDRESS to output
					   vrdyn_next:='0'; -- announce RDY
				   end if;
			   elsif vrdyn='0' and ackn='0' then
			      vrdyn_next:='1'; -- deacctivate RDYN
			   end if;
		end if;
		RDYN<=vrdyn; --  RDYN signal
end process;	


end architecture;
