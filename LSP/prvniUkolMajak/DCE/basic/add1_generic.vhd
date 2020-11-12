-- Unsigned Adder by 1-----------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- * Educational Library * that highlights design principles of circuits,
-- Richard Susta, CTU in Prague, Faculty of Electrical Eng., Department of Control Eng.
-- Published under GNU General Public License 
-----------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- *** NOTE ***
-- We can certainly design any adder from logical gates, 
-- but we do not achieve optimal behavior for wider adders.
-- Adders are deeply analyze cases of circuits and FPGAs contain internal support for them. 
-- If we inform Quartus compiler that we need an adder by 1,
-- the compiler will select the best possible internal structure for our target FPGA.
-------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add1_generic is

	generic -- definition of constants that can be parameterized in instances of circuits
	(
		WIDTH : natural := 16
	);

	port -- inputs and outputs
	(
		a	    : in std_logic_vector((WIDTH-1) downto 0);
		result : out std_logic_vector((WIDTH-1) downto 0)
	);
	
   begin -- This optional part of entitity is not syntezible but it can contain compile time checks of parameters
		assert WIDTH>1
		report "Data WIDTH parameter must be positive integer number greater than 1"
		severity error;	
end entity;

architecture rtl of add1_generic is
begin
	result <= std_logic_vector(unsigned(a)+1); 
end rtl;
