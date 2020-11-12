-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------
-- Version 1.1 of output register for DE2-115 board
-- Note: DE2-115 register has no testbench outputs. The testbench utilizes always VGARegDE2.vhd.

library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGApackage.all;

entity VGARegDE2_115 is
port(	 VGA_R_in, VGA_G_in, VGA_B_in: in vga_byte:=(others=>'0');--  8bit color information	    
	    yrow, xcolumn : in vga_xy := VGA_XY_ZERO; -- pixel index
		 VGA_CLK_in    : in std_logic:='0'; 
		 VGA_BLANK_in,  -- '0' if non-visible part of picture
		 VGA_HS_in,     -- '0' if horizontal synchronization puls
		 VGA_VS_in,     -- '0' if vertical synchronization puls 
		 VGA_SYNC_in : in std_logic := '1';
       CLOCK_50 : in std_logic:='0';		 
	    
		 VGA_R, VGA_G, VGA_B: out vga_byte:=(others=>'0');--  DE2-115 VGA driver
		 VGA_CLK,
		 VGA_BLANK_N,  -- '0' if non-visible part of picture
		 VGA_HS,     -- '0' if horizontal synchronization puls
		 VGA_VS,     -- '0' if vertical synchronization puls 
		 VGA_SYNC_N : out std_logic :='1'
	 );
end;

architecture rtl of VGARegDE2_115 is
begin


  reg:process(CLOCK_50)
  begin
-- All input signal are registered on the rising edge of CLOCK_50 when VGA_CLK_in=0
-- because xcolumn a yrow are changed by VGAgenerator at this moment .
   if rising_edge(CLOCK_50) then
      if VGA_CLK_in='0' then -- before the end of xcolumn and yrow validity
----------------------------------------------------------------------------   
			-- extending colors to 10 bits required by DE2 VGA chip
			VGA_R<=VGA_R_in;   
			VGA_G<=VGA_G_in; 
			VGA_B<=VGA_B_in;
					
			VGA_BLANK_N<=VGA_BLANK_in;  VGA_HS<=VGA_HS_in;  VGA_VS<=VGA_VS_in; VGA_SYNC_N<=VGA_SYNC_in;		 
-----------------------------------------------------------------------------
		end if;
		VGA_CLK <= VGA_CLK_in; -- VGA_CLK is delayed by 20 ns, 1 CLOCK_50 period, to assure setup of all data
	end if; 
	
	end process;
    
end architecture rtl;