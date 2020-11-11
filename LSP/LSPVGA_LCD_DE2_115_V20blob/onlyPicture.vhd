library ieee, work;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;       -- type integer and unsigned
use work.VGApackage.all;

entity onlyPicture is 
port(	 
       yrow, xcolumn : in vga_xy; -- row and  column indexes of VGA video
		 VGA_CLK : in std_logic;  -- it is not used in this code, but added for future
	    VGA_R, VGA_G, VGA_B: out vga_byte --  color information
	 ); 
end;

architecture behavioral of onlyPicture is

---------------------------------------------------------------------------------
   
-- Used colors - we defined them by the way that will allow their OR merging in future	
constant WHITE : RGB_type := ToRGB(X"FFFFFF");  
constant GREEN : RGB_type := ToRGB(X"3c746b");  
constant BLUE : RGB_type := ToRGB(X"007cc3"); 
constant CYAN : RGB_type := ToRGB(X"75c5f0");
constant BROWN : RGB_type := ToRGB(X"957f66");  
constant YELLOW : RGB_type := ToRGB(X"fff500");
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
		elsif (y > x) then
			RGB:=YELLOW;
		elsif (y < 163) and (y > 891 - 8*x) and (y < 8*x - 891) then
		   RGB:=CYAN;
		elsif (y < 163) and (y > 249 - 2*x) and (y < 2*x - 249) then  -- line equation  y = 240-(6/5)*x
		   RGB:=WHITE;
		elsif (y >= 163) and  (y < 206) and (x > 43) and (x < 171)then     -- line equation  y = 240-(3/8)*x
		   RGB:=BROWN;
		elsif (2*y < YSIZE) then
		   RGB:=BLUE;
		else 
			RGB:=GREEN;
		end if;

	-- Copy results in RGB to outputs of entity
		VGA_R<=RGB.R; VGA_G<=RGB.G; VGA_B<=RGB.B;
-----------------------------------------------------------------------------
	end process;
    
end architecture behavioral;