-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------
-- Version 1.1 of output register for DE2 and DE2-115 board

library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGApackage.all;
use work.MUXpackage.all;

entity VGARegPipeline is
port(	 
	     MuxAddress_in : in muxaddress_t;
	     
	     VGA_R1_in, VGA_G1_in, VGA_B1_in: in vga_byte:=(others=>'0');--  8bit color information channel 1
         VGA_R2_in, VGA_G2_in, VGA_B2_in: in vga_byte:=(others=>'0');--  8bit color information channel 2	    	    

	     yrow_g, xcolumn_g : in vga_xy := VGA_XY_ZERO; -- pixel index
		 VGA_CLK_g    : in std_logic:='0'; 
		 VGA_BLANK_g,  -- '0' if non-visible part of picture
		 VGA_HS_g,     -- '0' if horizontal synchronization puls
		 VGA_VS_g,     -- '0' if vertical synchronization puls 
		 VGA_SYNC_g : in std_logic := '1';
         CLOCK_50 : in std_logic:='0';		 
	    
       MuxAddress : out muxaddress_t;
		 VGA_R1, VGA_G1, VGA_B1: out vga_byte:=(others=>'0');--  8bit color information channel 1
		 VGA_R2, VGA_G2, VGA_B2: out vga_byte:=(others=>'0');--  8bit color information channel 2
		 VGA_CLK,
		 VGA_BLANK,  -- '0' if non-visible part of picture
		 VGA_HS,     -- '0' if horizontal synchronization puls
		 VGA_VS,     -- '0' if vertical synchronization puls 
		 VGA_SYNC : out std_logic :='1';		 
	    yrow, xcolumn : out vga_xy := VGA_XY_ZERO -- test bench outputs only
	 );
end;

architecture rtl of VGARegPipeline is
begin


  reg:process(CLOCK_50)
  begin
-- All input signal are registered on the rising edge of CLOCK_50 when VGA_CLK_in=0
-- because xcolumn a yrow are changed by VGAgenerator at this moment .
   if rising_edge(CLOCK_50) then
      if VGA_CLK_g='0' then -- before the end of xcolumn and yrow validity
----------------------------------------------------------------------------   
			MuxAddress<=MuxAddress_in;
			VGA_R1<=VGA_R1_in;  VGA_G1<=VGA_G1_in; VGA_B1<=VGA_B1_in;
			VGA_R2<=VGA_R2_in;  VGA_G2<=VGA_G2_in; VGA_B2<=VGA_B2_in;
					
			VGA_BLANK<=VGA_BLANK_g;  VGA_HS<=VGA_HS_g;  VGA_VS<=VGA_VS_g; VGA_SYNC<=VGA_SYNC_g;		 
			yrow<=yrow_g; xcolumn<=xcolumn_g;
-----------------------------------------------------------------------------
		end if;
	end if;
	if falling_edge(CLOCK_50) then
		VGA_CLK <= VGA_CLK_g; -- VGA_CLK is delayed by 20 ns, 1 CLOCK_50 period, to assure setup of all data
	end if;

	
	end process;
    
end architecture rtl;