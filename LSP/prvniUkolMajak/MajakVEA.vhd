-- Quartus II VHDL Template Basic

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MajakVEA is
	port 
	(
		A,B,C,D : in std_logic;
		STOP,M : out std_logic
	);

end entity;

architecture dataflow of MajakVEA is

begin

	M <= (not B or C) and (A or C);
	STOP <= (A and B and D);

end dataflow;
