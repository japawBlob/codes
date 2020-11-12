library ieee, work;
use ieee.std_logic_1164.all; 
use work.VGApackage.all;
use work.MUXpackage.all;

entity DisplayLogic2Mux_debugVersion is
	generic(isTestbench : integer := 0);
	port
	(   ACLRN :  in  std_logic;
	    yrow_g, xcolumn_g :  in  vga_xy;  -- _g from VGAgenerator
	    VGA_R, VGA_G, VGA_B :  out  vga_byte;
	    VGA_CLK_g,
		 VGA_BLANK_g,  -- '0' if non-visible part of picture
	    VGA_HS_g,     -- '0' if horizontal synchronization puls
	    VGA_VS_g,     -- '0' if vertical synchronization puls 
	    VGA_SYNC_g : in std_logic :='1';
	    CLOCK_50 : in std_logic;
	    VGA_CLK,
		 VGA_BLANK,  -- '0' if non-visible part of picture
	    VGA_HS,     -- '0' if horizontal synchronization puls
	    VGA_VS,     -- '0' if vertical synchronization puls 
	    VGA_SYNC : out std_logic :='1';
	    yrow, xcolumn : out vga_xy := VGA_XY_ZERO -- test bench outputs only
	    );
end;

architecture structural of DisplayLogic2Mux_debugVersion is

	component VideoMuxCalculate
	  generic(isTestbench : integer := 0);
		port(yrow, xcolumn  : in  vga_xy;
			VGA_VS         : in  std_logic;
			ACLRN          : in  std_logic;
			MuxAddress     : out muxaddress_t
		);
	end component VideoMuxCalculate;
    
    component VideoMuxSwitch
    	port(MuxAddress             : in  std_logic_vector(1 downto 0);
    		R1, G1, B1, R2, G2, B2 : in  vga_byte;
    		VGA_R, VGA_G, VGA_B    : out vga_byte
    	);
    end component VideoMuxSwitch;
    
	signal	toR1_vms,	toG1_vms, toB1_vms :  vga_byte; -- _vms to VideoMuxSwitch
	signal	toR2_vms,	toG2_vms, toB2_vms :  vga_byte;
	signal  toMuxAddress_vms : muxaddress_t;
   
	constant C0 : vga_byte := (others=>'0');
	constant C50 : vga_byte := (vga_byte'LEFT=>'0', others=>'1');
	constant C100 : vga_byte := (others=>'1');

begin

	    VGA_CLK <= VGA_CLK_g;
		 VGA_BLANK <= VGA_BLANK_g;  -- '0' if non-visible part of picture
	    VGA_HS<=VGA_HS_g;     -- '0' if horizontal synchronization puls
	    VGA_VS<=VGA_VS_g;     -- '0' if vertical synchronization puls 
	    VGA_SYNC<=VGA_SYNC_g;
	    yrow<=yrow_g;
		 xcolumn<=xcolumn_g;


iVMCalc : VideoMuxCalculate
	generic map(isTestbench=>isTestbench)
	port map(
		yrow       => yrow_g,
		xcolumn    => xcolumn_g,
		VGA_VS     => VGA_VS_g,
		ACLRN      => ACLRN,
		MuxAddress => toMuxAddress_vms
	);		 

 
iVMux : VideoMuxSwitch
	port map(MuxAddress => toMuxAddress_vms,
		R1         => C50,
		G1         => C0,
		B1         => C50,
		R2         => C0,
		G2         => C50,
		B2         => C50,
		VGA_R      => VGA_R,
		VGA_G      => VGA_G,
		VGA_B      => VGA_B
	);

end architecture;