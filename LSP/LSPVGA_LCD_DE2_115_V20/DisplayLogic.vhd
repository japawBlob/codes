-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------

library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;       -- type integer and unsigned
use work.VGApackage.all;

entity DisplayLogic is 
port(	xcolumn, yrow : in vga_xy; -- row and  column indexes of VGA video
      VGA_CLK : in std_logic; -- pixel clock
	   VGA_R, VGA_G, VGA_B: out vga_byte	 );  --  color information
end;

architecture behavioral of DisplayLogic is
---------------------------------------------------------------------------------
-- Used colors 	
constant RED : RGB_type := ToRGB(196,0,0);  
constant GREEN : RGB_type := ToRGB(0,96,0);  
constant BLUE : RGB_type := ToRGB(0,0,196); 
constant GRAY : RGB_type := ToRGB(31,31,31); 
constant YELLOW : RGB_type := ToRGB(X"BFBF00"); -- or ToRGB(191,191,0); 
constant BLACK : RGB_type := ToRGB(X"000000");  -- or ToRGB(0,0,0);
---------------------------------------------------------------------------
constant MEMROWSIZE : integer := 64; -- memory organization
constant MEMROWCOUNT : integer := 64;
constant EMBORGX1 : integer := 32; -- positions of picture in the flag
constant EMBORGY1 : integer := 32;
constant EMBORGX2 : integer := XSIZE-MEMROWSIZE-16; -- positions of picture in the flag
constant EMBORGY2 : integer := YSIZE-MEMROWCOUNT-16;
constant MEM_END_ADDRESS : integer := 4095; -- not used here

component romPicture	port(	address : IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
		clock   : IN  STD_LOGIC;
		q       : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
end component romPicture;

signal picture_address_s : std_logic_vector(11 DOWNTO 0); -- address sent to memory
signal picture_q_s : std_logic_vector(1 downto 0); -- obtained data
signal VGA_CLK_n:std_logic; -- negated VGA_CLK
begin
   VGA_CLK_n <= not VGA_CLK;

	rom_inst : romPicture
   PORT MAP(clock => VGA_CLK_n, address => picture_address_s, q => picture_q_s);
  
LSPflag : process(xcolumn, yrow, picture_q_s) -- output of process depends on xcolumn and yrow
    variable RGB : RGB_type; -- output colors
    variable x, y : integer; -- renamed xcolumn and yrow
	 variable romID:integer range 0 to 2;
    begin
		x:=to_integer(xcolumn); y:=to_integer(yrow); -- convert to integer      
		romID:=0;
		if(x>=EMBORGX1 and x<EMBORGX1+MEMROWSIZE 
			and y>=EMBORGY1 and y<EMBORGY1+MEMROWCOUNT) then romID:=1;
		end if;
		
		if(x>=EMBORGX2 and x<EMBORGX2+MEMROWSIZE 
			and y>=EMBORGY2 and y<EMBORGY2+MEMROWCOUNT) then romID:=2;
		end if;
		
		if(x<0) or (x>=XSIZE) or (y<0) or (y>=YSIZE) then  RGB:=BLACK; --black outside of visible frame 
		elsif romID>0 and picture_q_s /= "00" then -- no picture, background is transparent
			if romID=1 then
			  if picture_q_s = "01" then RGB:= GRAY; else RGB:= RED; end if; 
			else
			  if picture_q_s = "01" then RGB:= RED; else RGB:= GRAY; end if;
		  end if;
		elsif x*x+(y-YSIZE)*(y-YSIZE) < YSIZE*YSIZE/16 then   RGB:=YELLOW;
		elsif 5*y < 5*YSIZE - 6*x then  RGB:=GREEN;  -- line equation  y = 240-(6/5)*x
		elsif 8*y < 8*YSIZE- 3*x then    RGB:=YELLOW; -- line equation  y = 240-(3/8)*x
		else  RGB:=BLUE;
		end if;
	
		case romID is
			when 1 =>
				 picture_address_s <= std_logic_vector(to_unsigned((y-EMBORGY1)*MEMROWSIZE + (x-EMBORGX1),
																									 picture_address_s'LENGTH));
			when 2 =>
			-- we rotate rom coordinates by 90 degrees clockwise by matrix [0 1; -1 0]*[x y], i.e, xrom=-y, yrom=x
				 picture_address_s <= std_logic_vector(
							to_unsigned((EMBORGX2+MEMROWCOUNT-1-x)*MEMROWSIZE + (y-EMBORGY2),
							picture_address_s'LENGTH));
			  when others =>     picture_address_s <=(others=>'0'); 
		end case; 
		-- Copy results in RGB to outputs of entity
		VGA_R<=RGB.R; VGA_G<=RGB.G; VGA_B<=RGB.B;
-----------------------------------------------------------------------------
end process;

end architecture behavioral;
