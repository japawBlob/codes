-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------


library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGApackage.all;
use work.MUXpackage.all;

entity VideoMuxCalculate is
	port 
	(    yrow, xcolumn : in vga_xy; -- row and column indexes of VGA video
	     VGA_HS, VGA_VS : in std_logic; -- horizontal, vertical synchonization
	     ACLRN : in std_logic; -- clear after power up
		  MuxAddress : out muxaddress_t
	    );
end entity;


architecture rtl of VideoMuxCalculate is
   -- Note: Variable cannot be declared heere, only inside processes.
	signal s12 : boolean;  -- switch 1st or 2nd image
	
   -- After debugging, we can try decreasing bit width of MAX_COUNTER
	constant MAX_COUNTER: integer :=2**16-1; 
   constant SPEED_COUNTER: integer :=4;
   constant NONLIN_INCR: integer :=16;
   constant WAIT_COUNT: integer :=120; -- it counts by 60 Hz, i.e. 120=2s
	signal switch_counter : integer range 0 to MAX_COUNTER;
	
	constant XOR_STEP:integer := 48;
	signal prop_step : integer range 0 to XOR_STEP-1;
	signal even_odd : boolean:=false;
 
 -- Do not use enum type for Effect, enum types are compiled as Finate state machines.
   signal Effect : integer range 0 to 1;
begin

	-- concurrent part with multiplexer - it is always active
	MuxAddress <=  MUX_ADDR1 when s12 else MUX_ADDR0;

	 
	process (xcolumn, yrow)
	-- Note: Signals can never be declared insed processes.
	variable x,y : integer;
	variable dif : integer range -MAX_COUNTER to MAX_COUNTER;
	begin
	   
		x:=to_integer(xcolumn);
      y:=to_integer(yrow);
		
		-- Bevare, this part is pure combinational circuit. 
		-- Variable diff and s12 must be always assigned to prevent forbidden latches.
		case Effect is
			when 0=>
				dif:=x-switch_counter;
				if dif>=0 then s12<=true;
				elsif dif>=-XOR_STEP and dif<0 then 
				    s12<=(xcolumn(0) xor yrow(0))='1';
			   else s12<=false;
				end if;
            
			when 1=>
				if even_odd then dif:=x-switch_counter-prop_step;
				            else dif:=x-switch_counter-(XOR_STEP-1-prop_step); 
				end if;
				if dif>=(-2*XOR_STEP) and dif<(-XOR_STEP) then
					 s12<=(xcolumn(0) xor yrow(0))='1';
				else s12<=(dif>(-XOR_STEP));
				end if;
		end case;
		
	end process;
	
fsm:process(VGA_VS, ACLRN, xcolumn, yrow)
  	-- in VHDL, enum types are reserved for Finite state machines only
	type state_t is (STATE_INIT, STATE_UP, STATE_WAIT1, STATE_DOWN, STATE_WAIT2);
	variable state, state_next : state_t;

    constant MAX_WAIT: integer :=255;
	variable vcounter : integer range 0 to MAX_COUNTER;
	variable wait_counter : integer range 0 to MAX_WAIT;
	begin
	   if ACLRN='0' then state:=STATE_INIT;
		elsif falling_edge(VGA_VS) then
		   state:=state_next;
			case state is
			   when STATE_INIT=> state_next:=STATE_UP; vcounter:=0; Effect<=0;
				when STATE_UP =>   
					 if vcounter<XSCREEN+2*XOR_STEP 
					    then vcounter:=vcounter+1+vcounter/NONLIN_INCR;
					    else state_next:=STATE_WAIT1; wait_counter:=0;
					         vcounter:=XSCREEN+2*XOR_STEP; -- we limit too high value
					 end if;
					 switch_counter<=vcounter;
				when STATE_WAIT1=>
				    if wait_counter<WAIT_COUNT then wait_counter:=wait_counter+1;
					 else state_next:=STATE_DOWN; Effect<=1; 
					 end if;
					  
				when STATE_DOWN=>
					 if vcounter>=SPEED_COUNTER then vcounter:=vcounter-SPEED_COUNTER;
					 else state_next:=STATE_WAIT2; wait_counter:=0;
					 end if;
					 switch_counter<=vcounter;
				when STATE_WAIT2=>
				    if wait_counter<WAIT_COUNT then wait_counter:=wait_counter+1;
					 else state_next:=STATE_INIT;
					 end if;
			   when others=> assert false report "Missing state" severity error; 
			end case;
	   end if;
	
	end process;

-- we calculate modulo XOR_STEP by this counter, 
-- because we can use a divide or a modulo operator only with powers of 2.	
divXorStep : process(VGA_HS, VGA_VS)
    variable cntr : integer range 0 to XOR_STEP-1;
	 begin
	    if falling_edge(VGA_HS) then
		    if VGA_VS='0' then cntr:=0; even_odd<=false;
			 else if cntr<XOR_STEP-1 then cntr:=cntr+1;
			      else cntr:=0; even_odd<=not even_odd;
			      end if;
			 end if;
		 end if;
	    prop_step<=cntr;
	 end process;

	

end architecture;
