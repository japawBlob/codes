-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------


library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGApackage.all;
use work.MUXpackage.all;
use work.LCDpackage.all;

entity VideoMuxCalculate is
	port 
	(    yrow, xcolumn : in vga_xy; -- row and column indexes of VGA video
	     VGA_HS, VGA_VS : in std_logic; -- horizontal, vertical synchonization
	     ACLRN : in std_logic; -- clear after power up
		  MuxAddress : out muxaddress_t
	    );
end entity;


architecture rtl of VideoMuxCalculate is


	function Mod32(n:natural) return integer is
		begin return to_integer(unsigned(std_logic_vector(to_unsigned(n,9))(4 downto 0)));
	end;
   -- Note: Variable cannot be declared heere, only inside processes.
	signal s12 : boolean;  -- switch 1st or 2nd image
	
   -- After debugging, we can try decreasing bit width of MAX_COUNTER
	constant MAX_COUNTER: integer :=2**16-1; 
   constant SPEED_COUNTER: integer :=4;
   constant NONLIN_INCR: integer :=16;
   constant WAIT_COUNT: integer :=120; -- it counts by 60 Hz, i.e. 120=2s
	signal switch_counter : integer range 0 to MAX_COUNTER;
	
	constant DIAGONAL : integer := LCD_XSCREEN*LCD_XSCREEN + LCD_YSCREEN*LCD_YSCREEN;
	constant RASTR : integer := 32;
	constant modu : integer := 128;
	
	constant XOR_STEP:integer := 48;
	signal prop_step : integer range 0 to XOR_STEP-1;
	signal even_odd : boolean:=false;
 
 -- Do not use enum type for Effect, enum types are compiled as Finate state machines.
   signal Effect : integer range 0 to 6;
begin

	-- concurrent part with multiplexer - it is always active
	MuxAddress <=  MUX_ADDR1 when s12 else MUX_ADDR0;

	 
	process (xcolumn, yrow)
	-- Note: Signals can never be declared insed processes.
	variable x,y,x_rast,y_rast : integer;
	variable dif : integer;  --range -MAX_COUNTER to MAX_COUNTER
	variable dif2 : integer;
	variable dif3 : integer;
	variable dif4 : integer;
	
	
	begin
	   
		x:=to_integer(xcolumn);
		x_rast:=to_integer(xcolumn/RASTR);
      
		y:=to_integer(yrow);
		y_rast:=to_integer(yrow/RASTR);
		
		-- Bevare, this part is pure combinational circuit. 
		-- Variable diff and s12 must be always assigned to prevent forbidden latches.
		case Effect is
		
				--elsif dif>=-XOR_STEP and dif<0 then 
				--   s12<=(xcolumn(0) xor yrow(0))='1';
			when 0=> --kolo z leveho horniho rohu
				dif:=x*x+y*y-switch_counter*switch_counter;
				if dif>=0 then s12<=true;
			   else s12<=false;
				end if;
            
			when 1=>
				dif := y mod modu + x mod modu - switch_counter;
				dif2:= -y mod modu+ x mod modu+ modu-switch_counter;
				dif3:= y mod modu- x mod modu+ modu-switch_counter;
				dif4:= -y mod modu - x mod modu+ modu*2-switch_counter;
				if dif>=0 AND dif2>=0 AND dif3 >=0 AND dif4 >= 0 then s12<=true;
			   else s12<=false;
				end if;
			when 2=> --mozaika
				--dif := y mod 64 + x mod 64 - switch_counter;
				--dif:=(x mod modu *x mod modu +y mod modu *y mod modu)-switch_counter*switch_counter;
				dif:=((x mod modu - modu/2) * (x mod modu - modu/2)+(y mod modu - modu/2)*(y mod modu - modu/2))-switch_counter*switch_counter;
				--if Mod32(x) <= dif or Mod32(x) + dif >= 32 or Mod32(y) <= dif or Mod32(y) + dif >= 32 then s12 <= false;
				--if x mod 32 <= dif or x mod 32 + dif >= 32 or y mod 32 <= dif or y mod 32 + dif >= 32 then s12 <= false;
				--if ((x-400)*(x-400) mod 32) <= dif or ((x-400)*(x-400) mod 32) + dif >= 32 or ((y-300)*(y-300) mod 32) <= dif or ((y-300)*(y-300) mod 32) + dif >= 32 then s12 <= false;
				--if (((x-400)*(x-400)+(y-300)*(y-300)) mod 256) <= dif or (((x-400)*(x-400)+(y-300)*(y-300)) mod 256) + dif >= 256 then s12 <= false;
				--if dif >= 0 then s12<=true;
				--if (((x)*(x)+(y)*(y)) mod 256) <= dif or (((x)*(x)+(y)*(y)) mod 256) + dif >= 256 then s12 <= false;
				if dif >= 0 then s12<=true;
				else s12 <= false;
				end if;
			when 3=> --elipsa
				dif:= 9*(x-400)*(x-400) + 16*(y-300)*(y-300);
				if dif < 9*(400-switch_counter)*(400-switch_counter) OR dif > 9*(400+13*switch_counter/32)*(400+13*switch_counter/32) then s12<=true;
			   else s12<=false;
				end if;
			when 4=> --kolo z leveho horniho rohu a z praveho dolniho
				dif:=(x_rast*x_rast+y_rast*y_rast);
				dif2:=((x_rast-800/RASTR)*(x_rast-800/RASTR)+(y_rast-600/RASTR)*(y_rast-600/RASTR));
				if dif >= switch_counter*switch_counter/(RASTR*RASTR) and dif2 >= switch_counter*switch_counter/(RASTR*RASTR) then s12<=true;
			   else s12<=false;
				end if;
			when 5=> --kruznicova hvezdicka
				dif:=(x-200)*(x-200)+(y-150)*(y-150)-switch_counter*switch_counter;
				dif2:=(x-800+200)*(x-800+200)+(y-600+150)*(y-600+150)-switch_counter*switch_counter;
				dif3:=(x-200)*(x-200)+(y-600+150)*(y-600+150)-switch_counter*switch_counter;
				dif4:=(x-800+200)*(x-800+200)+(y-150)*(y-150)-switch_counter*switch_counter;
				--if dif>=0 OR dif2>= 0 OR dif3 >=0 OR dif4 >= 0 then s12<=true;
			   --else s12<=false;
				if (dif>=0 OR dif2>= 0) AND (dif3 >=0 OR dif4 >= 0) then s12<=true;
			   else s12<=false;
				end if;
				
			when 6=> --kosoctverec ze stran
				dif := y+x-switch_counter;
				dif2:= -y+x+600-switch_counter;
				dif3:= y-x+800-switch_counter;
				dif4:= -y-x+1400-switch_counter;
				if dif>=0 AND dif2>=0 AND dif3 >=0 AND dif4 >= 0 then s12<=true;
			   else s12<=false;
				end if;
		end case;
		
	end process;
	
fsm:process(VGA_VS, ACLRN, xcolumn, yrow)
  	-- in VHDL, enum types are reserved for Finite state machines only
	type state_t is (STATE_INIT, STATE_WAIT0, STATE_WAIT1, STATE_WAIT2, STATE_WAIT3, STATE_WAIT4, STATE_WAIT5, STATE_WAIT6, 
			STATE_WAIT7, STATE_WAIT8, STATE_WAIT9, STATE_WAIT10, STATE_WAIT11,
			STATE_KOLO_Z_OBOU_ROHU_UP, STATE_KOLO_Z_OBOU_ROHU_DOWN, STATE_SLZA_Z_PROSTRED_UP, STATE_SLZA_Z_PROSTRED_DOWN,
			STATE_KOSOCTVEREC_UP, STATE_KOSOCTVEREC_DOWN, STATE_ELIPSA_UP, STATE_ELIPSA_DOWN, STATE_MOZAIKA_KOLECKA_UP, STATE_MOZAIKA_KOLECKA_DOWN,
			STATE_MOZAIKA_KOSOCTVERCE_UP, STATE_MOZAIKA_KOSOCTVERCE_DOWN);
	variable state, state_next : state_t;

    constant MAX_WAIT: integer :=255;
	variable vcounter : integer range 0 to MAX_COUNTER;
	variable wait_counter : integer range 0 to MAX_WAIT;
	begin
	   if ACLRN='0' then state:=STATE_INIT;
		elsif falling_edge(VGA_VS) then
		   state:=state_next;
			case state is
			   when STATE_INIT=> state_next:=STATE_KOLO_Z_OBOU_ROHU_UP; vcounter:=0; Effect<=4;
				
				
				 when STATE_KOLO_Z_OBOU_ROHU_UP =>
					 if (vcounter*vcounter>(LCD_XSCREEN*LCD_XSCREEN)*3/4) then state_next:=STATE_WAIT0; wait_counter:=0; vcounter := LCD_XSCREEN;
					 end if;
					 if (vcounter*vcounter<DIAGONAL) then vcounter:=vcounter+SPEED_COUNTER;
					 else state_next:=STATE_WAIT0; wait_counter:=0;
					 end if;
					 switch_counter<=vcounter;
				 when STATE_WAIT0=>
					 if wait_counter<WAIT_COUNT then wait_counter:=wait_counter+1;
					 else state_next:=STATE_KOLO_Z_OBOU_ROHU_DOWN;
					 end if;
				 when STATE_KOLO_Z_OBOU_ROHU_DOWN =>
					 if (vcounter>LCD_XSCREEN) then vcounter:=LCD_XSCREEN;-- vcounter := LCD_XSCREEN+2*XOR_STEP;
					 end if;
					 if (vcounter*vcounter>=SPEED_COUNTER*SPEED_COUNTER) then vcounter:=vcounter-SPEED_COUNTER;
					 else state_next:=STATE_WAIT1; wait_counter:=0;
					 end if;
					 switch_counter<=vcounter;
				when STATE_WAIT1=>
				    if wait_counter<WAIT_COUNT then wait_counter:=wait_counter+1;
					 else state_next:=STATE_SLZA_Z_PROSTRED_UP;  Effect<=5; --vcounter:=0; switch_counter <= vcounter;
					 end if;
				when STATE_SLZA_Z_PROSTRED_UP =>
					 if (vcounter<250) then vcounter:= 250;
					 end if;
					 if (vcounter*vcounter<DIAGONAL) then vcounter:=vcounter+SPEED_COUNTER;
					 else state_next:=STATE_WAIT2; wait_counter:=0;
					 end if;
					 switch_counter<=vcounter;
				when STATE_WAIT2=>
				    if wait_counter<WAIT_COUNT then wait_counter:=wait_counter+SPEED_COUNTER;
					 else state_next:=STATE_SLZA_Z_PROSTRED_DOWN;
					 end if;
				 when STATE_SLZA_Z_PROSTRED_DOWN =>
					 --if (vcounter < LCD_XSCREEN) then vcounter:=LCD_XSCREEN;-- vcounter := LCD_XSCREEN+2*XOR_STEP;
					 --end if;
					 if (vcounter*vcounter>=SPEED_COUNTER*SPEED_COUNTER) then vcounter:=vcounter-SPEED_COUNTER;
					 else state_next:=STATE_WAIT3; wait_counter:=0;
					 end if;
					 switch_counter<=vcounter;
				 when STATE_WAIT3=>
					 if wait_counter<WAIT_COUNT then wait_counter:=wait_counter+1;
					 else state_next:=STATE_KOSOCTVEREC_UP; Effect<=6;
					 end if;
				 when STATE_KOSOCTVEREC_UP =>
					 if (vcounter<(LCD_YSCREEN+LCD_XSCREEN)/2) then vcounter:=vcounter+SPEED_COUNTER;
					 else state_next:=STATE_WAIT4; wait_counter:=0;
					 end if;
					 switch_counter<=vcounter;
				 when STATE_WAIT4=>
					 if wait_counter<WAIT_COUNT then wait_counter:=wait_counter+1;
					 else state_next:=STATE_KOSOCTVEREC_DOWN;
					 end if;
				 when STATE_KOSOCTVEREC_DOWN =>
					 if (vcounter>=SPEED_COUNTER) then vcounter:=vcounter-SPEED_COUNTER;
					 else state_next:=STATE_WAIT5; wait_counter:=0;
					 end if;
					 switch_counter<=vcounter;
				 when STATE_WAIT5=>
					 if wait_counter<WAIT_COUNT then wait_counter:=wait_counter+1;
					 else state_next:=STATE_ELIPSA_UP; Effect <= 3;
					 end if;
				 when STATE_ELIPSA_UP =>
					 if (vcounter<LCD_XSCREEN/2+SPEED_COUNTER) then vcounter:=vcounter+SPEED_COUNTER;
					 else state_next:=STATE_WAIT6; wait_counter:=0; vcounter := LCD_XSCREEN/2;
					 end if;
					 switch_counter<=vcounter;
				 when STATE_WAIT6=>
					 if wait_counter<WAIT_COUNT then wait_counter:=wait_counter+1;
					 else state_next:=STATE_ELIPSA_DOWN;
					 end if;
				 when STATE_ELIPSA_DOWN =>
					 if (vcounter>=SPEED_COUNTER) then vcounter:=vcounter-SPEED_COUNTER;
					 else state_next:=STATE_WAIT7; wait_counter:=0; vcounter:=0;
					 end if;
					 switch_counter<=vcounter;
				when STATE_WAIT7=>
					 if wait_counter<WAIT_COUNT then wait_counter:=wait_counter+1;
					 else state_next:=STATE_MOZAIKA_KOLECKA_UP; Effect <= 2;
					 end if;
				 when STATE_MOZAIKA_KOLECKA_UP =>
					 if vcounter<91 then vcounter:=vcounter+1;
					 else state_next:=STATE_WAIT8; wait_counter:=0;
					 end if;
					 switch_counter<=vcounter;
				 when STATE_WAIT8=>
					 if wait_counter<WAIT_COUNT then wait_counter:=wait_counter+1;
					 else state_next:=STATE_MOZAIKA_KOLECKA_DOWN;
					 end if;
				 when STATE_MOZAIKA_KOLECKA_DOWN =>
					 if (vcounter>=1) then vcounter:=vcounter-1;
					 else state_next:=STATE_WAIT9; wait_counter:=0;
					 end if;
					 switch_counter<=vcounter;
				when STATE_WAIT9=>
					 if wait_counter<WAIT_COUNT then wait_counter:=wait_counter+1;
					 else state_next:=STATE_MOZAIKA_KOSOCTVERCE_UP; Effect <= 1;
					 end if;
				 when STATE_MOZAIKA_KOSOCTVERCE_UP =>
					 if vcounter<modu+1 then vcounter:=vcounter+1;
					 else state_next:=STATE_WAIT10; wait_counter:=0;
					 end if;
					 switch_counter<=vcounter;
				 when STATE_WAIT10=>
					 if wait_counter<WAIT_COUNT then wait_counter:=wait_counter+1;
					 else state_next:=STATE_MOZAIKA_KOSOCTVERCE_DOWN;
					 end if;
				 when STATE_MOZAIKA_KOSOCTVERCE_DOWN =>
					 if (vcounter>=1) then vcounter:=vcounter-1;
					 else state_next:=STATE_WAIT11; wait_counter:=0;
					 end if;
					 switch_counter<=vcounter;
				when STATE_WAIT11=>
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

