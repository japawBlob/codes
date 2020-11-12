-- Quartus II VHDL Template Basic

library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGApackage.all;
use work.MUXpackage.all;

entity VideoMuxSwitch is
	port 
	(   MuxAddress : muxaddress_t; -- selection of switch effect
	    R1, G1, B1, R2, G2, B2: in vga_byte;
       VGA_R, VGA_G, VGA_B: out vga_byte -- output of RGB colors
	);

end entity;


architecture dataflow of VideoMuxSwitch is
   
begin

	with MuxAddress select 
     VGA_R <= R1 when MUX_ADDR0,
              R2 when others;
	with MuxAddress select 
     VGA_G <= G1 when MUX_ADDR0,
              G2 when others;
	with MuxAddress select 
     VGA_B <= B1 when MUX_ADDR0,
     B2 when others;
 		
		
end architecture;

