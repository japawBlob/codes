-- Quartus II VHDL Template Basic

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MajakJAKUJ is
	port 
	(
-- inputs and outputs
		x0, x1, x2, x3, x4, x5 : in std_logic;
		STOP, Y : out std_logic
	);

end entity;

architecture behavioral of MajakJAKUJ is
signal a, b, c, d, e, f : std_logic;
signal Y00, Y01, Y10, Y11 : std_logic;
-- definitions 

begin

	a <= x5; b <= x4; c <= x3; d <= x2; e <= x1; f <= x0;
	Y00 <= (f and not c) or (f and not d) or (c and not e) or (d and not e);
	Y01 <= (f and c) or (not e and d and not c) or (f and not d) or (e and not d and c);
	Y10 <= (not e and not c and not d) or (f and not e and not d) or (e and c and not d) or (d and e and f) or (d and f and not c);
	Y11 <= e or (f and not e and not d) or (f and d and not c);
	
	Y <= 	(not a and not b and Y00) or
			(not a and b and Y01) or
			(a and not b and Y10) or
			(a and b and Y11);
			
	STOP <= (a and b and c and d and f);
			

end architecture;
