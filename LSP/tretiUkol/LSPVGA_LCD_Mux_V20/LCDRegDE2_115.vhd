-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.VGApackage.all;


entity LCDRegDE2_115 is 
port (
	R,G,B : IN vga_byte; -- input colors
	LCD_CLK_in, LCD_DEN_in : in std_logic;   -- inputs of LCD controller signals
	ACLRN_in : IN std_logic; -- input of Asynchronous clear negative 
	
	LCD_R, LCD_G, LCD_B : OUT std_logic_vector(5 downto 0);	-- output 6-bit colors
	LCD_CLK, LCD_DEN, LCD_DIM : OUT std_logic   
	-- signals fro LCD controller, pixel-clock, data-enable, dim = backlight on
);
end LCDRegDE2_115;


architecture driver of LCDRegDE2_115 is

signal pllreset : std_logic;

-- used only for the conversion of 8-bit colors to 6-bit colors
subtype RC is std_logic_vector(vga_byte'LEFT downto (vga_byte'LEFT-LCD_R'LENGTH+1));

constant ZERO : std_logic_vector(LCD_R'RANGE) := (others=>'0');

begin
	
   LCD_CLK <= LCD_CLK_in;
	
	process(LCD_CLK_in, ACLRN_in)
	begin
		
      if ACLRN_in='0' then 
		   LCD_DEN<='0'; LCD_R <= ZERO; LCD_G <= ZERO; LCD_B <= ZERO;
			LCD_DIM<='0';
		elsif (falling_edge(LCD_CLK_in)) then
	      LCD_DIM <= '1'; -- backlight ON	
			if LCD_DEN_in='1' then -- data enable
				LCD_R <= R(RC'Range);
				LCD_G <= G(RC'Range);
				LCD_B <= B(RC'Range);
			else 
				LCD_R <= ZERO;
				LCD_G <= ZERO;
				LCD_B <= ZERO;
			end if;
			LCD_DEN <= LCD_DEN_in;
		end if;
	end process;
	
end architecture driver;