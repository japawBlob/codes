-- Multiplexer of 2 buses -----------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- * Educational Library * that highlights design principles of circuits,
-- Richard Susta, CTU in Prague, Faculty of Electrical Eng., Department of Control Eng.
-- Published under GNU General Public License 
-----------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;


entity mux4bus is

	generic -- definition of constants that can be parameterized in instances of circuits
	(
		WIDTH : natural := 16
	);

	port -- inputs and outputs
	(
		c0, c1, c2, c3 : in std_logic_vector((WIDTH-1) downto 0);
		a1,a0 : in std_logic;
		y : out std_logic_vector((WIDTH-1) downto 0)
	);
	
   begin -- This optional part of entitity is not syntezible but it can contain compile time checks of parameters
		assert WIDTH>0
		report "Data WIDTH parameter must be positive integer number greater than 0"
		severity error;	
end entity;

architecture behavorial of mux4bus is
signal address : std_logic_vector(1 downto 0);
begin
   address(1)<=a1; address(0)<=a0; -- these statements can be replaced by one statement: address<= a1 & a0;
	with address select
 	   y <= c0 when "00",
	        c1 when "01",
			  c2 when "10",
			  c3 when "11"; 
end behavorial;
