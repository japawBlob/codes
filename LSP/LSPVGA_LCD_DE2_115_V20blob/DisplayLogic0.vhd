-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------

library ieee, work;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;       -- type integer and unsigned
use work.VGApackage.all;

entity DisplayLogic0 is 
port(	 
       yrow, xcolumn : in vga_xy; -- row and  column indexes of VGA video
		 VGA_CLK : in std_logic;  -- it is not used in this code, but added for future
	    VGA_R, VGA_G, VGA_B: out vga_byte --  color information
	 ); 
end;

architecture behavioral of DisplayLogic0 is

---------------------------------------------------------------------------------
   
-- Used colors - we defined them by the way that will allow their OR merging in future	
constant RED : RGB_type := ToRGB(196,0,0);  
constant GREEN : RGB_type := ToRGB(0,96,0);  
constant BLUE : RGB_type := ToRGB(0,0,196); 
constant YELLOW : RGB_type := ToRGB(X"BFBF00"); -- or ToRGB(191,191,0); 
constant BLACK : RGB_type := ToRGB(X"000000");  -- or ToRGB(0,0,0);
---------------------------------------------------------------------------
begin 
    LSPflag : process(xcolumn, yrow) -- outputs of LSPflag process depend on xcolumn and yrow
    variable RGB : RGB_type; -- color output
    variable x, y : integer; -- integer xcolumn and yrow
    begin
	 -- convert to integers
	   x:=to_integer(xcolumn); y:=to_integer(yrow);
      
		if(x<0) or (x>=XSIZE) or (y<0) or (y>=YSIZE) then
		   RGB:=BLACK; --black outside of visible frame 
		elsif x*x+(y-YSIZE)*(y-YSIZE) < YSIZE*YSIZE/16 then
		   RGB:=YELLOW;
		elsif 5*y < 5*YSIZE - 6*x then  -- line equation  y = 240-(6/5)*x
		   RGB:=GREEN;
		elsif 8*y < 8*YSIZE- 3*x then     -- line equation  y = 240-(3/8)*x
		   RGB:=YELLOW;
		else 
		   RGB:=BLUE;
		end if;

	-- Copy results in RGB to outputs of entity
		VGA_R<=RGB.R; VGA_G<=RGB.G; VGA_B<=RGB.B;
-----------------------------------------------------------------------------
	end process;
    
end architecture behavioral;