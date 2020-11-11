library ieee, work;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;       -- type integer and unsigned
use work.VGApackage.all;

entity MyDisplayLogic is 
generic ( xreverse : integer:=0 );
port(	 
       yrow, xcolumn : in vga_xy; -- row and  column indexes of VGA video
		 VGA_CLK : in std_logic;  -- it is not used in this code, but added for future
	    VGA_R, VGA_G, VGA_B: out vga_byte --  color information
	 ); 
end;

architecture behavioral of MyDisplayLogic is

---------------------------------------------------------------------------------
function SwColor(xreverse:integer; C1, C2: RGB_type) return RGB_type is
begin
       if xreverse>0 then return C1; else return C2; end if;
end function;
-- Used colors - we defined them by the way that will allow their OR merging in future	
constant WHITE : RGB_type := ToRGB(X"FFFFFF");  
constant GREEN : RGB_type := ToRGB(X"3c746b");  
constant BLUE : RGB_type := ToRGB(X"007cc3"); 
constant CYAN : RGB_type := ToRGB(X"75c5f0");
constant BROWN : RGB_type := ToRGB(X"957f66");  
constant YELLOW : RGB_type := ToRGB(X"fff500");
constant BLACK : RGB_type := ToRGB(X"000000");  -- or ToRGB(0,0,0);
---------------------------------------------------------------------------
constant MEMROWSIZE : integer := 64; -- memory organization
constant MEMROWCOUNT : integer := 64;
constant EMBORGX1 : integer := XSIZE-MEMROWSIZE-48; -- positions of picture in the flag
constant EMBORGY1 : integer := 48;
constant EMBORGX2 : integer := XSIZE-MEMROWSIZE-48; -- positions of picture in the flag
constant EMBORGY2 : integer := YSIZE-MEMROWCOUNT-48;
constant MEM_END_ADDRESS : integer := 4095; -- not used here
------------------------------------------------------------------------------
component nalepka64	port(	
		address : IN  std_logic_vector(11 DOWNTO 0);
		clock   : IN  std_logic :='1';
		q       : OUT std_logic_vector(1 DOWNTO 0));
end component nalepka64;

signal picture_address_s : std_logic_vector(11 DOWNTO 0); -- address sent to memory
signal picture_q_s : std_logic_vector(1 downto 0); -- obtained data
signal VGA_CLK_n:std_logic; -- negated VGA_CLK


begin 
	
	VGA_CLK_n <= not VGA_CLK;

	rom_inst : nalepka64
   PORT MAP(clock => VGA_CLK_n, 
				address => picture_address_s, 
				q => picture_q_s);

   LSPflag : process(xcolumn, yrow) -- outputs of LSPflag process depend on xcolumn and yrow
   variable RGB : RGB_type; -- color output
   variable x, y : integer; -- integer xcolumn and yrow
	variable romID:integer range 0 to 2;
   begin
	-- convert to integers
		x:=to_integer(xcolumn); y:=to_integer(yrow);
		romID:= 0;
		if(x>=EMBORGX1 and x<EMBORGX1+MEMROWSIZE and y>=EMBORGY1 and y<EMBORGY1+MEMROWCOUNT) then
			romID:=1;
		end if;
		
		if(x>=EMBORGX2 and x<EMBORGX2+MEMROWSIZE and y>=EMBORGY2 and y<EMBORGY2+MEMROWCOUNT) then
			romID:= 2;
		end if;
      
		if(x<0) or (x>=XSIZE) or (y<0) or (y>=YSIZE) then
		   RGB:=BLACK; --black outside of visible frame
		elsif romID>0 and picture_q_s /= "00" then
			if romID=1 then
				if picture_q_s = "01" then RGB:=CYAN;
				else RGB:=YELLOW;
				end if;
			else
				if picture_q_s = "01" then RGB:=BROWN;
				else RGB:=YELLOW;
				end if;
			end if;
		elsif (y < 163) and (y > 891 - 8*x) and (y > 8*x - 821) then
		   RGB:=CYAN;
		elsif (y < 163) and (y > 249 - 2*x) and (y > 2*x - 179) then  -- line equation  y = 240-(6/5)*x
		   RGB:=WHITE;
		elsif (y >= 163) and  (y < 206) and (x > 43) and (x < 171)then     -- line equation  y = 240-(3/8)*x
		   RGB:=BROWN;
		elsif (2*y < YSIZE) then
		   RGB:=BLUE;
		else 
			RGB:=GREEN;
		end if;
		
		case romID is
			when 1 =>
				 picture_address_s <= std_logic_vector(
							to_unsigned((y-EMBORGY1)*MEMROWSIZE + (x-EMBORGX1), picture_address_s'LENGTH));
			when 2 =>
				--mirroring
				 picture_address_s <= std_logic_vector(
							to_unsigned((-y+EMBORGY2)*MEMROWSIZE + (x-EMBORGX2), picture_address_s'LENGTH));
			  when others =>     picture_address_s <=(others=>'0'); 
		end case;

	-- Copy results in RGB to outputs of entity
		VGA_R<=RGB.R; VGA_G<=RGB.G; VGA_B<=RGB.B;
-----------------------------------------------------------------------------
	end process;
    
end architecture behavioral;