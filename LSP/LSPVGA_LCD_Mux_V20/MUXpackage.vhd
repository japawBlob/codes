-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- numeric types integer, signed and unsigned

package MUXpackage is

	-- You can send more control bits to VideoMux by increasing its bit width 
	subtype muxaddress_t is std_logic_vector(0 downto 0);
	constant MUX_ADDR0 : muxaddress_t:=(others=>'0');
	constant MUX_ADDR1 : muxaddress_t:=(others=>'1');

end package MUXpackage;

package body MUXpackage is

end package body MUXpackage;
