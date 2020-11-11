-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License V1.2 2019
-------------------------------------------------------------

-----------------------------------
-- Note:
-- 1. To find proper places for changes, search for string: ***ToDo
-- 2. In Quartus, this file can be tested by "Start Analysis & Synthesis" button, 
--    but it always returns error: Error (10533): VHDL Wait Statement error...
--    It is OK - the compilation is impossible because testbench codes are not synthesizable.
--    the file is intended for ModelSim.
-----------------------------------
library ieee, work; use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all; 
use std.textio.all;
use work.VGApackage.all;


entity testbench_DisplayLogic is  --test benche style of entity
end testbench_DisplayLogic;

architecture testbench of testbench_DisplayLogic is
-------------------------------------------------------------------------------
-- ***ToDo 1 of 3 - Change condions of simulations
constant FILE_NAME : string := "C:/SPS/image.txt";  -- file name for storing testbench results, no \ backslashes !

-- how many times  the generation of image will be repeated, set to 1 in the most cases
constant NUMBER_OF_WRITTEN_IMAGES : positive := 1; 
---------------------------------------------------------------------------------------
-- ***ToDo 2 of 3: Replace by your own component
component DisplayLogic0 is 
--component DisplayLogic is 
port(	 
       yrow, xcolumn : in vga_xy; -- row and  column indexes of VGA video
	    VGA_CLK : in std_logic;  --pixel clock
	    VGA_R, VGA_G, VGA_B: out vga_byte --  color information
	 ); 
end component;
--------------------------------------------------------------

------------------------------
signal CLK_50MHz :  std_logic;
constant CLOCK_PERIOD : time := 20 ns;
signal ACLRN_signal, ACLRN_signal_delayed : std_logic:='0'; -- initialization after power-up

-- signal that corresponds to input ports of DE2 / DE2-115
signal VGA_BLANK :  std_logic;
signal VGA_HS :   std_logic;
signal VGA_VS :   std_logic;
signal VGA_SYNC :  std_logic;  -- VGA_SYNC is not recorded by the testbench, because it is = VGA_HS and VGA_VS
signal VGA_CLK :  std_logic:='0';
signal VGA_B :   std_logic_vector(9 downto 0);
signal VGA_G :   std_logic_vector(9 downto 0);
signal VGA_R :   std_logic_vector(9 downto 0);


component VGAgenerator is
port(
	CLOCK_50: in std_logic;  -- DE2 clock
	ACLRN : in std_logic;  -- asynchronous initilization 
	yrow : out vga_xy:=(others=>'0'); -- pixel y-index
	xcolumn : out vga_xy:=(others=>'0'); -- pixel x-index
	VGA_CLK: out std_logic:='0';    -- pixel clock 
	VGA_BLANK: out std_logic:='1';  -- ='0' if non-visible part of picture
	VGA_HS: out std_logic:='1';     -- ='0' if horizontal synchronization puls
	VGA_VS: out std_logic:='1';     -- ='0' if vertical synchronization puls 
	VGA_SYNC: out std_logic:='1' -- ='0' if VGA_HS='0' or VGA_VS='0'
);
end component;

component  VGARegDE2 is
port(	 VGA_R_in, VGA_G_in, VGA_B_in: in vga_byte;--  color information	    
	    yrow, xcolumn : in vga_xy; -- pixel index
		 VGA_CLK_in    : in std_logic; -- pixel clock
		 VGA_BLANK_in,  -- '0' if non-visible part of picture
		 VGA_HS_in,     -- '0' if horizontal synchronization puls
		 VGA_VS_in,     -- '0' if vertical synchronization puls 
		 VGA_SYNC_in : in std_logic;
       CLOCK_50 : in std_logic;	-- synchronizes all signal	to doamin clock 
	    
		 VGA_R, VGA_G, VGA_B: out std_logic_vector(9 downto 0);--  color information for DE2
		 VGA_CLK,    -- pixel clock sent to VGA driver = not VGA_CLK_in
		 VGA_BLANK,  -- '0' if non-visible part of picture
		 VGA_HS,     -- '0' if horizontal synchronization puls
		 VGA_VS,     -- '0' if vertical synchronization puls 
		 VGA_SYNC : out std_logic;		 
	    tb_yrow, tb_xcolumn : out vga_xy -- testbench outputs
	 );
end component;


---------------------------------------------------------------------------------

constant VS_LENGTH  : integer := 525; -- total rows including hidden
constant HS_LENGTH  : integer := 800; ---- total columns including hidden 

-- connection signals
signal	VGA_R_signal,	VGA_G_signal,	VGA_B_signal : vga_byte;
signal	column_signal :  vga_xy;
signal	row_signal :  vga_xy;
constant VGAZERO : unsigned(column_signal'range):=(others=>'0');
signal	VGA_CLK_signal, VGA_BLANK_signal : std_logic;
signal	VGA_HS_signal,	VGA_VS_signal,	VGA_SYNC_signal : std_logic;
signal tb_yrow, tb_xcolumn  : unsigned(column_signal'range):=VGAZERO;

signal iswrite_signal : std_logic:='0';

begin 

 -- Clock process with 50% duty cycle is generated here.
   clk_process :process
   begin
        CLK_50MHz <= '0';
        wait for CLOCK_PERIOD/2;  --for 50 % of CLK_25MHz175 period is'0'.
        CLK_50MHz <= '1';
        wait for CLOCK_PERIOD/2;  --for next 50% of CLK_25MHz175 period is '1'.
   end process;
   
    -- Clear process generates ACLRN for 1 CLOCK_PERIOD.
   clear_process :process
   begin
        ACLRN_signal <= '0'; ACLRN_signal_delayed <= '0';
        wait for CLOCK_PERIOD;  
        ACLRN_signal <= '1';
        wait for 2*CLOCK_PERIOD;
        ACLRN_signal_delayed <= '1';  -- we start storing testbench result with 1 clock delay
        wait;  -- terminate process.
   end process;
	
	stimuls : process(ACLRN_signal_delayed,VGA_CLK) 
   file outfile : TEXT; 
   variable  outline  : line; --line
   variable  fstatus : FILE_OPEN_STATUS;     
	 variable controlSignals : character;
	 
	 -- convert std_logic_vector to base32hex using Triacontakaidecimal encoding
	 function base32hex(data: std_logic_vector(4 downto 0)) return character is
--   variable c: character;
	 variable x : integer range 0 to 32;
	 constant results : string(1 to 32) := "0123456789ABCDEFGHIJKLMNOPQRSTUV";
   begin
        x:=to_integer(unsigned(data)); return results(x+1);
   end base32hex;
	 
	 function slv10_to_str(slv: std_logic_vector(9 downto 0)) return string is
      variable  astring: string(1 to 2);
 		begin
			astring(1):= base32hex(slv(4 downto 0));	astring(2):= base32hex(slv(9 downto 5));
			return astring;
		end slv10_to_str;
		
	variable iswrite : std_logic:='0';
	constant HEADER:string := "## VGA Testbench result - 800x525 full VGA frame";
	constant NUMHEADER:string := "##=";
	begin
	if ACLRN_signal_delayed='0' then iswrite:='0';
	elsif rising_edge(VGA_CLK) then
	  if( (iswrite='0') and (tb_xcolumn=VGAZERO) and (tb_yrow=VGAZERO)  ) then
	     file_open(fstatus, outfile, FILE_NAME, WRITE_MODE);  -- file name
		   iswrite:='1';
		   if fstatus=OPEN_OK then 
		     write(outline,HEADER); 
		     writeline(outfile, outline);
		   end if;
	  end if;
	  if iswrite='1' and fstatus=OPEN_OK then
	     if(tb_xcolumn=VGAZERO) then
	        write(outline,NUMHEADER);write(outline,to_integer(tb_xcolumn));
	        write(outline,',');write(outline,to_integer(tb_yrow));
 		     writeline(outfile, outline);
 		   end if;
	     controlSignals:=base32hex("00" & not (VGA_BLANK & VGA_VS & VGA_HS)); 
		  
	  	  write(outline, controlSignals);
		  write(outline, slv10_to_str(VGA_R));
		  write(outline, slv10_to_str(VGA_G));
		  write(outline, slv10_to_str(VGA_B));
	     writeline(outfile, outline);

	     if (tb_xcolumn=HS_LENGTH-1) and (tb_yrow=VS_LENGTH-1) then
	     	  file_close(outfile);
		     iswrite:='0';
		  end if;
	   end if;
	   if iswrite='1' and fstatus/=OPEN_OK then
		      assert false report "File status is not OPEN_OK" 
			   severity failure;
			   file_close(outfile);
	         iswrite:='0';
	   end if;
	end if;
	iswrite_signal<=iswrite;

  
 	end process stimuls;
 	
 	counter : process(ACLRN_signal, iswrite_signal)
 	variable counterOfImages : integer:=0;
 	begin
 	  	if ACLRN_signal='0' then counterOfImages:=0;
 	  	elsif falling_edge(iswrite_signal) then
 	  	  counterOfImages := counterOfImages+1;
 	  	  if counterOfImages>= NUMBER_OF_WRITTEN_IMAGES then

 	    			   assert false report "OK end of the simulation - Required NUMBER_OF_WRITTEN_IMAGES was done" 
						severity failure;
 	    		end if;
     end if;
  end process counter;



ivgagen : VGAgenerator
port map(CLOCK_50 => CLK_50MHz,
		ACLRN => ACLRN_signal,
		yrow => row_signal,
		xcolumn => column_signal,
		VGA_CLK => VGA_CLK_signal,
		VGA_BLANK => VGA_BLANK_signal,
		VGA_HS => VGA_HS_signal,
		VGA_VS => VGA_VS_signal,
	   VGA_SYNC => VGA_SYNC_signal);
			
ivgareg : VGARegDE2
port map(	 
       VGA_R_in => VGA_R_signal,
       VGA_G_in => VGA_G_signal,
       VGA_B_in => VGA_B_signal,
       yrow => row_signal,
       xcolumn => column_signal,
       VGA_CLK_in => VGA_CLK_signal,
       VGA_BLANK_in => VGA_BLANK_signal,
       VGA_HS_in => VGA_HS_signal,
       VGA_VS_in => VGA_VS_signal,
       VGA_SYNC_in => VGA_SYNC_signal,
       CLOCK_50 => CLK_50MHz,
       VGA_R => VGA_R,
       VGA_G => VGA_G,
       -- connect outputs to VGA pins with the same names
       VGA_B => VGA_B,
       VGA_CLK => VGA_CLK,
       VGA_BLANK => VGA_BLANK,
       VGA_HS => VGA_HS,
       VGA_VS => VGA_VS,
       VGA_SYNC => VGA_SYNC,
       -- outputs for testbench program
       tb_yrow => tb_yrow,
       tb_xcolumn => tb_xcolumn
	 );

--------------------------------------------------------------------------------------
-- ***ToDo 3 of 3: Replace by your own component
iDisplayLogic : DisplayLogic0
--iDisplayLogic : DisplayLogic
port map(	
		 yrow => row_signal, -- yrow input by wire row_signal
		 xcolumn => column_signal, -- xcolumn by wire column_signal
		 VGA_CLK => VGA_CLK_signal,
		 VGA_R => VGA_R_signal,
		 VGA_G => VGA_G_signal,
		 VGA_B => VGA_B_signal
	 ); 
------------------------------------------------------------------


end architecture testbench;