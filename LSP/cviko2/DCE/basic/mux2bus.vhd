-- Multiplexer of 2 buses -----------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- * Educational Library * that highlights design principles of circuits,
-- Richard Susta, CTU in Prague, Faculty of Electrical Eng., Department of Control Eng.
-- Published under GNU General Public License 
-----------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;


entity mux2bus is

	generic -- definition of constants that can be parameterized in instances of circuits
	(
		WIDTH : natural := 16
	);

	port -- inputs and outputs
	(
		c0	    : in std_logic_vector((WIDTH-1) downto 0);
		c1 	 : in std_logic_vector((WIDTH-1) downto 0);
		sel    : in std_logic;
		y : out std_logic_vector((WIDTH-1) downto 0)
	);
	
   begin -- This optional part of entitity is not syntezible but it can contain compile time checks of parameters
		assert WIDTH>0
		report "Data WIDTH parameter must be positive integer number greater than 0"
		severity error;	
end entity;

architecture behavorial of mux2bus is
begin
	y <= c0 when sel='0' else c1; 
end behavorial;
