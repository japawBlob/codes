-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------
-- Version 1.1 of output register for DE2-115 board

library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGApackage.all;
use work.MUXpackage.all;

entity LCDRegPipeline is
port(	MuxAddress_in : in muxaddress_t;
	   VGA_R1_in, VGA_G1_in, VGA_B1_in: in vga_byte:=(others=>'0');--  8bit color information channel 1
		VGA_R2_in, VGA_G2_in, VGA_B2_in: in vga_byte:=(others=>'0');--  8bit color information channel 2	    	    

		LCD_CLK_g    : in std_logic:='0';
		LCD_DEN_g: in std_logic:='0'; -- '0' if vertical synchronization puls 
	    
      MuxAddress : out muxaddress_t;
		VGA_R1, VGA_G1, VGA_B1: out vga_byte:=(others=>'0');--  8bit color information channel 1
		VGA_R2, VGA_G2, VGA_B2: out vga_byte:=(others=>'0');--  8bit color information channel 2
		LCD_CLK,    
		LCD_DEN   : out std_logic -- '0' if vertical synchronization puls 
	 );
end;

architecture rtl of LCDRegPipeline is
begin


  reg:process(LCD_CLK_g)
  begin
-- All input signal are registered on the rising edge of CLOCK_50 when VGA_CLK_in=0
-- because xcolumn a yrow are changed by VGAgenerator at this moment .
   if falling_edge(LCD_CLK_g) then
----------------------------------------------------------------------------   
			MuxAddress<=MuxAddress_in;
			VGA_R1<=VGA_R1_in;  VGA_G1<=VGA_G1_in; VGA_B1<=VGA_B1_in;
			VGA_R2<=VGA_R2_in;  VGA_G2<=VGA_G2_in; VGA_B2<=VGA_B2_in;
					
			LCD_DEN<=LCD_DEN_g; 
-----------------------------------------------------------------------------
	end if;
	
	LCD_CLK<=LCD_CLK_g;

	end process;
    
end architecture rtl;