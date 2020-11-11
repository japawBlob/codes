-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "08/31/2020 14:25:53"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	DemoMux_LCD IS
    PORT (
	LCD_CLK : OUT std_logic;
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	LCD_DEN : OUT std_logic;
	LCD_DIM : OUT std_logic;
	LCD_B : OUT std_logic_vector(5 DOWNTO 0);
	LCD_G : OUT std_logic_vector(5 DOWNTO 0);
	LCD_R : OUT std_logic_vector(5 DOWNTO 0)
	);
END DemoMux_LCD;

-- Design Ports Information
-- LCD_CLK	=>  Location: PIN_V24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_DEN	=>  Location: PIN_P25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_DIM	=>  Location: PIN_P27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_B[5]	=>  Location: PIN_J26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_B[4]	=>  Location: PIN_L28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_B[3]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_B[2]	=>  Location: PIN_V22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_B[1]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_B[0]	=>  Location: PIN_V28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_G[5]	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_G[4]	=>  Location: PIN_T21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_G[3]	=>  Location: PIN_R23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_G[2]	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_G[1]	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_G[0]	=>  Location: PIN_P21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_R[5]	=>  Location: PIN_V27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_R[4]	=>  Location: PIN_U28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_R[3]	=>  Location: PIN_U27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_R[2]	=>  Location: PIN_R28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_R[1]	=>  Location: PIN_R27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCD_R[0]	=>  Location: PIN_V26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF DemoMux_LCD IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LCD_CLK : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_LCD_DEN : std_logic;
SIGNAL ww_LCD_DIM : std_logic;
SIGNAL ww_LCD_B : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_LCD_G : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_LCD_R : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst|ipll|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|ipll|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|ipll|altpll_component|auto_generated|locked~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst|ipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst4~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \instDL2M|iDL1|Add2~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~4_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~6_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~12_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~2_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~4_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~6_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~8_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add0~1_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add0~3\ : std_logic;
SIGNAL \instDL2M|iDL1|Add0~2_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add0~5\ : std_logic;
SIGNAL \instDL2M|iDL1|Add0~4_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add0~7\ : std_logic;
SIGNAL \instDL2M|iDL1|Add0~6_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add0~9\ : std_logic;
SIGNAL \instDL2M|iDL1|Add0~8_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add0~11\ : std_logic;
SIGNAL \instDL2M|iDL1|Add0~10_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add0~12_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan11~1_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan11~3_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan11~5_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan11~7_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan11~9_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan11~11_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan11~13_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan11~14_combout\ : std_logic;
SIGNAL \inst|Add0~0_combout\ : std_logic;
SIGNAL \inst|Add0~2_combout\ : std_logic;
SIGNAL \inst|Add0~6_combout\ : std_logic;
SIGNAL \inst|Add1~0_combout\ : std_logic;
SIGNAL \inst|Add1~19_combout\ : std_logic;
SIGNAL \inst|Add1~23\ : std_logic;
SIGNAL \inst|Add1~25_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add5~2_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add5~8_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~21_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add5~11\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~25\ : std_logic;
SIGNAL \instDL2M|iDL1|Add5~12_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~27\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~26_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~29_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~7_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~9_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~10_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|RGB~2_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan17~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan17~1_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~13_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_B[6]~5_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_R[5]~3_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_R[5]~6_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_R[5]~7_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_R[2]~10_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_R[2]~11_combout\ : std_logic;
SIGNAL \inst|LessThan0~0_combout\ : std_logic;
SIGNAL \inst|LessThan1~1_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~12_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~17_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~23_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~28_combout\ : std_logic;
SIGNAL \inst|horizontal~5_combout\ : std_logic;
SIGNAL \inst|horizontal~7_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_R[3]~13_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_G[4]~8_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \inst|ipll|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \inst|ipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \inst|Add0~19\ : std_logic;
SIGNAL \inst|Add0~20_combout\ : std_logic;
SIGNAL \inst|horizontal~10_combout\ : std_logic;
SIGNAL \inst|horizontal~4_combout\ : std_logic;
SIGNAL \inst|Add0~1\ : std_logic;
SIGNAL \inst|Add0~3\ : std_logic;
SIGNAL \inst|Add0~4_combout\ : std_logic;
SIGNAL \inst|horizontal~3_combout\ : std_logic;
SIGNAL \inst|Add0~5\ : std_logic;
SIGNAL \inst|Add0~7\ : std_logic;
SIGNAL \inst|Add0~9\ : std_logic;
SIGNAL \inst|Add0~11\ : std_logic;
SIGNAL \inst|Add0~12_combout\ : std_logic;
SIGNAL \inst|horizontal~6_combout\ : std_logic;
SIGNAL \inst|horizontal~0_combout\ : std_logic;
SIGNAL \inst|LessThan0~2_combout\ : std_logic;
SIGNAL \inst|horizontal~9_combout\ : std_logic;
SIGNAL \inst|LessThan0~4_combout\ : std_logic;
SIGNAL \inst|horizontal~2_combout\ : std_logic;
SIGNAL \inst|Add0~8_combout\ : std_logic;
SIGNAL \inst|horizontal~1_combout\ : std_logic;
SIGNAL \inst|LessThan0~1_combout\ : std_logic;
SIGNAL \inst|Add0~13\ : std_logic;
SIGNAL \inst|Add0~15\ : std_logic;
SIGNAL \inst|Add0~16_combout\ : std_logic;
SIGNAL \inst|horizontal~8_combout\ : std_logic;
SIGNAL \inst|Add0~17\ : std_logic;
SIGNAL \inst|Add0~18_combout\ : std_logic;
SIGNAL \inst|Add0~14_combout\ : std_logic;
SIGNAL \inst|LessThan4~0_combout\ : std_logic;
SIGNAL \inst|LessThan4~1_combout\ : std_logic;
SIGNAL \inst|Add1~30_combout\ : std_logic;
SIGNAL \inst|LessThan0~3_combout\ : std_logic;
SIGNAL \inst|Add1~1\ : std_logic;
SIGNAL \inst|Add1~2_combout\ : std_logic;
SIGNAL \inst|Add1~29_combout\ : std_logic;
SIGNAL \inst|Add1~3\ : std_logic;
SIGNAL \inst|Add1~5\ : std_logic;
SIGNAL \inst|Add1~7\ : std_logic;
SIGNAL \inst|Add1~10_combout\ : std_logic;
SIGNAL \inst|Add1~12_combout\ : std_logic;
SIGNAL \inst|Add1~11\ : std_logic;
SIGNAL \inst|Add1~13_combout\ : std_logic;
SIGNAL \inst|Add1~15_combout\ : std_logic;
SIGNAL \inst|Add1~14\ : std_logic;
SIGNAL \inst|Add1~16_combout\ : std_logic;
SIGNAL \inst|Add1~18_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan0~0_combout\ : std_logic;
SIGNAL \inst|Add1~4_combout\ : std_logic;
SIGNAL \inst|Add1~28_combout\ : std_logic;
SIGNAL \inst|LessThan1~0_combout\ : std_logic;
SIGNAL \inst|Add1~27_combout\ : std_logic;
SIGNAL \inst|LessThan1~2_combout\ : std_logic;
SIGNAL \inst|Add1~8_combout\ : std_logic;
SIGNAL \inst|Add1~6_combout\ : std_logic;
SIGNAL \inst|Add1~9_combout\ : std_logic;
SIGNAL \inst|process_0~0_combout\ : std_logic;
SIGNAL \inst|Add1~21_combout\ : std_logic;
SIGNAL \inst|process_0~1_combout\ : std_logic;
SIGNAL \inst|process_0~2_combout\ : std_logic;
SIGNAL \inst|LCD_DEN~q\ : std_logic;
SIGNAL \instDL2M|iPipeLine|LCD_DEN~feeder_combout\ : std_logic;
SIGNAL \instDL2M|iPipeLine|LCD_DEN~q\ : std_logic;
SIGNAL \instLRD|LCD_DEN~feeder_combout\ : std_logic;
SIGNAL \inst|ipll|altpll_component|auto_generated|wire_pll1_locked\ : std_logic;
SIGNAL \inst|ipll|altpll_component|auto_generated|pll_lock_sync~feeder_combout\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \inst4~0_combout\ : std_logic;
SIGNAL \inst4~0clkctrl_outclk\ : std_logic;
SIGNAL \inst|ipll|altpll_component|auto_generated|pll_lock_sync~q\ : std_logic;
SIGNAL \inst|ipll|altpll_component|auto_generated|locked~combout\ : std_logic;
SIGNAL \inst|ipll|altpll_component|auto_generated|locked~clkctrl_outclk\ : std_logic;
SIGNAL \instLRD|LCD_DEN~q\ : std_logic;
SIGNAL \instLRD|LCD_DIM~feeder_combout\ : std_logic;
SIGNAL \instLRD|LCD_DIM~q\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~2_combout\ : std_logic;
SIGNAL \inst|xcolumn~4_combout\ : std_logic;
SIGNAL \inst|xcolumn~5_combout\ : std_logic;
SIGNAL \inst|xcolumn~2_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~1_combout\ : std_logic;
SIGNAL \inst|xcolumn~3_combout\ : std_logic;
SIGNAL \inst|xcolumn~0_combout\ : std_logic;
SIGNAL \inst|Add0~10_combout\ : std_logic;
SIGNAL \inst|xcolumn~1_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~3_combout\ : std_logic;
SIGNAL \inst|Add1~17\ : std_logic;
SIGNAL \inst|Add1~20\ : std_logic;
SIGNAL \inst|Add1~22_combout\ : std_logic;
SIGNAL \inst|Add1~24_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag:romID[1]~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag:romID[1]~1_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Mux11~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Mux10~0_combout\ : std_logic;
SIGNAL \inst|xcolumn~7_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Mux9~0_combout\ : std_logic;
SIGNAL \inst|xcolumn~6_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Mux8~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add5~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Mux7~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Mux6~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add5~1\ : std_logic;
SIGNAL \instDL2M|iDL1|Add5~3\ : std_logic;
SIGNAL \instDL2M|iDL1|Add5~4_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~14_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~15_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~31_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add5~5\ : std_logic;
SIGNAL \instDL2M|iDL1|Add5~6_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~16\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~18_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~32_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~33_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add5~7\ : std_logic;
SIGNAL \instDL2M|iDL1|Add5~9\ : std_logic;
SIGNAL \instDL2M|iDL1|Add5~10_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~20_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~19\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~22\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~24_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~34_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~35_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add6~36_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~4_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~5_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan9~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan20~1_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~6_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_G[7]~4_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan20~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan20~2_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_B[7]~2_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_B[7]~3_combout\ : std_logic;
SIGNAL \inst|xcolumn~9_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~1\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~3\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~5\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~7\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~9\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~11\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~13\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~14_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~10_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~8_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~2_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan14~1_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan14~3_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan14~5_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan14~7_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan14~9_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan14~11_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan14~13_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan14~15_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan14~16_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~15\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~16_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~17\ : std_logic;
SIGNAL \instDL2M|iDL1|Add2~18_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~8_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_B[7]~4_combout\ : std_logic;
SIGNAL \instLRD|LCD_B~0_combout\ : std_logic;
SIGNAL \instLRD|LCD_B~1_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_B[5]~6_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_B[5]~12_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_B[5]~7_combout\ : std_logic;
SIGNAL \instLRD|LCD_B~2_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_B[4]~8_combout\ : std_logic;
SIGNAL \instLRD|LCD_B~3_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~1\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~3\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~5\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~7\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~9\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~10_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~6_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~4_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~2_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan12~1_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan12~3_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan12~5_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan12~7_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan12~9_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan12~11_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan12~13_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan12~14_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~11\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~13\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~15\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~17\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~18_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~14_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~16_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add1~12_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~11_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~12_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_B[3]~9_combout\ : std_logic;
SIGNAL \instLRD|LCD_B~4_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_R[7]~2_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_B[2]~10_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_B[2]~11_combout\ : std_logic;
SIGNAL \instLRD|LCD_B~5_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_G[7]~5_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_R[5]~4_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_G[7]~7_combout\ : std_logic;
SIGNAL \instLRD|LCD_G~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~6_wirecell_combout\ : std_logic;
SIGNAL \instLRD|LCD_G~1_combout\ : std_logic;
SIGNAL \instLRD|LCD_G~2_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan16~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan16~1_combout\ : std_logic;
SIGNAL \inst|xcolumn~8_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~14_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~15_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~16_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LSPflag~17_combout\ : std_logic;
SIGNAL \instDL2M|iPipeLine|VGA_G1[3]~0_combout\ : std_logic;
SIGNAL \instDL2M|iPipeLine|VGA_G1[3]~feeder_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|RGB~3_combout\ : std_logic;
SIGNAL \instLRD|LCD_G~3_combout\ : std_logic;
SIGNAL \instLRD|LCD_G[0]~feeder_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_G[4]~6_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_R[7]~5_combout\ : std_logic;
SIGNAL \instLRD|LCD_R~0_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~1_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~3\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~5\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~7\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~9\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~11\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~13\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~15\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~16_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~14_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~12_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~10_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~8_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan15~1_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan15~3_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan15~5_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan15~7_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan15~9_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan15~11_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan15~13_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan15~15_cout\ : std_logic;
SIGNAL \instDL2M|iDL1|LessThan15~16_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~17\ : std_logic;
SIGNAL \instDL2M|iDL1|Add3~18_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_R[5]~8_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_R[5]~9_combout\ : std_logic;
SIGNAL \instLRD|LCD_R~1_combout\ : std_logic;
SIGNAL \instLRD|LCD_R~2_combout\ : std_logic;
SIGNAL \instDL2M|iDL1|VGA_R[3]~12_combout\ : std_logic;
SIGNAL \instLRD|LCD_R~3_combout\ : std_logic;
SIGNAL \instLRD|LCD_R\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \instLRD|LCD_G\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \instLRD|LCD_B\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \instDL2M|iPipeLine|VGA_R1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \instDL2M|iPipeLine|VGA_G1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \instDL2M|iPipeLine|VGA_B1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|yrow\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst|xcolumn\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst|horizontal\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|ipll|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_inst4~0clkctrl_outclk\ : std_logic;
SIGNAL \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\ : std_logic;

BEGIN

LCD_CLK <= ww_LCD_CLK;
ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
LCD_DEN <= ww_LCD_DEN;
LCD_DIM <= ww_LCD_DIM;
LCD_B <= ww_LCD_B;
LCD_G <= ww_LCD_G;
LCD_R <= ww_LCD_R;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst|ipll|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \CLOCK_50~input_o\);

\inst|ipll|altpll_component|auto_generated|wire_pll1_clk\(0) <= \inst|ipll|altpll_component|auto_generated|pll1_CLK_bus\(0);
\inst|ipll|altpll_component|auto_generated|wire_pll1_clk\(1) <= \inst|ipll|altpll_component|auto_generated|pll1_CLK_bus\(1);
\inst|ipll|altpll_component|auto_generated|wire_pll1_clk\(2) <= \inst|ipll|altpll_component|auto_generated|pll1_CLK_bus\(2);
\inst|ipll|altpll_component|auto_generated|wire_pll1_clk\(3) <= \inst|ipll|altpll_component|auto_generated|pll1_CLK_bus\(3);
\inst|ipll|altpll_component|auto_generated|wire_pll1_clk\(4) <= \inst|ipll|altpll_component|auto_generated|pll1_CLK_bus\(4);

\instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\instDL2M|iDL1|Add6~36_combout\ & \instDL2M|iDL1|Add6~35_combout\ & \instDL2M|iDL1|Add6~34_combout\ & \instDL2M|iDL1|Add6~33_combout\ & 
\instDL2M|iDL1|Add6~32_combout\ & \instDL2M|iDL1|Add6~31_combout\ & \instDL2M|iDL1|Mux6~0_combout\ & \instDL2M|iDL1|Mux7~0_combout\ & \instDL2M|iDL1|Mux8~0_combout\ & \instDL2M|iDL1|Mux9~0_combout\ & \instDL2M|iDL1|Mux10~0_combout\ & 
\instDL2M|iDL1|Mux11~0_combout\);

\instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(0) <= \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(1) <= \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);

\inst|ipll|altpll_component|auto_generated|locked~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst|ipll|altpll_component|auto_generated|locked~combout\);

\inst|ipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst|ipll|altpll_component|auto_generated|wire_pll1_clk\(0));

\inst4~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst4~0_combout\);
\ALT_INV_inst4~0clkctrl_outclk\ <= NOT \inst4~0clkctrl_outclk\;
\inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\ <= NOT \inst|ipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\;
\inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\ <= NOT \inst|ipll|altpll_component|auto_generated|locked~clkctrl_outclk\;

-- Location: M9K_X78_Y49_N0
\instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000005000000000000000000000000000000050000000000000000000000000000001A4000000000000000000000000000001A4000000000000000000000000000001A9000000000000000000000000000006A9000000000000000000000000000006A900000000000000000000000000001AAA40000000000000000000000000001AAA40000000000000000000000000006AAA900000000000000",
	mem_init2 => X"00000000000006AAA90000000000000000000000000006AAA90000000000000000000000000006AAAA400000000000000000000000001AAAAA400000000000000000000000001AAAAA400000000000000000000000001AAAAA400000000000000000000000006AAAAA900000000000000000000000006AAAAA900000000000000000000000006AAAAA900000000000000000000000001AAAAA900000000000000000000000001AAAAA400000000000000000000000001AAAAA400000000000000000000000001AAAAA400000000000000005550000001AAAAA40000005550000005AAA5400001AAAAA4000015AAA500001AAAAA9000006AAAA400006AAAAA400",
	mem_init1 => X"06AAAAAA500006AAA900005AAAAAA9001AAAAAAAA40006AAA90001AAAAAAAA406AAAAAAAA90006AAA90006AAAAAAAA906AAAAAAAA90006AAA90006AAAAAAAA906AAA956AAA4006AAA9001AAA956AAA946AA94056AA9001AAA4006AA95016AA906AA400016A9001AAA4006A940001AA906AA400001AA401AAA401AA400001AA906AA4000006A401AAA401A9000001AA901AA4000001A901AAA406A4000001AA401AA40000006901AA900690000001AA4006A400000019006A901A90000001A90001A90000001A406A901A40000006A400005900000006406A9019000000065000000540000056906A906954000015000000000000006A95AA956AA40000000000",
	mem_init0 => X"00000000006AAAAAAAAAA40000000000000000000055556A9555540000000000000000000000006A9000000000000000000000000000006A9000000000000000000000000000016A900000000000000000000000000006AAA4000000000000000000000000055AAAA955000000000000000000000006AA6A6AA4000000000000000000000006A96A5AA4000000000000000000000001546A9550000000000000000000000000006A4000000000000000000000000000006A4000000000000000000000000000001A4000000000000000000000000000001900000000000000000000000000000005000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "nalepka64.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux_LCD:instDL2M|MyDisplayLogic:iDL1|nalepka64:rom_inst|altsyncram:altsyncram_component|altsyncram_osb1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 2,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 2,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	portaaddr => \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X83_Y48_N8
\instDL2M|iDL1|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add2~0_combout\ = (\inst|xcolumn\(1) & (!\inst|xcolumn\(0) & VCC)) # (!\inst|xcolumn\(1) & (\inst|xcolumn\(0) $ (GND)))
-- \instDL2M|iDL1|Add2~1\ = CARRY((!\inst|xcolumn\(1) & !\inst|xcolumn\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(1),
	datab => \inst|xcolumn\(0),
	datad => VCC,
	combout => \instDL2M|iDL1|Add2~0_combout\,
	cout => \instDL2M|iDL1|Add2~1\);

-- Location: LCCOMB_X83_Y48_N12
\instDL2M|iDL1|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add2~4_combout\ = (\inst|xcolumn\(3) & (\instDL2M|iDL1|Add2~3\ $ (GND))) # (!\inst|xcolumn\(3) & ((GND) # (!\instDL2M|iDL1|Add2~3\)))
-- \instDL2M|iDL1|Add2~5\ = CARRY((!\instDL2M|iDL1|Add2~3\) # (!\inst|xcolumn\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(3),
	datad => VCC,
	cin => \instDL2M|iDL1|Add2~3\,
	combout => \instDL2M|iDL1|Add2~4_combout\,
	cout => \instDL2M|iDL1|Add2~5\);

-- Location: LCCOMB_X83_Y48_N14
\instDL2M|iDL1|Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add2~6_combout\ = (\inst|xcolumn\(4) & (!\instDL2M|iDL1|Add2~5\)) # (!\inst|xcolumn\(4) & (\instDL2M|iDL1|Add2~5\ & VCC))
-- \instDL2M|iDL1|Add2~7\ = CARRY((\inst|xcolumn\(4) & !\instDL2M|iDL1|Add2~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(4),
	datad => VCC,
	cin => \instDL2M|iDL1|Add2~5\,
	combout => \instDL2M|iDL1|Add2~6_combout\,
	cout => \instDL2M|iDL1|Add2~7\);

-- Location: LCCOMB_X83_Y48_N20
\instDL2M|iDL1|Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add2~12_combout\ = (\inst|xcolumn\(7) & (!\instDL2M|iDL1|Add2~11\ & VCC)) # (!\inst|xcolumn\(7) & (\instDL2M|iDL1|Add2~11\ $ (GND)))
-- \instDL2M|iDL1|Add2~13\ = CARRY((!\inst|xcolumn\(7) & !\instDL2M|iDL1|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(7),
	datad => VCC,
	cin => \instDL2M|iDL1|Add2~11\,
	combout => \instDL2M|iDL1|Add2~12_combout\,
	cout => \instDL2M|iDL1|Add2~13\);

-- Location: LCCOMB_X82_Y49_N4
\instDL2M|iDL1|Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add3~2_combout\ = (\inst|xcolumn\(2) & (\instDL2M|iDL1|Add3~1_cout\ & VCC)) # (!\inst|xcolumn\(2) & (!\instDL2M|iDL1|Add3~1_cout\))
-- \instDL2M|iDL1|Add3~3\ = CARRY((!\inst|xcolumn\(2) & !\instDL2M|iDL1|Add3~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(2),
	datad => VCC,
	cin => \instDL2M|iDL1|Add3~1_cout\,
	combout => \instDL2M|iDL1|Add3~2_combout\,
	cout => \instDL2M|iDL1|Add3~3\);

-- Location: LCCOMB_X82_Y49_N6
\instDL2M|iDL1|Add3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add3~4_combout\ = (\inst|xcolumn\(3) & (\instDL2M|iDL1|Add3~3\ $ (GND))) # (!\inst|xcolumn\(3) & (!\instDL2M|iDL1|Add3~3\ & VCC))
-- \instDL2M|iDL1|Add3~5\ = CARRY((\inst|xcolumn\(3) & !\instDL2M|iDL1|Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(3),
	datad => VCC,
	cin => \instDL2M|iDL1|Add3~3\,
	combout => \instDL2M|iDL1|Add3~4_combout\,
	cout => \instDL2M|iDL1|Add3~5\);

-- Location: LCCOMB_X82_Y49_N8
\instDL2M|iDL1|Add3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add3~6_combout\ = (\inst|xcolumn\(4) & (!\instDL2M|iDL1|Add3~5\)) # (!\inst|xcolumn\(4) & ((\instDL2M|iDL1|Add3~5\) # (GND)))
-- \instDL2M|iDL1|Add3~7\ = CARRY((!\instDL2M|iDL1|Add3~5\) # (!\inst|xcolumn\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(4),
	datad => VCC,
	cin => \instDL2M|iDL1|Add3~5\,
	combout => \instDL2M|iDL1|Add3~6_combout\,
	cout => \instDL2M|iDL1|Add3~7\);

-- Location: LCCOMB_X83_Y50_N6
\instDL2M|iDL1|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add1~0_combout\ = (\inst|xcolumn\(1) & (\inst|xcolumn\(0) $ (VCC))) # (!\inst|xcolumn\(1) & (\inst|xcolumn\(0) & VCC))
-- \instDL2M|iDL1|Add1~1\ = CARRY((\inst|xcolumn\(1) & \inst|xcolumn\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(1),
	datab => \inst|xcolumn\(0),
	datad => VCC,
	combout => \instDL2M|iDL1|Add1~0_combout\,
	cout => \instDL2M|iDL1|Add1~1\);

-- Location: LCCOMB_X83_Y50_N14
\instDL2M|iDL1|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add1~8_combout\ = (\inst|xcolumn\(5) & (\instDL2M|iDL1|Add1~7\ $ (GND))) # (!\inst|xcolumn\(5) & (!\instDL2M|iDL1|Add1~7\ & VCC))
-- \instDL2M|iDL1|Add1~9\ = CARRY((\inst|xcolumn\(5) & !\instDL2M|iDL1|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(5),
	datad => VCC,
	cin => \instDL2M|iDL1|Add1~7\,
	combout => \instDL2M|iDL1|Add1~8_combout\,
	cout => \instDL2M|iDL1|Add1~9\);

-- Location: LCCOMB_X81_Y48_N14
\instDL2M|iDL1|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add0~1_cout\ = CARRY(!\inst|xcolumn\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(4),
	datad => VCC,
	cout => \instDL2M|iDL1|Add0~1_cout\);

-- Location: LCCOMB_X81_Y48_N16
\instDL2M|iDL1|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add0~2_combout\ = (\inst|xcolumn\(5) & (!\instDL2M|iDL1|Add0~1_cout\)) # (!\inst|xcolumn\(5) & (\instDL2M|iDL1|Add0~1_cout\ & VCC))
-- \instDL2M|iDL1|Add0~3\ = CARRY((\inst|xcolumn\(5) & !\instDL2M|iDL1|Add0~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(5),
	datad => VCC,
	cin => \instDL2M|iDL1|Add0~1_cout\,
	combout => \instDL2M|iDL1|Add0~2_combout\,
	cout => \instDL2M|iDL1|Add0~3\);

-- Location: LCCOMB_X81_Y48_N18
\instDL2M|iDL1|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add0~4_combout\ = (\inst|xcolumn\(6) & (\instDL2M|iDL1|Add0~3\ $ (GND))) # (!\inst|xcolumn\(6) & ((GND) # (!\instDL2M|iDL1|Add0~3\)))
-- \instDL2M|iDL1|Add0~5\ = CARRY((!\instDL2M|iDL1|Add0~3\) # (!\inst|xcolumn\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(6),
	datad => VCC,
	cin => \instDL2M|iDL1|Add0~3\,
	combout => \instDL2M|iDL1|Add0~4_combout\,
	cout => \instDL2M|iDL1|Add0~5\);

-- Location: LCCOMB_X81_Y48_N20
\instDL2M|iDL1|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add0~6_combout\ = (\inst|xcolumn\(7) & ((\instDL2M|iDL1|Add0~5\) # (GND))) # (!\inst|xcolumn\(7) & (!\instDL2M|iDL1|Add0~5\))
-- \instDL2M|iDL1|Add0~7\ = CARRY((\inst|xcolumn\(7)) # (!\instDL2M|iDL1|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(7),
	datad => VCC,
	cin => \instDL2M|iDL1|Add0~5\,
	combout => \instDL2M|iDL1|Add0~6_combout\,
	cout => \instDL2M|iDL1|Add0~7\);

-- Location: LCCOMB_X81_Y48_N22
\instDL2M|iDL1|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add0~8_combout\ = (\inst|xcolumn\(8) & (!\instDL2M|iDL1|Add0~7\ & VCC)) # (!\inst|xcolumn\(8) & (\instDL2M|iDL1|Add0~7\ $ (GND)))
-- \instDL2M|iDL1|Add0~9\ = CARRY((!\inst|xcolumn\(8) & !\instDL2M|iDL1|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(8),
	datad => VCC,
	cin => \instDL2M|iDL1|Add0~7\,
	combout => \instDL2M|iDL1|Add0~8_combout\,
	cout => \instDL2M|iDL1|Add0~9\);

-- Location: LCCOMB_X81_Y48_N24
\instDL2M|iDL1|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add0~10_combout\ = (\inst|xcolumn\(9) & ((\instDL2M|iDL1|Add0~9\) # (GND))) # (!\inst|xcolumn\(9) & (!\instDL2M|iDL1|Add0~9\))
-- \instDL2M|iDL1|Add0~11\ = CARRY((\inst|xcolumn\(9)) # (!\instDL2M|iDL1|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(9),
	datad => VCC,
	cin => \instDL2M|iDL1|Add0~9\,
	combout => \instDL2M|iDL1|Add0~10_combout\,
	cout => \instDL2M|iDL1|Add0~11\);

-- Location: LCCOMB_X81_Y48_N26
\instDL2M|iDL1|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add0~12_combout\ = !\instDL2M|iDL1|Add0~11\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \instDL2M|iDL1|Add0~11\,
	combout => \instDL2M|iDL1|Add0~12_combout\);

-- Location: LCCOMB_X82_Y50_N16
\instDL2M|iDL1|LessThan11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan11~1_cout\ = CARRY(\inst|yrow\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(2),
	datad => VCC,
	cout => \instDL2M|iDL1|LessThan11~1_cout\);

-- Location: LCCOMB_X82_Y50_N18
\instDL2M|iDL1|LessThan11~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan11~3_cout\ = CARRY((\inst|yrow\(3) & (!\inst|xcolumn\(0) & !\instDL2M|iDL1|LessThan11~1_cout\)) # (!\inst|yrow\(3) & ((!\instDL2M|iDL1|LessThan11~1_cout\) # (!\inst|xcolumn\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(3),
	datab => \inst|xcolumn\(0),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan11~1_cout\,
	cout => \instDL2M|iDL1|LessThan11~3_cout\);

-- Location: LCCOMB_X82_Y50_N20
\instDL2M|iDL1|LessThan11~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan11~5_cout\ = CARRY((\inst|xcolumn\(1) & ((\inst|yrow\(4)) # (!\instDL2M|iDL1|LessThan11~3_cout\))) # (!\inst|xcolumn\(1) & (\inst|yrow\(4) & !\instDL2M|iDL1|LessThan11~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(1),
	datab => \inst|yrow\(4),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan11~3_cout\,
	cout => \instDL2M|iDL1|LessThan11~5_cout\);

-- Location: LCCOMB_X82_Y50_N22
\instDL2M|iDL1|LessThan11~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan11~7_cout\ = CARRY((\inst|yrow\(5) & (!\inst|xcolumn\(2) & !\instDL2M|iDL1|LessThan11~5_cout\)) # (!\inst|yrow\(5) & ((!\instDL2M|iDL1|LessThan11~5_cout\) # (!\inst|xcolumn\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(5),
	datab => \inst|xcolumn\(2),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan11~5_cout\,
	cout => \instDL2M|iDL1|LessThan11~7_cout\);

-- Location: LCCOMB_X82_Y50_N24
\instDL2M|iDL1|LessThan11~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan11~9_cout\ = CARRY((\inst|yrow\(6) & ((\inst|xcolumn\(3)) # (!\instDL2M|iDL1|LessThan11~7_cout\))) # (!\inst|yrow\(6) & (\inst|xcolumn\(3) & !\instDL2M|iDL1|LessThan11~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(6),
	datab => \inst|xcolumn\(3),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan11~7_cout\,
	cout => \instDL2M|iDL1|LessThan11~9_cout\);

-- Location: LCCOMB_X82_Y50_N26
\instDL2M|iDL1|LessThan11~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan11~11_cout\ = CARRY((\inst|yrow\(7) & (\inst|xcolumn\(4) & !\instDL2M|iDL1|LessThan11~9_cout\)) # (!\inst|yrow\(7) & ((\inst|xcolumn\(4)) # (!\instDL2M|iDL1|LessThan11~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(7),
	datab => \inst|xcolumn\(4),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan11~9_cout\,
	cout => \instDL2M|iDL1|LessThan11~11_cout\);

-- Location: LCCOMB_X82_Y50_N28
\instDL2M|iDL1|LessThan11~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan11~13_cout\ = CARRY((\instDL2M|iDL1|Add0~2_combout\ & (\inst|yrow\(8) & !\instDL2M|iDL1|LessThan11~11_cout\)) # (!\instDL2M|iDL1|Add0~2_combout\ & ((\inst|yrow\(8)) # (!\instDL2M|iDL1|LessThan11~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add0~2_combout\,
	datab => \inst|yrow\(8),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan11~11_cout\,
	cout => \instDL2M|iDL1|LessThan11~13_cout\);

-- Location: LCCOMB_X82_Y50_N30
\instDL2M|iDL1|LessThan11~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan11~14_combout\ = (\inst|yrow\(9) & ((\instDL2M|iDL1|LessThan11~13_cout\) # (!\instDL2M|iDL1|Add0~4_combout\))) # (!\inst|yrow\(9) & (\instDL2M|iDL1|LessThan11~13_cout\ & !\instDL2M|iDL1|Add0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(9),
	datad => \instDL2M|iDL1|Add0~4_combout\,
	cin => \instDL2M|iDL1|LessThan11~13_cout\,
	combout => \instDL2M|iDL1|LessThan11~14_combout\);

-- Location: LCCOMB_X79_Y48_N0
\inst|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~0_combout\ = \inst|horizontal\(0) $ (VCC)
-- \inst|Add0~1\ = CARRY(\inst|horizontal\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|horizontal\(0),
	datad => VCC,
	combout => \inst|Add0~0_combout\,
	cout => \inst|Add0~1\);

-- Location: LCCOMB_X79_Y48_N2
\inst|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~2_combout\ = (\inst|horizontal\(1) & (!\inst|Add0~1\)) # (!\inst|horizontal\(1) & ((\inst|Add0~1\) # (GND)))
-- \inst|Add0~3\ = CARRY((!\inst|Add0~1\) # (!\inst|horizontal\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|horizontal\(1),
	datad => VCC,
	cin => \inst|Add0~1\,
	combout => \inst|Add0~2_combout\,
	cout => \inst|Add0~3\);

-- Location: LCCOMB_X79_Y48_N6
\inst|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~6_combout\ = (\inst|horizontal\(3) & (!\inst|Add0~5\)) # (!\inst|horizontal\(3) & ((\inst|Add0~5\) # (GND)))
-- \inst|Add0~7\ = CARRY((!\inst|Add0~5\) # (!\inst|horizontal\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|horizontal\(3),
	datad => VCC,
	cin => \inst|Add0~5\,
	combout => \inst|Add0~6_combout\,
	cout => \inst|Add0~7\);

-- Location: LCCOMB_X80_Y50_N12
\inst|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~0_combout\ = \inst|yrow\(0) $ (VCC)
-- \inst|Add1~1\ = CARRY(\inst|yrow\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(0),
	datad => VCC,
	combout => \inst|Add1~0_combout\,
	cout => \inst|Add1~1\);

-- Location: LCCOMB_X80_Y50_N26
\inst|Add1~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~19_combout\ = (\inst|yrow\(7) & (!\inst|Add1~17\)) # (!\inst|yrow\(7) & ((\inst|Add1~17\) # (GND)))
-- \inst|Add1~20\ = CARRY((!\inst|Add1~17\) # (!\inst|yrow\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(7),
	datad => VCC,
	cin => \inst|Add1~17\,
	combout => \inst|Add1~19_combout\,
	cout => \inst|Add1~20\);

-- Location: LCCOMB_X80_Y50_N28
\inst|Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~22_combout\ = (\inst|yrow\(8) & (\inst|Add1~20\ $ (GND))) # (!\inst|yrow\(8) & (!\inst|Add1~20\ & VCC))
-- \inst|Add1~23\ = CARRY((\inst|yrow\(8) & !\inst|Add1~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(8),
	datad => VCC,
	cin => \inst|Add1~20\,
	combout => \inst|Add1~22_combout\,
	cout => \inst|Add1~23\);

-- Location: LCCOMB_X80_Y50_N30
\inst|Add1~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~25_combout\ = \inst|Add1~23\ $ (\inst|yrow\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst|yrow\(9),
	cin => \inst|Add1~23\,
	combout => \inst|Add1~25_combout\);

-- Location: LCCOMB_X80_Y49_N10
\instDL2M|iDL1|Add5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add5~2_combout\ = (\inst|xcolumn\(5) & (\instDL2M|iDL1|Add5~1\ & VCC)) # (!\inst|xcolumn\(5) & (!\instDL2M|iDL1|Add5~1\))
-- \instDL2M|iDL1|Add5~3\ = CARRY((!\inst|xcolumn\(5) & !\instDL2M|iDL1|Add5~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(5),
	datad => VCC,
	cin => \instDL2M|iDL1|Add5~1\,
	combout => \instDL2M|iDL1|Add5~2_combout\,
	cout => \instDL2M|iDL1|Add5~3\);

-- Location: LCCOMB_X80_Y49_N16
\instDL2M|iDL1|Add5~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add5~8_combout\ = (\inst|xcolumn\(8) & ((GND) # (!\instDL2M|iDL1|Add5~7\))) # (!\inst|xcolumn\(8) & (\instDL2M|iDL1|Add5~7\ $ (GND)))
-- \instDL2M|iDL1|Add5~9\ = CARRY((\inst|xcolumn\(8)) # (!\instDL2M|iDL1|Add5~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(8),
	datad => VCC,
	cin => \instDL2M|iDL1|Add5~7\,
	combout => \instDL2M|iDL1|Add5~8_combout\,
	cout => \instDL2M|iDL1|Add5~9\);

-- Location: LCCOMB_X79_Y49_N6
\instDL2M|iDL1|Add6~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~21_combout\ = (\instDL2M|iDL1|Add5~8_combout\ & ((\instDL2M|iDL1|Add6~20_combout\ & (\instDL2M|iDL1|Add6~19\ & VCC)) # (!\instDL2M|iDL1|Add6~20_combout\ & (!\instDL2M|iDL1|Add6~19\)))) # (!\instDL2M|iDL1|Add5~8_combout\ & 
-- ((\instDL2M|iDL1|Add6~20_combout\ & (!\instDL2M|iDL1|Add6~19\)) # (!\instDL2M|iDL1|Add6~20_combout\ & ((\instDL2M|iDL1|Add6~19\) # (GND)))))
-- \instDL2M|iDL1|Add6~22\ = CARRY((\instDL2M|iDL1|Add5~8_combout\ & (!\instDL2M|iDL1|Add6~20_combout\ & !\instDL2M|iDL1|Add6~19\)) # (!\instDL2M|iDL1|Add5~8_combout\ & ((!\instDL2M|iDL1|Add6~19\) # (!\instDL2M|iDL1|Add6~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add5~8_combout\,
	datab => \instDL2M|iDL1|Add6~20_combout\,
	datad => VCC,
	cin => \instDL2M|iDL1|Add6~19\,
	combout => \instDL2M|iDL1|Add6~21_combout\,
	cout => \instDL2M|iDL1|Add6~22\);

-- Location: LCCOMB_X80_Y49_N18
\instDL2M|iDL1|Add5~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add5~10_combout\ = (\inst|xcolumn\(9) & (\instDL2M|iDL1|Add5~9\ & VCC)) # (!\inst|xcolumn\(9) & (!\instDL2M|iDL1|Add5~9\))
-- \instDL2M|iDL1|Add5~11\ = CARRY((!\inst|xcolumn\(9) & !\instDL2M|iDL1|Add5~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(9),
	datad => VCC,
	cin => \instDL2M|iDL1|Add5~9\,
	combout => \instDL2M|iDL1|Add5~10_combout\,
	cout => \instDL2M|iDL1|Add5~11\);

-- Location: LCCOMB_X79_Y49_N8
\instDL2M|iDL1|Add6~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~24_combout\ = ((\instDL2M|iDL1|Add6~23_combout\ $ (\instDL2M|iDL1|Add5~10_combout\ $ (!\instDL2M|iDL1|Add6~22\)))) # (GND)
-- \instDL2M|iDL1|Add6~25\ = CARRY((\instDL2M|iDL1|Add6~23_combout\ & ((\instDL2M|iDL1|Add5~10_combout\) # (!\instDL2M|iDL1|Add6~22\))) # (!\instDL2M|iDL1|Add6~23_combout\ & (\instDL2M|iDL1|Add5~10_combout\ & !\instDL2M|iDL1|Add6~22\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add6~23_combout\,
	datab => \instDL2M|iDL1|Add5~10_combout\,
	datad => VCC,
	cin => \instDL2M|iDL1|Add6~22\,
	combout => \instDL2M|iDL1|Add6~24_combout\,
	cout => \instDL2M|iDL1|Add6~25\);

-- Location: LCCOMB_X80_Y49_N20
\instDL2M|iDL1|Add5~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add5~12_combout\ = !\instDL2M|iDL1|Add5~11\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \instDL2M|iDL1|Add5~11\,
	combout => \instDL2M|iDL1|Add5~12_combout\);

-- Location: LCCOMB_X79_Y49_N10
\instDL2M|iDL1|Add6~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~26_combout\ = (\instDL2M|iDL1|Add5~12_combout\ & ((\inst|yrow\(4) & ((\instDL2M|iDL1|Add6~25\) # (GND))) # (!\inst|yrow\(4) & (!\instDL2M|iDL1|Add6~25\)))) # (!\instDL2M|iDL1|Add5~12_combout\ & ((\inst|yrow\(4) & 
-- (!\instDL2M|iDL1|Add6~25\)) # (!\inst|yrow\(4) & (\instDL2M|iDL1|Add6~25\ & VCC))))
-- \instDL2M|iDL1|Add6~27\ = CARRY((\instDL2M|iDL1|Add5~12_combout\ & ((\inst|yrow\(4)) # (!\instDL2M|iDL1|Add6~25\))) # (!\instDL2M|iDL1|Add5~12_combout\ & (\inst|yrow\(4) & !\instDL2M|iDL1|Add6~25\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add5~12_combout\,
	datab => \inst|yrow\(4),
	datad => VCC,
	cin => \instDL2M|iDL1|Add6~25\,
	combout => \instDL2M|iDL1|Add6~26_combout\,
	cout => \instDL2M|iDL1|Add6~27\);

-- Location: LCCOMB_X79_Y49_N12
\instDL2M|iDL1|Add6~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~29_combout\ = \instDL2M|iDL1|Add5~12_combout\ $ (\instDL2M|iDL1|Add6~27\ $ (\instDL2M|iDL1|Add6~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add5~12_combout\,
	datad => \instDL2M|iDL1|Add6~28_combout\,
	cin => \instDL2M|iDL1|Add6~27\,
	combout => \instDL2M|iDL1|Add6~29_combout\);

-- Location: FF_X80_Y49_N7
\instDL2M|iPipeLine|VGA_B1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iDL1|VGA_B[6]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|VGA_B1\(6));

-- Location: FF_X84_Y49_N25
\instDL2M|iPipeLine|VGA_G1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iDL1|VGA_G[4]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|VGA_G1\(4));

-- Location: FF_X84_Y49_N3
\instDL2M|iPipeLine|VGA_R1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iDL1|VGA_R[2]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|VGA_R1\(2));

-- Location: LCCOMB_X83_Y49_N30
\instDL2M|iDL1|LSPflag~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~7_combout\ = (\instDL2M|iDL1|LessThan16~1_combout\ & (((\instDL2M|iDL1|LessThan15~16_combout\ & !\instDL2M|iDL1|Add3~16_combout\)) # (!\instDL2M|iDL1|Add3~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LessThan16~1_combout\,
	datab => \instDL2M|iDL1|Add3~18_combout\,
	datac => \instDL2M|iDL1|LessThan15~16_combout\,
	datad => \instDL2M|iDL1|Add3~16_combout\,
	combout => \instDL2M|iDL1|LSPflag~7_combout\);

-- Location: LCCOMB_X81_Y48_N4
\instDL2M|iDL1|LSPflag~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~9_combout\ = (\instDL2M|iDL1|Add0~6_combout\) # ((\instDL2M|iDL1|Add0~8_combout\) # (\instDL2M|iDL1|Add0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instDL2M|iDL1|Add0~6_combout\,
	datac => \instDL2M|iDL1|Add0~8_combout\,
	datad => \instDL2M|iDL1|Add0~10_combout\,
	combout => \instDL2M|iDL1|LSPflag~9_combout\);

-- Location: LCCOMB_X82_Y49_N0
\instDL2M|iDL1|LSPflag~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~10_combout\ = ((\instDL2M|iDL1|Add0~12_combout\ & ((\instDL2M|iDL1|LSPflag~9_combout\) # (!\instDL2M|iDL1|LessThan11~14_combout\)))) # (!\instDL2M|iDL1|LessThan16~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LessThan11~14_combout\,
	datab => \instDL2M|iDL1|LSPflag~9_combout\,
	datac => \instDL2M|iDL1|Add0~12_combout\,
	datad => \instDL2M|iDL1|LessThan16~1_combout\,
	combout => \instDL2M|iDL1|LSPflag~10_combout\);

-- Location: LCCOMB_X84_Y49_N30
\instDL2M|iDL1|RGB~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|RGB~2_combout\ = (!\instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(1) & \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(1),
	datac => \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(0),
	combout => \instDL2M|iDL1|RGB~2_combout\);

-- Location: LCCOMB_X82_Y48_N6
\instDL2M|iDL1|LessThan17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan17~0_combout\ = (!\inst|yrow\(4) & (((!\inst|yrow\(2)) # (!\inst|yrow\(1))) # (!\inst|yrow\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(3),
	datab => \inst|yrow\(4),
	datac => \inst|yrow\(1),
	datad => \inst|yrow\(2),
	combout => \instDL2M|iDL1|LessThan17~0_combout\);

-- Location: LCCOMB_X82_Y48_N0
\instDL2M|iDL1|LessThan17~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan17~1_combout\ = (((!\inst|yrow\(5) & \instDL2M|iDL1|LessThan17~0_combout\)) # (!\inst|yrow\(6))) # (!\inst|yrow\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(7),
	datab => \inst|yrow\(5),
	datac => \inst|yrow\(6),
	datad => \instDL2M|iDL1|LessThan17~0_combout\,
	combout => \instDL2M|iDL1|LessThan17~1_combout\);

-- Location: LCCOMB_X82_Y49_N26
\instDL2M|iDL1|LSPflag~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~13_combout\ = (!\inst|xcolumn\(8) & (\instDL2M|iDL1|LessThan17~1_combout\ & (!\inst|xcolumn\(9) & \instDL2M|iDL1|LessThan20~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(8),
	datab => \instDL2M|iDL1|LessThan17~1_combout\,
	datac => \inst|xcolumn\(9),
	datad => \instDL2M|iDL1|LessThan20~1_combout\,
	combout => \instDL2M|iDL1|LSPflag~13_combout\);

-- Location: LCCOMB_X80_Y49_N6
\instDL2M|iDL1|VGA_B[6]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_B[6]~5_combout\ = (!\instDL2M|iDL1|LSPflag~6_combout\ & (((\instDL2M|iDL1|LSPflag~3_combout\ & !\instDL2M|iDL1|LSPflag:romID[1]~1_combout\)) # (!\instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~6_combout\,
	datab => \instDL2M|iDL1|LSPflag~3_combout\,
	datac => \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(1),
	datad => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	combout => \instDL2M|iDL1|VGA_B[6]~5_combout\);

-- Location: LCCOMB_X83_Y49_N14
\instDL2M|iDL1|VGA_R[5]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_R[5]~3_combout\ = (!\instDL2M|iDL1|LSPflag~6_combout\ & ((!\instDL2M|iDL1|LSPflag~3_combout\) # (!\instDL2M|iDL1|LSPflag~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~6_combout\,
	datab => \instDL2M|iDL1|LSPflag~4_combout\,
	datac => \instDL2M|iDL1|LSPflag~3_combout\,
	combout => \instDL2M|iDL1|VGA_R[5]~3_combout\);

-- Location: LCCOMB_X83_Y49_N10
\instDL2M|iDL1|VGA_R[5]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_R[5]~6_combout\ = (!\instDL2M|iDL1|LSPflag~6_combout\ & (((\instDL2M|iDL1|LessThan14~16_combout\ & !\instDL2M|iDL1|Add2~16_combout\)) # (!\instDL2M|iDL1|Add2~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~6_combout\,
	datab => \instDL2M|iDL1|LessThan14~16_combout\,
	datac => \instDL2M|iDL1|Add2~16_combout\,
	datad => \instDL2M|iDL1|Add2~18_combout\,
	combout => \instDL2M|iDL1|VGA_R[5]~6_combout\);

-- Location: LCCOMB_X83_Y49_N12
\instDL2M|iDL1|VGA_R[5]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_R[5]~7_combout\ = (\instDL2M|iDL1|LessThan16~1_combout\ & (\instDL2M|iDL1|VGA_R[5]~6_combout\ & ((!\instDL2M|iDL1|LSPflag~4_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~3_combout\,
	datab => \instDL2M|iDL1|LessThan16~1_combout\,
	datac => \instDL2M|iDL1|LSPflag~4_combout\,
	datad => \instDL2M|iDL1|VGA_R[5]~6_combout\,
	combout => \instDL2M|iDL1|VGA_R[5]~7_combout\);

-- Location: LCCOMB_X84_Y49_N20
\instDL2M|iDL1|VGA_R[2]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_R[2]~10_combout\ = (\instDL2M|iDL1|LSPflag~17_combout\) # ((\instDL2M|iDL1|LSPflag~4_combout\) # (!\instDL2M|iDL1|LessThan20~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~17_combout\,
	datab => \instDL2M|iDL1|LessThan20~2_combout\,
	datac => \instDL2M|iDL1|LSPflag~4_combout\,
	combout => \instDL2M|iDL1|VGA_R[2]~10_combout\);

-- Location: LCCOMB_X84_Y49_N2
\instDL2M|iDL1|VGA_R[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_R[2]~11_combout\ = (!\instDL2M|iDL1|LSPflag~6_combout\ & (((\instDL2M|iDL1|VGA_R[2]~10_combout\) # (\instDL2M|iDL1|LSPflag~8_combout\)) # (!\instDL2M|iDL1|LSPflag~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~12_combout\,
	datab => \instDL2M|iDL1|VGA_R[2]~10_combout\,
	datac => \instDL2M|iDL1|LSPflag~8_combout\,
	datad => \instDL2M|iDL1|LSPflag~6_combout\,
	combout => \instDL2M|iDL1|VGA_R[2]~11_combout\);

-- Location: FF_X79_Y48_N27
\inst|horizontal[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|horizontal~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|horizontal\(0));

-- Location: FF_X80_Y48_N31
\inst|horizontal[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|horizontal~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|horizontal\(7));

-- Location: LCCOMB_X79_Y48_N28
\inst|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan0~0_combout\ = (!\inst|horizontal\(1)) # (!\inst|horizontal\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|horizontal\(0),
	datad => \inst|horizontal\(1),
	combout => \inst|LessThan0~0_combout\);

-- Location: LCCOMB_X82_Y48_N10
\inst|LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan1~1_combout\ = (!\inst|yrow\(8) & !\inst|yrow\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(8),
	datad => \inst|yrow\(7),
	combout => \inst|LessThan1~1_combout\);

-- Location: LCCOMB_X79_Y49_N30
\instDL2M|iDL1|Add6~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~12_combout\ = \inst|yrow\(0) $ (\instDL2M|iDL1|LSPflag:romID[1]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(0),
	datac => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	combout => \instDL2M|iDL1|Add6~12_combout\);

-- Location: LCCOMB_X81_Y49_N0
\instDL2M|iDL1|Add6~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~17_combout\ = \inst|yrow\(1) $ (\instDL2M|iDL1|LSPflag:romID[1]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(1),
	datad => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	combout => \instDL2M|iDL1|Add6~17_combout\);

-- Location: LCCOMB_X79_Y49_N26
\instDL2M|iDL1|Add6~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~23_combout\ = \instDL2M|iDL1|LSPflag:romID[1]~1_combout\ $ (\inst|yrow\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	datac => \inst|yrow\(3),
	combout => \instDL2M|iDL1|Add6~23_combout\);

-- Location: LCCOMB_X81_Y49_N28
\instDL2M|iDL1|Add6~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~28_combout\ = \inst|yrow\(5) $ (((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (\inst|yrow\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	datab => \inst|yrow\(4),
	datad => \inst|yrow\(5),
	combout => \instDL2M|iDL1|Add6~28_combout\);

-- Location: LCCOMB_X79_Y48_N26
\inst|horizontal~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|horizontal~5_combout\ = (\inst|Add0~0_combout\ & (((\inst|LessThan0~1_combout\ & \inst|LessThan0~4_combout\)) # (!\inst|horizontal\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~1_combout\,
	datab => \inst|Add0~0_combout\,
	datac => \inst|LessThan0~4_combout\,
	datad => \inst|horizontal\(10),
	combout => \inst|horizontal~5_combout\);

-- Location: LCCOMB_X80_Y48_N30
\inst|horizontal~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|horizontal~7_combout\ = (\inst|Add0~14_combout\ & (((\inst|LessThan0~1_combout\ & \inst|LessThan0~4_combout\)) # (!\inst|horizontal\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~14_combout\,
	datab => \inst|LessThan0~1_combout\,
	datac => \inst|horizontal\(10),
	datad => \inst|LessThan0~4_combout\,
	combout => \inst|horizontal~7_combout\);

-- Location: LCCOMB_X82_Y49_N30
\instDL2M|iDL1|VGA_R[3]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_R[3]~13_combout\ = (!\instDL2M|iDL1|LSPflag~17_combout\ & (((\inst|yrow\(3) & \instDL2M|iDL1|LessThan0~0_combout\)) # (!\instDL2M|iDL1|LessThan20~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(3),
	datab => \instDL2M|iDL1|LessThan0~0_combout\,
	datac => \instDL2M|iDL1|LessThan20~0_combout\,
	datad => \instDL2M|iDL1|LSPflag~17_combout\,
	combout => \instDL2M|iDL1|VGA_R[3]~13_combout\);

-- Location: LCCOMB_X84_Y49_N24
\instDL2M|iDL1|VGA_G[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_G[4]~8_combout\ = (\instDL2M|iDL1|VGA_G[4]~6_combout\) # ((\instDL2M|iDL1|LSPflag~12_combout\ & (!\instDL2M|iDL1|LSPflag~4_combout\ & !\instDL2M|iDL1|LSPflag~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~12_combout\,
	datab => \instDL2M|iDL1|LSPflag~4_combout\,
	datac => \instDL2M|iDL1|VGA_G[4]~6_combout\,
	datad => \instDL2M|iDL1|LSPflag~6_combout\,
	combout => \instDL2M|iDL1|VGA_G[4]~8_combout\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: IOOBUF_X115_Y24_N9
\LCD_CLK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	devoe => ww_devoe,
	o => ww_LCD_CLK);

-- Location: IOOBUF_X115_Y41_N9
\LCD_DEN~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_DEN~q\,
	devoe => ww_devoe,
	o => ww_LCD_DEN);

-- Location: IOOBUF_X115_Y44_N9
\LCD_DIM~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_DIM~q\,
	devoe => ww_devoe,
	o => ww_LCD_DIM);

-- Location: IOOBUF_X115_Y51_N9
\LCD_B[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_B\(5),
	devoe => ww_devoe,
	o => ww_LCD_B(5));

-- Location: IOOBUF_X115_Y47_N16
\LCD_B[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_B\(4),
	devoe => ww_devoe,
	o => ww_LCD_B(4));

-- Location: IOOBUF_X115_Y23_N2
\LCD_B[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_B\(3),
	devoe => ww_devoe,
	o => ww_LCD_B(3));

-- Location: IOOBUF_X115_Y26_N23
\LCD_B[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_B\(2),
	devoe => ww_devoe,
	o => ww_LCD_B(2));

-- Location: IOOBUF_X115_Y26_N16
\LCD_B[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_B\(1),
	devoe => ww_devoe,
	o => ww_LCD_B(1));

-- Location: IOOBUF_X115_Y22_N23
\LCD_B[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_B\(0),
	devoe => ww_devoe,
	o => ww_LCD_B(0));

-- Location: IOOBUF_X115_Y32_N9
\LCD_G[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_G\(5),
	devoe => ww_devoe,
	o => ww_LCD_G(5));

-- Location: IOOBUF_X115_Y32_N2
\LCD_G[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_G\(4),
	devoe => ww_devoe,
	o => ww_LCD_G(4));

-- Location: IOOBUF_X115_Y35_N16
\LCD_G[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_G\(3),
	devoe => ww_devoe,
	o => ww_LCD_G(3));

-- Location: IOOBUF_X115_Y36_N16
\LCD_G[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_G\(2),
	devoe => ww_devoe,
	o => ww_LCD_G(2));

-- Location: IOOBUF_X115_Y36_N9
\LCD_G[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_G\(1),
	devoe => ww_devoe,
	o => ww_LCD_G(1));

-- Location: IOOBUF_X115_Y36_N2
\LCD_G[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_G\(0),
	devoe => ww_devoe,
	o => ww_LCD_G(0));

-- Location: IOOBUF_X115_Y22_N16
\LCD_R[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_R\(5),
	devoe => ww_devoe,
	o => ww_LCD_R(5));

-- Location: IOOBUF_X115_Y28_N2
\LCD_R[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_R\(4),
	devoe => ww_devoe,
	o => ww_LCD_R(4));

-- Location: IOOBUF_X115_Y29_N9
\LCD_R[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_R\(3),
	devoe => ww_devoe,
	o => ww_LCD_R(3));

-- Location: IOOBUF_X115_Y34_N23
\LCD_R[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_R\(2),
	devoe => ww_devoe,
	o => ww_LCD_R(2));

-- Location: IOOBUF_X115_Y34_N16
\LCD_R[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_R\(1),
	devoe => ww_devoe,
	o => ww_LCD_R(1));

-- Location: IOOBUF_X115_Y23_N9
\LCD_R[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \instLRD|LCD_R\(0),
	devoe => ww_devoe,
	o => ww_LCD_R(0));

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: PLL_1
\inst|ipll|altpll_component|auto_generated|pll1\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 7,
	c0_initial => 1,
	c0_low => 7,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 0,
	c1_initial => 0,
	c1_low => 0,
	c1_mode => "bypass",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 49,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 39,
	clk0_phase_shift => "0",
	clk1_counter => "unused",
	clk1_divide_by => 0,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 0,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 16,
	m => 78,
	m_initial => 1,
	m_ph => 0,
	n => 7,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	pll_compensation_delay => 7173,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 224,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	areset => \inst4~0clkctrl_outclk\,
	fbin => \inst|ipll|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \inst|ipll|altpll_component|auto_generated|pll1_INCLK_bus\,
	locked => \inst|ipll|altpll_component|auto_generated|wire_pll1_locked\,
	fbout => \inst|ipll|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \inst|ipll|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G3
\inst|ipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst|ipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst|ipll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: LCCOMB_X79_Y48_N18
\inst|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~18_combout\ = (\inst|horizontal\(9) & (!\inst|Add0~17\)) # (!\inst|horizontal\(9) & ((\inst|Add0~17\) # (GND)))
-- \inst|Add0~19\ = CARRY((!\inst|Add0~17\) # (!\inst|horizontal\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|horizontal\(9),
	datad => VCC,
	cin => \inst|Add0~17\,
	combout => \inst|Add0~18_combout\,
	cout => \inst|Add0~19\);

-- Location: LCCOMB_X79_Y48_N20
\inst|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~20_combout\ = \inst|Add0~19\ $ (!\inst|horizontal\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst|horizontal\(10),
	cin => \inst|Add0~19\,
	combout => \inst|Add0~20_combout\);

-- Location: LCCOMB_X80_Y48_N4
\inst|horizontal~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|horizontal~10_combout\ = (\inst|Add0~20_combout\ & (((\inst|LessThan0~4_combout\ & \inst|LessThan0~1_combout\)) # (!\inst|horizontal\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~4_combout\,
	datab => \inst|LessThan0~1_combout\,
	datac => \inst|horizontal\(10),
	datad => \inst|Add0~20_combout\,
	combout => \inst|horizontal~10_combout\);

-- Location: FF_X80_Y48_N5
\inst|horizontal[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|horizontal~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|horizontal\(10));

-- Location: LCCOMB_X80_Y48_N18
\inst|horizontal~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|horizontal~4_combout\ = (\inst|Add0~2_combout\ & (((\inst|LessThan0~1_combout\ & \inst|LessThan0~4_combout\)) # (!\inst|horizontal\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~2_combout\,
	datab => \inst|LessThan0~1_combout\,
	datac => \inst|horizontal\(10),
	datad => \inst|LessThan0~4_combout\,
	combout => \inst|horizontal~4_combout\);

-- Location: FF_X80_Y48_N19
\inst|horizontal[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|horizontal~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|horizontal\(1));

-- Location: LCCOMB_X79_Y48_N4
\inst|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~4_combout\ = (\inst|horizontal\(2) & (\inst|Add0~3\ $ (GND))) # (!\inst|horizontal\(2) & (!\inst|Add0~3\ & VCC))
-- \inst|Add0~5\ = CARRY((\inst|horizontal\(2) & !\inst|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|horizontal\(2),
	datad => VCC,
	cin => \inst|Add0~3\,
	combout => \inst|Add0~4_combout\,
	cout => \inst|Add0~5\);

-- Location: LCCOMB_X80_Y48_N24
\inst|horizontal~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|horizontal~3_combout\ = (\inst|Add0~4_combout\ & (((\inst|LessThan0~4_combout\ & \inst|LessThan0~1_combout\)) # (!\inst|horizontal\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~4_combout\,
	datab => \inst|Add0~4_combout\,
	datac => \inst|horizontal\(10),
	datad => \inst|LessThan0~1_combout\,
	combout => \inst|horizontal~3_combout\);

-- Location: FF_X80_Y48_N25
\inst|horizontal[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|horizontal~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|horizontal\(2));

-- Location: LCCOMB_X79_Y48_N8
\inst|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~8_combout\ = (\inst|horizontal\(4) & (\inst|Add0~7\ $ (GND))) # (!\inst|horizontal\(4) & (!\inst|Add0~7\ & VCC))
-- \inst|Add0~9\ = CARRY((\inst|horizontal\(4) & !\inst|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|horizontal\(4),
	datad => VCC,
	cin => \inst|Add0~7\,
	combout => \inst|Add0~8_combout\,
	cout => \inst|Add0~9\);

-- Location: LCCOMB_X79_Y48_N10
\inst|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~10_combout\ = (\inst|horizontal\(5) & (!\inst|Add0~9\)) # (!\inst|horizontal\(5) & ((\inst|Add0~9\) # (GND)))
-- \inst|Add0~11\ = CARRY((!\inst|Add0~9\) # (!\inst|horizontal\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|horizontal\(5),
	datad => VCC,
	cin => \inst|Add0~9\,
	combout => \inst|Add0~10_combout\,
	cout => \inst|Add0~11\);

-- Location: LCCOMB_X79_Y48_N12
\inst|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~12_combout\ = (\inst|horizontal\(6) & (\inst|Add0~11\ $ (GND))) # (!\inst|horizontal\(6) & (!\inst|Add0~11\ & VCC))
-- \inst|Add0~13\ = CARRY((\inst|horizontal\(6) & !\inst|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|horizontal\(6),
	datad => VCC,
	cin => \inst|Add0~11\,
	combout => \inst|Add0~12_combout\,
	cout => \inst|Add0~13\);

-- Location: LCCOMB_X80_Y48_N20
\inst|horizontal~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|horizontal~6_combout\ = (\inst|Add0~12_combout\ & (((\inst|LessThan0~4_combout\ & \inst|LessThan0~1_combout\)) # (!\inst|horizontal\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~4_combout\,
	datab => \inst|LessThan0~1_combout\,
	datac => \inst|horizontal\(10),
	datad => \inst|Add0~12_combout\,
	combout => \inst|horizontal~6_combout\);

-- Location: FF_X80_Y48_N21
\inst|horizontal[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|horizontal~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|horizontal\(6));

-- Location: LCCOMB_X80_Y48_N6
\inst|horizontal~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|horizontal~0_combout\ = (\inst|Add0~10_combout\ & (((\inst|LessThan0~1_combout\ & \inst|LessThan0~4_combout\)) # (!\inst|horizontal\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~10_combout\,
	datab => \inst|LessThan0~1_combout\,
	datac => \inst|horizontal\(10),
	datad => \inst|LessThan0~4_combout\,
	combout => \inst|horizontal~0_combout\);

-- Location: FF_X80_Y48_N7
\inst|horizontal[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|horizontal~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|horizontal\(5));

-- Location: LCCOMB_X80_Y48_N22
\inst|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan0~2_combout\ = (!\inst|horizontal\(7) & (!\inst|horizontal\(6) & (!\inst|horizontal\(8) & !\inst|horizontal\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|horizontal\(7),
	datab => \inst|horizontal\(6),
	datac => \inst|horizontal\(8),
	datad => \inst|horizontal\(5),
	combout => \inst|LessThan0~2_combout\);

-- Location: LCCOMB_X80_Y48_N2
\inst|horizontal~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|horizontal~9_combout\ = (\inst|Add0~18_combout\ & (((\inst|LessThan0~4_combout\ & \inst|LessThan0~1_combout\)) # (!\inst|horizontal\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~4_combout\,
	datab => \inst|LessThan0~1_combout\,
	datac => \inst|horizontal\(10),
	datad => \inst|Add0~18_combout\,
	combout => \inst|horizontal~9_combout\);

-- Location: FF_X80_Y48_N3
\inst|horizontal[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|horizontal~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|horizontal\(9));

-- Location: LCCOMB_X80_Y48_N10
\inst|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan0~4_combout\ = (\inst|LessThan0~2_combout\ & !\inst|horizontal\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|LessThan0~2_combout\,
	datad => \inst|horizontal\(9),
	combout => \inst|LessThan0~4_combout\);

-- Location: LCCOMB_X79_Y48_N24
\inst|horizontal~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|horizontal~2_combout\ = (\inst|Add0~6_combout\ & (((\inst|LessThan0~4_combout\ & \inst|LessThan0~1_combout\)) # (!\inst|horizontal\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~6_combout\,
	datab => \inst|LessThan0~4_combout\,
	datac => \inst|LessThan0~1_combout\,
	datad => \inst|horizontal\(10),
	combout => \inst|horizontal~2_combout\);

-- Location: FF_X79_Y48_N25
\inst|horizontal[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|horizontal~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|horizontal\(3));

-- Location: LCCOMB_X79_Y48_N22
\inst|horizontal~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|horizontal~1_combout\ = (\inst|Add0~8_combout\ & (((\inst|LessThan0~1_combout\ & \inst|LessThan0~4_combout\)) # (!\inst|horizontal\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~1_combout\,
	datab => \inst|LessThan0~4_combout\,
	datac => \inst|Add0~8_combout\,
	datad => \inst|horizontal\(10),
	combout => \inst|horizontal~1_combout\);

-- Location: FF_X79_Y48_N23
\inst|horizontal[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|horizontal~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|horizontal\(4));

-- Location: LCCOMB_X79_Y48_N30
\inst|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan0~1_combout\ = (\inst|LessThan0~0_combout\) # (((!\inst|horizontal\(2)) # (!\inst|horizontal\(4))) # (!\inst|horizontal\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~0_combout\,
	datab => \inst|horizontal\(3),
	datac => \inst|horizontal\(4),
	datad => \inst|horizontal\(2),
	combout => \inst|LessThan0~1_combout\);

-- Location: LCCOMB_X79_Y48_N14
\inst|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~14_combout\ = (\inst|horizontal\(7) & (!\inst|Add0~13\)) # (!\inst|horizontal\(7) & ((\inst|Add0~13\) # (GND)))
-- \inst|Add0~15\ = CARRY((!\inst|Add0~13\) # (!\inst|horizontal\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|horizontal\(7),
	datad => VCC,
	cin => \inst|Add0~13\,
	combout => \inst|Add0~14_combout\,
	cout => \inst|Add0~15\);

-- Location: LCCOMB_X79_Y48_N16
\inst|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~16_combout\ = (\inst|horizontal\(8) & (\inst|Add0~15\ $ (GND))) # (!\inst|horizontal\(8) & (!\inst|Add0~15\ & VCC))
-- \inst|Add0~17\ = CARRY((\inst|horizontal\(8) & !\inst|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|horizontal\(8),
	datad => VCC,
	cin => \inst|Add0~15\,
	combout => \inst|Add0~16_combout\,
	cout => \inst|Add0~17\);

-- Location: LCCOMB_X80_Y48_N8
\inst|horizontal~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|horizontal~8_combout\ = (\inst|Add0~16_combout\ & (((\inst|LessThan0~4_combout\ & \inst|LessThan0~1_combout\)) # (!\inst|horizontal\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~4_combout\,
	datab => \inst|LessThan0~1_combout\,
	datac => \inst|horizontal\(10),
	datad => \inst|Add0~16_combout\,
	combout => \inst|horizontal~8_combout\);

-- Location: FF_X80_Y48_N9
\inst|horizontal[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|horizontal~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|horizontal\(8));

-- Location: LCCOMB_X81_Y48_N28
\inst|LessThan4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan4~0_combout\ = ((!\inst|Add0~10_combout\ & (!\inst|Add0~14_combout\ & !\inst|Add0~12_combout\))) # (!\inst|Add0~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~10_combout\,
	datab => \inst|Add0~14_combout\,
	datac => \inst|Add0~16_combout\,
	datad => \inst|Add0~12_combout\,
	combout => \inst|LessThan4~0_combout\);

-- Location: LCCOMB_X81_Y48_N30
\inst|LessThan4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan4~1_combout\ = (\inst|LessThan0~3_combout\) # ((!\inst|Add0~20_combout\ & ((\inst|LessThan4~0_combout\) # (!\inst|Add0~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~3_combout\,
	datab => \inst|Add0~18_combout\,
	datac => \inst|Add0~20_combout\,
	datad => \inst|LessThan4~0_combout\,
	combout => \inst|LessThan4~1_combout\);

-- Location: FF_X80_Y50_N5
\inst|yrow[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Add1~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|yrow\(3));

-- Location: LCCOMB_X80_Y50_N10
\inst|Add1~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~30_combout\ = (\inst|Add1~0_combout\ & \inst|LessThan1~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~0_combout\,
	datad => \inst|LessThan1~2_combout\,
	combout => \inst|Add1~30_combout\);

-- Location: LCCOMB_X80_Y48_N0
\inst|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan0~3_combout\ = (\inst|horizontal\(10) & (((\inst|horizontal\(9)) # (!\inst|LessThan0~1_combout\)) # (!\inst|LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~2_combout\,
	datab => \inst|LessThan0~1_combout\,
	datac => \inst|horizontal\(10),
	datad => \inst|horizontal\(9),
	combout => \inst|LessThan0~3_combout\);

-- Location: FF_X80_Y50_N11
\inst|yrow[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Add1~30_combout\,
	ena => \inst|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|yrow\(0));

-- Location: LCCOMB_X80_Y50_N14
\inst|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~2_combout\ = (\inst|yrow\(1) & (!\inst|Add1~1\)) # (!\inst|yrow\(1) & ((\inst|Add1~1\) # (GND)))
-- \inst|Add1~3\ = CARRY((!\inst|Add1~1\) # (!\inst|yrow\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(1),
	datad => VCC,
	cin => \inst|Add1~1\,
	combout => \inst|Add1~2_combout\,
	cout => \inst|Add1~3\);

-- Location: LCCOMB_X80_Y50_N0
\inst|Add1~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~29_combout\ = (\inst|Add1~2_combout\ & \inst|LessThan1~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Add1~2_combout\,
	datad => \inst|LessThan1~2_combout\,
	combout => \inst|Add1~29_combout\);

-- Location: FF_X80_Y50_N1
\inst|yrow[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Add1~29_combout\,
	ena => \inst|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|yrow\(1));

-- Location: LCCOMB_X80_Y50_N16
\inst|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~4_combout\ = (\inst|yrow\(2) & (\inst|Add1~3\ $ (GND))) # (!\inst|yrow\(2) & (!\inst|Add1~3\ & VCC))
-- \inst|Add1~5\ = CARRY((\inst|yrow\(2) & !\inst|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(2),
	datad => VCC,
	cin => \inst|Add1~3\,
	combout => \inst|Add1~4_combout\,
	cout => \inst|Add1~5\);

-- Location: LCCOMB_X80_Y50_N18
\inst|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~6_combout\ = (\inst|yrow\(3) & (!\inst|Add1~5\)) # (!\inst|yrow\(3) & ((\inst|Add1~5\) # (GND)))
-- \inst|Add1~7\ = CARRY((!\inst|Add1~5\) # (!\inst|yrow\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(3),
	datad => VCC,
	cin => \inst|Add1~5\,
	combout => \inst|Add1~6_combout\,
	cout => \inst|Add1~7\);

-- Location: LCCOMB_X80_Y50_N20
\inst|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~10_combout\ = (\inst|yrow\(4) & (\inst|Add1~7\ $ (GND))) # (!\inst|yrow\(4) & (!\inst|Add1~7\ & VCC))
-- \inst|Add1~11\ = CARRY((\inst|yrow\(4) & !\inst|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(4),
	datad => VCC,
	cin => \inst|Add1~7\,
	combout => \inst|Add1~10_combout\,
	cout => \inst|Add1~11\);

-- Location: LCCOMB_X80_Y50_N8
\inst|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~12_combout\ = (\inst|LessThan0~3_combout\ & (\inst|Add1~8_combout\ & ((\inst|Add1~10_combout\)))) # (!\inst|LessThan0~3_combout\ & ((\inst|yrow\(4)) # ((\inst|Add1~8_combout\ & \inst|Add1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~3_combout\,
	datab => \inst|Add1~8_combout\,
	datac => \inst|yrow\(4),
	datad => \inst|Add1~10_combout\,
	combout => \inst|Add1~12_combout\);

-- Location: FF_X80_Y50_N9
\inst|yrow[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Add1~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|yrow\(4));

-- Location: LCCOMB_X80_Y50_N22
\inst|Add1~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~13_combout\ = (\inst|yrow\(5) & (!\inst|Add1~11\)) # (!\inst|yrow\(5) & ((\inst|Add1~11\) # (GND)))
-- \inst|Add1~14\ = CARRY((!\inst|Add1~11\) # (!\inst|yrow\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(5),
	datad => VCC,
	cin => \inst|Add1~11\,
	combout => \inst|Add1~13_combout\,
	cout => \inst|Add1~14\);

-- Location: LCCOMB_X81_Y50_N12
\inst|Add1~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~15_combout\ = (\inst|LessThan0~3_combout\ & (\inst|Add1~8_combout\ & ((\inst|Add1~13_combout\)))) # (!\inst|LessThan0~3_combout\ & ((\inst|yrow\(5)) # ((\inst|Add1~8_combout\ & \inst|Add1~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~3_combout\,
	datab => \inst|Add1~8_combout\,
	datac => \inst|yrow\(5),
	datad => \inst|Add1~13_combout\,
	combout => \inst|Add1~15_combout\);

-- Location: FF_X81_Y50_N13
\inst|yrow[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Add1~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|yrow\(5));

-- Location: LCCOMB_X80_Y50_N24
\inst|Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~16_combout\ = (\inst|yrow\(6) & (\inst|Add1~14\ $ (GND))) # (!\inst|yrow\(6) & (!\inst|Add1~14\ & VCC))
-- \inst|Add1~17\ = CARRY((\inst|yrow\(6) & !\inst|Add1~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(6),
	datad => VCC,
	cin => \inst|Add1~14\,
	combout => \inst|Add1~16_combout\,
	cout => \inst|Add1~17\);

-- Location: LCCOMB_X81_Y50_N14
\inst|Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~18_combout\ = (\inst|LessThan0~3_combout\ & (\inst|Add1~8_combout\ & ((\inst|Add1~16_combout\)))) # (!\inst|LessThan0~3_combout\ & ((\inst|yrow\(6)) # ((\inst|Add1~8_combout\ & \inst|Add1~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~3_combout\,
	datab => \inst|Add1~8_combout\,
	datac => \inst|yrow\(6),
	datad => \inst|Add1~16_combout\,
	combout => \inst|Add1~18_combout\);

-- Location: FF_X81_Y50_N15
\inst|yrow[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Add1~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|yrow\(6));

-- Location: LCCOMB_X82_Y48_N2
\instDL2M|iDL1|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan0~0_combout\ = (\inst|yrow\(4) & (\inst|yrow\(6) & \inst|yrow\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(4),
	datac => \inst|yrow\(6),
	datad => \inst|yrow\(5),
	combout => \instDL2M|iDL1|LessThan0~0_combout\);

-- Location: LCCOMB_X80_Y50_N6
\inst|Add1~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~28_combout\ = (\inst|Add1~4_combout\ & \inst|LessThan1~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Add1~4_combout\,
	datad => \inst|LessThan1~2_combout\,
	combout => \inst|Add1~28_combout\);

-- Location: FF_X80_Y50_N7
\inst|yrow[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Add1~28_combout\,
	ena => \inst|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|yrow\(2));

-- Location: LCCOMB_X82_Y48_N8
\inst|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan1~0_combout\ = (!\inst|yrow\(2) & (!\inst|yrow\(3) & ((!\inst|yrow\(0)) # (!\inst|yrow\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(1),
	datab => \inst|yrow\(2),
	datac => \inst|yrow\(0),
	datad => \inst|yrow\(3),
	combout => \inst|LessThan1~0_combout\);

-- Location: LCCOMB_X80_Y50_N2
\inst|Add1~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~27_combout\ = (\inst|Add1~25_combout\ & ((\inst|Add1~8_combout\) # ((\inst|yrow\(9) & !\inst|LessThan0~3_combout\)))) # (!\inst|Add1~25_combout\ & (((\inst|yrow\(9) & !\inst|LessThan0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~25_combout\,
	datab => \inst|Add1~8_combout\,
	datac => \inst|yrow\(9),
	datad => \inst|LessThan0~3_combout\,
	combout => \inst|Add1~27_combout\);

-- Location: FF_X80_Y50_N3
\inst|yrow[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Add1~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|yrow\(9));

-- Location: LCCOMB_X82_Y48_N12
\inst|LessThan1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan1~2_combout\ = ((\inst|LessThan1~1_combout\ & ((\inst|LessThan1~0_combout\) # (!\instDL2M|iDL1|LessThan0~0_combout\)))) # (!\inst|yrow\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan1~1_combout\,
	datab => \instDL2M|iDL1|LessThan0~0_combout\,
	datac => \inst|LessThan1~0_combout\,
	datad => \inst|yrow\(9),
	combout => \inst|LessThan1~2_combout\);

-- Location: LCCOMB_X80_Y48_N28
\inst|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~8_combout\ = (\inst|horizontal\(10) & (\inst|LessThan1~2_combout\ & ((!\inst|LessThan0~1_combout\) # (!\inst|LessThan0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~4_combout\,
	datab => \inst|LessThan0~1_combout\,
	datac => \inst|horizontal\(10),
	datad => \inst|LessThan1~2_combout\,
	combout => \inst|Add1~8_combout\);

-- Location: LCCOMB_X80_Y50_N4
\inst|Add1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~9_combout\ = (\inst|LessThan0~3_combout\ & (\inst|Add1~8_combout\ & ((\inst|Add1~6_combout\)))) # (!\inst|LessThan0~3_combout\ & ((\inst|yrow\(3)) # ((\inst|Add1~8_combout\ & \inst|Add1~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~3_combout\,
	datab => \inst|Add1~8_combout\,
	datac => \inst|yrow\(3),
	datad => \inst|Add1~6_combout\,
	combout => \inst|Add1~9_combout\);

-- Location: LCCOMB_X81_Y50_N4
\inst|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~0_combout\ = ((!\inst|Add1~15_combout\ & ((!\inst|Add1~9_combout\) # (!\inst|Add1~12_combout\)))) # (!\inst|Add1~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~12_combout\,
	datab => \inst|Add1~9_combout\,
	datac => \inst|Add1~18_combout\,
	datad => \inst|Add1~15_combout\,
	combout => \inst|process_0~0_combout\);

-- Location: FF_X81_Y50_N3
\inst|yrow[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Add1~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|yrow\(7));

-- Location: LCCOMB_X81_Y50_N2
\inst|Add1~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~21_combout\ = (\inst|Add1~19_combout\ & ((\inst|Add1~8_combout\) # ((\inst|yrow\(7) & !\inst|LessThan0~3_combout\)))) # (!\inst|Add1~19_combout\ & (((\inst|yrow\(7) & !\inst|LessThan0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~19_combout\,
	datab => \inst|Add1~8_combout\,
	datac => \inst|yrow\(7),
	datad => \inst|LessThan0~3_combout\,
	combout => \inst|Add1~21_combout\);

-- Location: LCCOMB_X81_Y50_N30
\inst|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~1_combout\ = (!\inst|Add1~24_combout\ & (\inst|LessThan4~1_combout\ & (\inst|process_0~0_combout\ & !\inst|Add1~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~24_combout\,
	datab => \inst|LessThan4~1_combout\,
	datac => \inst|process_0~0_combout\,
	datad => \inst|Add1~21_combout\,
	combout => \inst|process_0~1_combout\);

-- Location: LCCOMB_X81_Y50_N18
\inst|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~2_combout\ = (\inst|process_0~1_combout\) # ((!\inst|Add1~27_combout\ & \inst|LessThan4~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add1~27_combout\,
	datab => \inst|LessThan4~1_combout\,
	datac => \inst|process_0~1_combout\,
	combout => \inst|process_0~2_combout\);

-- Location: FF_X81_Y50_N19
\inst|LCD_DEN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|LCD_DEN~q\);

-- Location: LCCOMB_X81_Y50_N0
\instDL2M|iPipeLine|LCD_DEN~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iPipeLine|LCD_DEN~feeder_combout\ = \inst|LCD_DEN~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|LCD_DEN~q\,
	combout => \instDL2M|iPipeLine|LCD_DEN~feeder_combout\);

-- Location: FF_X81_Y50_N1
\instDL2M|iPipeLine|LCD_DEN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iPipeLine|LCD_DEN~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|LCD_DEN~q\);

-- Location: LCCOMB_X114_Y41_N16
\instLRD|LCD_DEN~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_DEN~feeder_combout\ = \instDL2M|iPipeLine|LCD_DEN~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \instDL2M|iPipeLine|LCD_DEN~q\,
	combout => \instLRD|LCD_DEN~feeder_combout\);

-- Location: LCCOMB_X1_Y5_N0
\inst|ipll|altpll_component|auto_generated|pll_lock_sync~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ipll|altpll_component|auto_generated|pll_lock_sync~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ipll|altpll_component|auto_generated|pll_lock_sync~feeder_combout\);

-- Location: IOIBUF_X115_Y42_N15
\KEY[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: IOIBUF_X115_Y53_N15
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: IOIBUF_X115_Y35_N22
\KEY[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

-- Location: LCCOMB_X114_Y40_N8
\inst4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~0_combout\ = (((!\KEY[3]~input_o\) # (!\KEY[1]~input_o\)) # (!\KEY[2]~input_o\)) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \KEY[2]~input_o\,
	datac => \KEY[1]~input_o\,
	datad => \KEY[3]~input_o\,
	combout => \inst4~0_combout\);

-- Location: CLKCTRL_G8
\inst4~0clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst4~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst4~0clkctrl_outclk\);

-- Location: FF_X1_Y5_N1
\inst|ipll|altpll_component|auto_generated|pll_lock_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|wire_pll1_locked\,
	d => \inst|ipll|altpll_component|auto_generated|pll_lock_sync~feeder_combout\,
	clrn => \ALT_INV_inst4~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ipll|altpll_component|auto_generated|pll_lock_sync~q\);

-- Location: LCCOMB_X1_Y5_N10
\inst|ipll|altpll_component|auto_generated|locked\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ipll|altpll_component|auto_generated|locked~combout\ = (!\inst|ipll|altpll_component|auto_generated|pll_lock_sync~q\) # (!\inst|ipll|altpll_component|auto_generated|wire_pll1_locked\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|ipll|altpll_component|auto_generated|wire_pll1_locked\,
	datad => \inst|ipll|altpll_component|auto_generated|pll_lock_sync~q\,
	combout => \inst|ipll|altpll_component|auto_generated|locked~combout\);

-- Location: CLKCTRL_G1
\inst|ipll|altpll_component|auto_generated|locked~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst|ipll|altpll_component|auto_generated|locked~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst|ipll|altpll_component|auto_generated|locked~clkctrl_outclk\);

-- Location: FF_X114_Y41_N17
\instLRD|LCD_DEN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_DEN~feeder_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_DEN~q\);

-- Location: LCCOMB_X114_Y44_N16
\instLRD|LCD_DIM~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_DIM~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \instLRD|LCD_DIM~feeder_combout\);

-- Location: FF_X114_Y44_N17
\instLRD|LCD_DIM\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_DIM~feeder_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_DIM~q\);

-- Location: LCCOMB_X81_Y50_N8
\instDL2M|iDL1|LSPflag~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~2_combout\ = \inst|yrow\(6) $ (((!\inst|yrow\(5)) # (!\inst|yrow\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011110000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(4),
	datab => \inst|yrow\(5),
	datac => \inst|yrow\(6),
	combout => \instDL2M|iDL1|LSPflag~2_combout\);

-- Location: LCCOMB_X81_Y48_N0
\inst|xcolumn~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|xcolumn~4_combout\ = (!\inst|LessThan0~3_combout\ & ((\inst|Add0~18_combout\) # (\inst|Add0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~3_combout\,
	datab => \inst|Add0~18_combout\,
	datac => \inst|Add0~20_combout\,
	combout => \inst|xcolumn~4_combout\);

-- Location: FF_X81_Y48_N1
\inst|xcolumn[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|xcolumn~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|xcolumn\(9));

-- Location: LCCOMB_X80_Y48_N16
\inst|xcolumn~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|xcolumn~5_combout\ = (!\inst|LessThan0~3_combout\ & ((\inst|Add0~20_combout\) # (\inst|Add0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Add0~20_combout\,
	datac => \inst|Add0~12_combout\,
	datad => \inst|LessThan0~3_combout\,
	combout => \inst|xcolumn~5_combout\);

-- Location: FF_X80_Y48_N17
\inst|xcolumn[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|xcolumn~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|xcolumn\(6));

-- Location: LCCOMB_X81_Y48_N12
\inst|xcolumn~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|xcolumn~2_combout\ = (!\inst|LessThan0~3_combout\ & ((\inst|Add0~20_combout\) # (\inst|Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~20_combout\,
	datac => \inst|LessThan0~3_combout\,
	datad => \inst|Add0~16_combout\,
	combout => \inst|xcolumn~2_combout\);

-- Location: FF_X81_Y48_N13
\inst|xcolumn[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|xcolumn~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|xcolumn\(8));

-- Location: LCCOMB_X81_Y48_N10
\instDL2M|iDL1|LSPflag~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~1_combout\ = (\inst|xcolumn\(9)) # ((\inst|xcolumn\(6) & ((\inst|xcolumn\(8)))) # (!\inst|xcolumn\(6) & ((\inst|xcolumn\(7)) # (!\inst|xcolumn\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(7),
	datab => \inst|xcolumn\(9),
	datac => \inst|xcolumn\(6),
	datad => \inst|xcolumn\(8),
	combout => \instDL2M|iDL1|LSPflag~1_combout\);

-- Location: LCCOMB_X81_Y48_N6
\inst|xcolumn~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|xcolumn~3_combout\ = (!\inst|LessThan0~3_combout\ & ((\inst|Add0~14_combout\) # (\inst|Add0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~3_combout\,
	datab => \inst|Add0~14_combout\,
	datac => \inst|Add0~20_combout\,
	combout => \inst|xcolumn~3_combout\);

-- Location: FF_X81_Y48_N7
\inst|xcolumn[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|xcolumn~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|xcolumn\(7));

-- Location: LCCOMB_X81_Y48_N8
\inst|xcolumn~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|xcolumn~0_combout\ = (!\inst|LessThan0~3_combout\ & ((\inst|Add0~20_combout\) # (\inst|Add0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~20_combout\,
	datac => \inst|LessThan0~3_combout\,
	datad => \inst|Add0~8_combout\,
	combout => \inst|xcolumn~0_combout\);

-- Location: FF_X81_Y48_N9
\inst|xcolumn[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|xcolumn~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|xcolumn\(4));

-- Location: LCCOMB_X81_Y48_N2
\inst|xcolumn~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|xcolumn~1_combout\ = (!\inst|LessThan0~3_combout\ & ((\inst|Add0~20_combout\) # (\inst|Add0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~20_combout\,
	datac => \inst|LessThan0~3_combout\,
	datad => \inst|Add0~10_combout\,
	combout => \inst|xcolumn~1_combout\);

-- Location: FF_X81_Y48_N3
\inst|xcolumn[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|xcolumn~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|xcolumn\(5));

-- Location: LCCOMB_X80_Y49_N22
\instDL2M|iDL1|LSPflag~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~0_combout\ = (\inst|xcolumn\(4) & (((!\inst|xcolumn\(7))))) # (!\inst|xcolumn\(4) & ((\inst|xcolumn\(5) & ((!\inst|xcolumn\(7)))) # (!\inst|xcolumn\(5) & (!\inst|xcolumn\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(8),
	datab => \inst|xcolumn\(7),
	datac => \inst|xcolumn\(4),
	datad => \inst|xcolumn\(5),
	combout => \instDL2M|iDL1|LSPflag~0_combout\);

-- Location: LCCOMB_X81_Y50_N16
\instDL2M|iDL1|LSPflag~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~3_combout\ = ((\instDL2M|iDL1|LSPflag~2_combout\) # ((\instDL2M|iDL1|LSPflag~1_combout\) # (\instDL2M|iDL1|LSPflag~0_combout\))) # (!\instDL2M|iDL1|LessThan20~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LessThan20~0_combout\,
	datab => \instDL2M|iDL1|LSPflag~2_combout\,
	datac => \instDL2M|iDL1|LSPflag~1_combout\,
	datad => \instDL2M|iDL1|LSPflag~0_combout\,
	combout => \instDL2M|iDL1|LSPflag~3_combout\);

-- Location: LCCOMB_X81_Y50_N20
\inst|Add1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add1~24_combout\ = (\inst|LessThan0~3_combout\ & (\inst|Add1~8_combout\ & ((\inst|Add1~22_combout\)))) # (!\inst|LessThan0~3_combout\ & ((\inst|yrow\(8)) # ((\inst|Add1~8_combout\ & \inst|Add1~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~3_combout\,
	datab => \inst|Add1~8_combout\,
	datac => \inst|yrow\(8),
	datad => \inst|Add1~22_combout\,
	combout => \inst|Add1~24_combout\);

-- Location: FF_X81_Y50_N21
\inst|yrow[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Add1~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|yrow\(8));

-- Location: LCCOMB_X81_Y50_N26
\instDL2M|iDL1|LSPflag:romID[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag:romID[1]~0_combout\ = (!\inst|yrow\(9) & (!\inst|yrow\(6) & !\inst|yrow\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(9),
	datac => \inst|yrow\(6),
	datad => \inst|yrow\(8),
	combout => \instDL2M|iDL1|LSPflag:romID[1]~0_combout\);

-- Location: LCCOMB_X81_Y50_N28
\instDL2M|iDL1|LSPflag:romID[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag:romID[1]~1_combout\ = (!\instDL2M|iDL1|LSPflag~0_combout\ & (!\instDL2M|iDL1|LSPflag~1_combout\ & (\instDL2M|iDL1|LSPflag:romID[1]~0_combout\ & \inst|yrow\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~0_combout\,
	datab => \instDL2M|iDL1|LSPflag~1_combout\,
	datac => \instDL2M|iDL1|LSPflag:romID[1]~0_combout\,
	datad => \inst|yrow\(7),
	combout => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\);

-- Location: LCCOMB_X81_Y49_N2
\instDL2M|iDL1|Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Mux11~0_combout\ = (\inst|xcolumn\(0) & ((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(0),
	datac => \instDL2M|iDL1|LSPflag~3_combout\,
	datad => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	combout => \instDL2M|iDL1|Mux11~0_combout\);

-- Location: LCCOMB_X81_Y49_N4
\instDL2M|iDL1|Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Mux10~0_combout\ = (\inst|xcolumn\(1) & ((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(1),
	datab => \instDL2M|iDL1|LSPflag~3_combout\,
	datad => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	combout => \instDL2M|iDL1|Mux10~0_combout\);

-- Location: LCCOMB_X80_Y48_N26
\inst|xcolumn~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|xcolumn~7_combout\ = (!\inst|LessThan0~3_combout\ & ((\inst|Add0~20_combout\) # (\inst|Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Add0~20_combout\,
	datac => \inst|Add0~4_combout\,
	datad => \inst|LessThan0~3_combout\,
	combout => \inst|xcolumn~7_combout\);

-- Location: FF_X80_Y48_N27
\inst|xcolumn[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|xcolumn~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|xcolumn\(2));

-- Location: LCCOMB_X81_Y49_N30
\instDL2M|iDL1|Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Mux9~0_combout\ = (\inst|xcolumn\(2) & ((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(2),
	datac => \instDL2M|iDL1|LSPflag~3_combout\,
	datad => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	combout => \instDL2M|iDL1|Mux9~0_combout\);

-- Location: LCCOMB_X83_Y48_N0
\inst|xcolumn~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|xcolumn~6_combout\ = (!\inst|LessThan0~3_combout\ & ((\inst|Add0~6_combout\) # (\inst|Add0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~6_combout\,
	datab => \inst|Add0~20_combout\,
	datad => \inst|LessThan0~3_combout\,
	combout => \inst|xcolumn~6_combout\);

-- Location: FF_X83_Y48_N1
\inst|xcolumn[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|xcolumn~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|xcolumn\(3));

-- Location: LCCOMB_X80_Y49_N0
\instDL2M|iDL1|Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Mux8~0_combout\ = (\inst|xcolumn\(3) & ((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	datac => \instDL2M|iDL1|LSPflag~3_combout\,
	datad => \inst|xcolumn\(3),
	combout => \instDL2M|iDL1|Mux8~0_combout\);

-- Location: LCCOMB_X80_Y49_N8
\instDL2M|iDL1|Add5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add5~0_combout\ = \inst|xcolumn\(4) $ (VCC)
-- \instDL2M|iDL1|Add5~1\ = CARRY(\inst|xcolumn\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(4),
	datad => VCC,
	combout => \instDL2M|iDL1|Add5~0_combout\,
	cout => \instDL2M|iDL1|Add5~1\);

-- Location: LCCOMB_X80_Y49_N26
\instDL2M|iDL1|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Mux7~0_combout\ = (\instDL2M|iDL1|Add5~0_combout\ & ((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instDL2M|iDL1|LSPflag~3_combout\,
	datac => \instDL2M|iDL1|Add5~0_combout\,
	datad => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	combout => \instDL2M|iDL1|Mux7~0_combout\);

-- Location: LCCOMB_X80_Y49_N4
\instDL2M|iDL1|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Mux6~0_combout\ = (\instDL2M|iDL1|Add5~2_combout\ & ((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add5~2_combout\,
	datac => \instDL2M|iDL1|LSPflag~3_combout\,
	datad => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	combout => \instDL2M|iDL1|Mux6~0_combout\);

-- Location: LCCOMB_X80_Y49_N12
\instDL2M|iDL1|Add5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add5~4_combout\ = (\inst|xcolumn\(6) & (\instDL2M|iDL1|Add5~3\ $ (GND))) # (!\inst|xcolumn\(6) & (!\instDL2M|iDL1|Add5~3\ & VCC))
-- \instDL2M|iDL1|Add5~5\ = CARRY((\inst|xcolumn\(6) & !\instDL2M|iDL1|Add5~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(6),
	datad => VCC,
	cin => \instDL2M|iDL1|Add5~3\,
	combout => \instDL2M|iDL1|Add5~4_combout\,
	cout => \instDL2M|iDL1|Add5~5\);

-- Location: LCCOMB_X79_Y49_N0
\instDL2M|iDL1|Add6~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~14_cout\ = CARRY(\instDL2M|iDL1|LSPflag~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~3_combout\,
	datad => VCC,
	cout => \instDL2M|iDL1|Add6~14_cout\);

-- Location: LCCOMB_X79_Y49_N2
\instDL2M|iDL1|Add6~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~15_combout\ = (\instDL2M|iDL1|Add6~12_combout\ & ((\instDL2M|iDL1|Add5~4_combout\ & (\instDL2M|iDL1|Add6~14_cout\ & VCC)) # (!\instDL2M|iDL1|Add5~4_combout\ & (!\instDL2M|iDL1|Add6~14_cout\)))) # (!\instDL2M|iDL1|Add6~12_combout\ & 
-- ((\instDL2M|iDL1|Add5~4_combout\ & (!\instDL2M|iDL1|Add6~14_cout\)) # (!\instDL2M|iDL1|Add5~4_combout\ & ((\instDL2M|iDL1|Add6~14_cout\) # (GND)))))
-- \instDL2M|iDL1|Add6~16\ = CARRY((\instDL2M|iDL1|Add6~12_combout\ & (!\instDL2M|iDL1|Add5~4_combout\ & !\instDL2M|iDL1|Add6~14_cout\)) # (!\instDL2M|iDL1|Add6~12_combout\ & ((!\instDL2M|iDL1|Add6~14_cout\) # (!\instDL2M|iDL1|Add5~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add6~12_combout\,
	datab => \instDL2M|iDL1|Add5~4_combout\,
	datad => VCC,
	cin => \instDL2M|iDL1|Add6~14_cout\,
	combout => \instDL2M|iDL1|Add6~15_combout\,
	cout => \instDL2M|iDL1|Add6~16\);

-- Location: LCCOMB_X79_Y49_N20
\instDL2M|iDL1|Add6~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~31_combout\ = (\instDL2M|iDL1|Add6~15_combout\ & ((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~3_combout\,
	datab => \instDL2M|iDL1|Add6~15_combout\,
	datac => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	combout => \instDL2M|iDL1|Add6~31_combout\);

-- Location: LCCOMB_X80_Y49_N14
\instDL2M|iDL1|Add5~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add5~6_combout\ = (\inst|xcolumn\(7) & (!\instDL2M|iDL1|Add5~5\)) # (!\inst|xcolumn\(7) & ((\instDL2M|iDL1|Add5~5\) # (GND)))
-- \instDL2M|iDL1|Add5~7\ = CARRY((!\instDL2M|iDL1|Add5~5\) # (!\inst|xcolumn\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(7),
	datad => VCC,
	cin => \instDL2M|iDL1|Add5~5\,
	combout => \instDL2M|iDL1|Add5~6_combout\,
	cout => \instDL2M|iDL1|Add5~7\);

-- Location: LCCOMB_X79_Y49_N4
\instDL2M|iDL1|Add6~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~18_combout\ = ((\instDL2M|iDL1|Add6~17_combout\ $ (\instDL2M|iDL1|Add5~6_combout\ $ (!\instDL2M|iDL1|Add6~16\)))) # (GND)
-- \instDL2M|iDL1|Add6~19\ = CARRY((\instDL2M|iDL1|Add6~17_combout\ & ((\instDL2M|iDL1|Add5~6_combout\) # (!\instDL2M|iDL1|Add6~16\))) # (!\instDL2M|iDL1|Add6~17_combout\ & (\instDL2M|iDL1|Add5~6_combout\ & !\instDL2M|iDL1|Add6~16\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add6~17_combout\,
	datab => \instDL2M|iDL1|Add5~6_combout\,
	datad => VCC,
	cin => \instDL2M|iDL1|Add6~16\,
	combout => \instDL2M|iDL1|Add6~18_combout\,
	cout => \instDL2M|iDL1|Add6~19\);

-- Location: LCCOMB_X79_Y49_N22
\instDL2M|iDL1|Add6~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~32_combout\ = (\instDL2M|iDL1|Add6~18_combout\ & ((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~3_combout\,
	datab => \instDL2M|iDL1|Add6~18_combout\,
	datac => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	combout => \instDL2M|iDL1|Add6~32_combout\);

-- Location: LCCOMB_X79_Y49_N16
\instDL2M|iDL1|Add6~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~33_combout\ = (\instDL2M|iDL1|Add6~21_combout\ & ((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add6~21_combout\,
	datac => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	datad => \instDL2M|iDL1|LSPflag~3_combout\,
	combout => \instDL2M|iDL1|Add6~33_combout\);

-- Location: LCCOMB_X79_Y49_N24
\instDL2M|iDL1|Add6~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~20_combout\ = \inst|yrow\(2) $ (\instDL2M|iDL1|LSPflag:romID[1]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(2),
	datac => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	combout => \instDL2M|iDL1|Add6~20_combout\);

-- Location: LCCOMB_X79_Y49_N18
\instDL2M|iDL1|Add6~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~34_combout\ = (\instDL2M|iDL1|Add6~24_combout\ & ((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~3_combout\,
	datab => \instDL2M|iDL1|Add6~24_combout\,
	datac => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	combout => \instDL2M|iDL1|Add6~34_combout\);

-- Location: LCCOMB_X79_Y49_N28
\instDL2M|iDL1|Add6~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~35_combout\ = (\instDL2M|iDL1|Add6~26_combout\ & ((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add6~26_combout\,
	datac => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	datad => \instDL2M|iDL1|LSPflag~3_combout\,
	combout => \instDL2M|iDL1|Add6~35_combout\);

-- Location: LCCOMB_X79_Y49_N14
\instDL2M|iDL1|Add6~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add6~36_combout\ = (\instDL2M|iDL1|Add6~29_combout\ & ((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add6~29_combout\,
	datac => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	datad => \instDL2M|iDL1|LSPflag~3_combout\,
	combout => \instDL2M|iDL1|Add6~36_combout\);

-- Location: LCCOMB_X84_Y49_N4
\instDL2M|iDL1|LSPflag~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~4_combout\ = (\instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(1) & (((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\)))) # 
-- (!\instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(1) & (\instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(0) & ((\instDL2M|iDL1|LSPflag:romID[1]~1_combout\) # (!\instDL2M|iDL1|LSPflag~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(1),
	datab => \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(0),
	datac => \instDL2M|iDL1|LSPflag~3_combout\,
	datad => \instDL2M|iDL1|LSPflag:romID[1]~1_combout\,
	combout => \instDL2M|iDL1|LSPflag~4_combout\);

-- Location: LCCOMB_X82_Y49_N24
\instDL2M|iDL1|LSPflag~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~5_combout\ = ((!\inst|xcolumn\(7) & !\inst|xcolumn\(6))) # (!\inst|xcolumn\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(7),
	datac => \inst|xcolumn\(8),
	datad => \inst|xcolumn\(6),
	combout => \instDL2M|iDL1|LSPflag~5_combout\);

-- Location: LCCOMB_X81_Y50_N22
\instDL2M|iDL1|LessThan9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan9~0_combout\ = (((!\inst|yrow\(7)) # (!\inst|yrow\(5))) # (!\inst|yrow\(6))) # (!\inst|yrow\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(4),
	datab => \inst|yrow\(6),
	datac => \inst|yrow\(5),
	datad => \inst|yrow\(7),
	combout => \instDL2M|iDL1|LessThan9~0_combout\);

-- Location: LCCOMB_X81_Y49_N8
\instDL2M|iDL1|LessThan20~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan20~1_combout\ = (!\inst|yrow\(9) & !\inst|yrow\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(9),
	datad => \inst|yrow\(8),
	combout => \instDL2M|iDL1|LessThan20~1_combout\);

-- Location: LCCOMB_X82_Y49_N22
\instDL2M|iDL1|LSPflag~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~6_combout\ = (\inst|xcolumn\(9)) # (((!\instDL2M|iDL1|LessThan20~1_combout\) # (!\instDL2M|iDL1|LessThan9~0_combout\)) # (!\instDL2M|iDL1|LSPflag~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(9),
	datab => \instDL2M|iDL1|LSPflag~5_combout\,
	datac => \instDL2M|iDL1|LessThan9~0_combout\,
	datad => \instDL2M|iDL1|LessThan20~1_combout\,
	combout => \instDL2M|iDL1|LSPflag~6_combout\);

-- Location: LCCOMB_X83_Y49_N20
\instDL2M|iDL1|VGA_G[7]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_G[7]~4_combout\ = (!\instDL2M|iDL1|LSPflag~4_combout\ & !\instDL2M|iDL1|LSPflag~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instDL2M|iDL1|LSPflag~4_combout\,
	datac => \instDL2M|iDL1|LSPflag~6_combout\,
	combout => \instDL2M|iDL1|VGA_G[7]~4_combout\);

-- Location: LCCOMB_X81_Y50_N6
\instDL2M|iDL1|LessThan20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan20~0_combout\ = (!\inst|yrow\(8) & (!\inst|yrow\(9) & !\inst|yrow\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(8),
	datac => \inst|yrow\(9),
	datad => \inst|yrow\(7),
	combout => \instDL2M|iDL1|LessThan20~0_combout\);

-- Location: LCCOMB_X82_Y48_N4
\instDL2M|iDL1|LessThan20~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan20~2_combout\ = (\instDL2M|iDL1|LessThan20~0_combout\ & ((!\instDL2M|iDL1|LessThan0~0_combout\) # (!\inst|yrow\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(3),
	datac => \instDL2M|iDL1|LessThan20~0_combout\,
	datad => \instDL2M|iDL1|LessThan0~0_combout\,
	combout => \instDL2M|iDL1|LessThan20~2_combout\);

-- Location: LCCOMB_X84_Y49_N8
\instDL2M|iDL1|VGA_B[7]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_B[7]~2_combout\ = (\instDL2M|iDL1|RGB~2_combout\ & (!\instDL2M|iDL1|LSPflag~3_combout\ & (\instDL2M|iDL1|LSPflag~4_combout\ & !\instDL2M|iDL1|LSPflag~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|RGB~2_combout\,
	datab => \instDL2M|iDL1|LSPflag~3_combout\,
	datac => \instDL2M|iDL1|LSPflag~4_combout\,
	datad => \instDL2M|iDL1|LSPflag~6_combout\,
	combout => \instDL2M|iDL1|VGA_B[7]~2_combout\);

-- Location: LCCOMB_X84_Y49_N10
\instDL2M|iDL1|VGA_B[7]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_B[7]~3_combout\ = (\instDL2M|iDL1|VGA_B[7]~2_combout\) # ((!\instDL2M|iDL1|LSPflag~17_combout\ & (\instDL2M|iDL1|LessThan20~2_combout\ & \instDL2M|iDL1|VGA_G[7]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~17_combout\,
	datab => \instDL2M|iDL1|LessThan20~2_combout\,
	datac => \instDL2M|iDL1|VGA_B[7]~2_combout\,
	datad => \instDL2M|iDL1|VGA_G[7]~4_combout\,
	combout => \instDL2M|iDL1|VGA_B[7]~3_combout\);

-- Location: LCCOMB_X83_Y48_N2
\inst|xcolumn~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|xcolumn~9_combout\ = (!\inst|LessThan0~3_combout\ & ((\inst|Add0~0_combout\) # (\inst|Add0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~0_combout\,
	datab => \inst|Add0~20_combout\,
	datad => \inst|LessThan0~3_combout\,
	combout => \inst|xcolumn~9_combout\);

-- Location: FF_X83_Y48_N3
\inst|xcolumn[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|xcolumn~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|xcolumn\(0));

-- Location: LCCOMB_X83_Y48_N10
\instDL2M|iDL1|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add2~2_combout\ = (\inst|xcolumn\(2) & (!\instDL2M|iDL1|Add2~1\)) # (!\inst|xcolumn\(2) & (\instDL2M|iDL1|Add2~1\ & VCC))
-- \instDL2M|iDL1|Add2~3\ = CARRY((\inst|xcolumn\(2) & !\instDL2M|iDL1|Add2~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(2),
	datad => VCC,
	cin => \instDL2M|iDL1|Add2~1\,
	combout => \instDL2M|iDL1|Add2~2_combout\,
	cout => \instDL2M|iDL1|Add2~3\);

-- Location: LCCOMB_X83_Y48_N16
\instDL2M|iDL1|Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add2~8_combout\ = (\inst|xcolumn\(5) & (\instDL2M|iDL1|Add2~7\ $ (GND))) # (!\inst|xcolumn\(5) & ((GND) # (!\instDL2M|iDL1|Add2~7\)))
-- \instDL2M|iDL1|Add2~9\ = CARRY((!\instDL2M|iDL1|Add2~7\) # (!\inst|xcolumn\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(5),
	datad => VCC,
	cin => \instDL2M|iDL1|Add2~7\,
	combout => \instDL2M|iDL1|Add2~8_combout\,
	cout => \instDL2M|iDL1|Add2~9\);

-- Location: LCCOMB_X83_Y48_N18
\instDL2M|iDL1|Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add2~10_combout\ = (\inst|xcolumn\(6) & (!\instDL2M|iDL1|Add2~9\)) # (!\inst|xcolumn\(6) & (\instDL2M|iDL1|Add2~9\ & VCC))
-- \instDL2M|iDL1|Add2~11\ = CARRY((\inst|xcolumn\(6) & !\instDL2M|iDL1|Add2~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(6),
	datad => VCC,
	cin => \instDL2M|iDL1|Add2~9\,
	combout => \instDL2M|iDL1|Add2~10_combout\,
	cout => \instDL2M|iDL1|Add2~11\);

-- Location: LCCOMB_X83_Y48_N22
\instDL2M|iDL1|Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add2~14_combout\ = (\inst|xcolumn\(8) & ((\instDL2M|iDL1|Add2~13\) # (GND))) # (!\inst|xcolumn\(8) & (!\instDL2M|iDL1|Add2~13\))
-- \instDL2M|iDL1|Add2~15\ = CARRY((\inst|xcolumn\(8)) # (!\instDL2M|iDL1|Add2~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(8),
	datad => VCC,
	cin => \instDL2M|iDL1|Add2~13\,
	combout => \instDL2M|iDL1|Add2~14_combout\,
	cout => \instDL2M|iDL1|Add2~15\);

-- Location: LCCOMB_X82_Y48_N14
\instDL2M|iDL1|LessThan14~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan14~1_cout\ = CARRY((\inst|yrow\(1) & !\inst|xcolumn\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(1),
	datab => \inst|xcolumn\(0),
	datad => VCC,
	cout => \instDL2M|iDL1|LessThan14~1_cout\);

-- Location: LCCOMB_X82_Y48_N16
\instDL2M|iDL1|LessThan14~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan14~3_cout\ = CARRY((\instDL2M|iDL1|Add2~0_combout\ & ((!\instDL2M|iDL1|LessThan14~1_cout\) # (!\inst|yrow\(2)))) # (!\instDL2M|iDL1|Add2~0_combout\ & (!\inst|yrow\(2) & !\instDL2M|iDL1|LessThan14~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add2~0_combout\,
	datab => \inst|yrow\(2),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan14~1_cout\,
	cout => \instDL2M|iDL1|LessThan14~3_cout\);

-- Location: LCCOMB_X82_Y48_N18
\instDL2M|iDL1|LessThan14~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan14~5_cout\ = CARRY((\inst|yrow\(3) & ((!\instDL2M|iDL1|LessThan14~3_cout\) # (!\instDL2M|iDL1|Add2~2_combout\))) # (!\inst|yrow\(3) & (!\instDL2M|iDL1|Add2~2_combout\ & !\instDL2M|iDL1|LessThan14~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(3),
	datab => \instDL2M|iDL1|Add2~2_combout\,
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan14~3_cout\,
	cout => \instDL2M|iDL1|LessThan14~5_cout\);

-- Location: LCCOMB_X82_Y48_N20
\instDL2M|iDL1|LessThan14~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan14~7_cout\ = CARRY((\instDL2M|iDL1|Add2~4_combout\ & ((!\instDL2M|iDL1|LessThan14~5_cout\) # (!\inst|yrow\(4)))) # (!\instDL2M|iDL1|Add2~4_combout\ & (!\inst|yrow\(4) & !\instDL2M|iDL1|LessThan14~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add2~4_combout\,
	datab => \inst|yrow\(4),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan14~5_cout\,
	cout => \instDL2M|iDL1|LessThan14~7_cout\);

-- Location: LCCOMB_X82_Y48_N22
\instDL2M|iDL1|LessThan14~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan14~9_cout\ = CARRY((\instDL2M|iDL1|Add2~6_combout\ & (\inst|yrow\(5) & !\instDL2M|iDL1|LessThan14~7_cout\)) # (!\instDL2M|iDL1|Add2~6_combout\ & ((\inst|yrow\(5)) # (!\instDL2M|iDL1|LessThan14~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add2~6_combout\,
	datab => \inst|yrow\(5),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan14~7_cout\,
	cout => \instDL2M|iDL1|LessThan14~9_cout\);

-- Location: LCCOMB_X82_Y48_N24
\instDL2M|iDL1|LessThan14~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan14~11_cout\ = CARRY((\inst|yrow\(6) & (\instDL2M|iDL1|Add2~8_combout\ & !\instDL2M|iDL1|LessThan14~9_cout\)) # (!\inst|yrow\(6) & ((\instDL2M|iDL1|Add2~8_combout\) # (!\instDL2M|iDL1|LessThan14~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(6),
	datab => \instDL2M|iDL1|Add2~8_combout\,
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan14~9_cout\,
	cout => \instDL2M|iDL1|LessThan14~11_cout\);

-- Location: LCCOMB_X82_Y48_N26
\instDL2M|iDL1|LessThan14~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan14~13_cout\ = CARRY((\inst|yrow\(7) & ((!\instDL2M|iDL1|LessThan14~11_cout\) # (!\instDL2M|iDL1|Add2~10_combout\))) # (!\inst|yrow\(7) & (!\instDL2M|iDL1|Add2~10_combout\ & !\instDL2M|iDL1|LessThan14~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(7),
	datab => \instDL2M|iDL1|Add2~10_combout\,
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan14~11_cout\,
	cout => \instDL2M|iDL1|LessThan14~13_cout\);

-- Location: LCCOMB_X82_Y48_N28
\instDL2M|iDL1|LessThan14~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan14~15_cout\ = CARRY((\instDL2M|iDL1|Add2~12_combout\ & ((!\instDL2M|iDL1|LessThan14~13_cout\) # (!\inst|yrow\(8)))) # (!\instDL2M|iDL1|Add2~12_combout\ & (!\inst|yrow\(8) & !\instDL2M|iDL1|LessThan14~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add2~12_combout\,
	datab => \inst|yrow\(8),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan14~13_cout\,
	cout => \instDL2M|iDL1|LessThan14~15_cout\);

-- Location: LCCOMB_X82_Y48_N30
\instDL2M|iDL1|LessThan14~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan14~16_combout\ = (\inst|yrow\(9) & ((!\instDL2M|iDL1|Add2~14_combout\) # (!\instDL2M|iDL1|LessThan14~15_cout\))) # (!\inst|yrow\(9) & (!\instDL2M|iDL1|LessThan14~15_cout\ & !\instDL2M|iDL1|Add2~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(9),
	datad => \instDL2M|iDL1|Add2~14_combout\,
	cin => \instDL2M|iDL1|LessThan14~15_cout\,
	combout => \instDL2M|iDL1|LessThan14~16_combout\);

-- Location: LCCOMB_X83_Y48_N24
\instDL2M|iDL1|Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add2~16_combout\ = (\inst|xcolumn\(9) & (!\instDL2M|iDL1|Add2~15\ & VCC)) # (!\inst|xcolumn\(9) & (\instDL2M|iDL1|Add2~15\ $ (GND)))
-- \instDL2M|iDL1|Add2~17\ = CARRY((!\inst|xcolumn\(9) & !\instDL2M|iDL1|Add2~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(9),
	datad => VCC,
	cin => \instDL2M|iDL1|Add2~15\,
	combout => \instDL2M|iDL1|Add2~16_combout\,
	cout => \instDL2M|iDL1|Add2~17\);

-- Location: LCCOMB_X83_Y48_N26
\instDL2M|iDL1|Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add2~18_combout\ = \instDL2M|iDL1|Add2~17\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \instDL2M|iDL1|Add2~17\,
	combout => \instDL2M|iDL1|Add2~18_combout\);

-- Location: LCCOMB_X83_Y49_N8
\instDL2M|iDL1|LSPflag~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~8_combout\ = (\instDL2M|iDL1|LSPflag~7_combout\ & (((\instDL2M|iDL1|LessThan14~16_combout\ & !\instDL2M|iDL1|Add2~16_combout\)) # (!\instDL2M|iDL1|Add2~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~7_combout\,
	datab => \instDL2M|iDL1|LessThan14~16_combout\,
	datac => \instDL2M|iDL1|Add2~16_combout\,
	datad => \instDL2M|iDL1|Add2~18_combout\,
	combout => \instDL2M|iDL1|LSPflag~8_combout\);

-- Location: LCCOMB_X84_Y49_N18
\instDL2M|iDL1|VGA_B[7]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_B[7]~4_combout\ = (\instDL2M|iDL1|VGA_B[7]~3_combout\) # ((\instDL2M|iDL1|VGA_G[7]~4_combout\ & ((\instDL2M|iDL1|LSPflag~8_combout\) # (!\instDL2M|iDL1|LSPflag~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~12_combout\,
	datab => \instDL2M|iDL1|VGA_G[7]~4_combout\,
	datac => \instDL2M|iDL1|VGA_B[7]~3_combout\,
	datad => \instDL2M|iDL1|LSPflag~8_combout\,
	combout => \instDL2M|iDL1|VGA_B[7]~4_combout\);

-- Location: FF_X84_Y49_N19
\instDL2M|iPipeLine|VGA_B1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iDL1|VGA_B[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|VGA_B1\(7));

-- Location: LCCOMB_X111_Y41_N24
\instLRD|LCD_B~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_B~0_combout\ = (\instDL2M|iPipeLine|VGA_B1\(7) & \instDL2M|iPipeLine|LCD_DEN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \instDL2M|iPipeLine|VGA_B1\(7),
	datad => \instDL2M|iPipeLine|LCD_DEN~q\,
	combout => \instLRD|LCD_B~0_combout\);

-- Location: FF_X111_Y41_N25
\instLRD|LCD_B[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_B~0_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_B\(5));

-- Location: LCCOMB_X80_Y49_N2
\instLRD|LCD_B~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_B~1_combout\ = (\instDL2M|iPipeLine|VGA_B1\(6) & \instDL2M|iPipeLine|LCD_DEN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iPipeLine|VGA_B1\(6),
	datad => \instDL2M|iPipeLine|LCD_DEN~q\,
	combout => \instLRD|LCD_B~1_combout\);

-- Location: FF_X80_Y49_N3
\instLRD|LCD_B[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_B~1_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_B\(4));

-- Location: LCCOMB_X84_Y49_N28
\instDL2M|iDL1|VGA_B[5]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_B[5]~6_combout\ = (!\instDL2M|iDL1|LSPflag~6_combout\ & ((\instDL2M|iDL1|LSPflag~4_combout\ & (\instDL2M|iDL1|RGB~2_combout\)) # (!\instDL2M|iDL1|LSPflag~4_combout\ & ((!\instDL2M|iDL1|LessThan20~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|RGB~2_combout\,
	datab => \instDL2M|iDL1|LessThan20~2_combout\,
	datac => \instDL2M|iDL1|LSPflag~4_combout\,
	datad => \instDL2M|iDL1|LSPflag~6_combout\,
	combout => \instDL2M|iDL1|VGA_B[5]~6_combout\);

-- Location: LCCOMB_X84_Y49_N22
\instDL2M|iDL1|VGA_B[5]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_B[5]~12_combout\ = (\instDL2M|iDL1|VGA_B[5]~6_combout\) # ((\instDL2M|iDL1|LSPflag~17_combout\ & (!\instDL2M|iDL1|LSPflag~4_combout\ & !\instDL2M|iDL1|LSPflag~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~17_combout\,
	datab => \instDL2M|iDL1|VGA_B[5]~6_combout\,
	datac => \instDL2M|iDL1|LSPflag~4_combout\,
	datad => \instDL2M|iDL1|LSPflag~6_combout\,
	combout => \instDL2M|iDL1|VGA_B[5]~12_combout\);

-- Location: LCCOMB_X84_Y49_N12
\instDL2M|iDL1|VGA_B[5]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_B[5]~7_combout\ = (\instDL2M|iDL1|VGA_B[5]~12_combout\) # ((\instDL2M|iDL1|VGA_G[7]~4_combout\ & ((\instDL2M|iDL1|LSPflag~8_combout\) # (!\instDL2M|iDL1|LSPflag~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~12_combout\,
	datab => \instDL2M|iDL1|VGA_G[7]~4_combout\,
	datac => \instDL2M|iDL1|VGA_B[5]~12_combout\,
	datad => \instDL2M|iDL1|LSPflag~8_combout\,
	combout => \instDL2M|iDL1|VGA_B[5]~7_combout\);

-- Location: FF_X84_Y49_N13
\instDL2M|iPipeLine|VGA_B1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iDL1|VGA_B[5]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|VGA_B1\(5));

-- Location: LCCOMB_X111_Y41_N2
\instLRD|LCD_B~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_B~2_combout\ = (\instDL2M|iPipeLine|LCD_DEN~q\ & \instDL2M|iPipeLine|VGA_B1\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instDL2M|iPipeLine|LCD_DEN~q\,
	datad => \instDL2M|iPipeLine|VGA_B1\(5),
	combout => \instLRD|LCD_B~2_combout\);

-- Location: FF_X111_Y41_N3
\instLRD|LCD_B[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_B~2_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_B\(3));

-- Location: LCCOMB_X84_Y49_N14
\instDL2M|iDL1|VGA_B[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_B[4]~8_combout\ = (\instDL2M|iDL1|VGA_B[7]~2_combout\) # ((\instDL2M|iDL1|VGA_G[7]~4_combout\ & ((\instDL2M|iDL1|LSPflag~8_combout\) # (!\instDL2M|iDL1|LSPflag~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~12_combout\,
	datab => \instDL2M|iDL1|VGA_G[7]~4_combout\,
	datac => \instDL2M|iDL1|VGA_B[7]~2_combout\,
	datad => \instDL2M|iDL1|LSPflag~8_combout\,
	combout => \instDL2M|iDL1|VGA_B[4]~8_combout\);

-- Location: FF_X84_Y49_N15
\instDL2M|iPipeLine|VGA_B1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iDL1|VGA_B[4]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|VGA_B1\(4));

-- Location: LCCOMB_X111_Y41_N4
\instLRD|LCD_B~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_B~3_combout\ = (\instDL2M|iPipeLine|LCD_DEN~q\ & \instDL2M|iPipeLine|VGA_B1\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instDL2M|iPipeLine|LCD_DEN~q\,
	datad => \instDL2M|iPipeLine|VGA_B1\(4),
	combout => \instLRD|LCD_B~3_combout\);

-- Location: FF_X111_Y41_N5
\instLRD|LCD_B[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_B~3_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_B\(2));

-- Location: LCCOMB_X83_Y50_N8
\instDL2M|iDL1|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add1~2_combout\ = (\inst|xcolumn\(2) & (!\instDL2M|iDL1|Add1~1\)) # (!\inst|xcolumn\(2) & ((\instDL2M|iDL1|Add1~1\) # (GND)))
-- \instDL2M|iDL1|Add1~3\ = CARRY((!\instDL2M|iDL1|Add1~1\) # (!\inst|xcolumn\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(2),
	datad => VCC,
	cin => \instDL2M|iDL1|Add1~1\,
	combout => \instDL2M|iDL1|Add1~2_combout\,
	cout => \instDL2M|iDL1|Add1~3\);

-- Location: LCCOMB_X83_Y50_N10
\instDL2M|iDL1|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add1~4_combout\ = (\inst|xcolumn\(3) & ((GND) # (!\instDL2M|iDL1|Add1~3\))) # (!\inst|xcolumn\(3) & (\instDL2M|iDL1|Add1~3\ $ (GND)))
-- \instDL2M|iDL1|Add1~5\ = CARRY((\inst|xcolumn\(3)) # (!\instDL2M|iDL1|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(3),
	datad => VCC,
	cin => \instDL2M|iDL1|Add1~3\,
	combout => \instDL2M|iDL1|Add1~4_combout\,
	cout => \instDL2M|iDL1|Add1~5\);

-- Location: LCCOMB_X83_Y50_N12
\instDL2M|iDL1|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add1~6_combout\ = (\inst|xcolumn\(4) & (\instDL2M|iDL1|Add1~5\ & VCC)) # (!\inst|xcolumn\(4) & (!\instDL2M|iDL1|Add1~5\))
-- \instDL2M|iDL1|Add1~7\ = CARRY((!\inst|xcolumn\(4) & !\instDL2M|iDL1|Add1~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(4),
	datad => VCC,
	cin => \instDL2M|iDL1|Add1~5\,
	combout => \instDL2M|iDL1|Add1~6_combout\,
	cout => \instDL2M|iDL1|Add1~7\);

-- Location: LCCOMB_X83_Y50_N16
\instDL2M|iDL1|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add1~10_combout\ = (\inst|xcolumn\(6) & (!\instDL2M|iDL1|Add1~9\)) # (!\inst|xcolumn\(6) & ((\instDL2M|iDL1|Add1~9\) # (GND)))
-- \instDL2M|iDL1|Add1~11\ = CARRY((!\instDL2M|iDL1|Add1~9\) # (!\inst|xcolumn\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(6),
	datad => VCC,
	cin => \instDL2M|iDL1|Add1~9\,
	combout => \instDL2M|iDL1|Add1~10_combout\,
	cout => \instDL2M|iDL1|Add1~11\);

-- Location: LCCOMB_X82_Y50_N0
\instDL2M|iDL1|LessThan12~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan12~1_cout\ = CARRY(\inst|yrow\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(2),
	datad => VCC,
	cout => \instDL2M|iDL1|LessThan12~1_cout\);

-- Location: LCCOMB_X82_Y50_N2
\instDL2M|iDL1|LessThan12~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan12~3_cout\ = CARRY((\inst|yrow\(3) & (!\inst|xcolumn\(0) & !\instDL2M|iDL1|LessThan12~1_cout\)) # (!\inst|yrow\(3) & ((!\instDL2M|iDL1|LessThan12~1_cout\) # (!\inst|xcolumn\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(3),
	datab => \inst|xcolumn\(0),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan12~1_cout\,
	cout => \instDL2M|iDL1|LessThan12~3_cout\);

-- Location: LCCOMB_X82_Y50_N4
\instDL2M|iDL1|LessThan12~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan12~5_cout\ = CARRY((\instDL2M|iDL1|Add1~0_combout\ & (\inst|yrow\(4) & !\instDL2M|iDL1|LessThan12~3_cout\)) # (!\instDL2M|iDL1|Add1~0_combout\ & ((\inst|yrow\(4)) # (!\instDL2M|iDL1|LessThan12~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add1~0_combout\,
	datab => \inst|yrow\(4),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan12~3_cout\,
	cout => \instDL2M|iDL1|LessThan12~5_cout\);

-- Location: LCCOMB_X82_Y50_N6
\instDL2M|iDL1|LessThan12~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan12~7_cout\ = CARRY((\inst|yrow\(5) & (\instDL2M|iDL1|Add1~2_combout\ & !\instDL2M|iDL1|LessThan12~5_cout\)) # (!\inst|yrow\(5) & ((\instDL2M|iDL1|Add1~2_combout\) # (!\instDL2M|iDL1|LessThan12~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(5),
	datab => \instDL2M|iDL1|Add1~2_combout\,
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan12~5_cout\,
	cout => \instDL2M|iDL1|LessThan12~7_cout\);

-- Location: LCCOMB_X82_Y50_N8
\instDL2M|iDL1|LessThan12~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan12~9_cout\ = CARRY((\inst|yrow\(6) & ((!\instDL2M|iDL1|LessThan12~7_cout\) # (!\instDL2M|iDL1|Add1~4_combout\))) # (!\inst|yrow\(6) & (!\instDL2M|iDL1|Add1~4_combout\ & !\instDL2M|iDL1|LessThan12~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(6),
	datab => \instDL2M|iDL1|Add1~4_combout\,
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan12~7_cout\,
	cout => \instDL2M|iDL1|LessThan12~9_cout\);

-- Location: LCCOMB_X82_Y50_N10
\instDL2M|iDL1|LessThan12~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan12~11_cout\ = CARRY((\inst|yrow\(7) & (\instDL2M|iDL1|Add1~6_combout\ & !\instDL2M|iDL1|LessThan12~9_cout\)) # (!\inst|yrow\(7) & ((\instDL2M|iDL1|Add1~6_combout\) # (!\instDL2M|iDL1|LessThan12~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(7),
	datab => \instDL2M|iDL1|Add1~6_combout\,
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan12~9_cout\,
	cout => \instDL2M|iDL1|LessThan12~11_cout\);

-- Location: LCCOMB_X82_Y50_N12
\instDL2M|iDL1|LessThan12~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan12~13_cout\ = CARRY((\instDL2M|iDL1|Add1~8_combout\ & (\inst|yrow\(8) & !\instDL2M|iDL1|LessThan12~11_cout\)) # (!\instDL2M|iDL1|Add1~8_combout\ & ((\inst|yrow\(8)) # (!\instDL2M|iDL1|LessThan12~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add1~8_combout\,
	datab => \inst|yrow\(8),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan12~11_cout\,
	cout => \instDL2M|iDL1|LessThan12~13_cout\);

-- Location: LCCOMB_X82_Y50_N14
\instDL2M|iDL1|LessThan12~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan12~14_combout\ = (\inst|yrow\(9) & ((\instDL2M|iDL1|LessThan12~13_cout\) # (!\instDL2M|iDL1|Add1~10_combout\))) # (!\inst|yrow\(9) & (\instDL2M|iDL1|LessThan12~13_cout\ & !\instDL2M|iDL1|Add1~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(9),
	datad => \instDL2M|iDL1|Add1~10_combout\,
	cin => \instDL2M|iDL1|LessThan12~13_cout\,
	combout => \instDL2M|iDL1|LessThan12~14_combout\);

-- Location: LCCOMB_X83_Y50_N18
\instDL2M|iDL1|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add1~12_combout\ = (\inst|xcolumn\(7) & ((GND) # (!\instDL2M|iDL1|Add1~11\))) # (!\inst|xcolumn\(7) & (\instDL2M|iDL1|Add1~11\ $ (GND)))
-- \instDL2M|iDL1|Add1~13\ = CARRY((\inst|xcolumn\(7)) # (!\instDL2M|iDL1|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(7),
	datad => VCC,
	cin => \instDL2M|iDL1|Add1~11\,
	combout => \instDL2M|iDL1|Add1~12_combout\,
	cout => \instDL2M|iDL1|Add1~13\);

-- Location: LCCOMB_X83_Y50_N20
\instDL2M|iDL1|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add1~14_combout\ = (\inst|xcolumn\(8) & (\instDL2M|iDL1|Add1~13\ & VCC)) # (!\inst|xcolumn\(8) & (!\instDL2M|iDL1|Add1~13\))
-- \instDL2M|iDL1|Add1~15\ = CARRY((!\inst|xcolumn\(8) & !\instDL2M|iDL1|Add1~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(8),
	datad => VCC,
	cin => \instDL2M|iDL1|Add1~13\,
	combout => \instDL2M|iDL1|Add1~14_combout\,
	cout => \instDL2M|iDL1|Add1~15\);

-- Location: LCCOMB_X83_Y50_N22
\instDL2M|iDL1|Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add1~16_combout\ = (\inst|xcolumn\(9) & ((GND) # (!\instDL2M|iDL1|Add1~15\))) # (!\inst|xcolumn\(9) & (\instDL2M|iDL1|Add1~15\ $ (GND)))
-- \instDL2M|iDL1|Add1~17\ = CARRY((\inst|xcolumn\(9)) # (!\instDL2M|iDL1|Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(9),
	datad => VCC,
	cin => \instDL2M|iDL1|Add1~15\,
	combout => \instDL2M|iDL1|Add1~16_combout\,
	cout => \instDL2M|iDL1|Add1~17\);

-- Location: LCCOMB_X83_Y50_N24
\instDL2M|iDL1|Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add1~18_combout\ = \instDL2M|iDL1|Add1~17\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \instDL2M|iDL1|Add1~17\,
	combout => \instDL2M|iDL1|Add1~18_combout\);

-- Location: LCCOMB_X83_Y50_N0
\instDL2M|iDL1|LSPflag~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~11_combout\ = (\instDL2M|iDL1|Add1~14_combout\) # ((\instDL2M|iDL1|Add1~16_combout\) # (\instDL2M|iDL1|Add1~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instDL2M|iDL1|Add1~14_combout\,
	datac => \instDL2M|iDL1|Add1~16_combout\,
	datad => \instDL2M|iDL1|Add1~12_combout\,
	combout => \instDL2M|iDL1|LSPflag~11_combout\);

-- Location: LCCOMB_X83_Y49_N2
\instDL2M|iDL1|LSPflag~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~12_combout\ = (\instDL2M|iDL1|LSPflag~10_combout\) # ((\instDL2M|iDL1|Add1~18_combout\ & ((\instDL2M|iDL1|LSPflag~11_combout\) # (!\instDL2M|iDL1|LessThan12~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~10_combout\,
	datab => \instDL2M|iDL1|LessThan12~14_combout\,
	datac => \instDL2M|iDL1|Add1~18_combout\,
	datad => \instDL2M|iDL1|LSPflag~11_combout\,
	combout => \instDL2M|iDL1|LSPflag~12_combout\);

-- Location: LCCOMB_X83_Y49_N16
\instDL2M|iDL1|VGA_B[3]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_B[3]~9_combout\ = (\instDL2M|iDL1|LSPflag~12_combout\ & (\instDL2M|iDL1|VGA_G[7]~4_combout\ & ((\instDL2M|iDL1|VGA_R[3]~13_combout\) # (\instDL2M|iDL1|LSPflag~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|VGA_R[3]~13_combout\,
	datab => \instDL2M|iDL1|LSPflag~12_combout\,
	datac => \instDL2M|iDL1|LSPflag~8_combout\,
	datad => \instDL2M|iDL1|VGA_G[7]~4_combout\,
	combout => \instDL2M|iDL1|VGA_B[3]~9_combout\);

-- Location: FF_X83_Y49_N17
\instDL2M|iPipeLine|VGA_B1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iDL1|VGA_B[3]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|VGA_B1\(3));

-- Location: LCCOMB_X111_Y41_N6
\instLRD|LCD_B~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_B~4_combout\ = (\instDL2M|iPipeLine|LCD_DEN~q\ & \instDL2M|iPipeLine|VGA_B1\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instDL2M|iPipeLine|LCD_DEN~q\,
	datac => \instDL2M|iPipeLine|VGA_B1\(3),
	combout => \instLRD|LCD_B~4_combout\);

-- Location: FF_X111_Y41_N7
\instLRD|LCD_B[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_B~4_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_B\(1));

-- Location: LCCOMB_X83_Y49_N4
\instDL2M|iDL1|VGA_R[7]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_R[7]~2_combout\ = (!\instDL2M|iDL1|LSPflag~6_combout\ & (\instDL2M|iDL1|LSPflag~12_combout\ & !\instDL2M|iDL1|LSPflag~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~6_combout\,
	datab => \instDL2M|iDL1|LSPflag~12_combout\,
	datac => \instDL2M|iDL1|LSPflag~4_combout\,
	combout => \instDL2M|iDL1|VGA_R[7]~2_combout\);

-- Location: LCCOMB_X84_Y49_N6
\instDL2M|iDL1|VGA_B[2]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_B[2]~10_combout\ = (\instDL2M|iDL1|RGB~2_combout\ & (\instDL2M|iDL1|LSPflag~3_combout\ & (\instDL2M|iDL1|LSPflag~4_combout\ & !\instDL2M|iDL1|LSPflag~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|RGB~2_combout\,
	datab => \instDL2M|iDL1|LSPflag~3_combout\,
	datac => \instDL2M|iDL1|LSPflag~4_combout\,
	datad => \instDL2M|iDL1|LSPflag~6_combout\,
	combout => \instDL2M|iDL1|VGA_B[2]~10_combout\);

-- Location: LCCOMB_X83_Y49_N26
\instDL2M|iDL1|VGA_B[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_B[2]~11_combout\ = (\instDL2M|iDL1|VGA_B[2]~10_combout\) # ((\instDL2M|iDL1|VGA_R[7]~2_combout\ & ((\instDL2M|iDL1|LSPflag~17_combout\) # (\instDL2M|iDL1|LSPflag~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~17_combout\,
	datab => \instDL2M|iDL1|VGA_R[7]~2_combout\,
	datac => \instDL2M|iDL1|LSPflag~8_combout\,
	datad => \instDL2M|iDL1|VGA_B[2]~10_combout\,
	combout => \instDL2M|iDL1|VGA_B[2]~11_combout\);

-- Location: FF_X83_Y49_N27
\instDL2M|iPipeLine|VGA_B1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iDL1|VGA_B[2]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|VGA_B1\(2));

-- Location: LCCOMB_X111_Y41_N0
\instLRD|LCD_B~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_B~5_combout\ = (\instDL2M|iPipeLine|VGA_B1\(2) & \instDL2M|iPipeLine|LCD_DEN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \instDL2M|iPipeLine|VGA_B1\(2),
	datad => \instDL2M|iPipeLine|LCD_DEN~q\,
	combout => \instLRD|LCD_B~5_combout\);

-- Location: FF_X111_Y41_N1
\instLRD|LCD_B[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_B~5_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_B\(0));

-- Location: LCCOMB_X84_Y49_N16
\instDL2M|iDL1|VGA_G[7]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_G[7]~5_combout\ = (\instDL2M|iDL1|LSPflag~4_combout\ & (!\instDL2M|iDL1|LSPflag~6_combout\ & ((\instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(1)) # 
-- (!\instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(1),
	datab => \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(0),
	datac => \instDL2M|iDL1|LSPflag~4_combout\,
	datad => \instDL2M|iDL1|LSPflag~6_combout\,
	combout => \instDL2M|iDL1|VGA_G[7]~5_combout\);

-- Location: LCCOMB_X83_Y49_N24
\instDL2M|iDL1|VGA_R[5]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_R[5]~4_combout\ = (!\instDL2M|iDL1|VGA_G[7]~5_combout\ & (((\instDL2M|iDL1|LSPflag~12_combout\ & !\instDL2M|iDL1|LSPflag~4_combout\)) # (!\instDL2M|iDL1|VGA_R[5]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|VGA_R[5]~3_combout\,
	datab => \instDL2M|iDL1|LSPflag~12_combout\,
	datac => \instDL2M|iDL1|LSPflag~4_combout\,
	datad => \instDL2M|iDL1|VGA_G[7]~5_combout\,
	combout => \instDL2M|iDL1|VGA_R[5]~4_combout\);

-- Location: LCCOMB_X83_Y49_N28
\instDL2M|iDL1|VGA_G[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_G[7]~7_combout\ = ((!\instDL2M|iDL1|LSPflag~6_combout\ & (!\instDL2M|iDL1|LSPflag~4_combout\ & \instDL2M|iDL1|LSPflag~8_combout\))) # (!\instDL2M|iDL1|VGA_R[5]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~6_combout\,
	datab => \instDL2M|iDL1|LSPflag~4_combout\,
	datac => \instDL2M|iDL1|LSPflag~8_combout\,
	datad => \instDL2M|iDL1|VGA_R[5]~4_combout\,
	combout => \instDL2M|iDL1|VGA_G[7]~7_combout\);

-- Location: FF_X83_Y49_N29
\instDL2M|iPipeLine|VGA_G1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iDL1|VGA_G[7]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|VGA_G1\(7));

-- Location: LCCOMB_X111_Y41_N22
\instLRD|LCD_G~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_G~0_combout\ = (\instDL2M|iPipeLine|LCD_DEN~q\ & \instDL2M|iPipeLine|VGA_G1\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instDL2M|iPipeLine|LCD_DEN~q\,
	datad => \instDL2M|iPipeLine|VGA_G1\(7),
	combout => \instLRD|LCD_G~0_combout\);

-- Location: FF_X111_Y41_N19
\instLRD|LCD_G[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \instLRD|LCD_G~0_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_G\(5));

-- Location: LCCOMB_X111_Y41_N30
\instDL2M|iDL1|LSPflag~6_wirecell\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~6_wirecell_combout\ = !\instDL2M|iDL1|LSPflag~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \instDL2M|iDL1|LSPflag~6_combout\,
	combout => \instDL2M|iDL1|LSPflag~6_wirecell_combout\);

-- Location: FF_X111_Y41_N31
\instDL2M|iPipeLine|VGA_G1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iDL1|LSPflag~6_wirecell_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|VGA_G1\(2));

-- Location: LCCOMB_X111_Y41_N28
\instLRD|LCD_G~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_G~1_combout\ = (\instDL2M|iPipeLine|LCD_DEN~q\ & \instDL2M|iPipeLine|VGA_G1\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instDL2M|iPipeLine|LCD_DEN~q\,
	datac => \instDL2M|iPipeLine|VGA_G1\(2),
	combout => \instLRD|LCD_G~1_combout\);

-- Location: FF_X111_Y41_N29
\instLRD|LCD_G[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_G~1_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_G\(4));

-- Location: LCCOMB_X111_Y41_N14
\instLRD|LCD_G~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_G~2_combout\ = (\instDL2M|iPipeLine|VGA_G1\(4) & \instDL2M|iPipeLine|LCD_DEN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iPipeLine|VGA_G1\(4),
	datad => \instDL2M|iPipeLine|LCD_DEN~q\,
	combout => \instLRD|LCD_G~2_combout\);

-- Location: FF_X111_Y41_N15
\instLRD|LCD_G[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_G~2_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_G\(3));

-- Location: FF_X111_Y41_N17
\instLRD|LCD_G[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \instLRD|LCD_G~2_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_G\(2));

-- Location: LCCOMB_X81_Y50_N24
\instDL2M|iDL1|LessThan16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan16~0_combout\ = (\instDL2M|iDL1|LessThan20~0_combout\) # ((!\inst|yrow\(5) & \instDL2M|iDL1|LSPflag:romID[1]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(5),
	datac => \instDL2M|iDL1|LSPflag:romID[1]~0_combout\,
	datad => \instDL2M|iDL1|LessThan20~0_combout\,
	combout => \instDL2M|iDL1|LessThan16~0_combout\);

-- Location: LCCOMB_X81_Y50_N10
\instDL2M|iDL1|LessThan16~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan16~1_combout\ = (\instDL2M|iDL1|LessThan16~0_combout\) # ((!\inst|yrow\(4) & (\instDL2M|iDL1|LSPflag:romID[1]~0_combout\ & \inst|LessThan1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(4),
	datab => \instDL2M|iDL1|LessThan16~0_combout\,
	datac => \instDL2M|iDL1|LSPflag:romID[1]~0_combout\,
	datad => \inst|LessThan1~0_combout\,
	combout => \instDL2M|iDL1|LessThan16~1_combout\);

-- Location: LCCOMB_X80_Y48_N12
\inst|xcolumn~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|xcolumn~8_combout\ = (!\inst|LessThan0~3_combout\ & ((\inst|Add0~2_combout\) # (\inst|Add0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~2_combout\,
	datab => \inst|Add0~20_combout\,
	datad => \inst|LessThan0~3_combout\,
	combout => \inst|xcolumn~8_combout\);

-- Location: FF_X80_Y48_N13
\inst|xcolumn[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|xcolumn~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|xcolumn\(1));

-- Location: LCCOMB_X83_Y48_N28
\instDL2M|iDL1|LSPflag~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~14_combout\ = (\inst|xcolumn\(3) & ((\inst|xcolumn\(0)) # (\inst|xcolumn\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(0),
	datac => \inst|xcolumn\(2),
	datad => \inst|xcolumn\(3),
	combout => \instDL2M|iDL1|LSPflag~14_combout\);

-- Location: LCCOMB_X83_Y48_N6
\instDL2M|iDL1|LSPflag~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~15_combout\ = (\instDL2M|iDL1|LSPflag~14_combout\ & ((\inst|xcolumn\(2)) # ((\inst|xcolumn\(7) & \inst|xcolumn\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(7),
	datab => \inst|xcolumn\(1),
	datac => \inst|xcolumn\(2),
	datad => \instDL2M|iDL1|LSPflag~14_combout\,
	combout => \instDL2M|iDL1|LSPflag~15_combout\);

-- Location: LCCOMB_X83_Y48_N4
\instDL2M|iDL1|LSPflag~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~16_combout\ = (\inst|xcolumn\(6)) # ((\inst|xcolumn\(5) & ((\inst|xcolumn\(4)) # (\instDL2M|iDL1|LSPflag~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(4),
	datab => \inst|xcolumn\(6),
	datac => \inst|xcolumn\(5),
	datad => \instDL2M|iDL1|LSPflag~15_combout\,
	combout => \instDL2M|iDL1|LSPflag~16_combout\);

-- Location: LCCOMB_X82_Y49_N28
\instDL2M|iDL1|LSPflag~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LSPflag~17_combout\ = (\instDL2M|iDL1|LSPflag~13_combout\ & (!\instDL2M|iDL1|LessThan16~1_combout\ & (\inst|xcolumn\(7) $ (\instDL2M|iDL1|LSPflag~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~13_combout\,
	datab => \instDL2M|iDL1|LessThan16~1_combout\,
	datac => \inst|xcolumn\(7),
	datad => \instDL2M|iDL1|LSPflag~16_combout\,
	combout => \instDL2M|iDL1|LSPflag~17_combout\);

-- Location: LCCOMB_X84_Y49_N0
\instDL2M|iPipeLine|VGA_G1[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iPipeLine|VGA_G1[3]~0_combout\ = (\instDL2M|iDL1|LSPflag~12_combout\ & ((\instDL2M|iDL1|LSPflag~8_combout\) # ((\instDL2M|iDL1|LessThan20~2_combout\) # (\instDL2M|iDL1|LSPflag~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~8_combout\,
	datab => \instDL2M|iDL1|LessThan20~2_combout\,
	datac => \instDL2M|iDL1|LSPflag~17_combout\,
	datad => \instDL2M|iDL1|LSPflag~12_combout\,
	combout => \instDL2M|iPipeLine|VGA_G1[3]~0_combout\);

-- Location: LCCOMB_X80_Y49_N24
\instDL2M|iPipeLine|VGA_G1[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iPipeLine|VGA_G1[3]~feeder_combout\ = \instDL2M|iPipeLine|VGA_G1[3]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \instDL2M|iPipeLine|VGA_G1[3]~0_combout\,
	combout => \instDL2M|iPipeLine|VGA_G1[3]~feeder_combout\);

-- Location: LCCOMB_X80_Y49_N30
\instDL2M|iDL1|RGB~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|RGB~3_combout\ = (!\instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(1) & (\instDL2M|iDL1|LSPflag~3_combout\ & \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(1),
	datab => \instDL2M|iDL1|LSPflag~3_combout\,
	datac => \instDL2M|iDL1|rom_inst|altsyncram_component|auto_generated|q_a\(0),
	combout => \instDL2M|iDL1|RGB~3_combout\);

-- Location: FF_X80_Y49_N25
\instDL2M|iPipeLine|VGA_G1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iPipeLine|VGA_G1[3]~feeder_combout\,
	asdata => \instDL2M|iDL1|RGB~3_combout\,
	sclr => \instDL2M|iDL1|LSPflag~6_combout\,
	sload => \instDL2M|iDL1|LSPflag~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|VGA_G1\(3));

-- Location: LCCOMB_X80_Y49_N28
\instLRD|LCD_G~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_G~3_combout\ = (\instDL2M|iPipeLine|VGA_G1\(3) & \instDL2M|iPipeLine|LCD_DEN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instDL2M|iPipeLine|VGA_G1\(3),
	datad => \instDL2M|iPipeLine|LCD_DEN~q\,
	combout => \instLRD|LCD_G~3_combout\);

-- Location: FF_X80_Y49_N29
\instLRD|LCD_G[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_G~3_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_G\(1));

-- Location: LCCOMB_X111_Y41_N10
\instLRD|LCD_G[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_G[0]~feeder_combout\ = \instLRD|LCD_G~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \instLRD|LCD_G~1_combout\,
	combout => \instLRD|LCD_G[0]~feeder_combout\);

-- Location: FF_X111_Y41_N11
\instLRD|LCD_G[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_G[0]~feeder_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_G\(0));

-- Location: LCCOMB_X84_Y49_N26
\instDL2M|iDL1|VGA_G[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_G[4]~6_combout\ = (\instDL2M|iDL1|LSPflag~4_combout\ & (!\instDL2M|iDL1|LSPflag~6_combout\ & ((\instDL2M|iDL1|LSPflag~3_combout\) # (!\instDL2M|iDL1|RGB~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|RGB~2_combout\,
	datab => \instDL2M|iDL1|LSPflag~3_combout\,
	datac => \instDL2M|iDL1|LSPflag~4_combout\,
	datad => \instDL2M|iDL1|LSPflag~6_combout\,
	combout => \instDL2M|iDL1|VGA_G[4]~6_combout\);

-- Location: LCCOMB_X83_Y49_N6
\instDL2M|iDL1|VGA_R[7]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_R[7]~5_combout\ = (\instDL2M|iDL1|VGA_G[4]~6_combout\) # ((\instDL2M|iDL1|VGA_R[7]~2_combout\ & ((\instDL2M|iDL1|LSPflag~17_combout\) # (\instDL2M|iDL1|LSPflag~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|LSPflag~17_combout\,
	datab => \instDL2M|iDL1|VGA_R[7]~2_combout\,
	datac => \instDL2M|iDL1|LSPflag~8_combout\,
	datad => \instDL2M|iDL1|VGA_G[4]~6_combout\,
	combout => \instDL2M|iDL1|VGA_R[7]~5_combout\);

-- Location: FF_X83_Y49_N7
\instDL2M|iPipeLine|VGA_R1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iDL1|VGA_R[7]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|VGA_R1\(7));

-- Location: LCCOMB_X111_Y41_N12
\instLRD|LCD_R~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_R~0_combout\ = (\instDL2M|iPipeLine|LCD_DEN~q\ & \instDL2M|iPipeLine|VGA_R1\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instDL2M|iPipeLine|LCD_DEN~q\,
	datad => \instDL2M|iPipeLine|VGA_R1\(7),
	combout => \instLRD|LCD_R~0_combout\);

-- Location: FF_X111_Y41_N13
\instLRD|LCD_R[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_R~0_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_R\(5));

-- Location: FF_X111_Y41_N23
\instLRD|LCD_R[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_G~0_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_R\(4));

-- Location: LCCOMB_X82_Y49_N2
\instDL2M|iDL1|Add3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add3~1_cout\ = CARRY(\inst|xcolumn\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(1),
	datad => VCC,
	cout => \instDL2M|iDL1|Add3~1_cout\);

-- Location: LCCOMB_X82_Y49_N10
\instDL2M|iDL1|Add3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add3~8_combout\ = (\inst|xcolumn\(5) & ((GND) # (!\instDL2M|iDL1|Add3~7\))) # (!\inst|xcolumn\(5) & (\instDL2M|iDL1|Add3~7\ $ (GND)))
-- \instDL2M|iDL1|Add3~9\ = CARRY((\inst|xcolumn\(5)) # (!\instDL2M|iDL1|Add3~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(5),
	datad => VCC,
	cin => \instDL2M|iDL1|Add3~7\,
	combout => \instDL2M|iDL1|Add3~8_combout\,
	cout => \instDL2M|iDL1|Add3~9\);

-- Location: LCCOMB_X82_Y49_N12
\instDL2M|iDL1|Add3~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add3~10_combout\ = (\inst|xcolumn\(6) & (!\instDL2M|iDL1|Add3~9\)) # (!\inst|xcolumn\(6) & ((\instDL2M|iDL1|Add3~9\) # (GND)))
-- \instDL2M|iDL1|Add3~11\ = CARRY((!\instDL2M|iDL1|Add3~9\) # (!\inst|xcolumn\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|xcolumn\(6),
	datad => VCC,
	cin => \instDL2M|iDL1|Add3~9\,
	combout => \instDL2M|iDL1|Add3~10_combout\,
	cout => \instDL2M|iDL1|Add3~11\);

-- Location: LCCOMB_X82_Y49_N14
\instDL2M|iDL1|Add3~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add3~12_combout\ = (\inst|xcolumn\(7) & ((GND) # (!\instDL2M|iDL1|Add3~11\))) # (!\inst|xcolumn\(7) & (\instDL2M|iDL1|Add3~11\ $ (GND)))
-- \instDL2M|iDL1|Add3~13\ = CARRY((\inst|xcolumn\(7)) # (!\instDL2M|iDL1|Add3~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(7),
	datad => VCC,
	cin => \instDL2M|iDL1|Add3~11\,
	combout => \instDL2M|iDL1|Add3~12_combout\,
	cout => \instDL2M|iDL1|Add3~13\);

-- Location: LCCOMB_X82_Y49_N16
\instDL2M|iDL1|Add3~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add3~14_combout\ = (\inst|xcolumn\(8) & (\instDL2M|iDL1|Add3~13\ & VCC)) # (!\inst|xcolumn\(8) & (!\instDL2M|iDL1|Add3~13\))
-- \instDL2M|iDL1|Add3~15\ = CARRY((!\inst|xcolumn\(8) & !\instDL2M|iDL1|Add3~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(8),
	datad => VCC,
	cin => \instDL2M|iDL1|Add3~13\,
	combout => \instDL2M|iDL1|Add3~14_combout\,
	cout => \instDL2M|iDL1|Add3~15\);

-- Location: LCCOMB_X82_Y49_N18
\instDL2M|iDL1|Add3~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add3~16_combout\ = (\inst|xcolumn\(9) & ((GND) # (!\instDL2M|iDL1|Add3~15\))) # (!\inst|xcolumn\(9) & (\instDL2M|iDL1|Add3~15\ $ (GND)))
-- \instDL2M|iDL1|Add3~17\ = CARRY((\inst|xcolumn\(9)) # (!\instDL2M|iDL1|Add3~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(9),
	datad => VCC,
	cin => \instDL2M|iDL1|Add3~15\,
	combout => \instDL2M|iDL1|Add3~16_combout\,
	cout => \instDL2M|iDL1|Add3~17\);

-- Location: LCCOMB_X81_Y49_N10
\instDL2M|iDL1|LessThan15~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan15~1_cout\ = CARRY((!\inst|xcolumn\(0) & \inst|yrow\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(0),
	datab => \inst|yrow\(1),
	datad => VCC,
	cout => \instDL2M|iDL1|LessThan15~1_cout\);

-- Location: LCCOMB_X81_Y49_N12
\instDL2M|iDL1|LessThan15~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan15~3_cout\ = CARRY((\inst|xcolumn\(1) & (!\inst|yrow\(2) & !\instDL2M|iDL1|LessThan15~1_cout\)) # (!\inst|xcolumn\(1) & ((!\instDL2M|iDL1|LessThan15~1_cout\) # (!\inst|yrow\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|xcolumn\(1),
	datab => \inst|yrow\(2),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan15~1_cout\,
	cout => \instDL2M|iDL1|LessThan15~3_cout\);

-- Location: LCCOMB_X81_Y49_N14
\instDL2M|iDL1|LessThan15~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan15~5_cout\ = CARRY((\instDL2M|iDL1|Add3~2_combout\ & (\inst|yrow\(3) & !\instDL2M|iDL1|LessThan15~3_cout\)) # (!\instDL2M|iDL1|Add3~2_combout\ & ((\inst|yrow\(3)) # (!\instDL2M|iDL1|LessThan15~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add3~2_combout\,
	datab => \inst|yrow\(3),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan15~3_cout\,
	cout => \instDL2M|iDL1|LessThan15~5_cout\);

-- Location: LCCOMB_X81_Y49_N16
\instDL2M|iDL1|LessThan15~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan15~7_cout\ = CARRY((\instDL2M|iDL1|Add3~4_combout\ & ((!\instDL2M|iDL1|LessThan15~5_cout\) # (!\inst|yrow\(4)))) # (!\instDL2M|iDL1|Add3~4_combout\ & (!\inst|yrow\(4) & !\instDL2M|iDL1|LessThan15~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add3~4_combout\,
	datab => \inst|yrow\(4),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan15~5_cout\,
	cout => \instDL2M|iDL1|LessThan15~7_cout\);

-- Location: LCCOMB_X81_Y49_N18
\instDL2M|iDL1|LessThan15~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan15~9_cout\ = CARRY((\instDL2M|iDL1|Add3~6_combout\ & (\inst|yrow\(5) & !\instDL2M|iDL1|LessThan15~7_cout\)) # (!\instDL2M|iDL1|Add3~6_combout\ & ((\inst|yrow\(5)) # (!\instDL2M|iDL1|LessThan15~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|Add3~6_combout\,
	datab => \inst|yrow\(5),
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan15~7_cout\,
	cout => \instDL2M|iDL1|LessThan15~9_cout\);

-- Location: LCCOMB_X81_Y49_N20
\instDL2M|iDL1|LessThan15~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan15~11_cout\ = CARRY((\inst|yrow\(6) & (\instDL2M|iDL1|Add3~8_combout\ & !\instDL2M|iDL1|LessThan15~9_cout\)) # (!\inst|yrow\(6) & ((\instDL2M|iDL1|Add3~8_combout\) # (!\instDL2M|iDL1|LessThan15~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(6),
	datab => \instDL2M|iDL1|Add3~8_combout\,
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan15~9_cout\,
	cout => \instDL2M|iDL1|LessThan15~11_cout\);

-- Location: LCCOMB_X81_Y49_N22
\instDL2M|iDL1|LessThan15~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan15~13_cout\ = CARRY((\inst|yrow\(7) & ((!\instDL2M|iDL1|LessThan15~11_cout\) # (!\instDL2M|iDL1|Add3~10_combout\))) # (!\inst|yrow\(7) & (!\instDL2M|iDL1|Add3~10_combout\ & !\instDL2M|iDL1|LessThan15~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(7),
	datab => \instDL2M|iDL1|Add3~10_combout\,
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan15~11_cout\,
	cout => \instDL2M|iDL1|LessThan15~13_cout\);

-- Location: LCCOMB_X81_Y49_N24
\instDL2M|iDL1|LessThan15~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan15~15_cout\ = CARRY((\inst|yrow\(8) & (\instDL2M|iDL1|Add3~12_combout\ & !\instDL2M|iDL1|LessThan15~13_cout\)) # (!\inst|yrow\(8) & ((\instDL2M|iDL1|Add3~12_combout\) # (!\instDL2M|iDL1|LessThan15~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|yrow\(8),
	datab => \instDL2M|iDL1|Add3~12_combout\,
	datad => VCC,
	cin => \instDL2M|iDL1|LessThan15~13_cout\,
	cout => \instDL2M|iDL1|LessThan15~15_cout\);

-- Location: LCCOMB_X81_Y49_N26
\instDL2M|iDL1|LessThan15~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|LessThan15~16_combout\ = (\inst|yrow\(9) & ((!\instDL2M|iDL1|Add3~14_combout\) # (!\instDL2M|iDL1|LessThan15~15_cout\))) # (!\inst|yrow\(9) & (!\instDL2M|iDL1|LessThan15~15_cout\ & !\instDL2M|iDL1|Add3~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|yrow\(9),
	datad => \instDL2M|iDL1|Add3~14_combout\,
	cin => \instDL2M|iDL1|LessThan15~15_cout\,
	combout => \instDL2M|iDL1|LessThan15~16_combout\);

-- Location: LCCOMB_X82_Y49_N20
\instDL2M|iDL1|Add3~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|Add3~18_combout\ = \instDL2M|iDL1|Add3~17\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \instDL2M|iDL1|Add3~17\,
	combout => \instDL2M|iDL1|Add3~18_combout\);

-- Location: LCCOMB_X83_Y49_N22
\instDL2M|iDL1|VGA_R[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_R[5]~8_combout\ = (\instDL2M|iDL1|VGA_R[5]~7_combout\ & (((!\instDL2M|iDL1|Add3~16_combout\ & \instDL2M|iDL1|LessThan15~16_combout\)) # (!\instDL2M|iDL1|Add3~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|VGA_R[5]~7_combout\,
	datab => \instDL2M|iDL1|Add3~16_combout\,
	datac => \instDL2M|iDL1|LessThan15~16_combout\,
	datad => \instDL2M|iDL1|Add3~18_combout\,
	combout => \instDL2M|iDL1|VGA_R[5]~8_combout\);

-- Location: LCCOMB_X83_Y49_N0
\instDL2M|iDL1|VGA_R[5]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_R[5]~9_combout\ = ((\instDL2M|iDL1|VGA_R[5]~8_combout\) # ((\instDL2M|iDL1|VGA_R[3]~13_combout\ & \instDL2M|iDL1|VGA_G[7]~4_combout\))) # (!\instDL2M|iDL1|VGA_R[5]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|VGA_R[3]~13_combout\,
	datab => \instDL2M|iDL1|VGA_R[5]~4_combout\,
	datac => \instDL2M|iDL1|VGA_R[5]~8_combout\,
	datad => \instDL2M|iDL1|VGA_G[7]~4_combout\,
	combout => \instDL2M|iDL1|VGA_R[5]~9_combout\);

-- Location: FF_X83_Y49_N1
\instDL2M|iPipeLine|VGA_R1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iDL1|VGA_R[5]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|VGA_R1\(5));

-- Location: LCCOMB_X111_Y41_N8
\instLRD|LCD_R~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_R~1_combout\ = (\instDL2M|iPipeLine|LCD_DEN~q\ & \instDL2M|iPipeLine|VGA_R1\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instDL2M|iPipeLine|LCD_DEN~q\,
	datad => \instDL2M|iPipeLine|VGA_R1\(5),
	combout => \instLRD|LCD_R~1_combout\);

-- Location: FF_X111_Y41_N9
\instLRD|LCD_R[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_R~1_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_R\(3));

-- Location: LCCOMB_X111_Y41_N26
\instLRD|LCD_R~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_R~2_combout\ = (\instDL2M|iPipeLine|VGA_R1\(2) & \instDL2M|iPipeLine|LCD_DEN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iPipeLine|VGA_R1\(2),
	datad => \instDL2M|iPipeLine|LCD_DEN~q\,
	combout => \instLRD|LCD_R~2_combout\);

-- Location: FF_X111_Y41_N27
\instLRD|LCD_R[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_R~2_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_R\(2));

-- Location: LCCOMB_X83_Y49_N18
\instDL2M|iDL1|VGA_R[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \instDL2M|iDL1|VGA_R[3]~12_combout\ = (\instDL2M|iDL1|VGA_G[7]~5_combout\) # ((\instDL2M|iDL1|VGA_R[7]~2_combout\ & ((\instDL2M|iDL1|VGA_R[3]~13_combout\) # (\instDL2M|iDL1|LSPflag~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instDL2M|iDL1|VGA_R[3]~13_combout\,
	datab => \instDL2M|iDL1|VGA_R[7]~2_combout\,
	datac => \instDL2M|iDL1|LSPflag~8_combout\,
	datad => \instDL2M|iDL1|VGA_G[7]~5_combout\,
	combout => \instDL2M|iDL1|VGA_R[3]~12_combout\);

-- Location: FF_X83_Y49_N19
\instDL2M|iPipeLine|VGA_R1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instDL2M|iDL1|VGA_R[3]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instDL2M|iPipeLine|VGA_R1\(3));

-- Location: LCCOMB_X114_Y41_N18
\instLRD|LCD_R~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \instLRD|LCD_R~3_combout\ = (\instDL2M|iPipeLine|LCD_DEN~q\ & \instDL2M|iPipeLine|VGA_R1\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instDL2M|iPipeLine|LCD_DEN~q\,
	datad => \instDL2M|iPipeLine|VGA_R1\(3),
	combout => \instLRD|LCD_R~3_combout\);

-- Location: FF_X114_Y41_N19
\instLRD|LCD_R[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	d => \instLRD|LCD_R~3_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_R\(1));

-- Location: FF_X111_Y41_N21
\instLRD|LCD_R[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|ipll|altpll_component|auto_generated|ALT_INV_wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \instLRD|LCD_R~2_combout\,
	clrn => \inst|ipll|altpll_component|auto_generated|ALT_INV_locked~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instLRD|LCD_R\(0));
END structure;


