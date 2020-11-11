-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------


library ieee, work;
use ieee.std_logic_1164.all; 
use work.VGApackage.all;
use work.MUXpackage.all;

entity DisplayLogic2Mux_LCD is
	port
	(   xcolumn_g, yrow_g :  in  vga_xy;  -- from LCDgenerator
	    LCD_CLK_g,
		 LCD_DEN_g,  -- '0' if non-visible part of picture
	    ACLRN_g :  in  std_logic;
	    HS_N_g,     -- '0' if vertical synchronization puls 
	    VS_N_g : in std_logic;
	    VGA_R, VGA_G, VGA_B :  out  vga_byte;
	    LCD_CLK,
		 LCD_DEN,  -- '0' if non-visible part of picture
	    ACLRN  : out std_logic   -- '0' if horizontal synchronization puls
	    );
end;

architecture structural of DisplayLogic2Mux_LCD is

	component DisplayLogic2
		generic(xreverse : integer);
		port(
			yrow, xcolumn       : in  vga_xy;
			VGA_CLK             : in  std_logic;
			VGA_R, VGA_G, VGA_B : out vga_byte
		);
	end component DisplayLogic2;

	component LCDRegPipeline is
		port(
			MuxAddress_in : in muxaddress_t;
			VGA_R1_in, VGA_G1_in, VGA_B1_in: in vga_byte:=(others=>'0');--  8bit color information channel 1
			VGA_R2_in, VGA_G2_in, VGA_B2_in: in vga_byte:=(others=>'0');--  8bit color information channel 2	    	    
	
			LCD_CLK_g    : in std_logic:='0';
			LCD_DEN_g : in std_logic:='0'; -- '0' if vertical synchronization puls 
			 
			MuxAddress : out muxaddress_t;
			VGA_R1, VGA_G1, VGA_B1: out vga_byte:=(others=>'0');--  8bit color information channel 1
			VGA_R2, VGA_G2, VGA_B2: out vga_byte:=(others=>'0');--  8bit color information channel 2
			LCD_CLK,    
			LCD_DEN   : out std_logic -- '0' if vertical synchronization puls 
		    );
	end component LCDRegPipeline;

	component VideoMuxCalculate
		port(yrow, xcolumn  : in  vga_xy;
			  VGA_HS         : in  std_logic;
			  VGA_VS         : in  std_logic;
			  ACLRN          : in  std_logic;
			  MuxAddress     : out muxaddress_t
		);
	end component VideoMuxCalculate;
    
    component VideoMuxSwitch
   	port(MuxAddress             : in  muxaddress_t;
    		R1, G1, B1, R2, G2, B2 : in  vga_byte;
    		VGA_R, VGA_G, VGA_B    : out vga_byte
    	);
    end component VideoMuxSwitch;
    
	signal	toR1_rp,	toG1_rp, toB1_rp :  vga_byte; -- _pr to VGARegPipeLine
	signal	toR2_rp,	toG2_rp, toB2_rp :  vga_byte;
	signal	toR1_vms,	toG1_vms, toB1_vms :  vga_byte; -- _vms to VideoMuxSwitch
	signal	toR2_vms,	toG2_vms, toB2_vms :  vga_byte;
	signal  toMuxAddress_rp, toMuxAddress_vms : muxaddress_t;
   

begin

   ACLRN<=ACLRN_g;

	iDL1 : DisplayLogic2
		generic map(xreverse => 1)
		port map(yrow => yrow_g,
		         xcolumn => xcolumn_g,
		         VGA_CLK => LCD_CLK_g,
		         VGA_R => toR1_rp,
		         VGA_G => toG1_rp,
		         VGA_B => toB1_rp);


iDL2 : DisplayLogic2
		generic map(xreverse => 0)
		port map(yrow => yrow_g,
		         xcolumn => xcolumn_g,
		         VGA_CLK => LCD_CLK_g,
		         VGA_R => toR2_rp,
		         VGA_G => toG2_rp,
		         VGA_B => toB2_rp);

iVMCalc : VideoMuxCalculate
	port map(
		yrow       => yrow_g,
		xcolumn    => xcolumn_g,
		VGA_HS     => HS_N_g,
		VGA_VS     => VS_N_g,
		ACLRN      => ACLRN_g,
		MuxAddress => toMuxAddress_rp
	);		 

	iPipeLine : LCDRegPipeline
		port map( MuxAddress_in => toMuxAddress_rp,
		         VGA_R1_in => toR1_rp, --  8bit color information channel 1
		         VGA_G1_in => toG1_rp, --  8bit color information channel 1
		         VGA_B1_in => toB1_rp, --  8bit color information channel 1
		         VGA_R2_in => toR2_rp, --  8bit color information channel 2	    	    
		         VGA_G2_in => toG2_rp, --  8bit color information channel 2	    	    
		         VGA_B2_in => toB2_rp, --  8bit color information channel 2	    	    
		         LCD_CLK_g => LCD_CLK_g,
		         LCD_DEN_g => LCD_DEN_g, -- '0' if non-visible part of picture
		         MuxAddress => toMuxAddress_vms,
		         VGA_R1 => toR1_vms, --  8bit color information channel 1
		         VGA_G1 => toG1_vms, --  8bit color information channel 1
		         VGA_B1 => toB1_vms, --  8bit color information channel 1
		         VGA_R2 => toR2_vms, --  8bit color information channel 2
		         VGA_G2 => toG2_vms, --  8bit color information channel 2
		         VGA_B2 => toB2_vms, --  8bit color information channel 2
		         LCD_CLK => LCD_CLK,
		         LCD_DEN => LCD_DEN); -- test bench outputs only
	 
iVMux : VideoMuxSwitch
	port map(MuxAddress => toMuxAddress_vms,
		R1         => toR1_vms,
		G1         => toG1_vms,
		B1         => toB1_vms,
		R2         => toR2_vms,
		G2         => toG2_vms,
		B2         => toB2_vms,
		VGA_R      => VGA_R,
		VGA_G      => VGA_G,
		VGA_B      => VGA_B
	);

end architecture;