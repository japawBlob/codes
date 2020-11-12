-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- numeric types integer, signed and unsigned

-- you do not need to use this package, it is just information of screen sizes
package LCDpackage is

	constant LCD_XSCREEN : integer := 800;  -- visible columns of VGA screen, the width of screan 
	constant LCD_YSCREEN : integer :=600;   -- visible rows of VGA screen, the height of screen 

end package LCDpackage;

package body LCDpackage is

end package body LCDpackage;
