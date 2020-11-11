---------------------------------
-- LCD controller -- Version 1.0
-----------------------------------------------------------------------------------------
-- * Educational Library * that highlights design principles of circuits,
-- Richard Susta, CTU in Prague, Faculty of Electrical Eng., Department of Control Eng.
-- Published under GNU General Public License 
-----------------------------------------------------------------------------------------
-- The controller is FSM that performs all necessary initializations after power-up 
---and then, it listens on asynchronous write-only bus. 
-- The bus is controlled by READY (RDYN input) and Acknowledge (ACKN output) signals. 
-- Character code (DATA input) is written directly into LCD memory
-- to position of LCD text specified by supplied address (ADDRESS input).
-- After each command, the controller waits until the busy flag of used LCD chip is active,
-- before it accepts new command, so its operations are as fast as possible.
-- A write character operation is about 45 us and clear LCD operation is about 1.4 ms.
--------------------------------------------------------------
-- History: In 2016, new original lcd_controller was programmed as a replacement of too slow LCD_driver.
-- It requires only about 100 LE (logic elements).
------------------------------------------------------------------------------------------ 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lcd_controller is
	port (
		CLOCK_50 : in std_logic; -- 50 MHz clock
		-- address of LCD text position are from X"00" to X"0F" (1st line) and X"10" to X"1F" (2nd line)
		ADDRESS : in std_logic_vector(4 downto 0); 
		DATA :  in std_logic_vector(7 downto 0); -- ASCII code of character; 
      
		-- CLEARN_LCD is active in 0 and it is sent by RDYN and ACKN as other commands,
		-- thus, it fully integrated with them. It takes about 1.4 ms before LCD chips finishes it.
		-- If it is active, then DATA and ADDRESS are ignored and clear command of LCD is performed. 
		CLEARN_CMD : in std_logic; 
		
		-- RDYN is active in '0, it specifies, then data and address are ready or clear command is sent. 
		-- RDYN must be held in '0' together with stable DATA and ADDRESS until ACK='0', 
		-- if ACKN='0' then DATA and ADDRESS can be released and RDYN must return to '1' to close command.
		RDYN : in std_logic;  
		ACLRN : in std_logic;  -- power-up only initialization, active in '0', connect to any KEY[x] on DE
		-----
		-- ALL LCD_* should be assigned to pins with the same names on DE2 boards  
		LCD_EN, LCD_RW, LCD_RS, LCD_ON : out std_logic;
		LCD_DATA : inout std_logic_vector(7 downto 0);
			----
		ACKN : out std_logic;  -- active in '0', data write (or clear command) was acknowledged (done)
		                       -- if ACKN='0' then the controller waits for RDYN='1'.
									  -- The next command can start only when RDYN='1' and ACKN='1'
		ACLRN_OUT : out std_logic -- it is alwasy in '0; when ACLR='0'
		                         -- it goes to '1' after the controller has finished power-up initialization
);
end entity;

architecture rtl of lcd_controller is

	signal LCD_DATA_OUT : std_logic_vector(LCD_DATA'range);
	signal request_write_to_LCD, sig_LCD_RS, data_Z_state : std_logic;

	signal clock_internal : std_logic; -- clock signal with dual frequency
	signal fast_clock_reguest : boolean; -- request for fast clock
	signal fast_clock_active : boolean; -- the divider signals that clock operates on higher frequency

	signal data_to_lcd : std_logic_vector(DATA'range);
	signal busy_LCD_flag : std_logic;
begin
	LCD_ON <= '1';
   LCD_RS <= sig_LCD_RS;
	LCD_DATA <=  LCD_DATA_OUT when data_Z_state='0' else (others=>'Z');

-- BIDIRECTIONAL TRI STATE LCD DATA BUS SWITCH WITH DATA ENABLE DELAY
switch_rw : 
process(ACLRN, CLOCK_50)
   type t_rwstate is (rws_write_data, rws_z, rws_read, rws_busy);
 	variable nstate, state : t_rwstate;
	variable vbusy_LCD_flag : std_logic;
begin
	if ACLRN='0' then	state:=rws_busy;
	elsif rising_edge(CLOCK_50) then
		state := nstate;
		vbusy_LCD_flag := '1'; -- default value;
		case state is
		   -- enable data from controller
			when rws_write_data =>
	         data_Z_state <='0'; LCD_RW <= '0'; 
			   if request_write_to_LCD='1' then nstate:=rws_write_data;
				else nstate:=rws_z;
				end if;
			-- switch LCD to write, data in Z state
			when rws_z => 
	         data_Z_state <='1'; LCD_RW <= '0'; 
			   if request_write_to_LCD='1' then nstate:=rws_write_data;
				else nstate:=rws_read;
				end if;
			-- switch LCD to read, data in Z state
			when rws_read => 
	         data_Z_state <='1'; LCD_RW <= '1'; 
			   if request_write_to_LCD='1' then nstate:=rws_z;
				elsif sig_LCD_RS='0' then -- mode function
				     nstate:=rws_busy;
				else nstate:=rws_read;
				end if;
			-- test busy flag	
			when rws_busy => -- read busy state of LCD (conditions RS='0' and RW='1')
	         data_Z_state <='1'; LCD_RW <= '1';
			   if request_write_to_LCD='1' then 
				   nstate:=rws_z; -- we go directly to rws_z
				elsif sig_LCD_RS='1' then 
				   nstate:=rws_read;
				else nstate:=rws_busy;
					vbusy_LCD_flag := LCD_DATA(7); 
				end if;
		end case;
	end if;
   busy_LCD_flag <= vbusy_LCD_flag;	
end process;

-- The divider creates clock 1.5625 MHz (period 640 us) when fast_clock_active is true.
-- The frequency could be even higher, but 1.56 MHz was selected for safety. 
-- If fast_clock_active is false, the clock is reduced to 381 Hz 
-- that is required during slow initialization process spefified by LCD chip timing.
divider : 
process(ACLRN, CLOCK_50)
	variable counter : integer range 0 to 2**16;
	variable vfast_clock : boolean;
   variable toggle : std_logic;	
	begin 
		if ACLRN='0' then 
			counter:=0; vfast_clock := false; toggle:='0';
		elsif rising_edge(CLOCK_50) then 
			-- we used constants that allow simple implementation of divider
			if (vfast_clock and counter<2**4) or (not vfast_clock and counter<2**16) 
			then counter:=counter+1;
			else counter:=0; 
				  toggle := not toggle; -- dividing by 2 to create 50 % duty cycle of clock
				  vfast_clock:=fast_clock_reguest; -- we change clock frequency in this point to prevent glitches
			end if;
		end if;
		clock_internal<=toggle;
		fast_clock_active<=vfast_clock;
end process;	

-- FSM that initilizes LCD chip and performs commands 	
fsm :	process (ACLRN, clock_internal, ADDRESS)
		variable VDATA : std_logic_vector(DATA'RANGE);
		variable VLCD_EN : std_logic; -- active in 0, toggle for writing data to LCD 
		variable vrequest_write_to_LCD : std_logic; -- sigle for controlling iobuf
		variable VLCD_RS : std_logic;
		variable VACKN : std_logic; -- active in '0'
		variable VACLRN_OUT : std_logic;
		variable address_of_lcd : std_logic_vector(LCD_DATA'range);
		
		variable ix : integer range 0 to 7;
		type t_init is array(0 to 6) of std_logic_vector(LCD_DATA'range);
	   constant init : t_init := (x"38", x"38", x"38", x"08",x"01",x"0c",x"06");
		-- X"38":Set Function to 8-bit transfer and 2 line display with 5x8 Font size
		-- Note:  Other LCD configurations look terrible for this LCD type (the used chip is designed for more LCD types) 
		-- X"8":display off, X"1":clear, X"0c":display on, X"6":entry mode
    	type t_state is (reset0, reset1, reset2,
		              func_set, func_set_e, func_set_inc, wait_fast_frequency,
						  command_loop_wait_RDYN, write_address_e, write_address_hold,
						  write_address_busy_test, write_address_busy_OK, 
						  write_data, write_data_e, write_data_busy_test,
						  write_clear, write_clear_e, 
						  wait_end);
 	   variable next_state, current_state : t_state;
	begin
	-- we create internal addresses of LCD RAM by reorganizing of ADDRESS bits 
	-- DDRAM addresses is sent by LCD data bus as 00-1F (for 1st line of LCD ), and as 40-4F (for 2nd line of LCD), 
	--  the other address are not used in this LCD type
		address_of_lcd(7):='1'; -- upper bit in 1 specify DDRAM address
		address_of_lcd(6):=ADDRESS(4); -- the second line begins from 0x40
		address_of_lcd(5):='0'; address_of_lcd(4):='0'; -- always zero for DDRAM in this LCD type
		address_of_lcd(3 downto 0):=ADDRESS(3 downto 0);

	if ACLRN = '0' then
      -- power up initialization
		current_state := reset0; next_state:=reset0;  fast_clock_reguest<=false;
		VLCD_EN := '1'; vrequest_write_to_LCD := '0'; VACLRN_OUT:='0';
		VDATA := (others=>'0'); VACKN := '1';
	elsif rising_edge(clock_internal) then
--------------------------------------------		
		current_state:=next_state;
--------------------------------------------
	-- default values
	    VLCD_EN := '1'; -- this signal toggles to '0' to write data to LCD chip 
		VLCD_RS := '0'; -- "ram" or "set function" selection is assigned to "set function"
		vrequest_write_to_LCD := '1'; -- enabled write
		
		
		case current_state is
-- wait after power up
		when reset0 =>
	       VACLRN_OUT:='0'; VACKN := '1';
			fast_clock_reguest<=false; ix:=0; vrequest_write_to_LCD := '0'; -- data in 3state
			LCD_DATA_OUT<=init(0);
			if not fast_clock_active then next_state:= reset1; -- wait for slow clock
			else next_state:=reset0; -- wait for slow clock
			end if;
		when reset1 =>
			next_state:= reset2; vrequest_write_to_LCD := '0'; -- data in 3state
		-- delay	
		when reset2 =>
			next_state:= func_set; 
	
		when func_set =>
			LCD_DATA_OUT<=init(ix);
			next_state:= func_set_e;

		when func_set_e =>
			VLCD_EN:='0';   -- toggle enable
			next_state:= func_set_inc;

		when func_set_inc =>
			if ix<init'HIGH then -- Is a next command in init memory?
				ix:=ix+1;
				next_state:= func_set;
			else 
				next_state:=wait_fast_frequency;
				fast_clock_reguest<=true; -- other commands can be performed faster
			end if;
			
		when wait_fast_frequency=>
           if not fast_clock_active  then 
			   fast_clock_reguest<=true; -- other commands can be performed faster
              next_state:=wait_fast_frequency;
			else
		       VACLRN_OUT:='1';
				next_state:=command_loop_wait_RDYN;
			end if;

		when command_loop_wait_RDYN =>
		  VACKN:='1';
		  if RDYN='0' then -- RDYN is active in '0' 
            if CLEARN_CMD='0' then 
				  next_state:=write_clear; --  clear command
				else  
					LCD_DATA_OUT <= address_of_lcd;
					VDATA := DATA;  -- buffer data
					next_state:= write_address_e;
				end if;
		  else 
			   next_state:= command_loop_wait_RDYN;
		end if;
		--------------------------------------------------------------------
		when write_address_e =>
			VACKN:='0';  -- data are stored in buffer, so we can generate ACK here
			VLCD_EN:='0';  -- toggle enable
			next_state:= write_address_hold;
		when write_address_hold =>
			next_state:= write_address_busy_test;
		when write_address_busy_test=>
	      vrequest_write_to_LCD:='0';  -- when LCD_RW='0' busy is always 1
		   if busy_LCD_flag='1' then
		      next_state:=write_address_busy_test;
			else 
		      next_state:=write_address_busy_OK;
			end if;	
		when write_address_busy_OK =>
			next_state:= write_data;
-------------------------------------------------------------------------		
		when write_clear =>
			VLCD_RS:='0';
			LCD_DATA_OUT <= X"01";
			next_state:= write_clear_e;
		when write_clear_e =>
			VACKN:='0';  
			VLCD_RS:='0';
			VLCD_EN:='0';
			next_state:= write_data_busy_test;
	
	
-------------------------------------------------------------------------			
		when write_data =>
			VLCD_RS:='1';
			LCD_DATA_OUT <= VDATA;
			next_state:= write_data_e;
		when write_data_e =>
			VLCD_RS:='1';
			VLCD_EN:='0';
			next_state:= write_data_busy_test;
		when write_data_busy_test=>
	       vrequest_write_to_LCD:='0';  -- busy_LCD_flag is always 1 when vrequest_write_to_LCD='1' 
		   if busy_LCD_flag='1' then
		      next_state:=write_data_busy_test;
			else 
		      next_state:=wait_end;
			end if;	
		-- wait ende of RDYN, RDYN is active in '0''
		when wait_end =>
			if RDYN='1' then 
				next_state:= command_loop_wait_RDYN;
				VACKN := '1';
			else 
			  next_state:= wait_end;
			end if;				
		end case;
	end if;
	LCD_EN <= VLCD_EN;
	request_write_to_LCD <= vrequest_write_to_LCD;
	sig_LCD_RS <= VLCD_RS;
	ACKN <= VACKN;
	ACLRN_OUT<=VACLRN_OUT;
	end process;
	

end architecture;
