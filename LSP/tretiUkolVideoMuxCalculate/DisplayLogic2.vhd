-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------

library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;       -- type integer and unsigned
use work.VGApackage.all;
use work.LCDpackage.all;

entity DisplayLogic2 is 
generic ( xreverse : integer:=0 );
port(	 
       yrow, xcolumn : in vga_xy; -- row and  column indexes of VGA video
		 VGA_CLK : in std_logic;
	    VGA_R, VGA_G, VGA_B: out vga_byte --  color information
	 ); 
end;

architecture behavioral of DisplayLogic2 is

---------------------------------------------------------------------------------
function SwColor(xreverse:integer; C1, C2: RGB_type) return RGB_type is
begin
       if xreverse>0 then return C1; else return C2; end if;
end function; 
-- Used colors 	
constant RED : RGB_type := SwColor(xreverse,ToRGB(196,0,0),ToRGB(128,15,15));  
constant GREEN : RGB_type := SwColor(xreverse,ToRGB(128,255,0),ToRGB(0,64,0));  
constant BLUE : RGB_type := SwColor(xreverse,ToRGB (0,179,255),ToRGB(0,0,128)); 
constant GRAY : RGB_type := SwColor(xreverse,ToRGB(31,31,31),ToRGB(16,16,16)); 
constant YELLOW : RGB_type := SwColor(xreverse,ToRGB(X"EC7B4B"),ToRGB(X"FFFF00")); -- or ToRGB(191,191,0); 
constant BLACK : RGB_type := ToRGB(X"000000");  -- or ToRGB(0,0,0);

constant WHITE : RGB_type := SwColor(xreverse,ToRGB(169,169,169),ToRGB(X"FFFFFF"));  
-- constant GREEN : RGB_type := ToRGB(X"3c746b");  
-- constant BLUE : RGB_type := ToRGB(X"007cc3"); 
constant CYAN : RGB_type := SwColor(xreverse,ToRGB(X"487590"),ToRGB(X"75c5f0"));
constant BROWN : RGB_type := SwColor(xreverse,ToRGB(X"553714"),ToRGB(X"957f66")); 
---------------------------------------------------------------------------

--constant MEMROWSIZE : integer := 128; -- memory organization
--constant MEMROWCOUNT : integer := 128;
--constant EMBORGX1 : integer := 64; -- positions of picture in the flag
--constant EMBORGY1 : integer := 64;
--constant EMBORGX2 : integer := LCD_XSCREEN-MEMROWSIZE-32; -- positions of picture in the flag
--constant EMBORGY2 : integer := LCD_YSCREEN-MEMROWCOUNT-32;
--constant MEM_END_ADDRESS : integer := 16383;

--constant MEMROWSIZE : integer := 64; -- memory organization
--constant MEMROWCOUNT : integer := 64;
--constant EMBORGX1 : integer := (LCD_XSCREEN-MEMROWSIZE-120); -- positions of picture in the flag
--constant EMBORGY1 : integer := 120;
--constant EMBORGX2 : integer := (LCD_XSCREEN-MEMROWSIZE-120); -- positions of picture in the flag
--constant EMBORGY2 : integer := (LCD_YSCREEN-MEMROWCOUNT-120);
--constant MEM_END_ADDRESS : integer := 4095; -- not used here

constant MEMROWSIZE : integer := 256; -- memory organization
constant MEMROWCOUNT : integer := 256;
constant EMBORGX1 : integer := (LCD_XSCREEN-MEMROWSIZE-70); -- positions of picture in the flag
constant EMBORGY1 : integer := 70;
constant EMBORGX2 : integer := (LCD_XSCREEN-MEMROWSIZE-70); -- positions of picture in the flag
constant EMBORGY2 : integer := (LCD_YSCREEN-MEMROWCOUNT-70);
constant MEM_END_ADDRESS : integer := 65536; -- not used here

--component romPicture2
--	port(
--		address : IN  STD_LOGIC_VECTOR(13 DOWNTO 0);
--		clock   : IN  STD_LOGIC;
--		q       : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
--	);
--end component romPicture2;

--signal picture_address_s : std_logic_vector(13 DOWNTO 0); -- ROM mem address
--signal picture_q_s : std_logic_vector(1 downto 0); -- data from ROM memory
--signal VGA_CLK_n:std_logic;


--component nalepka64	port(	
--		address : IN  std_logic_vector(11 DOWNTO 0);
--		clock   : IN  std_logic :='1';
--		q       : OUT std_logic_vector(1 DOWNTO 0));
--end component nalepka64;

component blob256	port(	
		address : IN  std_logic_vector(15 DOWNTO 0);
		clock   : IN  std_logic :='1';
		q       : OUT std_logic_vector(1 DOWNTO 0));
end component blob256;

signal picture_address_s : std_logic_vector(15 DOWNTO 0); -- address sent to memory
signal picture_q_s : std_logic_vector(1 downto 0); -- obtained data
signal VGA_CLK_n:std_logic; -- negated VGA_CLK

begin -- architecture

VGA_CLK_n <= not VGA_CLK;
rom_inst : blob256
port map(clock => VGA_CLK_n,  
		 address => picture_address_s,
		 q => picture_q_s);
  
    LSPflag : process(xcolumn, yrow, picture_q_s) -- output of process depends on xcolumn and yrow
    variable RGB : RGB_type; -- output colors
    variable x, y : integer; -- renamed xcolumn and yrow
	 variable romID:integer range 0 to 2;
    begin
	 -- convert to integer and swap
	   if xreverse>0 then x:=(LCD_XSCREEN-1-to_integer(xcolumn));
		else x:=to_integer(xcolumn); 
		end if;
		y:=to_integer(yrow); -- convert to integer 
      
		romID:=0;
		
		if(x>=EMBORGX1 and x<EMBORGX1+MEMROWSIZE and y>=EMBORGY1 and y<EMBORGY1+MEMROWCOUNT) then
			romID:=1;
		end if;
		
		if(x>=EMBORGX2 and x<EMBORGX2+MEMROWSIZE and y>=EMBORGY2 and y<EMBORGY2+MEMROWCOUNT) then
			romID:= 2;
		end if;
      
		if(x<0) or (x>=LCD_XSCREEN) or (y<0) or (y>=LCD_YSCREEN) then
		   RGB:=BLACK; --black outside of visible frame
		elsif romID>0 and picture_q_s /= "00" then
			if romID=1 then
				if picture_q_s = "01" then RGB:=YELLOW;
				else RGB:=CYAN;
				end if;
			else
				if picture_q_s = "01" then RGB:=YELLOW;
				else RGB:=BROWN;
				end if;
			end if;--2227 2054
		elsif (y < 405) and (y > (2223) - 8*x) and (y > 8*x - 2055) then
		   RGB:=CYAN;
		elsif (y < 405) and (y > (623) - 2*x) and (y > 2*x - 448) then  -- line equation  y = 240-(6/5)*x
		   RGB:=WHITE;
		elsif (y >= 405) and  (y < 515) and (x > 108) and (x < 428)then     -- line equation  y = 240-(3/8)*x
		   RGB:=BROWN;
		elsif (y*2 < LCD_YSCREEN) then
		   RGB:=BLUE;
		else 
			RGB:=GREEN;
		end if;
		
		case romID is
			when 1 =>
				 picture_address_s <= std_logic_vector(
							to_unsigned((y-EMBORGY1)*MEMROWSIZE + (x-EMBORGX1), picture_address_s'LENGTH));
			when 2 =>
				--mirroring
				 picture_address_s <= std_logic_vector(
							to_unsigned((-y+EMBORGY2)*MEMROWSIZE + (x-EMBORGX2), picture_address_s'LENGTH));
			  when others =>     picture_address_s <=(others=>'0'); 
		end case;

	-- Copy results in RGB to outputs of entity
		VGA_R<=RGB.R; VGA_G<=RGB.G; VGA_B<=RGB.B;
-----------------------------------------------------------------------------
	end process;

    
end architecture behavioral;