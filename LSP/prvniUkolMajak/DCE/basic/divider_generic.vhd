-- divider_generic of frequency-----------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- * Educational Library * that highlights design principles of circuits,
-- Richard Susta, CTU in Prague, Faculty of Electrical Eng., Department of Control Eng.
-- Published under GNU General Public License 
-----------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- *** NOTE ***
-- divider_generic was created in VHDL. This way is more safe because counters and dividers
-- are deeply analyze cases of circuits and FPGAs contain internal supports for them. 
-- If we inform Quartus compiler that we need a divider or counter
-- it selects the best possible internal structures for our target FPGA.
-------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divider_generic is
   generic( DIVISOR: integer := 10 );
   port(CLK  : in std_logic; 
        q  : out std_logic);
   begin -- Passive processes with no signal assignment statements  
	      -- can be placed inside entity to check input parameters
		assert DIVISOR>1
		report "TOO SMALL DIVISOR: divider_generic requires DIVISOR of frequency greather than 1." 
		severity severity_level(error); 
end entity;

architecture behav of divider_generic is

-- We set IRANGE to (DIVISOR/2-1) for even (cz:sude) number 
--        and to (DIVISOR-1) for odd (cz:liche) 
constant IRANGE:integer := (DIVISOR-1)*(DIVISOR mod 2)+(DIVISOR/2-1)*((DIVISOR+1) mod 2);
begin
  
  process (CLK)   
  variable   cnt : integer range 0 to IRANGE:=0;
  variable   q2 : std_logic := '0';
  begin
  if rising_edge(CLK) then
    -- if-elsif depends on constants, so compiler will implement only one part
    if DIVISOR=2 -- dividing by 2 is a special simple case
	    then q2:=not q2;
	 elsif DIVISOR mod 2 = 0 then
	      -- To divide by EVEN number, we divide first by DIVISOR/2 and then by 2
			-- by this way, the complexity of circuit will be reduced approx. by 20 %
		  if cnt>=IRANGE then cnt:=0; q2:=not q2;  
		  else cnt := cnt + 1; 
		  end if;
	 else -- dividing by ODD (cz:liche) number ------------------------------
		  if cnt>=DIVISOR/2 then q2:='1' ;
		  else q2:='0';
		  end if;
		  if cnt>=IRANGE then cnt:=0; 
		  else cnt:=cnt+1;
		  end if;
	 end if; 
  end if;

  q<=q2; -- copy internal variable of process to output

  end process;
end behav;