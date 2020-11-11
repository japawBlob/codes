-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------
-- Version 1.1 of VGA generator for DE2 and DE2-115 boards

library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGApackage.all;

entity VGAgenerator is
port(
	CLOCK_50: in std_logic;  -- DE2 clock
	ACLRN : in std_logic;  -- asynchronous initilization 
	yrow : out vga_xy:=(others=>'0'); -- pixel index
	xcolumn : out vga_xy:=(others=>'0'); -- pixel index
	VGA_CLK: out std_logic:='0';    -- vga clock 
	VGA_BLANK: out std_logic:='1';  -- ='0' if non-visible part of picture
	VGA_HS: out std_logic:='1';     -- ='0' if horizontal synchronization puls
	VGA_VS: out std_logic:='1';     -- ='0' if vertical synchronization puls 
	VGA_SYNC: out std_logic:='1' -- ='0' if VGA_HS='0' or VGA_VS='0'
);
end entity VGAgenerator;

architecture rtl of VGAgenerator is
  
begin
	
gen: process(CLOCK_50, ACLRN)
	
		-- http://tinyvga.com/vga-timing/640x480@60Hz
		-- timing supposes VGA_CLK frequency 25.175 MHz
		constant VS_LINE_VISIBLE : integer := YSCREEN; -- visible rows
		constant VS_FRONT_PORCH : integer := 10;
		constant VS_SYN_LINES : integer := 2;
--		constant VS_BACK_PORCH : integer := 33; --not used
		constant VS_LENGTH  : integer := 525; -- total rows including hidden
		
		constant HS_PIXEL_VISIBLE  : integer := XSCREEN; --visible  columns
		constant HS_FRONT_PORCH : integer := 16;
		constant HS_SYN_PULS : integer := 96;
--		constant HS_BACK_PORCH : integer := 48; --not used
		constant HS_LENGTH  : integer := 800; ---- total columns including hidden
		
		variable xc: vga_xy:=VGA_XY_ZERO; -- horizontal  counter, i.e.  columns
		variable xcounter: unsigned(yrow'HIGH+1 downto 0):=(others=>'0');   --clock, i.e. rows
		variable yr: vga_xy:=VGA_XY_ZERO;   --vertical counter, i.e. rows
		variable qVGA_VS, qVGA_HS, qVGA_BLANK: std_logic;

		
	begin
	   
		xc:=xcounter(xcounter'HIGH downto 1);  -- xcounter(0) is VGA_CLK

		-- vertical synchronization puls
		if     (yr >= (VS_LINE_VISIBLE+VS_FRONT_PORCH)) 
			and (yr < (VS_LINE_VISIBLE+VS_FRONT_PORCH+VS_SYN_LINES))
		 then  qVGA_VS := '0';
		 else  qVGA_VS := '1';
		end if;
		
		-- horizontal synchronization puls
		if (xc >= (HS_PIXEL_VISIBLE+HS_FRONT_PORCH)) 
			and (xc < (HS_PIXEL_VISIBLE+HS_FRONT_PORCH+HS_SYN_PULS))
		 then qVGA_HS :='0';
		 else qVGA_HS :='1'; 
		end if;

		-- '0' if non visible part of picture, otherwise '1'
		if (xc < HS_PIXEL_VISIBLE) and (yr < VS_LINE_VISIBLE) 
		 then qVGA_BLANK :='1';
		 else qVGA_BLANK :='0';
		end if;
		
		if ACLRN='0' then 
		   
			xc:=VGA_XY_ZERO; yr:=VGA_XY_ZERO; qVGA_VS:='1'; qVGA_HS:='1'; qVGA_BLANK:='1';
			VGA_SYNC<= qVGA_VS and qVGA_HS;
		   VGA_VS<=qVGA_VS; VGA_HS<=qVGA_HS; VGA_BLANK<=qVGA_BLANK;
			yrow<=yr; xcolumn<=xc;

		elsif rising_edge(CLOCK_50) then
	     VGA_SYNC<= qVGA_VS and qVGA_HS;
	     VGA_VS<=qVGA_VS; VGA_HS<=qVGA_HS; VGA_BLANK<=qVGA_BLANK;
		  yrow<=yr; xcolumn<=xc;
		  
	-- Incrementing counters at the end!!! we used the values n the next loop run when they will be stable
			if xcounter<2*HS_LENGTH-1 then xcounter:= xcounter+1;
			else xcounter:=(others=>'0'); 
			     if yr<VS_LENGTH-1 then yr:=yr+1;
			     else yr:=(others=>'0'); end if;
			end if;
		elsif falling_edge(CLOCK_50) then
	------------------
	     -- we delay VGA_CLK by 10 ns (period/2 of CLOCK_50)
		  -- thus, yrow and ycolumn have this setup before rising edge of VGA_CLK
        VGA_CLK<=xcounter(0); 
		end if;
	end process;
 
end architecture rtl;
