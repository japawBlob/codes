-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.VGApackage.all;
use work.LCDpackage.all;


entity LCDgenerator is 
port (
	CLOCK_50 : in std_logic; -- input clock signal 50 MHz 
	ACLRN_in : in std_logic; -- asynchronous clear negative, connected to KEY[0] 
	xcolumn  : out vga_xy;	 -- order number of actual pixel-column, see note 1 below
	yrow     : out vga_xy;   -- order number of actual pixel-row
	LCD_CLK  : out std_logic;   -- LCD pixel clock, 39.795918 MHz, see note 2 below
	LCD_DEN  : OUT std_logic;   -- DataEnable control signal of LCD controller
	ACLRN_out : out std_logic; -- output of phase-locked loop, after start-up, it changes from 0 -> 1 and remains in 1
	
   HS_N     : out std_logic;	-- '0' pulse at the end of row, analogy of VGA_HS, f=37685.5 Hz, see note 3
	VS_N     : out std_logic   -- '0' pulse at the end of row, analogy of VGA_VS, f=60 Hz, see note 3
);
end LCDgenerator;
-- Note1: xcolumn counts from 0 to 1023 and then it repeats 1023 value, 
-- thus xcolumn equals to 1023 for 33 LCD_CLK periods (see note 2) at the end of each row
-- The trick allows keeping xcolumn only 10-bits width, i.e. the same as yrow width.

-- Note2: LCD drive synchronization requires 
--- that xcolumn and yrow change of its falling edge (LCD_CLK '1'->'0')
-- i.e. LCD_CLK preriod is from one its falling edge to another.

-- Note3: HS_N and VS_N are in 1, and they go to 0 only for one LCD_CLK period.
-- Their rising edges begin new row/frame 

architecture driver of LCDgenerator is

component LCD_altpll is -- phase-locked loop for LCD_CLK
	port( 
    	areset		: in std_logic  := '0';
		inclk0		: in std_logic  := '0';
		c0		: out std_logic ;
		locked		: out std_logic);
end component LCD_altpll;

signal pllreset : std_logic;
signal CLK : std_logic;

constant LCD_XCOLUMN_MAX : integer := 1055; 
constant LCD_YROW_MAX : integer := 627;

begin

 pllreset<=not ACLRN_in; -- areset of PLL, areset is active in 1 (ACLRN is active in 0]
 
 ipll : LCD_altpll 
    port map(areset => pllreset, inclk0 => CLOCK_50, c0=>CLK, locked=>ACLRN_out);
	
	LCD_CLK<=CLK;

	process(CLK)
		
		variable	horizontal : unsigned(xcolumn'LEFT+1 downto 0);
		variable	vertical : unsigned(yrow'RANGE);
		
	begin
		
		if (falling_edge(CLK)) then 

			if horizontal<LCD_XCOLUMN_MAX 
			  then horizontal:=horizontal + 1;
			  else horizontal:=(others=>'0');
				    if vertical<LCD_YROW_MAX then vertical:=vertical + 1;
					 else vertical:=(others=>'0');
					 end if;
			end if;
			
			if horizontal>=LCD_XCOLUMN_MAX then HS_N<='0'; else HS_N<='1'; end if;
			if vertical>=LCD_YROW_MAX then VS_N<='0'; else VS_N<='1'; end if;
		
		-- for proper synchronization, the tests must be after incrementing counters
			if ((horizontal < LCD_XSCREEN) and (vertical < LCD_YSCREEN)) then 
				LCD_DEN <= '1';
			else 
				LCD_DEN <= '0';
			end if;
			
			-- when horizontal>1023, output 1023
			if(horizontal(horizontal'LEFT)='1') then xcolumn<=(others=>'1');
			else xcolumn <= horizontal(vga_xy'RANGE);
			end if;
			
		   yrow <= vertical;
		end if;
	end process;

	
end architecture driver;