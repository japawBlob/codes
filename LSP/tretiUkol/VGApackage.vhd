-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- numeric types integer, signed and unsigned

package VGApackage is

	subtype vga_xy is unsigned(9 downto 0);  --xcolumn and yrow data sent by VGAgenerator

	constant VGA_XY_ZERO : vga_xy := (others=>'0');
	
	constant XSCREEN : integer := 640;  -- visible columns of VGA screen 
	constant YSCREEN : integer :=480;   -- visible rows of VGA screen 
	constant XSIZE : integer := XSCREEN/2; -- width of displayed image
	constant YSIZE : integer := YSCREEN/2; -- height of displayed image

	subtype vga_byte is std_logic_vector(7 downto 0); -- color information

	-- records are VHDL equivalents of structures
	type RGB_type is -- RGB color 
		record 
			R, G, B : vga_byte;
		end record;

  -- auxiliary conversion functions
 
 -- convert positive integer to color byte
	function ToByte(n:natural) return vga_byte; 

 -- create color from integer R G B values
	function ToRGB(red,green,blue:natural) return RGB_type;

 -- create color from 24 bit std_logic_vector, it is intended for defining color by one hexadecimal number
	function ToRGB(rgb_hex:std_logic_vector(23 downto 0)) return RGB_type;

end package VGApackage;

package body VGApackage is

	function ToByte(n:natural) return vga_byte is
	begin return std_logic_vector(to_unsigned(n,vga_byte'LENGTH));
	end;

	function ToRGB(red,green,blue:natural) return RGB_type is
	variable tmp:RGB_type;
	begin  tmp.R:=ToByte(red); tmp.G:=ToByte(green); tmp.B:=ToByte(blue);
       return tmp;
	end;

	function ToRGB(rgb_hex:std_logic_vector(23 downto 0)) return RGB_type is
	variable tmp:RGB_type;
	begin  tmp.R:=rgb_hex(23 downto 16); tmp.G:=rgb_hex(15 downto 8); tmp.B:=rgb_hex(7 downto 0);
       return tmp;
	end;


end package body VGApackage;
