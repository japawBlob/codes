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
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

-- DATE "11/05/2019 11:27:21"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	DemoMux IS
    PORT (
	VGA_CLK : OUT std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	CLOCK_50 : IN std_logic;
	VGA_BLANK : OUT std_logic;
	VGA_HS : OUT std_logic;
	VGA_VS : OUT std_logic;
	VGA_SYNC : OUT std_logic;
	VGA_B : OUT std_logic_vector(9 DOWNTO 0);
	VGA_G : OUT std_logic_vector(9 DOWNTO 0);
	VGA_R : OUT std_logic_vector(9 DOWNTO 0)
	);
END DemoMux;

-- Design Ports Information
-- VGA_CLK	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_BLANK	=>  Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_HS	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_VS	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_SYNC	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_B[9]	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_B[8]	=>  Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_B[7]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_B[6]	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_B[5]	=>  Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_B[4]	=>  Location: PIN_J10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_B[3]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_B[2]	=>  Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_B[1]	=>  Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_B[0]	=>  Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_G[9]	=>  Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_G[8]	=>  Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_G[7]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_G[6]	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_G[5]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_G[4]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_G[3]	=>  Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_G[2]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_G[1]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_G[0]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_R[9]	=>  Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_R[8]	=>  Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_R[7]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_R[6]	=>  Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_R[5]	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_R[4]	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_R[3]	=>  Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_R[2]	=>  Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_R[1]	=>  Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_R[0]	=>  Location: PIN_C8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- CLOCK_50	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_W26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_P23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_N23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF DemoMux IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_VGA_CLK : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_VGA_BLANK : std_logic;
SIGNAL ww_VGA_HS : std_logic;
SIGNAL ww_VGA_VS : std_logic;
SIGNAL ww_VGA_SYNC : std_logic;
SIGNAL ww_VGA_B : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_VGA_G : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_VGA_R : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2_DATAA_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2_DATAA_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2_DATAA_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAA_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAB_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAA_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAB_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAA_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAB_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \inst4~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_gen|VGA_CLK~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_gen|VGA_VS~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK_50~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst|iVMCalc|LessThan0~1_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan0~3_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan0~5_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan0~7_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan0~9_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan0~11_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan0~13_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan0~15_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan0~17_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan0~18_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~4_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~6_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~8_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~12_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add1~0_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add1~2_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add1~5\ : std_logic;
SIGNAL \inst|iVMCalc|Add1~6_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add1~7\ : std_logic;
SIGNAL \inst|iVMCalc|Add1~8_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add1~9\ : std_logic;
SIGNAL \inst|iVMCalc|Add1~10_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan2~1_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan2~3_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan2~5_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan2~7_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan2~9_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan2~11_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan2~13_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan2~15_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan2~16_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~0_combout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a2~portadataout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a4~portadataout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a6~portadataout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a3~portadataout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a7~portadataout\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~dataout\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT1\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT2\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT5\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT9\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT10\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT13\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT18\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~0\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~1\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~2\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~3\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~4\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~5\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~6\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~7\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~8\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~9\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~10\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~11\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~12\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~13\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~dataout\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT1\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT2\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT3\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT4\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT5\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT6\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT7\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT8\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT9\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT10\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT11\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT12\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT13\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT14\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT15\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT16\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT17\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT18\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT19\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~0\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~1\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~2\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~3\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~4\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~5\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~6\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~7\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~8\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~9\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~10\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~11\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~12\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~13\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~14\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_out2~15\ : std_logic;
SIGNAL \inst|iDL2|Add1~3_cout\ : std_logic;
SIGNAL \inst|iDL2|Add1~5_cout\ : std_logic;
SIGNAL \inst|iDL2|Add1~7_cout\ : std_logic;
SIGNAL \inst|iDL2|Add1~9_cout\ : std_logic;
SIGNAL \inst|iDL2|Add1~10_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~11\ : std_logic;
SIGNAL \inst|iDL2|Add1~12_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~13\ : std_logic;
SIGNAL \inst|iDL2|Add1~14_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~15\ : std_logic;
SIGNAL \inst|iDL2|Add1~16_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~17\ : std_logic;
SIGNAL \inst|iDL2|Add1~18_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~19\ : std_logic;
SIGNAL \inst|iDL2|Add1~20_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~21\ : std_logic;
SIGNAL \inst|iDL2|Add1~22_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~23\ : std_logic;
SIGNAL \inst|iDL2|Add1~24_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~25\ : std_logic;
SIGNAL \inst|iDL2|Add1~26_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~27\ : std_logic;
SIGNAL \inst|iDL2|Add1~28_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~29\ : std_logic;
SIGNAL \inst|iDL2|Add1~30_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~31\ : std_logic;
SIGNAL \inst|iDL2|Add1~32_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~33\ : std_logic;
SIGNAL \inst|iDL2|Add1~34_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~35\ : std_logic;
SIGNAL \inst|iDL2|Add1~36_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~37\ : std_logic;
SIGNAL \inst|iDL2|Add1~38_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~39\ : std_logic;
SIGNAL \inst|iDL2|Add1~40_combout\ : std_logic;
SIGNAL \inst|iDL2|Add1~41\ : std_logic;
SIGNAL \inst|iDL2|Add1~42_combout\ : std_logic;
SIGNAL \inst|iDL2|Add2~4_combout\ : std_logic;
SIGNAL \inst|iDL2|Add2~6_combout\ : std_logic;
SIGNAL \inst|iDL2|Add2~10_combout\ : std_logic;
SIGNAL \inst|iDL2|Add2~16_combout\ : std_logic;
SIGNAL \inst|iDL2|Add2~18_combout\ : std_logic;
SIGNAL \inst|iDL2|Add4~4_combout\ : std_logic;
SIGNAL \inst|iDL2|Add3~2_combout\ : std_logic;
SIGNAL \inst|iDL2|Add3~8_combout\ : std_logic;
SIGNAL \inst|iDL2|Add3~12_combout\ : std_logic;
SIGNAL \inst|iDL2|Add3~14_combout\ : std_logic;
SIGNAL \inst|iDL2|Add3~20_combout\ : std_logic;
SIGNAL \inst|iDL1|Add5~12_combout\ : std_logic;
SIGNAL \inst|iDL1|Add5~21\ : std_logic;
SIGNAL \inst|iDL1|Add5~22_combout\ : std_logic;
SIGNAL \inst|iDL1|Add6~2_combout\ : std_logic;
SIGNAL \inst|iDL1|Add6~12_combout\ : std_logic;
SIGNAL \inst|iDL1|Add6~22_combout\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~dataout\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT1\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT3\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT4\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT6\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT7\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT8\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT11\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT12\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT14\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT15\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT16\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT17\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT19\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT20\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT21\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~0\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~1\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~2\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~3\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~4\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~5\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~6\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~7\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~8\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~9\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~10\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~11\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~12\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~13\ : std_logic;
SIGNAL \inst|iDL1|Add2~8_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~10_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~12_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~14_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~30_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~36_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~39\ : std_logic;
SIGNAL \inst|iDL1|Add2~40_combout\ : std_logic;
SIGNAL \inst|iDL1|Add4~2_combout\ : std_logic;
SIGNAL \inst|iDL1|Add4~4_combout\ : std_logic;
SIGNAL \inst|iDL1|Add4~6_combout\ : std_logic;
SIGNAL \inst|iDL1|Add4~8_combout\ : std_logic;
SIGNAL \inst|iDL1|Add4~10_combout\ : std_logic;
SIGNAL \inst|iDL1|Add4~12_combout\ : std_logic;
SIGNAL \inst|iDL1|Add4~14_combout\ : std_logic;
SIGNAL \inst|iDL1|Add4~16_combout\ : std_logic;
SIGNAL \inst|iDL1|Add4~18_combout\ : std_logic;
SIGNAL \inst|iDL1|Add4~20_combout\ : std_logic;
SIGNAL \inst|iDL1|LessThan14~1_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan14~3_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan14~5_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan14~7_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan14~9_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan14~11_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan14~13_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan14~15_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan14~17_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan14~19_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan14~21_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan14~22_combout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a6~portadataout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a5~portadataout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a3~portadataout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a1~portadataout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a7~portadataout\ : std_logic;
SIGNAL \inst|iDL2|Add5~2_combout\ : std_logic;
SIGNAL \inst|iDL2|Add5~4_combout\ : std_logic;
SIGNAL \inst|iDL2|Add5~8_combout\ : std_logic;
SIGNAL \inst|iDL2|Add5~12_combout\ : std_logic;
SIGNAL \inst|iDL2|Add5~20_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[0]~regout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[12]~53_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[19]~67_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[21]~71_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[22]~73_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[24]~77_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[26]~81_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[28]~85_combout\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~dataout\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT1\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT2\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT3\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT4\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT5\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT6\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT7\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT8\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT9\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT10\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT11\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT12\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT13\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT14\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT15\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT16\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT17\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT18\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT19\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~0\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~1\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~2\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~3\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~4\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~5\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~6\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~7\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~8\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~9\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~10\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~11\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~12\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~13\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~14\ : std_logic;
SIGNAL \inst|iDL2|Mult0|auto_generated|mac_mult1~15\ : std_logic;
SIGNAL \inst|iDL1|Add9~15_combout\ : std_logic;
SIGNAL \inst|iDL1|Add9~19_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[0]~1_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan7~0_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan7~1_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan7~2_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan7~3_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan7~4_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan7~5_combout\ : std_logic;
SIGNAL \inst|iDL2|LSPflag~0_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan7~6_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan2~18_combout\ : std_logic;
SIGNAL \inst|iVMCalc|MuxAddress~2_combout\ : std_logic;
SIGNAL \inst|iDL2|LSPflag:romID[1]~0_combout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~0_combout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan13~0_combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan13~1_combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan13~2_combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan13~3_combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan13~4_combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan13~5_combout\ : std_logic;
SIGNAL \inst|iVMCalc|sor~0_combout\ : std_logic;
SIGNAL \inst|iVMCalc|MuxAddress[1]~7_combout\ : std_logic;
SIGNAL \inst|iDL1|LessThan13~2_combout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~2_combout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\ : std_logic;
SIGNAL \inst|iDL1|LSPflag:romID[1]~2_combout\ : std_logic;
SIGNAL \inst|iDL1|RGB~1_combout\ : std_logic;
SIGNAL \inst|iDL1|VGA_B[0]~1_combout\ : std_logic;
SIGNAL \inst|iDL2|Equal2~0_combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan15~0_combout\ : std_logic;
SIGNAL \inst|iDL1|VGA_G[0]~3_combout\ : std_logic;
SIGNAL \inst|iDL1|VGA_G[0]~4_combout\ : std_logic;
SIGNAL \inst|iDL1|VGA_R[6]~0_combout\ : std_logic;
SIGNAL \inst|iDL2|RGB~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~1_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~2_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~3_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~4_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~6_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~8_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~9_combout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~0_combout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~2_combout\ : std_logic;
SIGNAL \inst|iDL1|Add9~6_combout\ : std_logic;
SIGNAL \inst|iDL1|Add9~7_combout\ : std_logic;
SIGNAL \inst|iDL1|Add9~8_combout\ : std_logic;
SIGNAL \inst|iDL1|Add9~10_combout\ : std_logic;
SIGNAL \inst|iDL1|Add9~11_combout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode45w[2]~0_combout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~2_combout\ : std_logic;
SIGNAL \inst_gen|LessThan6~0_combout\ : std_logic;
SIGNAL \inst_gen|LessThan7~1_combout\ : std_logic;
SIGNAL \inst|iDL1|LSPflag:romID[1]~5_combout\ : std_logic;
SIGNAL \inst|iDL1|Add9~28_combout\ : std_logic;
SIGNAL \inst|iVMCalc|MuxAddress[0]~9_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan9~0_wirecell_combout\ : std_logic;
SIGNAL \inst_gen|VGA_VS~clkctrl_outclk\ : std_logic;
SIGNAL \CLOCK_50~combout\ : std_logic;
SIGNAL \inst4~0_combout\ : std_logic;
SIGNAL \inst_gen|VGA_CLK~0_combout\ : std_logic;
SIGNAL \inst_gen|VGA_CLK~regout\ : std_logic;
SIGNAL \inst|iPipeLine|VGA_CLK~0_combout\ : std_logic;
SIGNAL \inst|iPipeLine|VGA_CLK~regout\ : std_logic;
SIGNAL \inst2|VGA_CLK~regout\ : std_logic;
SIGNAL \CLOCK_50~clkctrl_outclk\ : std_logic;
SIGNAL \inst_gen|gen:yr[0]~2\ : std_logic;
SIGNAL \inst_gen|gen:yr[1]~2\ : std_logic;
SIGNAL \inst_gen|gen:yr[2]~1_combout\ : std_logic;
SIGNAL \inst4~0clkctrl_outclk\ : std_logic;
SIGNAL \inst_gen|gen:yr[5]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[0]~2\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[1]~2\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[2]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[2]~regout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[2]~2\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[3]~2\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[4]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[4]~regout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[4]~2\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[5]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[5]~regout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[1]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[1]~regout\ : std_logic;
SIGNAL \inst_gen|LessThan6~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[3]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[3]~regout\ : std_logic;
SIGNAL \inst_gen|LessThan6~2_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[5]~2\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[6]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[6]~regout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[6]~2\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[7]~2\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[8]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[8]~regout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[8]~2\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[9]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[9]~regout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[9]~2\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[10]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[10]~regout\ : std_logic;
SIGNAL \inst_gen|LessThan6~3_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[5]~regout\ : std_logic;
SIGNAL \inst_gen|LessThan7~0_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[8]~2\ : std_logic;
SIGNAL \inst_gen|gen:yr[9]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[9]~regout\ : std_logic;
SIGNAL \inst_gen|LessThan7~2_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[2]~regout\ : std_logic;
SIGNAL \inst_gen|gen:yr[2]~2\ : std_logic;
SIGNAL \inst_gen|gen:yr[3]~2\ : std_logic;
SIGNAL \inst_gen|gen:yr[4]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[4]~regout\ : std_logic;
SIGNAL \inst_gen|gen:yr[4]~2\ : std_logic;
SIGNAL \inst_gen|gen:yr[5]~2\ : std_logic;
SIGNAL \inst_gen|gen:yr[6]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[6]~regout\ : std_logic;
SIGNAL \inst_gen|gen:yr[6]~2\ : std_logic;
SIGNAL \inst_gen|gen:yr[7]~2\ : std_logic;
SIGNAL \inst_gen|gen:yr[8]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[8]~regout\ : std_logic;
SIGNAL \inst_gen|LessThan5~0_combout\ : std_logic;
SIGNAL \inst_gen|gen~0_combout\ : std_logic;
SIGNAL \inst_gen|gen~1_combout\ : std_logic;
SIGNAL \inst_gen|VGA_BLANK~regout\ : std_logic;
SIGNAL \inst|iPipeLine|VGA_BLANK~feeder_combout\ : std_logic;
SIGNAL \inst|iPipeLine|VGA_BLANK~regout\ : std_logic;
SIGNAL \inst2|VGA_BLANK~feeder_combout\ : std_logic;
SIGNAL \inst2|VGA_BLANK~regout\ : std_logic;
SIGNAL \inst_gen|gen~2_combout\ : std_logic;
SIGNAL \inst_gen|gen~3_combout\ : std_logic;
SIGNAL \inst_gen|VGA_HS~regout\ : std_logic;
SIGNAL \inst|iPipeLine|VGA_HS~feeder_combout\ : std_logic;
SIGNAL \inst|iPipeLine|VGA_HS~regout\ : std_logic;
SIGNAL \inst2|VGA_HS~feeder_combout\ : std_logic;
SIGNAL \inst2|VGA_HS~regout\ : std_logic;
SIGNAL \inst_gen|gen~4_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[1]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[1]~regout\ : std_logic;
SIGNAL \inst_gen|gen~5_combout\ : std_logic;
SIGNAL \inst_gen|VGA_VS~regout\ : std_logic;
SIGNAL \inst|iPipeLine|VGA_VS~feeder_combout\ : std_logic;
SIGNAL \inst|iPipeLine|VGA_VS~regout\ : std_logic;
SIGNAL \inst2|VGA_VS~feeder_combout\ : std_logic;
SIGNAL \inst2|VGA_VS~regout\ : std_logic;
SIGNAL \inst_gen|VGA_SYNC~0_combout\ : std_logic;
SIGNAL \inst_gen|VGA_SYNC~regout\ : std_logic;
SIGNAL \inst|iPipeLine|VGA_SYNC~feeder_combout\ : std_logic;
SIGNAL \inst|iPipeLine|VGA_SYNC~regout\ : std_logic;
SIGNAL \inst2|VGA_SYNC~regout\ : std_logic;
SIGNAL \inst_gen|xcolumn[9]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[7]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:xcounter[7]~regout\ : std_logic;
SIGNAL \inst_gen|xcolumn[6]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst_gen|xcolumn[7]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst|iDL1|LSPflag~0_combout\ : std_logic;
SIGNAL \inst|iDL1|LSPflag:romID[1]~3_combout\ : std_logic;
SIGNAL \inst_gen|xcolumn[8]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst|iDL1|Add0~0_combout\ : std_logic;
SIGNAL \inst|iDL1|LSPflag:romID[1]~4_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[7]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[7]~regout\ : std_logic;
SIGNAL \inst|iDL2|LSPflag~1_combout\ : std_logic;
SIGNAL \inst|iDL1|LSPflag~1_combout\ : std_logic;
SIGNAL \inst|iDL1|Mux0~2_combout\ : std_logic;
SIGNAL \inst|iDL1|Mux1~2_combout\ : std_logic;
SIGNAL \inst_gen|VGA_CLK~clkctrl_outclk\ : std_logic;
SIGNAL \inst|iDL1|Add9~4_combout\ : std_logic;
SIGNAL \inst_gen|xcolumn[5]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst|iDL1|Add9~5_combout\ : std_logic;
SIGNAL \inst|iDL1|Add8~0_combout\ : std_logic;
SIGNAL \inst|iDL1|Add9~9_combout\ : std_logic;
SIGNAL \inst|iDL1|Add9~27_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[0]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[0]~regout\ : std_logic;
SIGNAL \inst_gen|xcolumn[0]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst|iDL1|Add9~12_combout\ : std_logic;
SIGNAL \inst|iDL1|Add9~14\ : std_logic;
SIGNAL \inst|iDL1|Add9~16\ : std_logic;
SIGNAL \inst|iDL1|Add9~18\ : std_logic;
SIGNAL \inst|iDL1|Add9~20\ : std_logic;
SIGNAL \inst|iDL1|Add9~22\ : std_logic;
SIGNAL \inst|iDL1|Add9~24\ : std_logic;
SIGNAL \inst|iDL1|Add9~25_combout\ : std_logic;
SIGNAL \inst|iDL1|Add9~23_combout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~1_combout\ : std_logic;
SIGNAL \inst|iDL1|LSPflag:romID[0]~0_combout\ : std_logic;
SIGNAL \inst|iDL1|Mux13~0_combout\ : std_logic;
SIGNAL \inst_gen|xcolumn[1]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst|iDL1|Mux12~0_combout\ : std_logic;
SIGNAL \inst_gen|xcolumn[2]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst|iDL1|Mux11~0_combout\ : std_logic;
SIGNAL \inst_gen|xcolumn[3]~_Duplicate_2feeder_combout\ : std_logic;
SIGNAL \inst_gen|xcolumn[3]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst|iDL1|Mux10~0_combout\ : std_logic;
SIGNAL \inst|iDL1|Mux9~0_combout\ : std_logic;
SIGNAL \inst|iDL1|Mux8~0_combout\ : std_logic;
SIGNAL \inst|iDL1|Mux7~0_combout\ : std_logic;
SIGNAL \inst|iDL1|Add9~13_combout\ : std_logic;
SIGNAL \inst|iDL1|Mux6~2_combout\ : std_logic;
SIGNAL \inst|iDL1|Mux5~2_combout\ : std_logic;
SIGNAL \inst|iDL1|Add9~17_combout\ : std_logic;
SIGNAL \inst|iDL1|Mux4~2_combout\ : std_logic;
SIGNAL \inst|iDL1|Mux3~2_combout\ : std_logic;
SIGNAL \inst|iDL1|Add9~21_combout\ : std_logic;
SIGNAL \inst|iDL1|Mux2~2_combout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a4~portadataout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~0_combout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~0_combout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a2~portadataout\ : std_logic;
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan9~0_combout\ : std_logic;
SIGNAL \inst|iDL2|LSPflag~4_combout\ : std_logic;
SIGNAL \inst|iDL1|VGA_G[5]~0_combout\ : std_logic;
SIGNAL \inst|iDL1|Add0~0_wirecell_combout\ : std_logic;
SIGNAL \inst|iDL1|Add0~1_combout\ : std_logic;
SIGNAL \inst_gen|xcolumn[4]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst|iDL1|Add5~1\ : std_logic;
SIGNAL \inst|iDL1|Add5~3\ : std_logic;
SIGNAL \inst|iDL1|Add5~5\ : std_logic;
SIGNAL \inst|iDL1|Add5~7\ : std_logic;
SIGNAL \inst|iDL1|Add5~9\ : std_logic;
SIGNAL \inst|iDL1|Add5~11\ : std_logic;
SIGNAL \inst|iDL1|Add5~13\ : std_logic;
SIGNAL \inst|iDL1|Add5~15\ : std_logic;
SIGNAL \inst|iDL1|Add5~17\ : std_logic;
SIGNAL \inst|iDL1|Add5~19\ : std_logic;
SIGNAL \inst|iDL1|Add5~20_combout\ : std_logic;
SIGNAL \inst|iDL1|Add5~18_combout\ : std_logic;
SIGNAL \inst|iDL1|Add5~16_combout\ : std_logic;
SIGNAL \inst|iDL1|Add5~14_combout\ : std_logic;
SIGNAL \inst|iDL1|Add5~10_combout\ : std_logic;
SIGNAL \inst|iDL1|Add5~8_combout\ : std_logic;
SIGNAL \inst|iDL1|Add5~6_combout\ : std_logic;
SIGNAL \inst|iDL1|Add5~4_combout\ : std_logic;
SIGNAL \inst|iDL1|Add4~1_cout\ : std_logic;
SIGNAL \inst|iDL1|Add4~3\ : std_logic;
SIGNAL \inst|iDL1|Add4~5\ : std_logic;
SIGNAL \inst|iDL1|Add4~7\ : std_logic;
SIGNAL \inst|iDL1|Add4~9\ : std_logic;
SIGNAL \inst|iDL1|Add4~11\ : std_logic;
SIGNAL \inst|iDL1|Add4~13\ : std_logic;
SIGNAL \inst|iDL1|Add4~15\ : std_logic;
SIGNAL \inst|iDL1|Add4~17\ : std_logic;
SIGNAL \inst|iDL1|Add4~19\ : std_logic;
SIGNAL \inst|iDL1|Add4~21\ : std_logic;
SIGNAL \inst|iDL1|Add4~23\ : std_logic;
SIGNAL \inst|iDL1|Add4~25\ : std_logic;
SIGNAL \inst|iDL1|Add4~26_combout\ : std_logic;
SIGNAL \inst|iDL1|Add4~24_combout\ : std_logic;
SIGNAL \inst|iDL1|Add4~22_combout\ : std_logic;
SIGNAL \inst|iDL1|RGB~0_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[3]~1_combout\ : std_logic;
SIGNAL \inst_gen|gen:yr[3]~regout\ : std_logic;
SIGNAL \inst|iDL2|Add0~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Add0~1_combout\ : std_logic;
SIGNAL \inst|iDL2|Add0~2_combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan11~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Add0~3_combout\ : std_logic;
SIGNAL \inst|iDL2|Add0~4_combout\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~dataout\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT1\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT2\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT3\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT4\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT5\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT6\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT7\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT8\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT9\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT10\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT11\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT12\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT13\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT14\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT15\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT16\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT17\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT18\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT19\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT20\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT21\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~0\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~1\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~2\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~3\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~4\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~5\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~6\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~7\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~8\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~9\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~10\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~11\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~12\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_mult1~13\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT20\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~dataout\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT1\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT2\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT3\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT4\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT5\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT6\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT7\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT8\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT9\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT10\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT11\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT12\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT13\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT14\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT15\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT16\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT17\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT18\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT19\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT20\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT21\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~0\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~1\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~2\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~3\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~4\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~5\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~6\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~7\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~8\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~9\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~10\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~11\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~12\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_mult1~13\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT18\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT16\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT14\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT13\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT12\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT11\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT10\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT9\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT8\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT7\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT6\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT5\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT4\ : std_logic;
SIGNAL \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT3\ : std_logic;
SIGNAL \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT2\ : std_logic;
SIGNAL \inst|iDL1|Add2~1_cout\ : std_logic;
SIGNAL \inst|iDL1|Add2~3_cout\ : std_logic;
SIGNAL \inst|iDL1|Add2~5_cout\ : std_logic;
SIGNAL \inst|iDL1|Add2~7_cout\ : std_logic;
SIGNAL \inst|iDL1|Add2~9\ : std_logic;
SIGNAL \inst|iDL1|Add2~11\ : std_logic;
SIGNAL \inst|iDL1|Add2~13\ : std_logic;
SIGNAL \inst|iDL1|Add2~15\ : std_logic;
SIGNAL \inst|iDL1|Add2~17\ : std_logic;
SIGNAL \inst|iDL1|Add2~19\ : std_logic;
SIGNAL \inst|iDL1|Add2~21\ : std_logic;
SIGNAL \inst|iDL1|Add2~23\ : std_logic;
SIGNAL \inst|iDL1|Add2~25\ : std_logic;
SIGNAL \inst|iDL1|Add2~27\ : std_logic;
SIGNAL \inst|iDL1|Add2~29\ : std_logic;
SIGNAL \inst|iDL1|Add2~31\ : std_logic;
SIGNAL \inst|iDL1|Add2~33\ : std_logic;
SIGNAL \inst|iDL1|Add2~35\ : std_logic;
SIGNAL \inst|iDL1|Add2~37\ : std_logic;
SIGNAL \inst|iDL1|Add2~38_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~34_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~32_combout\ : std_logic;
SIGNAL \inst|iDL1|LessThan13~0_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~28_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~24_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~26_combout\ : std_logic;
SIGNAL \inst|iDL1|LessThan13~4_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~16_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~20_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~22_combout\ : std_logic;
SIGNAL \inst|iDL1|Add2~18_combout\ : std_logic;
SIGNAL \inst|iDL1|LessThan13~1_combout\ : std_logic;
SIGNAL \inst|iDL1|LessThan13~3_combout\ : std_logic;
SIGNAL \inst|iDL1|LessThan13~5_combout\ : std_logic;
SIGNAL \inst|iDL1|VGA_B[6]~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Add7~0_combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan6~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~5_combout\ : std_logic;
SIGNAL \inst|iDL2|LSPflag:romID[1]~combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~7_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~10_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~12\ : std_logic;
SIGNAL \inst|iDL2|Add8~14\ : std_logic;
SIGNAL \inst|iDL2|Add8~16\ : std_logic;
SIGNAL \inst|iDL2|Add8~18\ : std_logic;
SIGNAL \inst|iDL2|Add8~20\ : std_logic;
SIGNAL \inst|iDL2|Add8~22\ : std_logic;
SIGNAL \inst|iDL2|Add8~23_combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan7~0_combout\ : std_logic;
SIGNAL \inst|iDL2|LSPflag:romID[1]~1_combout\ : std_logic;
SIGNAL \inst|iDL2|Mux0~2_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~21_combout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode45w[2]~0_combout\ : std_logic;
SIGNAL \inst|iDL2|LSPflag:romID[0]~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Mux13~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Mux12~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Mux11~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Mux10~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Mux9~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Mux8~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Mux7~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~11_combout\ : std_logic;
SIGNAL \inst|iDL2|Mux6~2_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~13_combout\ : std_logic;
SIGNAL \inst|iDL2|Mux5~2_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~15_combout\ : std_logic;
SIGNAL \inst|iDL2|Mux4~2_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~17_combout\ : std_logic;
SIGNAL \inst|iDL2|Mux3~2_combout\ : std_logic;
SIGNAL \inst|iDL2|Add8~19_combout\ : std_logic;
SIGNAL \inst|iDL2|Mux2~2_combout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a1~portadataout\ : std_logic;
SIGNAL \inst|iDL2|Mux0~3_combout\ : std_logic;
SIGNAL \inst|iDL2|Mux1~2_combout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~2_combout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~1_combout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a5~portadataout\ : std_logic;
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\ : std_logic;
SIGNAL \inst|iDL2|LSPflag~2_combout\ : std_logic;
SIGNAL \inst|iDL2|LSPflag~3_combout\ : std_logic;
SIGNAL \inst|iDL2|VGA_B[2]~6_combout\ : std_logic;
SIGNAL \inst|iDL2|Add2~1\ : std_logic;
SIGNAL \inst|iDL2|Add2~3\ : std_logic;
SIGNAL \inst|iDL2|Add2~5\ : std_logic;
SIGNAL \inst|iDL2|Add2~7\ : std_logic;
SIGNAL \inst|iDL2|Add2~9\ : std_logic;
SIGNAL \inst|iDL2|Add2~11\ : std_logic;
SIGNAL \inst|iDL2|Add2~13\ : std_logic;
SIGNAL \inst|iDL2|Add2~15\ : std_logic;
SIGNAL \inst|iDL2|Add2~17\ : std_logic;
SIGNAL \inst|iDL2|Add2~19\ : std_logic;
SIGNAL \inst|iDL2|Add2~20_combout\ : std_logic;
SIGNAL \inst|iDL2|Add4~1\ : std_logic;
SIGNAL \inst|iDL2|Add4~3\ : std_logic;
SIGNAL \inst|iDL2|Add4~5\ : std_logic;
SIGNAL \inst|iDL2|Add4~7\ : std_logic;
SIGNAL \inst|iDL2|Add4~9\ : std_logic;
SIGNAL \inst|iDL2|Add4~11\ : std_logic;
SIGNAL \inst|iDL2|Add4~13\ : std_logic;
SIGNAL \inst|iDL2|Add4~15\ : std_logic;
SIGNAL \inst|iDL2|Add4~17\ : std_logic;
SIGNAL \inst|iDL2|Add4~18_combout\ : std_logic;
SIGNAL \inst|iDL2|Add4~16_combout\ : std_logic;
SIGNAL \inst|iDL2|Add4~12_combout\ : std_logic;
SIGNAL \inst|iDL2|Add4~10_combout\ : std_logic;
SIGNAL \inst|iDL2|Add3~1_cout\ : std_logic;
SIGNAL \inst|iDL2|Add3~3\ : std_logic;
SIGNAL \inst|iDL2|Add3~5\ : std_logic;
SIGNAL \inst|iDL2|Add3~7\ : std_logic;
SIGNAL \inst|iDL2|Add3~9\ : std_logic;
SIGNAL \inst|iDL2|Add3~11\ : std_logic;
SIGNAL \inst|iDL2|Add3~13\ : std_logic;
SIGNAL \inst|iDL2|Add3~15\ : std_logic;
SIGNAL \inst|iDL2|Add3~17\ : std_logic;
SIGNAL \inst|iDL2|Add3~18_combout\ : std_logic;
SIGNAL \inst|iDL2|Add3~16_combout\ : std_logic;
SIGNAL \inst|iDL2|Add2~14_combout\ : std_logic;
SIGNAL \inst|iDL2|Add2~12_combout\ : std_logic;
SIGNAL \inst|iDL2|Add3~10_combout\ : std_logic;
SIGNAL \inst|iDL2|Add2~8_combout\ : std_logic;
SIGNAL \inst|iDL2|Add3~6_combout\ : std_logic;
SIGNAL \inst|iDL2|Add3~4_combout\ : std_logic;
SIGNAL \inst|iDL2|Add2~2_combout\ : std_logic;
SIGNAL \inst|iDL2|Add2~0_combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan14~1_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan14~3_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan14~5_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan14~7_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan14~9_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan14~11_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan14~13_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan14~15_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan14~17_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan14~19_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan14~21_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan14~22_combout\ : std_logic;
SIGNAL \inst|iDL2|Add4~19\ : std_logic;
SIGNAL \inst|iDL2|Add4~20_combout\ : std_logic;
SIGNAL \inst|iDL2|Add3~19\ : std_logic;
SIGNAL \inst|iDL2|Add3~21\ : std_logic;
SIGNAL \inst|iDL2|Add3~22_combout\ : std_logic;
SIGNAL \inst|iDL2|VGA_B[7]~7_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[1]~31_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[6]~41_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan7~7_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan7~8_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan7~9_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[1]~32\ : std_logic;
SIGNAL \inst|iVMCalc|counter[2]~33_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[2]~34\ : std_logic;
SIGNAL \inst|iVMCalc|counter[3]~36\ : std_logic;
SIGNAL \inst|iVMCalc|counter[4]~37_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[4]~38\ : std_logic;
SIGNAL \inst|iVMCalc|counter[5]~40\ : std_logic;
SIGNAL \inst|iVMCalc|counter[6]~42\ : std_logic;
SIGNAL \inst|iVMCalc|counter[7]~43_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[7]~44\ : std_logic;
SIGNAL \inst|iVMCalc|counter[8]~46\ : std_logic;
SIGNAL \inst|iVMCalc|counter[9]~47_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[9]~48\ : std_logic;
SIGNAL \inst|iVMCalc|counter[10]~50\ : std_logic;
SIGNAL \inst|iVMCalc|counter[11]~51_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[11]~52\ : std_logic;
SIGNAL \inst|iVMCalc|counter[12]~54\ : std_logic;
SIGNAL \inst|iVMCalc|counter[13]~55_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[13]~56\ : std_logic;
SIGNAL \inst|iVMCalc|counter[14]~57_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[14]~58\ : std_logic;
SIGNAL \inst|iVMCalc|counter[15]~59_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[15]~60\ : std_logic;
SIGNAL \inst|iVMCalc|counter[16]~61_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[16]~62\ : std_logic;
SIGNAL \inst|iVMCalc|counter[17]~63_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[17]~64\ : std_logic;
SIGNAL \inst|iVMCalc|counter[18]~65_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[18]~66\ : std_logic;
SIGNAL \inst|iVMCalc|counter[19]~68\ : std_logic;
SIGNAL \inst|iVMCalc|counter[20]~69_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[20]~70\ : std_logic;
SIGNAL \inst|iVMCalc|counter[21]~72\ : std_logic;
SIGNAL \inst|iVMCalc|counter[22]~74\ : std_logic;
SIGNAL \inst|iVMCalc|counter[23]~75_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[23]~76\ : std_logic;
SIGNAL \inst|iVMCalc|counter[24]~78\ : std_logic;
SIGNAL \inst|iVMCalc|counter[25]~79_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[25]~80\ : std_logic;
SIGNAL \inst|iVMCalc|counter[26]~82\ : std_logic;
SIGNAL \inst|iVMCalc|counter[27]~83_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[27]~84\ : std_logic;
SIGNAL \inst|iVMCalc|counter[28]~86\ : std_logic;
SIGNAL \inst|iVMCalc|counter[29]~87_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[29]~88\ : std_logic;
SIGNAL \inst|iVMCalc|counter[30]~89_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[30]~90\ : std_logic;
SIGNAL \inst|iVMCalc|counter[31]~91_combout\ : std_logic;
SIGNAL \inst|iVMCalc|MuxAddress[1]~8_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux16~0_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux17~0_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[10]~49_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[8]~45_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add1~1\ : std_logic;
SIGNAL \inst|iVMCalc|Add1~3\ : std_logic;
SIGNAL \inst|iVMCalc|Add1~4_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[5]~39_combout\ : std_logic;
SIGNAL \inst|iVMCalc|counter[3]~35_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan3~1_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan3~3_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan3~5_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan3~7_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan3~9_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan3~11_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan3~13_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan3~15_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan3~17_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan3~19_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan3~20_combout\ : std_logic;
SIGNAL \inst|iVMCalc|MuxAddress~3_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~1\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~3\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~5\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~7\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~9\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~11\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~13\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~14_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~10_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~2_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add0~0_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan1~1_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan1~3_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan1~5_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan1~7_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan1~9_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan1~11_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan1~13_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan1~15_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan1~17_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan1~19_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan1~20_combout\ : std_logic;
SIGNAL \inst|iVMCalc|MuxAddress[0]~10_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add2~0_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add2~1_combout\ : std_logic;
SIGNAL \inst|iVMCalc|Add2~2_combout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan6~1_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan6~3_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan6~5_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan6~7_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan6~9_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan6~11_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan6~13_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan6~15_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan6~17_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan6~19_cout\ : std_logic;
SIGNAL \inst|iVMCalc|LessThan6~20_combout\ : std_logic;
SIGNAL \inst|iVMCalc|secondImage~0_combout\ : std_logic;
SIGNAL \inst|iVMCalc|secondImage~regout\ : std_logic;
SIGNAL \inst|iVMCalc|MuxAddress[0]~4_combout\ : std_logic;
SIGNAL \inst|iVMCalc|MuxAddress[0]~5_combout\ : std_logic;
SIGNAL \inst|iVMCalc|MuxAddress[0]~6_combout\ : std_logic;
SIGNAL \inst|iDL2|VGA_B[4]~4_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux19~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Add4~14_combout\ : std_logic;
SIGNAL \inst|iDL2|Add4~8_combout\ : std_logic;
SIGNAL \inst|iDL2|Add4~6_combout\ : std_logic;
SIGNAL \inst|iDL2|Add4~2_combout\ : std_logic;
SIGNAL \inst|iDL2|Add4~0_combout\ : std_logic;
SIGNAL \inst|iDL2|Add5~1_cout\ : std_logic;
SIGNAL \inst|iDL2|Add5~3\ : std_logic;
SIGNAL \inst|iDL2|Add5~5\ : std_logic;
SIGNAL \inst|iDL2|Add5~7\ : std_logic;
SIGNAL \inst|iDL2|Add5~9\ : std_logic;
SIGNAL \inst|iDL2|Add5~11\ : std_logic;
SIGNAL \inst|iDL2|Add5~13\ : std_logic;
SIGNAL \inst|iDL2|Add5~15\ : std_logic;
SIGNAL \inst|iDL2|Add5~17\ : std_logic;
SIGNAL \inst|iDL2|Add5~19\ : std_logic;
SIGNAL \inst|iDL2|Add5~21\ : std_logic;
SIGNAL \inst|iDL2|Add5~22_combout\ : std_logic;
SIGNAL \inst|iDL2|Add5~18_combout\ : std_logic;
SIGNAL \inst|iDL2|Add5~16_combout\ : std_logic;
SIGNAL \inst|iDL2|Add5~14_combout\ : std_logic;
SIGNAL \inst|iDL2|Add5~10_combout\ : std_logic;
SIGNAL \inst|iDL2|Add5~6_combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan15~2_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan15~4_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan15~6_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan15~8_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan15~10_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan15~12_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan15~14_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan15~16_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan15~18_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan15~20_cout\ : std_logic;
SIGNAL \inst|iDL2|LessThan15~21_combout\ : std_logic;
SIGNAL \inst|iDL2|VGA_G[6]~1_combout\ : std_logic;
SIGNAL \inst|iDL2|VGA_G[6]~0_combout\ : std_logic;
SIGNAL \inst|iDL2|VGA_B[2]~5_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux20~0_combout\ : std_logic;
SIGNAL \inst|iDL1|LSPflag~2_combout\ : std_logic;
SIGNAL \inst|iDL1|VGA_B[2]~2_combout\ : std_logic;
SIGNAL \inst|iDL2|LessThan5~0_combout\ : std_logic;
SIGNAL \inst|iDL1|Add5~2_combout\ : std_logic;
SIGNAL \inst|iDL1|Add5~0_combout\ : std_logic;
SIGNAL \inst|iDL1|Add6~1_cout\ : std_logic;
SIGNAL \inst|iDL1|Add6~3\ : std_logic;
SIGNAL \inst|iDL1|Add6~5\ : std_logic;
SIGNAL \inst|iDL1|Add6~7\ : std_logic;
SIGNAL \inst|iDL1|Add6~9\ : std_logic;
SIGNAL \inst|iDL1|Add6~11\ : std_logic;
SIGNAL \inst|iDL1|Add6~13\ : std_logic;
SIGNAL \inst|iDL1|Add6~15\ : std_logic;
SIGNAL \inst|iDL1|Add6~17\ : std_logic;
SIGNAL \inst|iDL1|Add6~19\ : std_logic;
SIGNAL \inst|iDL1|Add6~21\ : std_logic;
SIGNAL \inst|iDL1|Add6~23\ : std_logic;
SIGNAL \inst|iDL1|Add6~25\ : std_logic;
SIGNAL \inst|iDL1|Add6~26_combout\ : std_logic;
SIGNAL \inst|iDL1|Add6~20_combout\ : std_logic;
SIGNAL \inst|iDL1|Add6~18_combout\ : std_logic;
SIGNAL \inst|iDL1|Add6~16_combout\ : std_logic;
SIGNAL \inst|iDL1|Add6~14_combout\ : std_logic;
SIGNAL \inst|iDL1|Add6~10_combout\ : std_logic;
SIGNAL \inst|iDL1|Add6~8_combout\ : std_logic;
SIGNAL \inst|iDL1|Add6~6_combout\ : std_logic;
SIGNAL \inst|iDL1|Add6~4_combout\ : std_logic;
SIGNAL \inst|iDL1|LessThan15~0_combout\ : std_logic;
SIGNAL \inst|iDL1|LessThan15~2_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan15~4_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan15~6_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan15~8_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan15~10_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan15~12_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan15~14_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan15~16_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan15~18_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan15~20_cout\ : std_logic;
SIGNAL \inst|iDL1|LessThan15~21_combout\ : std_logic;
SIGNAL \inst|iDL1|Add6~24_combout\ : std_logic;
SIGNAL \inst|iDL1|LessThan15~23_combout\ : std_logic;
SIGNAL \inst|iDL1|VGA_B[2]~3_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux21~0_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux22~0_combout\ : std_logic;
SIGNAL \inst2|VGA_B[2]~feeder_combout\ : std_logic;
SIGNAL \inst2|VGA_B[1]~feeder_combout\ : std_logic;
SIGNAL \inst2|VGA_B[0]~feeder_combout\ : std_logic;
SIGNAL \inst|iDL1|VGA_G[7]~1_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux8~0_combout\ : std_logic;
SIGNAL \inst|iDL2|VGA_G[6]~2_combout\ : std_logic;
SIGNAL \inst|iDL1|VGA_G[5]~2_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux9~0_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux10~0_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux11~0_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux12~0_combout\ : std_logic;
SIGNAL \inst2|VGA_G[5]~feeder_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux13~0_combout\ : std_logic;
SIGNAL \inst2|VGA_G[3]~feeder_combout\ : std_logic;
SIGNAL \inst2|VGA_G[2]~feeder_combout\ : std_logic;
SIGNAL \inst2|VGA_G[1]~feeder_combout\ : std_logic;
SIGNAL \inst|iDL2|VGA_R[7]~0_combout\ : std_logic;
SIGNAL \inst|iDL2|VGA_R[7]~1_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux0~0_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux1~0_combout\ : std_logic;
SIGNAL \inst2|VGA_R[7]~feeder_combout\ : std_logic;
SIGNAL \inst|iDL2|VGA_R[4]~2_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux3~0_combout\ : std_logic;
SIGNAL \inst2|VGA_R[5]~feeder_combout\ : std_logic;
SIGNAL \inst|iDL1|VGA_R[2]~1_combout\ : std_logic;
SIGNAL \inst|iVMux|Mux5~0_combout\ : std_logic;
SIGNAL \inst2|VGA_R[3]~feeder_combout\ : std_logic;
SIGNAL \inst2|VGA_R[2]~feeder_combout\ : std_logic;
SIGNAL \inst2|VGA_R[1]~feeder_combout\ : std_logic;
SIGNAL \inst2|VGA_R[0]~feeder_combout\ : std_logic;
SIGNAL \KEY~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|iDL2|rom_inst|altsyncram_component|auto_generated|address_reg_a\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst2|VGA_R\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst2|VGA_G\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst2|VGA_B\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|iDL1|rom_inst|altsyncram_component|auto_generated|address_reg_a\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|iVMCalc|counter\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst|iPipeLine|VGA_R2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|iPipeLine|VGA_R1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|iPipeLine|VGA_G2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|iPipeLine|VGA_G1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|iPipeLine|VGA_B2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|iPipeLine|VGA_B1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|iPipeLine|MuxAddress\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst_gen|yrow\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ALT_INV_CLOCK_50~clkctrl_outclk\ : std_logic;
SIGNAL \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\ : std_logic;
SIGNAL \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_CLOCK_50~combout\ : std_logic;
SIGNAL \ALT_INV_inst4~0_combout\ : std_logic;
SIGNAL \inst_gen|ALT_INV_yrow\ : std_logic_vector(5 DOWNTO 5);
SIGNAL \inst_gen|ALT_INV_xcolumn[0]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst_gen|ALT_INV_xcolumn[1]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst_gen|ALT_INV_xcolumn[2]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst_gen|ALT_INV_xcolumn[3]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst_gen|ALT_INV_xcolumn[4]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst_gen|ALT_INV_xcolumn[5]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst_gen|ALT_INV_xcolumn[6]~_Duplicate_2_regout\ : std_logic;
SIGNAL \inst_gen|ALT_INV_VGA_CLK~regout\ : std_logic;
SIGNAL \inst2|ALT_INV_VGA_SYNC~regout\ : std_logic;
SIGNAL \inst2|ALT_INV_VGA_VS~regout\ : std_logic;
SIGNAL \inst2|ALT_INV_VGA_HS~regout\ : std_logic;
SIGNAL \inst2|ALT_INV_VGA_BLANK~regout\ : std_logic;
SIGNAL \inst2|ALT_INV_VGA_CLK~regout\ : std_logic;

BEGIN

VGA_CLK <= ww_VGA_CLK;
ww_KEY <= KEY;
ww_CLOCK_50 <= CLOCK_50;
VGA_BLANK <= ww_VGA_BLANK;
VGA_HS <= ww_VGA_HS;
VGA_VS <= ww_VGA_VS;
VGA_SYNC <= ww_VGA_SYNC;
VGA_B <= ww_VGA_B;
VGA_G <= ww_VGA_G;
VGA_R <= ww_VGA_R;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\inst|iDL2|Mux2~2_combout\ & \inst|iDL2|Mux3~2_combout\ & \inst|iDL2|Mux4~2_combout\ & \inst|iDL2|Mux5~2_combout\ & \inst|iDL2|Mux6~2_combout\ & 
\inst|iDL2|Mux7~0_combout\ & \inst|iDL2|Mux8~0_combout\ & \inst|iDL2|Mux9~0_combout\ & \inst|iDL2|Mux10~0_combout\ & \inst|iDL2|Mux11~0_combout\ & \inst|iDL2|Mux12~0_combout\ & \inst|iDL2|Mux13~0_combout\);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a2~portadataout\ <= \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\inst|iDL2|Mux2~2_combout\ & \inst|iDL2|Mux3~2_combout\ & \inst|iDL2|Mux4~2_combout\ & \inst|iDL2|Mux5~2_combout\ & \inst|iDL2|Mux6~2_combout\ & 
\inst|iDL2|Mux7~0_combout\ & \inst|iDL2|Mux8~0_combout\ & \inst|iDL2|Mux9~0_combout\ & \inst|iDL2|Mux10~0_combout\ & \inst|iDL2|Mux11~0_combout\ & \inst|iDL2|Mux12~0_combout\ & \inst|iDL2|Mux13~0_combout\);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a4~portadataout\ <= \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\inst|iDL2|Mux2~2_combout\ & \inst|iDL2|Mux3~2_combout\ & \inst|iDL2|Mux4~2_combout\ & \inst|iDL2|Mux5~2_combout\ & \inst|iDL2|Mux6~2_combout\ & 
\inst|iDL2|Mux7~0_combout\ & \inst|iDL2|Mux8~0_combout\ & \inst|iDL2|Mux9~0_combout\ & \inst|iDL2|Mux10~0_combout\ & \inst|iDL2|Mux11~0_combout\ & \inst|iDL2|Mux12~0_combout\ & \inst|iDL2|Mux13~0_combout\);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a0~portadataout\ <= \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\inst|iDL2|Mux2~2_combout\ & \inst|iDL2|Mux3~2_combout\ & \inst|iDL2|Mux4~2_combout\ & \inst|iDL2|Mux5~2_combout\ & \inst|iDL2|Mux6~2_combout\ & 
\inst|iDL2|Mux7~0_combout\ & \inst|iDL2|Mux8~0_combout\ & \inst|iDL2|Mux9~0_combout\ & \inst|iDL2|Mux10~0_combout\ & \inst|iDL2|Mux11~0_combout\ & \inst|iDL2|Mux12~0_combout\ & \inst|iDL2|Mux13~0_combout\);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a6~portadataout\ <= \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\inst|iDL2|Mux2~2_combout\ & \inst|iDL2|Mux3~2_combout\ & \inst|iDL2|Mux4~2_combout\ & \inst|iDL2|Mux5~2_combout\ & \inst|iDL2|Mux6~2_combout\ & 
\inst|iDL2|Mux7~0_combout\ & \inst|iDL2|Mux8~0_combout\ & \inst|iDL2|Mux9~0_combout\ & \inst|iDL2|Mux10~0_combout\ & \inst|iDL2|Mux11~0_combout\ & \inst|iDL2|Mux12~0_combout\ & \inst|iDL2|Mux13~0_combout\);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a5~portadataout\ <= \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\(0);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\inst|iDL2|Mux2~2_combout\ & \inst|iDL2|Mux3~2_combout\ & \inst|iDL2|Mux4~2_combout\ & \inst|iDL2|Mux5~2_combout\ & \inst|iDL2|Mux6~2_combout\ & 
\inst|iDL2|Mux7~0_combout\ & \inst|iDL2|Mux8~0_combout\ & \inst|iDL2|Mux9~0_combout\ & \inst|iDL2|Mux10~0_combout\ & \inst|iDL2|Mux11~0_combout\ & \inst|iDL2|Mux12~0_combout\ & \inst|iDL2|Mux13~0_combout\);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a3~portadataout\ <= \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\(0);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\inst|iDL2|Mux2~2_combout\ & \inst|iDL2|Mux3~2_combout\ & \inst|iDL2|Mux4~2_combout\ & \inst|iDL2|Mux5~2_combout\ & \inst|iDL2|Mux6~2_combout\ & 
\inst|iDL2|Mux7~0_combout\ & \inst|iDL2|Mux8~0_combout\ & \inst|iDL2|Mux9~0_combout\ & \inst|iDL2|Mux10~0_combout\ & \inst|iDL2|Mux11~0_combout\ & \inst|iDL2|Mux12~0_combout\ & \inst|iDL2|Mux13~0_combout\);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a1~portadataout\ <= \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\(0);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\inst|iDL2|Mux2~2_combout\ & \inst|iDL2|Mux3~2_combout\ & \inst|iDL2|Mux4~2_combout\ & \inst|iDL2|Mux5~2_combout\ & \inst|iDL2|Mux6~2_combout\ & 
\inst|iDL2|Mux7~0_combout\ & \inst|iDL2|Mux8~0_combout\ & \inst|iDL2|Mux9~0_combout\ & \inst|iDL2|Mux10~0_combout\ & \inst|iDL2|Mux11~0_combout\ & \inst|iDL2|Mux12~0_combout\ & \inst|iDL2|Mux13~0_combout\);

\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a7~portadataout\ <= \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\(0);

\inst|iDL2|Mult1|auto_generated|mac_out2_DATAA_bus\ <= (\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT21\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT20\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT19\ & 
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT18\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT17\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT16\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT15\ & 
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT14\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT13\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT12\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT11\ & 
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT10\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT9\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT8\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT7\ & 
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT6\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT5\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT4\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT3\ & 
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT2\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT1\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~dataout\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~13\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~12\
& \inst|iDL2|Mult1|auto_generated|mac_mult1~11\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~10\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~9\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~8\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~7\ & 
\inst|iDL2|Mult1|auto_generated|mac_mult1~6\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~5\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~4\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~3\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~2\ & 
\inst|iDL2|Mult1|auto_generated|mac_mult1~1\ & \inst|iDL2|Mult1|auto_generated|mac_mult1~0\);

\inst|iDL2|Mult1|auto_generated|mac_out2~0\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(0);
\inst|iDL2|Mult1|auto_generated|mac_out2~1\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(1);
\inst|iDL2|Mult1|auto_generated|mac_out2~2\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(2);
\inst|iDL2|Mult1|auto_generated|mac_out2~3\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(3);
\inst|iDL2|Mult1|auto_generated|mac_out2~4\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(4);
\inst|iDL2|Mult1|auto_generated|mac_out2~5\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(5);
\inst|iDL2|Mult1|auto_generated|mac_out2~6\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(6);
\inst|iDL2|Mult1|auto_generated|mac_out2~7\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(7);
\inst|iDL2|Mult1|auto_generated|mac_out2~8\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(8);
\inst|iDL2|Mult1|auto_generated|mac_out2~9\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(9);
\inst|iDL2|Mult1|auto_generated|mac_out2~10\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(10);
\inst|iDL2|Mult1|auto_generated|mac_out2~11\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(11);
\inst|iDL2|Mult1|auto_generated|mac_out2~12\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(12);
\inst|iDL2|Mult1|auto_generated|mac_out2~13\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(13);
\inst|iDL2|Mult1|auto_generated|mac_out2~dataout\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(14);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT1\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(15);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT2\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(16);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT3\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(17);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT4\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(18);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT5\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(19);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT6\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(20);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT7\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(21);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT8\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(22);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT9\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(23);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT10\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(24);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT11\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(25);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT12\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(26);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT13\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(27);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT14\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(28);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(29);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT16\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(30);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(31);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT18\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(32);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(33);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT20\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(34);
\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\ <= \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\(35);

\inst|iDL2|Mult0|auto_generated|mac_out2_DATAA_bus\ <= (\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT19\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT18\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT17\ & 
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT16\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT15\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT14\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT13\ & 
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT12\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT11\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT10\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT9\ & 
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT8\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT7\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT6\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT5\ & 
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT4\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT3\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT2\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT1\ & 
\inst|iDL2|Mult0|auto_generated|mac_mult1~dataout\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~15\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~14\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~13\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~12\ & 
\inst|iDL2|Mult0|auto_generated|mac_mult1~11\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~10\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~9\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~8\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~7\ & 
\inst|iDL2|Mult0|auto_generated|mac_mult1~6\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~5\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~4\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~3\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~2\ & 
\inst|iDL2|Mult0|auto_generated|mac_mult1~1\ & \inst|iDL2|Mult0|auto_generated|mac_mult1~0\);

\inst|iDL2|Mult0|auto_generated|mac_out2~0\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(0);
\inst|iDL2|Mult0|auto_generated|mac_out2~1\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(1);
\inst|iDL2|Mult0|auto_generated|mac_out2~2\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(2);
\inst|iDL2|Mult0|auto_generated|mac_out2~3\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(3);
\inst|iDL2|Mult0|auto_generated|mac_out2~4\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(4);
\inst|iDL2|Mult0|auto_generated|mac_out2~5\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(5);
\inst|iDL2|Mult0|auto_generated|mac_out2~6\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(6);
\inst|iDL2|Mult0|auto_generated|mac_out2~7\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(7);
\inst|iDL2|Mult0|auto_generated|mac_out2~8\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(8);
\inst|iDL2|Mult0|auto_generated|mac_out2~9\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(9);
\inst|iDL2|Mult0|auto_generated|mac_out2~10\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(10);
\inst|iDL2|Mult0|auto_generated|mac_out2~11\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(11);
\inst|iDL2|Mult0|auto_generated|mac_out2~12\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(12);
\inst|iDL2|Mult0|auto_generated|mac_out2~13\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(13);
\inst|iDL2|Mult0|auto_generated|mac_out2~14\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(14);
\inst|iDL2|Mult0|auto_generated|mac_out2~15\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(15);
\inst|iDL2|Mult0|auto_generated|mac_out2~dataout\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(16);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT1\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(17);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT2\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(18);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT3\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(19);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT4\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(20);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT5\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(21);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT6\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(22);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT7\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(23);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT8\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(24);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT9\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(25);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT10\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(26);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT11\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(27);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT12\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(28);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT13\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(29);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT14\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(30);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT15\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(31);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT16\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(32);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT17\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(33);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT18\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(34);
\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT19\ <= \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\(35);

\inst|iDL1|Mult0|auto_generated|mac_out2_DATAA_bus\ <= (\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT21\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT20\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT19\ & 
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT18\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT17\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT16\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT15\ & 
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT14\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT13\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT12\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT11\ & 
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT10\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT9\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT8\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT7\ & 
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT6\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT5\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT4\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT3\ & 
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT2\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT1\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~dataout\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~13\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~12\
& \inst|iDL1|Mult0|auto_generated|mac_mult1~11\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~10\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~9\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~8\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~7\ & 
\inst|iDL1|Mult0|auto_generated|mac_mult1~6\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~5\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~4\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~3\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~2\ & 
\inst|iDL1|Mult0|auto_generated|mac_mult1~1\ & \inst|iDL1|Mult0|auto_generated|mac_mult1~0\);

\inst|iDL1|Mult0|auto_generated|mac_out2~0\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(0);
\inst|iDL1|Mult0|auto_generated|mac_out2~1\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(1);
\inst|iDL1|Mult0|auto_generated|mac_out2~2\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(2);
\inst|iDL1|Mult0|auto_generated|mac_out2~3\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(3);
\inst|iDL1|Mult0|auto_generated|mac_out2~4\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(4);
\inst|iDL1|Mult0|auto_generated|mac_out2~5\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(5);
\inst|iDL1|Mult0|auto_generated|mac_out2~6\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(6);
\inst|iDL1|Mult0|auto_generated|mac_out2~7\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(7);
\inst|iDL1|Mult0|auto_generated|mac_out2~8\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(8);
\inst|iDL1|Mult0|auto_generated|mac_out2~9\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(9);
\inst|iDL1|Mult0|auto_generated|mac_out2~10\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(10);
\inst|iDL1|Mult0|auto_generated|mac_out2~11\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(11);
\inst|iDL1|Mult0|auto_generated|mac_out2~12\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(12);
\inst|iDL1|Mult0|auto_generated|mac_out2~13\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(13);
\inst|iDL1|Mult0|auto_generated|mac_out2~dataout\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(14);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT1\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(15);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT2\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(16);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT3\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(17);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT4\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(18);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT5\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(19);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT6\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(20);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT7\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(21);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT8\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(22);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT9\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(23);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT10\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(24);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT11\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(25);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT12\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(26);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT13\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(27);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT14\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(28);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT15\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(29);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT16\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(30);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT17\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(31);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT18\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(32);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT19\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(33);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT20\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(34);
\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT21\ <= \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(35);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\inst|iDL1|Mux2~2_combout\ & \inst|iDL1|Mux3~2_combout\ & \inst|iDL1|Mux4~2_combout\ & \inst|iDL1|Mux5~2_combout\ & \inst|iDL1|Mux6~2_combout\ & 
\inst|iDL1|Mux7~0_combout\ & \inst|iDL1|Mux8~0_combout\ & \inst|iDL1|Mux9~0_combout\ & \inst|iDL1|Mux10~0_combout\ & \inst|iDL1|Mux11~0_combout\ & \inst|iDL1|Mux12~0_combout\ & \inst|iDL1|Mux13~0_combout\);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a2~portadataout\ <= \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\inst|iDL1|Mux2~2_combout\ & \inst|iDL1|Mux3~2_combout\ & \inst|iDL1|Mux4~2_combout\ & \inst|iDL1|Mux5~2_combout\ & \inst|iDL1|Mux6~2_combout\ & 
\inst|iDL1|Mux7~0_combout\ & \inst|iDL1|Mux8~0_combout\ & \inst|iDL1|Mux9~0_combout\ & \inst|iDL1|Mux10~0_combout\ & \inst|iDL1|Mux11~0_combout\ & \inst|iDL1|Mux12~0_combout\ & \inst|iDL1|Mux13~0_combout\);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a4~portadataout\ <= \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\inst|iDL1|Mux2~2_combout\ & \inst|iDL1|Mux3~2_combout\ & \inst|iDL1|Mux4~2_combout\ & \inst|iDL1|Mux5~2_combout\ & \inst|iDL1|Mux6~2_combout\ & 
\inst|iDL1|Mux7~0_combout\ & \inst|iDL1|Mux8~0_combout\ & \inst|iDL1|Mux9~0_combout\ & \inst|iDL1|Mux10~0_combout\ & \inst|iDL1|Mux11~0_combout\ & \inst|iDL1|Mux12~0_combout\ & \inst|iDL1|Mux13~0_combout\);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0~portadataout\ <= \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\inst|iDL1|Mux2~2_combout\ & \inst|iDL1|Mux3~2_combout\ & \inst|iDL1|Mux4~2_combout\ & \inst|iDL1|Mux5~2_combout\ & \inst|iDL1|Mux6~2_combout\ & 
\inst|iDL1|Mux7~0_combout\ & \inst|iDL1|Mux8~0_combout\ & \inst|iDL1|Mux9~0_combout\ & \inst|iDL1|Mux10~0_combout\ & \inst|iDL1|Mux11~0_combout\ & \inst|iDL1|Mux12~0_combout\ & \inst|iDL1|Mux13~0_combout\);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a6~portadataout\ <= \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\inst|iDL1|Mux2~2_combout\ & \inst|iDL1|Mux3~2_combout\ & \inst|iDL1|Mux4~2_combout\ & \inst|iDL1|Mux5~2_combout\ & \inst|iDL1|Mux6~2_combout\ & 
\inst|iDL1|Mux7~0_combout\ & \inst|iDL1|Mux8~0_combout\ & \inst|iDL1|Mux9~0_combout\ & \inst|iDL1|Mux10~0_combout\ & \inst|iDL1|Mux11~0_combout\ & \inst|iDL1|Mux12~0_combout\ & \inst|iDL1|Mux13~0_combout\);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a5~portadataout\ <= \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\(0);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\inst|iDL1|Mux2~2_combout\ & \inst|iDL1|Mux3~2_combout\ & \inst|iDL1|Mux4~2_combout\ & \inst|iDL1|Mux5~2_combout\ & \inst|iDL1|Mux6~2_combout\ & 
\inst|iDL1|Mux7~0_combout\ & \inst|iDL1|Mux8~0_combout\ & \inst|iDL1|Mux9~0_combout\ & \inst|iDL1|Mux10~0_combout\ & \inst|iDL1|Mux11~0_combout\ & \inst|iDL1|Mux12~0_combout\ & \inst|iDL1|Mux13~0_combout\);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a3~portadataout\ <= \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\(0);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\inst|iDL1|Mux2~2_combout\ & \inst|iDL1|Mux3~2_combout\ & \inst|iDL1|Mux4~2_combout\ & \inst|iDL1|Mux5~2_combout\ & \inst|iDL1|Mux6~2_combout\ & 
\inst|iDL1|Mux7~0_combout\ & \inst|iDL1|Mux8~0_combout\ & \inst|iDL1|Mux9~0_combout\ & \inst|iDL1|Mux10~0_combout\ & \inst|iDL1|Mux11~0_combout\ & \inst|iDL1|Mux12~0_combout\ & \inst|iDL1|Mux13~0_combout\);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a1~portadataout\ <= \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\(0);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\inst|iDL1|Mux2~2_combout\ & \inst|iDL1|Mux3~2_combout\ & \inst|iDL1|Mux4~2_combout\ & \inst|iDL1|Mux5~2_combout\ & \inst|iDL1|Mux6~2_combout\ & 
\inst|iDL1|Mux7~0_combout\ & \inst|iDL1|Mux8~0_combout\ & \inst|iDL1|Mux9~0_combout\ & \inst|iDL1|Mux10~0_combout\ & \inst|iDL1|Mux11~0_combout\ & \inst|iDL1|Mux12~0_combout\ & \inst|iDL1|Mux13~0_combout\);

\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a7~portadataout\ <= \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\(0);

\inst|iDL2|Mult1|auto_generated|mac_mult1_DATAA_bus\ <= (\inst|iDL2|Add0~4_combout\ & \inst|iDL2|Add0~3_combout\ & \inst|iDL2|Add0~2_combout\ & \inst|iDL2|Add0~1_combout\ & \inst|iDL2|Add0~0_combout\ & NOT \inst_gen|yrow\(5) & \inst_gen|yrow\(4) & 
\inst_gen|yrow\(3) & \inst_gen|yrow\(2) & \inst_gen|yrow\(1) & \inst_gen|yrow\(0) & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|iDL2|Mult1|auto_generated|mac_mult1_DATAB_bus\ <= (\inst|iDL2|Add0~4_combout\ & \inst|iDL2|Add0~3_combout\ & \inst|iDL2|Add0~2_combout\ & \inst|iDL2|Add0~1_combout\ & \inst|iDL2|Add0~0_combout\ & NOT \inst_gen|yrow\(5) & \inst_gen|yrow\(4) & 
\inst_gen|yrow\(3) & \inst_gen|yrow\(2) & \inst_gen|yrow\(1) & \inst_gen|yrow\(0) & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|iDL2|Mult1|auto_generated|mac_mult1~0\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(0);
\inst|iDL2|Mult1|auto_generated|mac_mult1~1\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(1);
\inst|iDL2|Mult1|auto_generated|mac_mult1~2\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(2);
\inst|iDL2|Mult1|auto_generated|mac_mult1~3\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(3);
\inst|iDL2|Mult1|auto_generated|mac_mult1~4\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(4);
\inst|iDL2|Mult1|auto_generated|mac_mult1~5\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(5);
\inst|iDL2|Mult1|auto_generated|mac_mult1~6\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(6);
\inst|iDL2|Mult1|auto_generated|mac_mult1~7\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(7);
\inst|iDL2|Mult1|auto_generated|mac_mult1~8\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(8);
\inst|iDL2|Mult1|auto_generated|mac_mult1~9\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(9);
\inst|iDL2|Mult1|auto_generated|mac_mult1~10\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(10);
\inst|iDL2|Mult1|auto_generated|mac_mult1~11\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(11);
\inst|iDL2|Mult1|auto_generated|mac_mult1~12\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(12);
\inst|iDL2|Mult1|auto_generated|mac_mult1~13\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(13);
\inst|iDL2|Mult1|auto_generated|mac_mult1~dataout\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(14);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT1\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(15);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT2\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(16);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT3\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(17);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT4\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(18);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT5\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(19);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT6\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(20);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT7\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(21);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT8\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(22);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT9\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(23);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT10\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(24);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT11\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(25);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT12\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(26);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT13\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(27);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT14\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(28);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT15\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(29);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT16\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(30);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT17\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(31);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT18\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(32);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT19\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(33);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT20\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(34);
\inst|iDL2|Mult1|auto_generated|mac_mult1~DATAOUT21\ <= \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(35);

\inst|iDL2|Mult0|auto_generated|mac_mult1_DATAA_bus\ <= (\inst_gen|gen:xcounter[10]~regout\ & \inst_gen|gen:xcounter[9]~regout\ & \inst_gen|gen:xcounter[8]~regout\ & \inst_gen|gen:xcounter[7]~regout\ & \inst_gen|gen:xcounter[6]~regout\ & 
\inst_gen|gen:xcounter[5]~regout\ & \inst_gen|gen:xcounter[4]~regout\ & \inst_gen|gen:xcounter[3]~regout\ & \inst_gen|gen:xcounter[2]~regout\ & \inst_gen|gen:xcounter[1]~regout\ & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|iDL2|Mult0|auto_generated|mac_mult1_DATAB_bus\ <= (\inst_gen|gen:xcounter[10]~regout\ & \inst_gen|gen:xcounter[9]~regout\ & \inst_gen|gen:xcounter[8]~regout\ & \inst_gen|gen:xcounter[7]~regout\ & \inst_gen|gen:xcounter[6]~regout\ & 
\inst_gen|gen:xcounter[5]~regout\ & \inst_gen|gen:xcounter[4]~regout\ & \inst_gen|gen:xcounter[3]~regout\ & \inst_gen|gen:xcounter[2]~regout\ & \inst_gen|gen:xcounter[1]~regout\ & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|iDL2|Mult0|auto_generated|mac_mult1~0\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(0);
\inst|iDL2|Mult0|auto_generated|mac_mult1~1\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(1);
\inst|iDL2|Mult0|auto_generated|mac_mult1~2\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(2);
\inst|iDL2|Mult0|auto_generated|mac_mult1~3\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(3);
\inst|iDL2|Mult0|auto_generated|mac_mult1~4\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(4);
\inst|iDL2|Mult0|auto_generated|mac_mult1~5\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(5);
\inst|iDL2|Mult0|auto_generated|mac_mult1~6\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(6);
\inst|iDL2|Mult0|auto_generated|mac_mult1~7\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(7);
\inst|iDL2|Mult0|auto_generated|mac_mult1~8\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(8);
\inst|iDL2|Mult0|auto_generated|mac_mult1~9\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(9);
\inst|iDL2|Mult0|auto_generated|mac_mult1~10\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(10);
\inst|iDL2|Mult0|auto_generated|mac_mult1~11\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(11);
\inst|iDL2|Mult0|auto_generated|mac_mult1~12\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(12);
\inst|iDL2|Mult0|auto_generated|mac_mult1~13\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(13);
\inst|iDL2|Mult0|auto_generated|mac_mult1~14\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(14);
\inst|iDL2|Mult0|auto_generated|mac_mult1~15\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(15);
\inst|iDL2|Mult0|auto_generated|mac_mult1~dataout\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(16);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT1\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(17);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT2\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(18);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT3\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(19);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT4\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(20);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT5\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(21);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT6\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(22);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT7\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(23);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT8\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(24);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT9\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(25);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT10\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(26);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT11\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(27);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT12\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(28);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT13\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(29);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT14\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(30);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT15\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(31);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT16\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(32);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT17\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(33);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT18\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(34);
\inst|iDL2|Mult0|auto_generated|mac_mult1~DATAOUT19\ <= \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(35);

\inst|iDL1|Mult0|auto_generated|mac_mult1_DATAA_bus\ <= (\inst|iDL2|LessThan9~0_combout\ & \inst|iDL1|Add0~0_combout\ & \inst|iDL1|Add0~1_combout\ & \inst_gen|xcolumn[7]~_Duplicate_2_regout\ & NOT \inst_gen|xcolumn[6]~_Duplicate_2_regout\ & NOT 
\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & NOT \inst_gen|xcolumn[4]~_Duplicate_2_regout\ & NOT \inst_gen|xcolumn[3]~_Duplicate_2_regout\ & NOT \inst_gen|xcolumn[2]~_Duplicate_2_regout\ & NOT \inst_gen|xcolumn[1]~_Duplicate_2_regout\ & NOT 
\inst_gen|xcolumn[0]~_Duplicate_2_regout\ & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|iDL1|Mult0|auto_generated|mac_mult1_DATAB_bus\ <= (\inst|iDL2|LessThan9~0_combout\ & \inst|iDL1|Add0~0_combout\ & \inst|iDL1|Add0~1_combout\ & \inst_gen|xcolumn[7]~_Duplicate_2_regout\ & NOT \inst_gen|xcolumn[6]~_Duplicate_2_regout\ & NOT 
\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & NOT \inst_gen|xcolumn[4]~_Duplicate_2_regout\ & NOT \inst_gen|xcolumn[3]~_Duplicate_2_regout\ & NOT \inst_gen|xcolumn[2]~_Duplicate_2_regout\ & NOT \inst_gen|xcolumn[1]~_Duplicate_2_regout\ & NOT 
\inst_gen|xcolumn[0]~_Duplicate_2_regout\ & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|iDL1|Mult0|auto_generated|mac_mult1~0\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(0);
\inst|iDL1|Mult0|auto_generated|mac_mult1~1\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(1);
\inst|iDL1|Mult0|auto_generated|mac_mult1~2\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(2);
\inst|iDL1|Mult0|auto_generated|mac_mult1~3\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(3);
\inst|iDL1|Mult0|auto_generated|mac_mult1~4\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(4);
\inst|iDL1|Mult0|auto_generated|mac_mult1~5\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(5);
\inst|iDL1|Mult0|auto_generated|mac_mult1~6\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(6);
\inst|iDL1|Mult0|auto_generated|mac_mult1~7\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(7);
\inst|iDL1|Mult0|auto_generated|mac_mult1~8\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(8);
\inst|iDL1|Mult0|auto_generated|mac_mult1~9\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(9);
\inst|iDL1|Mult0|auto_generated|mac_mult1~10\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(10);
\inst|iDL1|Mult0|auto_generated|mac_mult1~11\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(11);
\inst|iDL1|Mult0|auto_generated|mac_mult1~12\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(12);
\inst|iDL1|Mult0|auto_generated|mac_mult1~13\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(13);
\inst|iDL1|Mult0|auto_generated|mac_mult1~dataout\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(14);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT1\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(15);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT2\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(16);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT3\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(17);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT4\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(18);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT5\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(19);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT6\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(20);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT7\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(21);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT8\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(22);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT9\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(23);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT10\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(24);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT11\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(25);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT12\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(26);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT13\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(27);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT14\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(28);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT15\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(29);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT16\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(30);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT17\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(31);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT18\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(32);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT19\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(33);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT20\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(34);
\inst|iDL1|Mult0|auto_generated|mac_mult1~DATAOUT21\ <= \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(35);

\inst4~0clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \inst4~0_combout\);

\inst_gen|VGA_CLK~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \inst_gen|VGA_CLK~regout\);

\inst_gen|VGA_VS~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \inst_gen|VGA_VS~regout\);

\CLOCK_50~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLOCK_50~combout\);
\ALT_INV_CLOCK_50~clkctrl_outclk\ <= NOT \CLOCK_50~clkctrl_outclk\;
\inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\ <= NOT \inst_gen|VGA_VS~clkctrl_outclk\;
\inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\ <= NOT \inst_gen|VGA_CLK~clkctrl_outclk\;
\ALT_INV_CLOCK_50~combout\ <= NOT \CLOCK_50~combout\;
\ALT_INV_inst4~0_combout\ <= NOT \inst4~0_combout\;
\inst_gen|ALT_INV_yrow\(5) <= NOT \inst_gen|yrow\(5);
\inst_gen|ALT_INV_xcolumn[0]~_Duplicate_2_regout\ <= NOT \inst_gen|xcolumn[0]~_Duplicate_2_regout\;
\inst_gen|ALT_INV_xcolumn[1]~_Duplicate_2_regout\ <= NOT \inst_gen|xcolumn[1]~_Duplicate_2_regout\;
\inst_gen|ALT_INV_xcolumn[2]~_Duplicate_2_regout\ <= NOT \inst_gen|xcolumn[2]~_Duplicate_2_regout\;
\inst_gen|ALT_INV_xcolumn[3]~_Duplicate_2_regout\ <= NOT \inst_gen|xcolumn[3]~_Duplicate_2_regout\;
\inst_gen|ALT_INV_xcolumn[4]~_Duplicate_2_regout\ <= NOT \inst_gen|xcolumn[4]~_Duplicate_2_regout\;
\inst_gen|ALT_INV_xcolumn[5]~_Duplicate_2_regout\ <= NOT \inst_gen|xcolumn[5]~_Duplicate_2_regout\;
\inst_gen|ALT_INV_xcolumn[6]~_Duplicate_2_regout\ <= NOT \inst_gen|xcolumn[6]~_Duplicate_2_regout\;
\inst_gen|ALT_INV_VGA_CLK~regout\ <= NOT \inst_gen|VGA_CLK~regout\;
\inst2|ALT_INV_VGA_SYNC~regout\ <= NOT \inst2|VGA_SYNC~regout\;
\inst2|ALT_INV_VGA_VS~regout\ <= NOT \inst2|VGA_VS~regout\;
\inst2|ALT_INV_VGA_HS~regout\ <= NOT \inst2|VGA_HS~regout\;
\inst2|ALT_INV_VGA_BLANK~regout\ <= NOT \inst2|VGA_BLANK~regout\;
\inst2|ALT_INV_VGA_CLK~regout\ <= NOT \inst2|VGA_CLK~regout\;

-- Location: LCCOMB_X34_Y21_N0
\inst|iVMCalc|LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan0~1_cout\ = CARRY(\inst_gen|xcolumn[0]~_Duplicate_2_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datad => VCC,
	cout => \inst|iVMCalc|LessThan0~1_cout\);

-- Location: LCCOMB_X34_Y21_N2
\inst|iVMCalc|LessThan0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan0~3_cout\ = CARRY((\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & (\inst|iVMCalc|counter\(1) & !\inst|iVMCalc|LessThan0~1_cout\)) # (!\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & ((\inst|iVMCalc|counter\(1)) # 
-- (!\inst|iVMCalc|LessThan0~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(1),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan0~1_cout\,
	cout => \inst|iVMCalc|LessThan0~3_cout\);

-- Location: LCCOMB_X34_Y21_N4
\inst|iVMCalc|LessThan0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan0~5_cout\ = CARRY((\inst|iVMCalc|counter\(2) & (\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & !\inst|iVMCalc|LessThan0~3_cout\)) # (!\inst|iVMCalc|counter\(2) & ((\inst_gen|xcolumn[2]~_Duplicate_2_regout\) # 
-- (!\inst|iVMCalc|LessThan0~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(2),
	datab => \inst_gen|xcolumn[2]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan0~3_cout\,
	cout => \inst|iVMCalc|LessThan0~5_cout\);

-- Location: LCCOMB_X34_Y21_N6
\inst|iVMCalc|LessThan0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan0~7_cout\ = CARRY((\inst|iVMCalc|counter\(3) & ((!\inst|iVMCalc|LessThan0~5_cout\) # (!\inst_gen|xcolumn[3]~_Duplicate_2_regout\))) # (!\inst|iVMCalc|counter\(3) & (!\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & 
-- !\inst|iVMCalc|LessThan0~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(3),
	datab => \inst_gen|xcolumn[3]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan0~5_cout\,
	cout => \inst|iVMCalc|LessThan0~7_cout\);

-- Location: LCCOMB_X34_Y21_N8
\inst|iVMCalc|LessThan0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan0~9_cout\ = CARRY((\inst|iVMCalc|counter\(4) & (\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & !\inst|iVMCalc|LessThan0~7_cout\)) # (!\inst|iVMCalc|counter\(4) & ((\inst_gen|xcolumn[4]~_Duplicate_2_regout\) # 
-- (!\inst|iVMCalc|LessThan0~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(4),
	datab => \inst_gen|xcolumn[4]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan0~7_cout\,
	cout => \inst|iVMCalc|LessThan0~9_cout\);

-- Location: LCCOMB_X34_Y21_N10
\inst|iVMCalc|LessThan0~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan0~11_cout\ = CARRY((\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & (\inst|iVMCalc|counter\(5) & !\inst|iVMCalc|LessThan0~9_cout\)) # (!\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & ((\inst|iVMCalc|counter\(5)) # 
-- (!\inst|iVMCalc|LessThan0~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(5),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan0~9_cout\,
	cout => \inst|iVMCalc|LessThan0~11_cout\);

-- Location: LCCOMB_X34_Y21_N12
\inst|iVMCalc|LessThan0~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan0~13_cout\ = CARRY((\inst|iVMCalc|counter\(6) & (\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & !\inst|iVMCalc|LessThan0~11_cout\)) # (!\inst|iVMCalc|counter\(6) & ((\inst_gen|xcolumn[6]~_Duplicate_2_regout\) # 
-- (!\inst|iVMCalc|LessThan0~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(6),
	datab => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan0~11_cout\,
	cout => \inst|iVMCalc|LessThan0~13_cout\);

-- Location: LCCOMB_X34_Y21_N14
\inst|iVMCalc|LessThan0~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan0~15_cout\ = CARRY((\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & (\inst|iVMCalc|counter\(7) & !\inst|iVMCalc|LessThan0~13_cout\)) # (!\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & ((\inst|iVMCalc|counter\(7)) # 
-- (!\inst|iVMCalc|LessThan0~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(7),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan0~13_cout\,
	cout => \inst|iVMCalc|LessThan0~15_cout\);

-- Location: LCCOMB_X34_Y21_N16
\inst|iVMCalc|LessThan0~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan0~17_cout\ = CARRY((\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & ((!\inst|iVMCalc|LessThan0~15_cout\) # (!\inst|iVMCalc|counter\(8)))) # (!\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & (!\inst|iVMCalc|counter\(8) & 
-- !\inst|iVMCalc|LessThan0~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(8),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan0~15_cout\,
	cout => \inst|iVMCalc|LessThan0~17_cout\);

-- Location: LCCOMB_X34_Y21_N18
\inst|iVMCalc|LessThan0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan0~18_combout\ = (\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & ((\inst|iVMCalc|LessThan0~17_cout\) # (!\inst|iVMCalc|counter\(9)))) # (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & (\inst|iVMCalc|LessThan0~17_cout\ & 
-- !\inst|iVMCalc|counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datad => \inst|iVMCalc|counter\(9),
	cin => \inst|iVMCalc|LessThan0~17_cout\,
	combout => \inst|iVMCalc|LessThan0~18_combout\);

-- Location: LCFF_X34_Y24_N25
\inst|iVMCalc|counter[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[12]~53_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(12));

-- Location: LCFF_X34_Y23_N7
\inst|iVMCalc|counter[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[19]~67_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(19));

-- Location: LCFF_X34_Y23_N11
\inst|iVMCalc|counter[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[21]~71_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(21));

-- Location: LCFF_X34_Y23_N13
\inst|iVMCalc|counter[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[22]~73_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(22));

-- Location: LCFF_X34_Y23_N17
\inst|iVMCalc|counter[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[24]~77_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(24));

-- Location: LCFF_X34_Y23_N21
\inst|iVMCalc|counter[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[26]~81_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(26));

-- Location: LCFF_X34_Y23_N25
\inst|iVMCalc|counter[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[28]~85_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(28));

-- Location: LCCOMB_X31_Y22_N18
\inst|iVMCalc|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add0~4_combout\ = (\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & (\inst|iVMCalc|Add0~3\ $ (GND))) # (!\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & (!\inst|iVMCalc|Add0~3\ & VCC))
-- \inst|iVMCalc|Add0~5\ = CARRY((\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & !\inst|iVMCalc|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|Add0~3\,
	combout => \inst|iVMCalc|Add0~4_combout\,
	cout => \inst|iVMCalc|Add0~5\);

-- Location: LCCOMB_X31_Y22_N20
\inst|iVMCalc|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add0~6_combout\ = (\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & (!\inst|iVMCalc|Add0~5\)) # (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & ((\inst|iVMCalc|Add0~5\) # (GND)))
-- \inst|iVMCalc|Add0~7\ = CARRY((!\inst|iVMCalc|Add0~5\) # (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|Add0~5\,
	combout => \inst|iVMCalc|Add0~6_combout\,
	cout => \inst|iVMCalc|Add0~7\);

-- Location: LCCOMB_X31_Y22_N22
\inst|iVMCalc|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add0~8_combout\ = (\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & (\inst|iVMCalc|Add0~7\ $ (GND))) # (!\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & (!\inst|iVMCalc|Add0~7\ & VCC))
-- \inst|iVMCalc|Add0~9\ = CARRY((\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & !\inst|iVMCalc|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|Add0~7\,
	combout => \inst|iVMCalc|Add0~8_combout\,
	cout => \inst|iVMCalc|Add0~9\);

-- Location: LCCOMB_X31_Y22_N26
\inst|iVMCalc|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add0~12_combout\ = (\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & (\inst|iVMCalc|Add0~11\ $ (GND))) # (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & (!\inst|iVMCalc|Add0~11\ & VCC))
-- \inst|iVMCalc|Add0~13\ = CARRY((\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & !\inst|iVMCalc|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|Add0~11\,
	combout => \inst|iVMCalc|Add0~12_combout\,
	cout => \inst|iVMCalc|Add0~13\);

-- Location: LCCOMB_X31_Y22_N0
\inst|iVMCalc|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add1~0_combout\ = \inst_gen|xcolumn[5]~_Duplicate_2_regout\ $ (VCC)
-- \inst|iVMCalc|Add1~1\ = CARRY(\inst_gen|xcolumn[5]~_Duplicate_2_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	datad => VCC,
	combout => \inst|iVMCalc|Add1~0_combout\,
	cout => \inst|iVMCalc|Add1~1\);

-- Location: LCCOMB_X31_Y22_N2
\inst|iVMCalc|Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add1~2_combout\ = (\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & (!\inst|iVMCalc|Add1~1\)) # (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & ((\inst|iVMCalc|Add1~1\) # (GND)))
-- \inst|iVMCalc|Add1~3\ = CARRY((!\inst|iVMCalc|Add1~1\) # (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|Add1~1\,
	combout => \inst|iVMCalc|Add1~2_combout\,
	cout => \inst|iVMCalc|Add1~3\);

-- Location: LCCOMB_X31_Y22_N4
\inst|iVMCalc|Add1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add1~4_combout\ = (\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & (\inst|iVMCalc|Add1~3\ $ (GND))) # (!\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & (!\inst|iVMCalc|Add1~3\ & VCC))
-- \inst|iVMCalc|Add1~5\ = CARRY((\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & !\inst|iVMCalc|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|Add1~3\,
	combout => \inst|iVMCalc|Add1~4_combout\,
	cout => \inst|iVMCalc|Add1~5\);

-- Location: LCCOMB_X31_Y22_N6
\inst|iVMCalc|Add1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add1~6_combout\ = (\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & (!\inst|iVMCalc|Add1~5\)) # (!\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & ((\inst|iVMCalc|Add1~5\) # (GND)))
-- \inst|iVMCalc|Add1~7\ = CARRY((!\inst|iVMCalc|Add1~5\) # (!\inst_gen|xcolumn[8]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|Add1~5\,
	combout => \inst|iVMCalc|Add1~6_combout\,
	cout => \inst|iVMCalc|Add1~7\);

-- Location: LCCOMB_X31_Y22_N8
\inst|iVMCalc|Add1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add1~8_combout\ = (\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & (\inst|iVMCalc|Add1~7\ $ (GND))) # (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & (!\inst|iVMCalc|Add1~7\ & VCC))
-- \inst|iVMCalc|Add1~9\ = CARRY((\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & !\inst|iVMCalc|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|Add1~7\,
	combout => \inst|iVMCalc|Add1~8_combout\,
	cout => \inst|iVMCalc|Add1~9\);

-- Location: LCCOMB_X31_Y22_N10
\inst|iVMCalc|Add1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add1~10_combout\ = \inst|iVMCalc|Add1~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst|iVMCalc|Add1~9\,
	combout => \inst|iVMCalc|Add1~10_combout\);

-- Location: LCCOMB_X33_Y22_N14
\inst|iVMCalc|LessThan2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan2~1_cout\ = CARRY((!\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & \inst|iVMCalc|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(1),
	datad => VCC,
	cout => \inst|iVMCalc|LessThan2~1_cout\);

-- Location: LCCOMB_X33_Y22_N16
\inst|iVMCalc|LessThan2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan2~3_cout\ = CARRY((\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & ((!\inst|iVMCalc|LessThan2~1_cout\) # (!\inst|iVMCalc|counter\(2)))) # (!\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & (!\inst|iVMCalc|counter\(2) & 
-- !\inst|iVMCalc|LessThan2~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[2]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(2),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan2~1_cout\,
	cout => \inst|iVMCalc|LessThan2~3_cout\);

-- Location: LCCOMB_X33_Y22_N18
\inst|iVMCalc|LessThan2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan2~5_cout\ = CARRY((\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & (\inst|iVMCalc|counter\(3) & !\inst|iVMCalc|LessThan2~3_cout\)) # (!\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & ((\inst|iVMCalc|counter\(3)) # 
-- (!\inst|iVMCalc|LessThan2~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[3]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(3),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan2~3_cout\,
	cout => \inst|iVMCalc|LessThan2~5_cout\);

-- Location: LCCOMB_X33_Y22_N20
\inst|iVMCalc|LessThan2~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan2~7_cout\ = CARRY((\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & ((!\inst|iVMCalc|LessThan2~5_cout\) # (!\inst|iVMCalc|counter\(4)))) # (!\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & (!\inst|iVMCalc|counter\(4) & 
-- !\inst|iVMCalc|LessThan2~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[4]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(4),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan2~5_cout\,
	cout => \inst|iVMCalc|LessThan2~7_cout\);

-- Location: LCCOMB_X33_Y22_N22
\inst|iVMCalc|LessThan2~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan2~9_cout\ = CARRY((\inst|iVMCalc|counter\(5) & ((!\inst|iVMCalc|LessThan2~7_cout\) # (!\inst_gen|xcolumn[5]~_Duplicate_2_regout\))) # (!\inst|iVMCalc|counter\(5) & (!\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & 
-- !\inst|iVMCalc|LessThan2~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(5),
	datab => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan2~7_cout\,
	cout => \inst|iVMCalc|LessThan2~9_cout\);

-- Location: LCCOMB_X33_Y22_N24
\inst|iVMCalc|LessThan2~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan2~11_cout\ = CARRY((\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & ((!\inst|iVMCalc|LessThan2~9_cout\) # (!\inst|iVMCalc|counter\(6)))) # (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & (!\inst|iVMCalc|counter\(6) & 
-- !\inst|iVMCalc|LessThan2~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(6),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan2~9_cout\,
	cout => \inst|iVMCalc|LessThan2~11_cout\);

-- Location: LCCOMB_X33_Y22_N26
\inst|iVMCalc|LessThan2~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan2~13_cout\ = CARRY((\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & (\inst|iVMCalc|counter\(7) & !\inst|iVMCalc|LessThan2~11_cout\)) # (!\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & ((\inst|iVMCalc|counter\(7)) # 
-- (!\inst|iVMCalc|LessThan2~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(7),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan2~11_cout\,
	cout => \inst|iVMCalc|LessThan2~13_cout\);

-- Location: LCCOMB_X33_Y22_N28
\inst|iVMCalc|LessThan2~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan2~15_cout\ = CARRY((\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & ((!\inst|iVMCalc|LessThan2~13_cout\) # (!\inst|iVMCalc|counter\(8)))) # (!\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & (!\inst|iVMCalc|counter\(8) & 
-- !\inst|iVMCalc|LessThan2~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(8),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan2~13_cout\,
	cout => \inst|iVMCalc|LessThan2~15_cout\);

-- Location: LCCOMB_X33_Y22_N30
\inst|iVMCalc|LessThan2~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan2~16_combout\ = (\inst|iVMCalc|counter\(9) & ((!\inst_gen|xcolumn[9]~_Duplicate_2_regout\) # (!\inst|iVMCalc|LessThan2~15_cout\))) # (!\inst|iVMCalc|counter\(9) & (!\inst|iVMCalc|LessThan2~15_cout\ & 
-- !\inst_gen|xcolumn[9]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(9),
	datad => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	cin => \inst|iVMCalc|LessThan2~15_cout\,
	combout => \inst|iVMCalc|LessThan2~16_combout\);

-- Location: LCCOMB_X30_Y20_N0
\inst|iDL2|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~0_combout\ = \inst_gen|yrow\(0) $ (\inst_gen|xcolumn[0]~_Duplicate_2_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(0),
	datad => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	combout => \inst|iDL2|Add1~0_combout\);

-- Location: M4K_X52_Y19
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a2\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003E000000000000000000000000000001FFC00000000000000000000000000003FFF0000000000000000000000000000FFFFC000000000000000000000000001FFFFE000000000000000000000000003FFFFF00000000000000000",
	mem_init0 => X"0000000007FFFFF80000000000000000000000000FFFFFF80000000000000000000000000FFF0FFC0000000000000000000000001FFE03FC0000000000000000000000003FF801FE0000000000000000000000007FF000FE0000000000000000000000007FF000FF000000000000000000000000FFE0007F000000000000000000000001FFC0007F000000000000000000000001FF80007F000000000000000000000003FF80007F000000000000000000000003FF00007F000000000000000000000007FE00007F000000000000000000000007FE0000FF00000000000000000000000FFC0000FF00000000000000000000000FF80000FF0000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL2|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~0_combout\,
	portaaddr => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

-- Location: M4K_X26_Y18
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a4\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000001FE00007FE00000000000000000000001FE0000FFC00000000000000000000001FE0000FFC00000000000000000000001FC0001FF800000000000000000000001FC0003FF800000000000000000000001FC0003FF000000000000000000000001FC0007FF000000000000000000000001FC000FFE000000000000000000000000FE001FFC000000000000000000000000FE001FFC000000000000000000000000FF003FF80000000000000000000000007F80FFF00000000000000000000000007FE3FFF00000000000000000000000003FFFFFE00000000000000000000000003FFFFFC00000000000000000000000001FFFFF800000000",
	mem_init0 => X"000000000000000000FFFFF0000000000000000000000000003FFFE0000000000000000000000000001FFF800000000000000000000000000007FE0000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL2|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~1_combout\,
	portaaddr => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

-- Location: M4K_X13_Y20
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a0\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"0000001FF80001FF00000000000000000000001FF00001FE00000000000000000000003FF00003FE00000000000000000000003FE00003FE00000000000000000000003FE00007FC00000000000000000000003FC00007FC00000000000000000000007FC0000FFC00000000000000000000007FC0000FF800000000000000000000007F80001FF800000000000000000000007F80003FF000000000000000000000007F80003FF000000000000000000000007F00007FE000000000000000000000007F0000FFE000000000000000000000007F0000FFC000000000000000000000007F0001FFC000000000000000000000007F0003FF800000000000000000",
	mem_init0 => X"0000003F8007FF0000000000000000000000003F8007FF0000000000000000000000003FC00FFE0000000000000000000000001FE03FFC0000000000000000000000001FF8FFFC0000000000000000000000000FFFFFF80000000000000000000000000FFFFFF000000000000000000000000007FFFFE000000000000000000000000003FFFFC000000000000000000000000000FFFF80000000000000000000000000007FFE00000000000000000000000000001FF80000000000000000000000000000018000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL2|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode45w[2]~0_combout\,
	portaaddr => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: M4K_X26_Y19
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a6\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000F8000000000000000000000000000007FF00000000000000000000000000000FFFC0000000000000000000000000003FFFF0000000000000000000000000007FFFF800000000000000000000000000FFFFFC00000000000000000000000001FFFFFE00000000000000000000000003FFFFFE00000000000000000000000003FFC3FF00000000000000000000000007FF80FF0000000000000000000000000FFE007F8000000000000000000000001FFC003F8000000000000000000000001FFC003FC000000000000000000000003FF8001FC00000",
	mem_init0 => X"0000000000000000007FF0001FC000000000000000000000007FE0001FC00000000000000000000000FFE0001FC00000000000000000000000FFC0001FC00000000000000000000001FF80001FC00000000000000000000001FF80003FC00000000000000000000003FF00003FC00000000000000000000003FE00003FC00000000000000000000007FE00007FC00000000000000000000007FC00007F80000000000000000000000FFC0000FF80000000000000000000000FF80000FF80000000000000000000000FF80001FF00000000000000000000000FF00001FF00000000000000000000001FF00003FF00000000000000000000001FF00003FE000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL2|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~2_combout\,
	portaaddr => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

-- Location: M4K_X13_Y19
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a3\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000078000000000000000000000000000000F8000000000000000000000600000001FC000000000000000000001F80000003FC000000000000000000003FC0000003F8000000000000000000007FE0000007F800000000000000000000FFF8000007F8",
	mem_init0 => X"00000000000000000000FFFC000007F800000000000000000001FFFE00000FF800000000000000000001FFFF80000FF000000000000000000001FFFFC0000FF000000000000000000001FFFFE0000FF000000000000000000001FFFFF8000FF000000000000000000001FFFFFC001FE000000000000000000001FFFFFE001FE000000000000000000000FFFFFF001FE0000000000000000000007FFFFFC01FE0000000000000000000003FFFFFE01FE0000000000000000000000FFFFFF01FC00000000000000000000007FFFFFC3FC00000000000000000000003FFFFFE3FC00000000000000000000000FFFFFF3FC000000000000000000000007FFFFFFFC0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL2|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~0_combout\,
	portaaddr => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\);

-- Location: M4K_X26_Y20
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a7\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0030000000000000000000000000000000FC000000000000000000000000000001FE000000000000000000000000000001FF800000000000000000000000000003FFC00000000000000000000000000007FFE00000000000000000000000000007FFF80000000000000000000000000007FFFC0000000000000000000000000007FFFE0000000000000000000000000007FFFF8000000000000000000000000007FFFFC000000000000000000000000007FFFFE000000000000000000000000003FFFFF800000000000000000000000003FFFFFC00000000000000000000000003FFFFFE00000000000000000000000003FFFFFF800000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL2|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~2_combout\,
	portaaddr => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\);

-- Location: DSPOUT_X39_Y19_N2
\inst|iDL2|Mult1|auto_generated|mac_out2\ : cycloneii_mac_out
-- pragma translate_off
GENERIC MAP (
	dataa_width => 36,
	output_clock => "none")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2_DATAA_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \inst|iDL2|Mult1|auto_generated|mac_out2_DATAOUT_bus\);

-- Location: DSPOUT_X39_Y18_N2
\inst|iDL2|Mult0|auto_generated|mac_out2\ : cycloneii_mac_out
-- pragma translate_off
GENERIC MAP (
	dataa_width => 36,
	output_clock => "none")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult0|auto_generated|mac_out2_DATAA_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \inst|iDL2|Mult0|auto_generated|mac_out2_DATAOUT_bus\);

-- Location: LCCOMB_X38_Y18_N12
\inst|iDL2|Add1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~3_cout\ = CARRY((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT2\ & \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT2\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT2\,
	datad => VCC,
	cout => \inst|iDL2|Add1~3_cout\);

-- Location: LCCOMB_X38_Y18_N14
\inst|iDL2|Add1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~5_cout\ = CARRY((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT3\ & (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT3\ & !\inst|iDL2|Add1~3_cout\)) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT3\ & ((!\inst|iDL2|Add1~3_cout\) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT3\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT3\,
	datad => VCC,
	cin => \inst|iDL2|Add1~3_cout\,
	cout => \inst|iDL2|Add1~5_cout\);

-- Location: LCCOMB_X38_Y18_N16
\inst|iDL2|Add1~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~7_cout\ = CARRY((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT4\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT4\) # (!\inst|iDL2|Add1~5_cout\))) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT4\ & 
-- (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT4\ & !\inst|iDL2|Add1~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT4\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT4\,
	datad => VCC,
	cin => \inst|iDL2|Add1~5_cout\,
	cout => \inst|iDL2|Add1~7_cout\);

-- Location: LCCOMB_X38_Y18_N18
\inst|iDL2|Add1~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~9_cout\ = CARRY((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT5\ & (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT5\ & !\inst|iDL2|Add1~7_cout\)) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT5\ & ((!\inst|iDL2|Add1~7_cout\) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT5\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT5\,
	datad => VCC,
	cin => \inst|iDL2|Add1~7_cout\,
	cout => \inst|iDL2|Add1~9_cout\);

-- Location: LCCOMB_X38_Y18_N20
\inst|iDL2|Add1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~10_combout\ = ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT6\ $ (\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT6\ $ (!\inst|iDL2|Add1~9_cout\)))) # (GND)
-- \inst|iDL2|Add1~11\ = CARRY((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT6\ & ((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT6\) # (!\inst|iDL2|Add1~9_cout\))) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT6\ & 
-- (\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT6\ & !\inst|iDL2|Add1~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT6\,
	datab => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT6\,
	datad => VCC,
	cin => \inst|iDL2|Add1~9_cout\,
	combout => \inst|iDL2|Add1~10_combout\,
	cout => \inst|iDL2|Add1~11\);

-- Location: LCCOMB_X38_Y18_N22
\inst|iDL2|Add1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~12_combout\ = (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT7\ & ((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT7\ & (\inst|iDL2|Add1~11\ & VCC)) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT7\ & (!\inst|iDL2|Add1~11\)))) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT7\ & ((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT7\ & (!\inst|iDL2|Add1~11\)) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT7\ & ((\inst|iDL2|Add1~11\) # (GND)))))
-- \inst|iDL2|Add1~13\ = CARRY((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT7\ & (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT7\ & !\inst|iDL2|Add1~11\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT7\ & ((!\inst|iDL2|Add1~11\) # 
-- (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT7\,
	datab => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT7\,
	datad => VCC,
	cin => \inst|iDL2|Add1~11\,
	combout => \inst|iDL2|Add1~12_combout\,
	cout => \inst|iDL2|Add1~13\);

-- Location: LCCOMB_X38_Y18_N24
\inst|iDL2|Add1~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~14_combout\ = ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT8\ $ (\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT8\ $ (!\inst|iDL2|Add1~13\)))) # (GND)
-- \inst|iDL2|Add1~15\ = CARRY((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT8\ & ((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT8\) # (!\inst|iDL2|Add1~13\))) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT8\ & 
-- (\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT8\ & !\inst|iDL2|Add1~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT8\,
	datab => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT8\,
	datad => VCC,
	cin => \inst|iDL2|Add1~13\,
	combout => \inst|iDL2|Add1~14_combout\,
	cout => \inst|iDL2|Add1~15\);

-- Location: LCCOMB_X38_Y18_N26
\inst|iDL2|Add1~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~16_combout\ = (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT9\ & ((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT9\ & (\inst|iDL2|Add1~15\ & VCC)) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT9\ & (!\inst|iDL2|Add1~15\)))) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT9\ & ((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT9\ & (!\inst|iDL2|Add1~15\)) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT9\ & ((\inst|iDL2|Add1~15\) # (GND)))))
-- \inst|iDL2|Add1~17\ = CARRY((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT9\ & (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT9\ & !\inst|iDL2|Add1~15\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT9\ & ((!\inst|iDL2|Add1~15\) # 
-- (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT9\,
	datab => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT9\,
	datad => VCC,
	cin => \inst|iDL2|Add1~15\,
	combout => \inst|iDL2|Add1~16_combout\,
	cout => \inst|iDL2|Add1~17\);

-- Location: LCCOMB_X38_Y18_N28
\inst|iDL2|Add1~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~18_combout\ = ((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT10\ $ (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT10\ $ (!\inst|iDL2|Add1~17\)))) # (GND)
-- \inst|iDL2|Add1~19\ = CARRY((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT10\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT10\) # (!\inst|iDL2|Add1~17\))) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT10\ & 
-- (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT10\ & !\inst|iDL2|Add1~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT10\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT10\,
	datad => VCC,
	cin => \inst|iDL2|Add1~17\,
	combout => \inst|iDL2|Add1~18_combout\,
	cout => \inst|iDL2|Add1~19\);

-- Location: LCCOMB_X38_Y18_N30
\inst|iDL2|Add1~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~20_combout\ = (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT11\ & ((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT11\ & (\inst|iDL2|Add1~19\ & VCC)) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT11\ & (!\inst|iDL2|Add1~19\)))) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT11\ & ((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT11\ & (!\inst|iDL2|Add1~19\)) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT11\ & ((\inst|iDL2|Add1~19\) # (GND)))))
-- \inst|iDL2|Add1~21\ = CARRY((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT11\ & (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT11\ & !\inst|iDL2|Add1~19\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT11\ & ((!\inst|iDL2|Add1~19\) # 
-- (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT11\,
	datab => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT11\,
	datad => VCC,
	cin => \inst|iDL2|Add1~19\,
	combout => \inst|iDL2|Add1~20_combout\,
	cout => \inst|iDL2|Add1~21\);

-- Location: LCCOMB_X38_Y17_N0
\inst|iDL2|Add1~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~22_combout\ = ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT12\ $ (\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT12\ $ (!\inst|iDL2|Add1~21\)))) # (GND)
-- \inst|iDL2|Add1~23\ = CARRY((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT12\ & ((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT12\) # (!\inst|iDL2|Add1~21\))) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT12\ & 
-- (\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT12\ & !\inst|iDL2|Add1~21\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT12\,
	datab => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT12\,
	datad => VCC,
	cin => \inst|iDL2|Add1~21\,
	combout => \inst|iDL2|Add1~22_combout\,
	cout => \inst|iDL2|Add1~23\);

-- Location: LCCOMB_X38_Y17_N2
\inst|iDL2|Add1~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~24_combout\ = (\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT13\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT13\ & (\inst|iDL2|Add1~23\ & VCC)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT13\ & (!\inst|iDL2|Add1~23\)))) # 
-- (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT13\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT13\ & (!\inst|iDL2|Add1~23\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT13\ & ((\inst|iDL2|Add1~23\) # (GND)))))
-- \inst|iDL2|Add1~25\ = CARRY((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT13\ & (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT13\ & !\inst|iDL2|Add1~23\)) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT13\ & ((!\inst|iDL2|Add1~23\) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT13\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT13\,
	datad => VCC,
	cin => \inst|iDL2|Add1~23\,
	combout => \inst|iDL2|Add1~24_combout\,
	cout => \inst|iDL2|Add1~25\);

-- Location: LCCOMB_X38_Y17_N4
\inst|iDL2|Add1~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~26_combout\ = ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT14\ $ (\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT14\ $ (!\inst|iDL2|Add1~25\)))) # (GND)
-- \inst|iDL2|Add1~27\ = CARRY((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT14\ & ((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT14\) # (!\inst|iDL2|Add1~25\))) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT14\ & 
-- (\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT14\ & !\inst|iDL2|Add1~25\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT14\,
	datab => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT14\,
	datad => VCC,
	cin => \inst|iDL2|Add1~25\,
	combout => \inst|iDL2|Add1~26_combout\,
	cout => \inst|iDL2|Add1~27\);

-- Location: LCCOMB_X38_Y17_N6
\inst|iDL2|Add1~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~28_combout\ = (\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT15\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\ & (\inst|iDL2|Add1~27\ & VCC)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\ & (!\inst|iDL2|Add1~27\)))) # 
-- (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT15\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\ & (!\inst|iDL2|Add1~27\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\ & ((\inst|iDL2|Add1~27\) # (GND)))))
-- \inst|iDL2|Add1~29\ = CARRY((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT15\ & (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\ & !\inst|iDL2|Add1~27\)) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT15\ & ((!\inst|iDL2|Add1~27\) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT15\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\,
	datad => VCC,
	cin => \inst|iDL2|Add1~27\,
	combout => \inst|iDL2|Add1~28_combout\,
	cout => \inst|iDL2|Add1~29\);

-- Location: LCCOMB_X38_Y17_N8
\inst|iDL2|Add1~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~30_combout\ = ((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT16\ $ (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT16\ $ (!\inst|iDL2|Add1~29\)))) # (GND)
-- \inst|iDL2|Add1~31\ = CARRY((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT16\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT16\) # (!\inst|iDL2|Add1~29\))) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT16\ & 
-- (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT16\ & !\inst|iDL2|Add1~29\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT16\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT16\,
	datad => VCC,
	cin => \inst|iDL2|Add1~29\,
	combout => \inst|iDL2|Add1~30_combout\,
	cout => \inst|iDL2|Add1~31\);

-- Location: LCCOMB_X38_Y17_N10
\inst|iDL2|Add1~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~32_combout\ = (\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT17\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\ & (\inst|iDL2|Add1~31\ & VCC)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\ & (!\inst|iDL2|Add1~31\)))) # 
-- (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT17\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\ & (!\inst|iDL2|Add1~31\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\ & ((\inst|iDL2|Add1~31\) # (GND)))))
-- \inst|iDL2|Add1~33\ = CARRY((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT17\ & (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\ & !\inst|iDL2|Add1~31\)) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT17\ & ((!\inst|iDL2|Add1~31\) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT17\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\,
	datad => VCC,
	cin => \inst|iDL2|Add1~31\,
	combout => \inst|iDL2|Add1~32_combout\,
	cout => \inst|iDL2|Add1~33\);

-- Location: LCCOMB_X38_Y17_N12
\inst|iDL2|Add1~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~34_combout\ = ((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT18\ $ (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT18\ $ (!\inst|iDL2|Add1~33\)))) # (GND)
-- \inst|iDL2|Add1~35\ = CARRY((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT18\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT18\) # (!\inst|iDL2|Add1~33\))) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT18\ & 
-- (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT18\ & !\inst|iDL2|Add1~33\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT18\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT18\,
	datad => VCC,
	cin => \inst|iDL2|Add1~33\,
	combout => \inst|iDL2|Add1~34_combout\,
	cout => \inst|iDL2|Add1~35\);

-- Location: LCCOMB_X38_Y17_N14
\inst|iDL2|Add1~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~36_combout\ = (\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT19\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\ & (\inst|iDL2|Add1~35\ & VCC)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\ & (!\inst|iDL2|Add1~35\)))) # 
-- (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT19\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\ & (!\inst|iDL2|Add1~35\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\ & ((\inst|iDL2|Add1~35\) # (GND)))))
-- \inst|iDL2|Add1~37\ = CARRY((\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT19\ & (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\ & !\inst|iDL2|Add1~35\)) # (!\inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT19\ & ((!\inst|iDL2|Add1~35\) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult0|auto_generated|mac_out2~DATAOUT19\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\,
	datad => VCC,
	cin => \inst|iDL2|Add1~35\,
	combout => \inst|iDL2|Add1~36_combout\,
	cout => \inst|iDL2|Add1~37\);

-- Location: LCCOMB_X38_Y17_N16
\inst|iDL2|Add1~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~38_combout\ = (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT20\ & (\inst|iDL2|Add1~37\ $ (GND))) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT20\ & (!\inst|iDL2|Add1~37\ & VCC))
-- \inst|iDL2|Add1~39\ = CARRY((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT20\ & !\inst|iDL2|Add1~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT20\,
	datad => VCC,
	cin => \inst|iDL2|Add1~37\,
	combout => \inst|iDL2|Add1~38_combout\,
	cout => \inst|iDL2|Add1~39\);

-- Location: LCCOMB_X38_Y17_N18
\inst|iDL2|Add1~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~40_combout\ = (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\ & (!\inst|iDL2|Add1~39\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\ & ((\inst|iDL2|Add1~39\) # (GND)))
-- \inst|iDL2|Add1~41\ = CARRY((!\inst|iDL2|Add1~39\) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\,
	datad => VCC,
	cin => \inst|iDL2|Add1~39\,
	combout => \inst|iDL2|Add1~40_combout\,
	cout => \inst|iDL2|Add1~41\);

-- Location: LCCOMB_X38_Y17_N20
\inst|iDL2|Add1~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add1~42_combout\ = \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\ $ (!\inst|iDL2|Add1~41\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\,
	cin => \inst|iDL2|Add1~41\,
	combout => \inst|iDL2|Add1~42_combout\);

-- Location: LCCOMB_X33_Y19_N12
\inst|iDL2|Add2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add2~4_combout\ = ((\inst_gen|yrow\(4) $ (\inst_gen|yrow\(2) $ (!\inst|iDL2|Add2~3\)))) # (GND)
-- \inst|iDL2|Add2~5\ = CARRY((\inst_gen|yrow\(4) & ((\inst_gen|yrow\(2)) # (!\inst|iDL2|Add2~3\))) # (!\inst_gen|yrow\(4) & (\inst_gen|yrow\(2) & !\inst|iDL2|Add2~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(4),
	datab => \inst_gen|yrow\(2),
	datad => VCC,
	cin => \inst|iDL2|Add2~3\,
	combout => \inst|iDL2|Add2~4_combout\,
	cout => \inst|iDL2|Add2~5\);

-- Location: LCCOMB_X33_Y19_N14
\inst|iDL2|Add2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add2~6_combout\ = (\inst_gen|yrow\(3) & ((\inst_gen|yrow\(5) & (\inst|iDL2|Add2~5\ & VCC)) # (!\inst_gen|yrow\(5) & (!\inst|iDL2|Add2~5\)))) # (!\inst_gen|yrow\(3) & ((\inst_gen|yrow\(5) & (!\inst|iDL2|Add2~5\)) # (!\inst_gen|yrow\(5) & 
-- ((\inst|iDL2|Add2~5\) # (GND)))))
-- \inst|iDL2|Add2~7\ = CARRY((\inst_gen|yrow\(3) & (!\inst_gen|yrow\(5) & !\inst|iDL2|Add2~5\)) # (!\inst_gen|yrow\(3) & ((!\inst|iDL2|Add2~5\) # (!\inst_gen|yrow\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(3),
	datab => \inst_gen|yrow\(5),
	datad => VCC,
	cin => \inst|iDL2|Add2~5\,
	combout => \inst|iDL2|Add2~6_combout\,
	cout => \inst|iDL2|Add2~7\);

-- Location: LCCOMB_X33_Y19_N18
\inst|iDL2|Add2~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add2~10_combout\ = (\inst_gen|yrow\(7) & ((\inst_gen|yrow\(5) & (\inst|iDL2|Add2~9\ & VCC)) # (!\inst_gen|yrow\(5) & (!\inst|iDL2|Add2~9\)))) # (!\inst_gen|yrow\(7) & ((\inst_gen|yrow\(5) & (!\inst|iDL2|Add2~9\)) # (!\inst_gen|yrow\(5) & 
-- ((\inst|iDL2|Add2~9\) # (GND)))))
-- \inst|iDL2|Add2~11\ = CARRY((\inst_gen|yrow\(7) & (!\inst_gen|yrow\(5) & !\inst|iDL2|Add2~9\)) # (!\inst_gen|yrow\(7) & ((!\inst|iDL2|Add2~9\) # (!\inst_gen|yrow\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(7),
	datab => \inst_gen|yrow\(5),
	datad => VCC,
	cin => \inst|iDL2|Add2~9\,
	combout => \inst|iDL2|Add2~10_combout\,
	cout => \inst|iDL2|Add2~11\);

-- Location: LCCOMB_X33_Y19_N24
\inst|iDL2|Add2~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add2~16_combout\ = (\inst_gen|yrow\(8) & (\inst|iDL2|Add2~15\ $ (GND))) # (!\inst_gen|yrow\(8) & (!\inst|iDL2|Add2~15\ & VCC))
-- \inst|iDL2|Add2~17\ = CARRY((\inst_gen|yrow\(8) & !\inst|iDL2|Add2~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(8),
	datad => VCC,
	cin => \inst|iDL2|Add2~15\,
	combout => \inst|iDL2|Add2~16_combout\,
	cout => \inst|iDL2|Add2~17\);

-- Location: LCCOMB_X33_Y19_N26
\inst|iDL2|Add2~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add2~18_combout\ = (\inst_gen|yrow\(9) & (!\inst|iDL2|Add2~17\)) # (!\inst_gen|yrow\(9) & ((\inst|iDL2|Add2~17\) # (GND)))
-- \inst|iDL2|Add2~19\ = CARRY((!\inst|iDL2|Add2~17\) # (!\inst_gen|yrow\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(9),
	datad => VCC,
	cin => \inst|iDL2|Add2~17\,
	combout => \inst|iDL2|Add2~18_combout\,
	cout => \inst|iDL2|Add2~19\);

-- Location: LCCOMB_X30_Y19_N10
\inst|iDL2|Add4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add4~4_combout\ = ((\inst_gen|xcolumn[3]~_Duplicate_2_regout\ $ (\inst_gen|xcolumn[2]~_Duplicate_2_regout\ $ (!\inst|iDL2|Add4~3\)))) # (GND)
-- \inst|iDL2|Add4~5\ = CARRY((\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[2]~_Duplicate_2_regout\) # (!\inst|iDL2|Add4~3\))) # (!\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & 
-- !\inst|iDL2|Add4~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[3]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[2]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL2|Add4~3\,
	combout => \inst|iDL2|Add4~4_combout\,
	cout => \inst|iDL2|Add4~5\);

-- Location: LCCOMB_X31_Y19_N2
\inst|iDL2|Add3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add3~2_combout\ = (\inst|iDL2|Add4~2_combout\ & ((\inst|iDL2|Add3~1_cout\) # (GND))) # (!\inst|iDL2|Add4~2_combout\ & (!\inst|iDL2|Add3~1_cout\))
-- \inst|iDL2|Add3~3\ = CARRY((\inst|iDL2|Add4~2_combout\) # (!\inst|iDL2|Add3~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add4~2_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add3~1_cout\,
	combout => \inst|iDL2|Add3~2_combout\,
	cout => \inst|iDL2|Add3~3\);

-- Location: LCCOMB_X31_Y19_N8
\inst|iDL2|Add3~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add3~8_combout\ = (\inst|iDL2|Add4~8_combout\ & (\inst|iDL2|Add3~7\ $ (GND))) # (!\inst|iDL2|Add4~8_combout\ & ((GND) # (!\inst|iDL2|Add3~7\)))
-- \inst|iDL2|Add3~9\ = CARRY((!\inst|iDL2|Add3~7\) # (!\inst|iDL2|Add4~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add4~8_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add3~7\,
	combout => \inst|iDL2|Add3~8_combout\,
	cout => \inst|iDL2|Add3~9\);

-- Location: LCCOMB_X31_Y19_N12
\inst|iDL2|Add3~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add3~12_combout\ = (\inst|iDL2|Add4~12_combout\ & (\inst|iDL2|Add3~11\ $ (GND))) # (!\inst|iDL2|Add4~12_combout\ & ((GND) # (!\inst|iDL2|Add3~11\)))
-- \inst|iDL2|Add3~13\ = CARRY((!\inst|iDL2|Add3~11\) # (!\inst|iDL2|Add4~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add4~12_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add3~11\,
	combout => \inst|iDL2|Add3~12_combout\,
	cout => \inst|iDL2|Add3~13\);

-- Location: LCCOMB_X31_Y19_N14
\inst|iDL2|Add3~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add3~14_combout\ = (\inst|iDL2|Add4~14_combout\ & ((\inst|iDL2|Add3~13\) # (GND))) # (!\inst|iDL2|Add4~14_combout\ & (!\inst|iDL2|Add3~13\))
-- \inst|iDL2|Add3~15\ = CARRY((\inst|iDL2|Add4~14_combout\) # (!\inst|iDL2|Add3~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add4~14_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add3~13\,
	combout => \inst|iDL2|Add3~14_combout\,
	cout => \inst|iDL2|Add3~15\);

-- Location: LCCOMB_X31_Y19_N20
\inst|iDL2|Add3~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add3~20_combout\ = (\inst|iDL2|Add4~20_combout\ & (!\inst|iDL2|Add3~19\ & VCC)) # (!\inst|iDL2|Add4~20_combout\ & (\inst|iDL2|Add3~19\ $ (GND)))
-- \inst|iDL2|Add3~21\ = CARRY((!\inst|iDL2|Add4~20_combout\ & !\inst|iDL2|Add3~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add4~20_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add3~19\,
	combout => \inst|iDL2|Add3~20_combout\,
	cout => \inst|iDL2|Add3~21\);

-- Location: LCCOMB_X35_Y20_N16
\inst|iDL1|Add5~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add5~12_combout\ = ((\inst_gen|xcolumn[6]~_Duplicate_2_regout\ $ (\inst_gen|xcolumn[7]~_Duplicate_2_regout\ $ (\inst|iDL1|Add5~11\)))) # (GND)
-- \inst|iDL1|Add5~13\ = CARRY((\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & !\inst|iDL1|Add5~11\)) # (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[7]~_Duplicate_2_regout\) # 
-- (!\inst|iDL1|Add5~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL1|Add5~11\,
	combout => \inst|iDL1|Add5~12_combout\,
	cout => \inst|iDL1|Add5~13\);

-- Location: LCCOMB_X35_Y20_N24
\inst|iDL1|Add5~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add5~20_combout\ = (((!\inst|iDL1|Add5~19\))) # (GND)
-- \inst|iDL1|Add5~21\ = CARRY(!\inst|iDL2|LessThan9~0_wirecell_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101010101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LessThan9~0_wirecell_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add5~19\,
	combout => \inst|iDL1|Add5~20_combout\,
	cout => \inst|iDL1|Add5~21\);

-- Location: LCCOMB_X35_Y20_N26
\inst|iDL1|Add5~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add5~22_combout\ = \inst|iDL1|Add5~21\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst|iDL1|Add5~21\,
	combout => \inst|iDL1|Add5~22_combout\);

-- Location: LCCOMB_X33_Y20_N6
\inst|iDL1|Add6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add6~2_combout\ = (\inst|iDL1|Add5~2_combout\ & ((\inst|iDL1|Add6~1_cout\) # (GND))) # (!\inst|iDL1|Add5~2_combout\ & (!\inst|iDL1|Add6~1_cout\))
-- \inst|iDL1|Add6~3\ = CARRY((\inst|iDL1|Add5~2_combout\) # (!\inst|iDL1|Add6~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add5~2_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add6~1_cout\,
	combout => \inst|iDL1|Add6~2_combout\,
	cout => \inst|iDL1|Add6~3\);

-- Location: LCCOMB_X33_Y20_N16
\inst|iDL1|Add6~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add6~12_combout\ = (\inst|iDL1|Add5~12_combout\ & (!\inst|iDL1|Add6~11\ & VCC)) # (!\inst|iDL1|Add5~12_combout\ & (\inst|iDL1|Add6~11\ $ (GND)))
-- \inst|iDL1|Add6~13\ = CARRY((!\inst|iDL1|Add5~12_combout\ & !\inst|iDL1|Add6~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add5~12_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add6~11\,
	combout => \inst|iDL1|Add6~12_combout\,
	cout => \inst|iDL1|Add6~13\);

-- Location: LCCOMB_X33_Y20_N26
\inst|iDL1|Add6~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add6~22_combout\ = (\inst|iDL1|Add5~22_combout\ & ((\inst|iDL1|Add6~21\) # (GND))) # (!\inst|iDL1|Add5~22_combout\ & (!\inst|iDL1|Add6~21\))
-- \inst|iDL1|Add6~23\ = CARRY((\inst|iDL1|Add5~22_combout\) # (!\inst|iDL1|Add6~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add5~22_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add6~21\,
	combout => \inst|iDL1|Add6~22_combout\,
	cout => \inst|iDL1|Add6~23\);

-- Location: DSPOUT_X39_Y20_N2
\inst|iDL1|Mult0|auto_generated|mac_out2\ : cycloneii_mac_out
-- pragma translate_off
GENERIC MAP (
	dataa_width => 36,
	output_clock => "none")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2_DATAA_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \inst|iDL1|Mult0|auto_generated|mac_out2_DATAOUT_bus\);

-- Location: LCCOMB_X38_Y20_N20
\inst|iDL1|Add2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~8_combout\ = ((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT6\ $ (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT6\ $ (!\inst|iDL1|Add2~7_cout\)))) # (GND)
-- \inst|iDL1|Add2~9\ = CARRY((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT6\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT6\) # (!\inst|iDL1|Add2~7_cout\))) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT6\ & 
-- (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT6\ & !\inst|iDL1|Add2~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT6\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT6\,
	datad => VCC,
	cin => \inst|iDL1|Add2~7_cout\,
	combout => \inst|iDL1|Add2~8_combout\,
	cout => \inst|iDL1|Add2~9\);

-- Location: LCCOMB_X38_Y20_N22
\inst|iDL1|Add2~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~10_combout\ = (\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT7\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT7\ & (\inst|iDL1|Add2~9\ & VCC)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT7\ & (!\inst|iDL1|Add2~9\)))) # 
-- (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT7\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT7\ & (!\inst|iDL1|Add2~9\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT7\ & ((\inst|iDL1|Add2~9\) # (GND)))))
-- \inst|iDL1|Add2~11\ = CARRY((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT7\ & (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT7\ & !\inst|iDL1|Add2~9\)) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT7\ & ((!\inst|iDL1|Add2~9\) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT7\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT7\,
	datad => VCC,
	cin => \inst|iDL1|Add2~9\,
	combout => \inst|iDL1|Add2~10_combout\,
	cout => \inst|iDL1|Add2~11\);

-- Location: LCCOMB_X38_Y20_N24
\inst|iDL1|Add2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~12_combout\ = ((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT8\ $ (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT8\ $ (!\inst|iDL1|Add2~11\)))) # (GND)
-- \inst|iDL1|Add2~13\ = CARRY((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT8\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT8\) # (!\inst|iDL1|Add2~11\))) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT8\ & 
-- (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT8\ & !\inst|iDL1|Add2~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT8\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT8\,
	datad => VCC,
	cin => \inst|iDL1|Add2~11\,
	combout => \inst|iDL1|Add2~12_combout\,
	cout => \inst|iDL1|Add2~13\);

-- Location: LCCOMB_X38_Y20_N26
\inst|iDL1|Add2~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~14_combout\ = (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT9\ & ((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT9\ & (\inst|iDL1|Add2~13\ & VCC)) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT9\ & (!\inst|iDL1|Add2~13\)))) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT9\ & ((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT9\ & (!\inst|iDL1|Add2~13\)) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT9\ & ((\inst|iDL1|Add2~13\) # (GND)))))
-- \inst|iDL1|Add2~15\ = CARRY((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT9\ & (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT9\ & !\inst|iDL1|Add2~13\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT9\ & ((!\inst|iDL1|Add2~13\) # 
-- (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT9\,
	datab => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT9\,
	datad => VCC,
	cin => \inst|iDL1|Add2~13\,
	combout => \inst|iDL1|Add2~14_combout\,
	cout => \inst|iDL1|Add2~15\);

-- Location: LCCOMB_X38_Y19_N10
\inst|iDL1|Add2~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~30_combout\ = (\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT17\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\ & (\inst|iDL1|Add2~29\ & VCC)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\ & (!\inst|iDL1|Add2~29\)))) # 
-- (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT17\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\ & (!\inst|iDL1|Add2~29\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\ & ((\inst|iDL1|Add2~29\) # (GND)))))
-- \inst|iDL1|Add2~31\ = CARRY((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT17\ & (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\ & !\inst|iDL1|Add2~29\)) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT17\ & ((!\inst|iDL1|Add2~29\) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT17\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT17\,
	datad => VCC,
	cin => \inst|iDL1|Add2~29\,
	combout => \inst|iDL1|Add2~30_combout\,
	cout => \inst|iDL1|Add2~31\);

-- Location: LCCOMB_X38_Y19_N16
\inst|iDL1|Add2~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~36_combout\ = ((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT20\ $ (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT20\ $ (!\inst|iDL1|Add2~35\)))) # (GND)
-- \inst|iDL1|Add2~37\ = CARRY((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT20\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT20\) # (!\inst|iDL1|Add2~35\))) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT20\ & 
-- (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT20\ & !\inst|iDL1|Add2~35\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT20\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT20\,
	datad => VCC,
	cin => \inst|iDL1|Add2~35\,
	combout => \inst|iDL1|Add2~36_combout\,
	cout => \inst|iDL1|Add2~37\);

-- Location: LCCOMB_X38_Y19_N18
\inst|iDL1|Add2~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~38_combout\ = (\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT21\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\ & (\inst|iDL1|Add2~37\ & VCC)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\ & (!\inst|iDL1|Add2~37\)))) # 
-- (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT21\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\ & (!\inst|iDL1|Add2~37\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\ & ((\inst|iDL1|Add2~37\) # (GND)))))
-- \inst|iDL1|Add2~39\ = CARRY((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT21\ & (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\ & !\inst|iDL1|Add2~37\)) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT21\ & ((!\inst|iDL1|Add2~37\) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT21\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\,
	datad => VCC,
	cin => \inst|iDL1|Add2~37\,
	combout => \inst|iDL1|Add2~38_combout\,
	cout => \inst|iDL1|Add2~39\);

-- Location: LCCOMB_X38_Y19_N20
\inst|iDL1|Add2~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~40_combout\ = \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT21\ $ (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\ $ (!\inst|iDL1|Add2~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT21\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT21\,
	cin => \inst|iDL1|Add2~39\,
	combout => \inst|iDL1|Add2~40_combout\);

-- Location: LCCOMB_X34_Y20_N2
\inst|iDL1|Add4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add4~2_combout\ = (\inst|iDL1|Add5~2_combout\ & ((\inst|iDL1|Add4~1_cout\) # (GND))) # (!\inst|iDL1|Add5~2_combout\ & (!\inst|iDL1|Add4~1_cout\))
-- \inst|iDL1|Add4~3\ = CARRY((\inst|iDL1|Add5~2_combout\) # (!\inst|iDL1|Add4~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add5~2_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add4~1_cout\,
	combout => \inst|iDL1|Add4~2_combout\,
	cout => \inst|iDL1|Add4~3\);

-- Location: LCCOMB_X34_Y20_N4
\inst|iDL1|Add4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add4~4_combout\ = (\inst|iDL1|Add5~4_combout\ & (!\inst|iDL1|Add4~3\ & VCC)) # (!\inst|iDL1|Add5~4_combout\ & (\inst|iDL1|Add4~3\ $ (GND)))
-- \inst|iDL1|Add4~5\ = CARRY((!\inst|iDL1|Add5~4_combout\ & !\inst|iDL1|Add4~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add5~4_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add4~3\,
	combout => \inst|iDL1|Add4~4_combout\,
	cout => \inst|iDL1|Add4~5\);

-- Location: LCCOMB_X34_Y20_N6
\inst|iDL1|Add4~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add4~6_combout\ = (\inst|iDL1|Add5~6_combout\ & (!\inst|iDL1|Add4~5\)) # (!\inst|iDL1|Add5~6_combout\ & (\inst|iDL1|Add4~5\ & VCC))
-- \inst|iDL1|Add4~7\ = CARRY((\inst|iDL1|Add5~6_combout\ & !\inst|iDL1|Add4~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add5~6_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add4~5\,
	combout => \inst|iDL1|Add4~6_combout\,
	cout => \inst|iDL1|Add4~7\);

-- Location: LCCOMB_X34_Y20_N8
\inst|iDL1|Add4~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add4~8_combout\ = (\inst|iDL1|Add5~8_combout\ & (\inst|iDL1|Add4~7\ $ (GND))) # (!\inst|iDL1|Add5~8_combout\ & ((GND) # (!\inst|iDL1|Add4~7\)))
-- \inst|iDL1|Add4~9\ = CARRY((!\inst|iDL1|Add4~7\) # (!\inst|iDL1|Add5~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add5~8_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add4~7\,
	combout => \inst|iDL1|Add4~8_combout\,
	cout => \inst|iDL1|Add4~9\);

-- Location: LCCOMB_X34_Y20_N10
\inst|iDL1|Add4~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add4~10_combout\ = (\inst|iDL1|Add5~10_combout\ & ((\inst|iDL1|Add4~9\) # (GND))) # (!\inst|iDL1|Add5~10_combout\ & (!\inst|iDL1|Add4~9\))
-- \inst|iDL1|Add4~11\ = CARRY((\inst|iDL1|Add5~10_combout\) # (!\inst|iDL1|Add4~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add5~10_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add4~9\,
	combout => \inst|iDL1|Add4~10_combout\,
	cout => \inst|iDL1|Add4~11\);

-- Location: LCCOMB_X34_Y20_N12
\inst|iDL1|Add4~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add4~12_combout\ = (\inst|iDL1|Add5~12_combout\ & (\inst|iDL1|Add4~11\ $ (GND))) # (!\inst|iDL1|Add5~12_combout\ & ((GND) # (!\inst|iDL1|Add4~11\)))
-- \inst|iDL1|Add4~13\ = CARRY((!\inst|iDL1|Add4~11\) # (!\inst|iDL1|Add5~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add5~12_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add4~11\,
	combout => \inst|iDL1|Add4~12_combout\,
	cout => \inst|iDL1|Add4~13\);

-- Location: LCCOMB_X34_Y20_N14
\inst|iDL1|Add4~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add4~14_combout\ = (\inst|iDL1|Add5~14_combout\ & ((\inst|iDL1|Add4~13\) # (GND))) # (!\inst|iDL1|Add5~14_combout\ & (!\inst|iDL1|Add4~13\))
-- \inst|iDL1|Add4~15\ = CARRY((\inst|iDL1|Add5~14_combout\) # (!\inst|iDL1|Add4~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add5~14_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add4~13\,
	combout => \inst|iDL1|Add4~14_combout\,
	cout => \inst|iDL1|Add4~15\);

-- Location: LCCOMB_X34_Y20_N16
\inst|iDL1|Add4~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add4~16_combout\ = (\inst|iDL1|Add5~16_combout\ & (!\inst|iDL1|Add4~15\ & VCC)) # (!\inst|iDL1|Add5~16_combout\ & (\inst|iDL1|Add4~15\ $ (GND)))
-- \inst|iDL1|Add4~17\ = CARRY((!\inst|iDL1|Add5~16_combout\ & !\inst|iDL1|Add4~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add5~16_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add4~15\,
	combout => \inst|iDL1|Add4~16_combout\,
	cout => \inst|iDL1|Add4~17\);

-- Location: LCCOMB_X34_Y20_N18
\inst|iDL1|Add4~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add4~18_combout\ = (\inst|iDL1|Add5~18_combout\ & (!\inst|iDL1|Add4~17\)) # (!\inst|iDL1|Add5~18_combout\ & (\inst|iDL1|Add4~17\ & VCC))
-- \inst|iDL1|Add4~19\ = CARRY((\inst|iDL1|Add5~18_combout\ & !\inst|iDL1|Add4~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add5~18_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add4~17\,
	combout => \inst|iDL1|Add4~18_combout\,
	cout => \inst|iDL1|Add4~19\);

-- Location: LCCOMB_X34_Y20_N20
\inst|iDL1|Add4~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add4~20_combout\ = (\inst|iDL1|Add5~20_combout\ & (!\inst|iDL1|Add4~19\ & VCC)) # (!\inst|iDL1|Add5~20_combout\ & (\inst|iDL1|Add4~19\ $ (GND)))
-- \inst|iDL1|Add4~21\ = CARRY((!\inst|iDL1|Add5~20_combout\ & !\inst|iDL1|Add4~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add5~20_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add4~19\,
	combout => \inst|iDL1|Add4~20_combout\,
	cout => \inst|iDL1|Add4~21\);

-- Location: LCCOMB_X34_Y19_N0
\inst|iDL1|LessThan14~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan14~1_cout\ = CARRY((!\inst_gen|yrow\(1) & !\inst_gen|xcolumn[0]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(1),
	datab => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datad => VCC,
	cout => \inst|iDL1|LessThan14~1_cout\);

-- Location: LCCOMB_X34_Y19_N2
\inst|iDL1|LessThan14~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan14~3_cout\ = CARRY((\inst|iDL2|Add2~0_combout\ & ((\inst_gen|xcolumn[1]~_Duplicate_2_regout\) # (!\inst|iDL1|LessThan14~1_cout\))) # (!\inst|iDL2|Add2~0_combout\ & (\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & 
-- !\inst|iDL1|LessThan14~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add2~0_combout\,
	datab => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan14~1_cout\,
	cout => \inst|iDL1|LessThan14~3_cout\);

-- Location: LCCOMB_X34_Y19_N4
\inst|iDL1|LessThan14~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan14~5_cout\ = CARRY((\inst|iDL2|Add2~2_combout\ & (\inst|iDL1|Add4~2_combout\ & !\inst|iDL1|LessThan14~3_cout\)) # (!\inst|iDL2|Add2~2_combout\ & ((\inst|iDL1|Add4~2_combout\) # (!\inst|iDL1|LessThan14~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add2~2_combout\,
	datab => \inst|iDL1|Add4~2_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan14~3_cout\,
	cout => \inst|iDL1|LessThan14~5_cout\);

-- Location: LCCOMB_X34_Y19_N6
\inst|iDL1|LessThan14~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan14~7_cout\ = CARRY((\inst|iDL2|Add2~4_combout\ & ((!\inst|iDL1|LessThan14~5_cout\) # (!\inst|iDL1|Add4~4_combout\))) # (!\inst|iDL2|Add2~4_combout\ & (!\inst|iDL1|Add4~4_combout\ & !\inst|iDL1|LessThan14~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add2~4_combout\,
	datab => \inst|iDL1|Add4~4_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan14~5_cout\,
	cout => \inst|iDL1|LessThan14~7_cout\);

-- Location: LCCOMB_X34_Y19_N8
\inst|iDL1|LessThan14~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan14~9_cout\ = CARRY((\inst|iDL1|Add4~6_combout\ & ((!\inst|iDL1|LessThan14~7_cout\) # (!\inst|iDL2|Add2~6_combout\))) # (!\inst|iDL1|Add4~6_combout\ & (!\inst|iDL2|Add2~6_combout\ & !\inst|iDL1|LessThan14~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add4~6_combout\,
	datab => \inst|iDL2|Add2~6_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan14~7_cout\,
	cout => \inst|iDL1|LessThan14~9_cout\);

-- Location: LCCOMB_X34_Y19_N10
\inst|iDL1|LessThan14~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan14~11_cout\ = CARRY((\inst|iDL1|Add4~8_combout\ & (\inst|iDL2|Add2~8_combout\ & !\inst|iDL1|LessThan14~9_cout\)) # (!\inst|iDL1|Add4~8_combout\ & ((\inst|iDL2|Add2~8_combout\) # (!\inst|iDL1|LessThan14~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add4~8_combout\,
	datab => \inst|iDL2|Add2~8_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan14~9_cout\,
	cout => \inst|iDL1|LessThan14~11_cout\);

-- Location: LCCOMB_X34_Y19_N12
\inst|iDL1|LessThan14~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan14~13_cout\ = CARRY((\inst|iDL1|Add4~10_combout\ & ((!\inst|iDL1|LessThan14~11_cout\) # (!\inst|iDL2|Add2~10_combout\))) # (!\inst|iDL1|Add4~10_combout\ & (!\inst|iDL2|Add2~10_combout\ & !\inst|iDL1|LessThan14~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add4~10_combout\,
	datab => \inst|iDL2|Add2~10_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan14~11_cout\,
	cout => \inst|iDL1|LessThan14~13_cout\);

-- Location: LCCOMB_X34_Y19_N14
\inst|iDL1|LessThan14~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan14~15_cout\ = CARRY((\inst|iDL2|Add2~12_combout\ & ((!\inst|iDL1|LessThan14~13_cout\) # (!\inst|iDL1|Add4~12_combout\))) # (!\inst|iDL2|Add2~12_combout\ & (!\inst|iDL1|Add4~12_combout\ & !\inst|iDL1|LessThan14~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add2~12_combout\,
	datab => \inst|iDL1|Add4~12_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan14~13_cout\,
	cout => \inst|iDL1|LessThan14~15_cout\);

-- Location: LCCOMB_X34_Y19_N16
\inst|iDL1|LessThan14~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan14~17_cout\ = CARRY((\inst|iDL1|Add4~14_combout\ & ((!\inst|iDL1|LessThan14~15_cout\) # (!\inst|iDL2|Add2~14_combout\))) # (!\inst|iDL1|Add4~14_combout\ & (!\inst|iDL2|Add2~14_combout\ & !\inst|iDL1|LessThan14~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add4~14_combout\,
	datab => \inst|iDL2|Add2~14_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan14~15_cout\,
	cout => \inst|iDL1|LessThan14~17_cout\);

-- Location: LCCOMB_X34_Y19_N18
\inst|iDL1|LessThan14~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan14~19_cout\ = CARRY((\inst|iDL1|Add4~16_combout\ & (\inst|iDL2|Add2~16_combout\ & !\inst|iDL1|LessThan14~17_cout\)) # (!\inst|iDL1|Add4~16_combout\ & ((\inst|iDL2|Add2~16_combout\) # (!\inst|iDL1|LessThan14~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add4~16_combout\,
	datab => \inst|iDL2|Add2~16_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan14~17_cout\,
	cout => \inst|iDL1|LessThan14~19_cout\);

-- Location: LCCOMB_X34_Y19_N20
\inst|iDL1|LessThan14~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan14~21_cout\ = CARRY((\inst|iDL2|Add2~18_combout\ & (\inst|iDL1|Add4~18_combout\ & !\inst|iDL1|LessThan14~19_cout\)) # (!\inst|iDL2|Add2~18_combout\ & ((\inst|iDL1|Add4~18_combout\) # (!\inst|iDL1|LessThan14~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add2~18_combout\,
	datab => \inst|iDL1|Add4~18_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan14~19_cout\,
	cout => \inst|iDL1|LessThan14~21_cout\);

-- Location: LCCOMB_X34_Y19_N22
\inst|iDL1|LessThan14~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan14~22_combout\ = (\inst|iDL2|Add2~20_combout\ & (\inst|iDL1|LessThan14~21_cout\ & \inst|iDL1|Add4~20_combout\)) # (!\inst|iDL2|Add2~20_combout\ & ((\inst|iDL1|LessThan14~21_cout\) # (\inst|iDL1|Add4~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add2~20_combout\,
	datad => \inst|iDL1|Add4~20_combout\,
	cin => \inst|iDL1|LessThan14~21_cout\,
	combout => \inst|iDL1|LessThan14~22_combout\);

-- Location: M4K_X26_Y24
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"0000001FF80001FF00000000000000000000001FF00001FE00000000000000000000003FF00003FE00000000000000000000003FE00003FE00000000000000000000003FE00007FC00000000000000000000003FC00007FC00000000000000000000007FC0000FFC00000000000000000000007FC0000FF800000000000000000000007F80001FF800000000000000000000007F80003FF000000000000000000000007F80003FF000000000000000000000007F00007FE000000000000000000000007F0000FFE000000000000000000000007F0000FFC000000000000000000000007F0001FFC000000000000000000000007F0003FF800000000000000000",
	mem_init0 => X"0000003F8007FF0000000000000000000000003F8007FF0000000000000000000000003FC00FFE0000000000000000000000001FE03FFC0000000000000000000000001FF8FFFC0000000000000000000000000FFFFFF80000000000000000000000000FFFFFF000000000000000000000000007FFFFE000000000000000000000000003FFFFC000000000000000000000000000FFFF80000000000000000000000000007FFE00000000000000000000000000001FF80000000000000000000000000000018000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL1|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode45w[2]~0_combout\,
	portaaddr => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: M4K_X52_Y22
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a6\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000F8000000000000000000000000000007FF00000000000000000000000000000FFFC0000000000000000000000000003FFFF0000000000000000000000000007FFFF800000000000000000000000000FFFFFC00000000000000000000000001FFFFFE00000000000000000000000003FFFFFE00000000000000000000000003FFC3FF00000000000000000000000007FF80FF0000000000000000000000000FFE007F8000000000000000000000001FFC003F8000000000000000000000001FFC003FC000000000000000000000003FF8001FC00000",
	mem_init0 => X"0000000000000000007FF0001FC000000000000000000000007FE0001FC00000000000000000000000FFE0001FC00000000000000000000000FFC0001FC00000000000000000000001FF80001FC00000000000000000000001FF80003FC00000000000000000000003FF00003FC00000000000000000000003FE00003FC00000000000000000000007FE00007FC00000000000000000000007FC00007F80000000000000000000000FFC0000FF80000000000000000000000FF80000FF80000000000000000000000FF80001FF00000000000000000000000FF00001FF00000000000000000000001FF00003FF00000000000000000000001FF00003FE000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL1|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~2_combout\,
	portaaddr => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

-- Location: M4K_X26_Y21
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a5\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"03FFFFFFC0000000000000000000000003FFFFFFE0000000000000000000000003FFFFFFF8000000000000000000000003FFFFFFFC000000000000000000000003FFFFFFFE000000000000000000000003FCFFFFFF000000000000000000000003FC7FFFFFC00000000000000000000003FC3FFFFFE00000000000000000000003F80FFFFFF00000000000000000000007F807FFFFFC0000000000000000000007F803FFFFFE0000000000000000000007F800FFFFFF0000000000000000000007F8007FFFFF8000000000000000000007F8003FFFFF800000000000000000000FF0001FFFFF800000000000000000000FF00007FFFF80000000000000000000",
	mem_init0 => X"0FF00003FFFF800000000000000000000FF00001FFFF800000000000000000001FF000007FFF800000000000000000001FE000003FFF000000000000000000001FE000001FFF000000000000000000001FE0000007FE000000000000000000001FC0000003FC000000000000000000003FC0000001F8000000000000000000003F8000000070000000000000000000001F0000000000000000000000000000001E0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL1|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~1_combout\,
	portaaddr => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\);

-- Location: M4K_X52_Y24
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a3\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000078000000000000000000000000000000F8000000000000000000000600000001FC000000000000000000001F80000003FC000000000000000000003FC0000003F8000000000000000000007FE0000007F800000000000000000000FFF8000007F8",
	mem_init0 => X"00000000000000000000FFFC000007F800000000000000000001FFFE00000FF800000000000000000001FFFF80000FF000000000000000000001FFFFC0000FF000000000000000000001FFFFE0000FF000000000000000000001FFFFF8000FF000000000000000000001FFFFFC001FE000000000000000000001FFFFFE001FE000000000000000000000FFFFFF001FE0000000000000000000007FFFFFC01FE0000000000000000000003FFFFFE01FE0000000000000000000000FFFFFF01FC00000000000000000000007FFFFFC3FC00000000000000000000003FFFFFE3FC00000000000000000000000FFFFFF3FC000000000000000000000007FFFFFFFC0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL1|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~0_combout\,
	portaaddr => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\);

-- Location: M4K_X26_Y23
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a1\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000003FFFFFFFC000000000000000000000001FFFFFFFC0000000000000000000000007FFFFFFC0000000000000000000000003FFFFFFC0000000000000000000000001FFFFFFC00000000000000000000000007FFFFFC00000000000000000000000003FFFFFC00000000000000000000000001FFFFFC000000000000000000000000007FFFFE000000000000000000000000003FFFFE000000000000000000000000001FFFFE0000000000000000000000000007FFFE0000000000000000000000000003FFFE0000000000000000000000000001FFFE00000000000000000000000000007FFE00000000000000000000000000003FFC0",
	mem_init0 => X"0000000000000000000000000001FF8000000000000000000000000000007F8000000000000000000000000000003F0000000000000000000000000000000C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL1|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode45w[2]~0_combout\,
	portaaddr => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\);

-- Location: M4K_X26_Y22
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a7\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0030000000000000000000000000000000FC000000000000000000000000000001FE000000000000000000000000000001FF800000000000000000000000000003FFC00000000000000000000000000007FFE00000000000000000000000000007FFF80000000000000000000000000007FFFC0000000000000000000000000007FFFE0000000000000000000000000007FFFF8000000000000000000000000007FFFFC000000000000000000000000007FFFFE000000000000000000000000003FFFFF800000000000000000000000003FFFFFC00000000000000000000000003FFFFFE00000000000000000000000003FFFFFF800000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL1|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~2_combout\,
	portaaddr => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\);

-- Location: LCCOMB_X30_Y20_N10
\inst|iDL2|Add5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add5~2_combout\ = (\inst|iDL2|Add4~2_combout\ & ((\inst|iDL2|Add5~1_cout\) # (GND))) # (!\inst|iDL2|Add4~2_combout\ & (!\inst|iDL2|Add5~1_cout\))
-- \inst|iDL2|Add5~3\ = CARRY((\inst|iDL2|Add4~2_combout\) # (!\inst|iDL2|Add5~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add4~2_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add5~1_cout\,
	combout => \inst|iDL2|Add5~2_combout\,
	cout => \inst|iDL2|Add5~3\);

-- Location: LCCOMB_X30_Y20_N12
\inst|iDL2|Add5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add5~4_combout\ = (\inst|iDL2|Add4~4_combout\ & (!\inst|iDL2|Add5~3\ & VCC)) # (!\inst|iDL2|Add4~4_combout\ & (\inst|iDL2|Add5~3\ $ (GND)))
-- \inst|iDL2|Add5~5\ = CARRY((!\inst|iDL2|Add4~4_combout\ & !\inst|iDL2|Add5~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add4~4_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add5~3\,
	combout => \inst|iDL2|Add5~4_combout\,
	cout => \inst|iDL2|Add5~5\);

-- Location: LCCOMB_X30_Y20_N16
\inst|iDL2|Add5~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add5~8_combout\ = (\inst|iDL2|Add4~8_combout\ & (!\inst|iDL2|Add5~7\ & VCC)) # (!\inst|iDL2|Add4~8_combout\ & (\inst|iDL2|Add5~7\ $ (GND)))
-- \inst|iDL2|Add5~9\ = CARRY((!\inst|iDL2|Add4~8_combout\ & !\inst|iDL2|Add5~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add4~8_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add5~7\,
	combout => \inst|iDL2|Add5~8_combout\,
	cout => \inst|iDL2|Add5~9\);

-- Location: LCCOMB_X30_Y20_N20
\inst|iDL2|Add5~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add5~12_combout\ = (\inst|iDL2|Add4~12_combout\ & (!\inst|iDL2|Add5~11\ & VCC)) # (!\inst|iDL2|Add4~12_combout\ & (\inst|iDL2|Add5~11\ $ (GND)))
-- \inst|iDL2|Add5~13\ = CARRY((!\inst|iDL2|Add4~12_combout\ & !\inst|iDL2|Add5~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add4~12_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add5~11\,
	combout => \inst|iDL2|Add5~12_combout\,
	cout => \inst|iDL2|Add5~13\);

-- Location: LCCOMB_X30_Y20_N28
\inst|iDL2|Add5~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add5~20_combout\ = (\inst|iDL2|Add4~20_combout\ & (\inst|iDL2|Add5~19\ $ (GND))) # (!\inst|iDL2|Add4~20_combout\ & ((GND) # (!\inst|iDL2|Add5~19\)))
-- \inst|iDL2|Add5~21\ = CARRY((!\inst|iDL2|Add5~19\) # (!\inst|iDL2|Add4~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add4~20_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add5~19\,
	combout => \inst|iDL2|Add5~20_combout\,
	cout => \inst|iDL2|Add5~21\);

-- Location: LCFF_X31_Y18_N11
\inst_gen|gen:xcounter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:xcounter[0]~1_combout\,
	sclr => \inst_gen|LessThan6~3_combout\,
	ena => \ALT_INV_inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:xcounter[0]~regout\);

-- Location: LCCOMB_X34_Y24_N24
\inst|iVMCalc|counter[12]~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[12]~53_combout\ = (\inst|iVMCalc|counter\(12) & (!\inst|iVMCalc|counter[11]~52\)) # (!\inst|iVMCalc|counter\(12) & ((\inst|iVMCalc|counter[11]~52\) # (GND)))
-- \inst|iVMCalc|counter[12]~54\ = CARRY((!\inst|iVMCalc|counter[11]~52\) # (!\inst|iVMCalc|counter\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(12),
	datad => VCC,
	cin => \inst|iVMCalc|counter[11]~52\,
	combout => \inst|iVMCalc|counter[12]~53_combout\,
	cout => \inst|iVMCalc|counter[12]~54\);

-- Location: LCCOMB_X34_Y23_N6
\inst|iVMCalc|counter[19]~67\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[19]~67_combout\ = (\inst|iVMCalc|counter\(19) & (\inst|iVMCalc|counter[18]~66\ $ (GND))) # (!\inst|iVMCalc|counter\(19) & (!\inst|iVMCalc|counter[18]~66\ & VCC))
-- \inst|iVMCalc|counter[19]~68\ = CARRY((\inst|iVMCalc|counter\(19) & !\inst|iVMCalc|counter[18]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(19),
	datad => VCC,
	cin => \inst|iVMCalc|counter[18]~66\,
	combout => \inst|iVMCalc|counter[19]~67_combout\,
	cout => \inst|iVMCalc|counter[19]~68\);

-- Location: LCCOMB_X34_Y23_N10
\inst|iVMCalc|counter[21]~71\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[21]~71_combout\ = (\inst|iVMCalc|counter\(21) & (\inst|iVMCalc|counter[20]~70\ $ (GND))) # (!\inst|iVMCalc|counter\(21) & (!\inst|iVMCalc|counter[20]~70\ & VCC))
-- \inst|iVMCalc|counter[21]~72\ = CARRY((\inst|iVMCalc|counter\(21) & !\inst|iVMCalc|counter[20]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(21),
	datad => VCC,
	cin => \inst|iVMCalc|counter[20]~70\,
	combout => \inst|iVMCalc|counter[21]~71_combout\,
	cout => \inst|iVMCalc|counter[21]~72\);

-- Location: LCCOMB_X34_Y23_N12
\inst|iVMCalc|counter[22]~73\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[22]~73_combout\ = (\inst|iVMCalc|counter\(22) & (!\inst|iVMCalc|counter[21]~72\)) # (!\inst|iVMCalc|counter\(22) & ((\inst|iVMCalc|counter[21]~72\) # (GND)))
-- \inst|iVMCalc|counter[22]~74\ = CARRY((!\inst|iVMCalc|counter[21]~72\) # (!\inst|iVMCalc|counter\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(22),
	datad => VCC,
	cin => \inst|iVMCalc|counter[21]~72\,
	combout => \inst|iVMCalc|counter[22]~73_combout\,
	cout => \inst|iVMCalc|counter[22]~74\);

-- Location: LCCOMB_X34_Y23_N16
\inst|iVMCalc|counter[24]~77\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[24]~77_combout\ = (\inst|iVMCalc|counter\(24) & (!\inst|iVMCalc|counter[23]~76\)) # (!\inst|iVMCalc|counter\(24) & ((\inst|iVMCalc|counter[23]~76\) # (GND)))
-- \inst|iVMCalc|counter[24]~78\ = CARRY((!\inst|iVMCalc|counter[23]~76\) # (!\inst|iVMCalc|counter\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(24),
	datad => VCC,
	cin => \inst|iVMCalc|counter[23]~76\,
	combout => \inst|iVMCalc|counter[24]~77_combout\,
	cout => \inst|iVMCalc|counter[24]~78\);

-- Location: LCCOMB_X34_Y23_N20
\inst|iVMCalc|counter[26]~81\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[26]~81_combout\ = (\inst|iVMCalc|counter\(26) & (!\inst|iVMCalc|counter[25]~80\)) # (!\inst|iVMCalc|counter\(26) & ((\inst|iVMCalc|counter[25]~80\) # (GND)))
-- \inst|iVMCalc|counter[26]~82\ = CARRY((!\inst|iVMCalc|counter[25]~80\) # (!\inst|iVMCalc|counter\(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(26),
	datad => VCC,
	cin => \inst|iVMCalc|counter[25]~80\,
	combout => \inst|iVMCalc|counter[26]~81_combout\,
	cout => \inst|iVMCalc|counter[26]~82\);

-- Location: LCCOMB_X34_Y23_N24
\inst|iVMCalc|counter[28]~85\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[28]~85_combout\ = (\inst|iVMCalc|counter\(28) & (!\inst|iVMCalc|counter[27]~84\)) # (!\inst|iVMCalc|counter\(28) & ((\inst|iVMCalc|counter[27]~84\) # (GND)))
-- \inst|iVMCalc|counter[28]~86\ = CARRY((!\inst|iVMCalc|counter[27]~84\) # (!\inst|iVMCalc|counter\(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(28),
	datad => VCC,
	cin => \inst|iVMCalc|counter[27]~84\,
	combout => \inst|iVMCalc|counter[28]~85_combout\,
	cout => \inst|iVMCalc|counter[28]~86\);

-- Location: DSPMULT_X39_Y18_N0
\inst|iDL2|Mult0|auto_generated|mac_mult1\ : cycloneii_mac_mult
-- pragma translate_off
GENERIC MAP (
	dataa_clock => "0",
	dataa_width => 18,
	datab_clock => "0",
	datab_width => 18,
	signa_clock => "none",
	signb_clock => "none")
-- pragma translate_on
PORT MAP (
	signa => \~GND~combout\,
	signb => \~GND~combout\,
	clk => \CLOCK_50~clkctrl_outclk\,
	aclr => \inst4~0clkctrl_outclk\,
	ena => VCC,
	dataa => \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAA_bus\,
	datab => \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAB_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \inst|iDL2|Mult0|auto_generated|mac_mult1_DATAOUT_bus\);

-- Location: LCCOMB_X33_Y21_N20
\inst|iDL1|Add9~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~15_combout\ = (\inst|iDL1|Add9~11_combout\ & ((\inst|iDL1|Add9~27_combout\ & (\inst|iDL1|Add9~14\ & VCC)) # (!\inst|iDL1|Add9~27_combout\ & (!\inst|iDL1|Add9~14\)))) # (!\inst|iDL1|Add9~11_combout\ & ((\inst|iDL1|Add9~27_combout\ & 
-- (!\inst|iDL1|Add9~14\)) # (!\inst|iDL1|Add9~27_combout\ & ((\inst|iDL1|Add9~14\) # (GND)))))
-- \inst|iDL1|Add9~16\ = CARRY((\inst|iDL1|Add9~11_combout\ & (!\inst|iDL1|Add9~27_combout\ & !\inst|iDL1|Add9~14\)) # (!\inst|iDL1|Add9~11_combout\ & ((!\inst|iDL1|Add9~14\) # (!\inst|iDL1|Add9~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add9~11_combout\,
	datab => \inst|iDL1|Add9~27_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add9~14\,
	combout => \inst|iDL1|Add9~15_combout\,
	cout => \inst|iDL1|Add9~16\);

-- Location: LCCOMB_X33_Y21_N24
\inst|iDL1|Add9~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~19_combout\ = (\inst|iDL1|Add9~8_combout\ & ((\inst|iDL1|Add9~4_combout\ & (\inst|iDL1|Add9~18\ & VCC)) # (!\inst|iDL1|Add9~4_combout\ & (!\inst|iDL1|Add9~18\)))) # (!\inst|iDL1|Add9~8_combout\ & ((\inst|iDL1|Add9~4_combout\ & 
-- (!\inst|iDL1|Add9~18\)) # (!\inst|iDL1|Add9~4_combout\ & ((\inst|iDL1|Add9~18\) # (GND)))))
-- \inst|iDL1|Add9~20\ = CARRY((\inst|iDL1|Add9~8_combout\ & (!\inst|iDL1|Add9~4_combout\ & !\inst|iDL1|Add9~18\)) # (!\inst|iDL1|Add9~8_combout\ & ((!\inst|iDL1|Add9~18\) # (!\inst|iDL1|Add9~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add9~8_combout\,
	datab => \inst|iDL1|Add9~4_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add9~18\,
	combout => \inst|iDL1|Add9~19_combout\,
	cout => \inst|iDL1|Add9~20\);

-- Location: LCCOMB_X31_Y18_N10
\inst_gen|gen:xcounter[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:xcounter[0]~1_combout\ = \inst_gen|gen:xcounter[0]~regout\ $ (VCC)
-- \inst_gen|gen:xcounter[0]~2\ = CARRY(\inst_gen|gen:xcounter[0]~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:xcounter[0]~regout\,
	datad => VCC,
	combout => \inst_gen|gen:xcounter[0]~1_combout\,
	cout => \inst_gen|gen:xcounter[0]~2\);

-- Location: LCFF_X32_Y23_N19
\inst|iPipeLine|VGA_B1[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iDL1|VGA_B[0]~1_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_B1\(0));

-- Location: LCFF_X32_Y23_N11
\inst|iPipeLine|VGA_G1[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iDL1|VGA_G[0]~4_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_G1\(0));

-- Location: LCFF_X32_Y23_N5
\inst|iPipeLine|VGA_R1[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iDL1|VGA_R[6]~0_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_R1\(6));

-- Location: LCCOMB_X34_Y24_N0
\inst|iVMCalc|LessThan7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan7~0_combout\ = (!\inst|iVMCalc|counter\(13) & (!\inst|iVMCalc|counter\(14) & (!\inst|iVMCalc|counter\(12) & !\inst|iVMCalc|counter\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(13),
	datab => \inst|iVMCalc|counter\(14),
	datac => \inst|iVMCalc|counter\(12),
	datad => \inst|iVMCalc|counter\(11),
	combout => \inst|iVMCalc|LessThan7~0_combout\);

-- Location: LCCOMB_X35_Y23_N0
\inst|iVMCalc|LessThan7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan7~1_combout\ = (!\inst|iVMCalc|counter\(16) & (!\inst|iVMCalc|counter\(18) & (!\inst|iVMCalc|counter\(15) & !\inst|iVMCalc|counter\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(16),
	datab => \inst|iVMCalc|counter\(18),
	datac => \inst|iVMCalc|counter\(15),
	datad => \inst|iVMCalc|counter\(17),
	combout => \inst|iVMCalc|LessThan7~1_combout\);

-- Location: LCCOMB_X35_Y23_N2
\inst|iVMCalc|LessThan7~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan7~2_combout\ = (!\inst|iVMCalc|counter\(21) & (!\inst|iVMCalc|counter\(22) & (!\inst|iVMCalc|counter\(19) & !\inst|iVMCalc|counter\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(21),
	datab => \inst|iVMCalc|counter\(22),
	datac => \inst|iVMCalc|counter\(19),
	datad => \inst|iVMCalc|counter\(20),
	combout => \inst|iVMCalc|LessThan7~2_combout\);

-- Location: LCCOMB_X35_Y23_N12
\inst|iVMCalc|LessThan7~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan7~3_combout\ = (!\inst|iVMCalc|counter\(23) & (!\inst|iVMCalc|counter\(25) & (!\inst|iVMCalc|counter\(26) & !\inst|iVMCalc|counter\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(23),
	datab => \inst|iVMCalc|counter\(25),
	datac => \inst|iVMCalc|counter\(26),
	datad => \inst|iVMCalc|counter\(24),
	combout => \inst|iVMCalc|LessThan7~3_combout\);

-- Location: LCCOMB_X35_Y23_N6
\inst|iVMCalc|LessThan7~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan7~4_combout\ = (\inst|iVMCalc|LessThan7~3_combout\ & (\inst|iVMCalc|LessThan7~2_combout\ & (\inst|iVMCalc|LessThan7~0_combout\ & \inst|iVMCalc|LessThan7~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|LessThan7~3_combout\,
	datab => \inst|iVMCalc|LessThan7~2_combout\,
	datac => \inst|iVMCalc|LessThan7~0_combout\,
	datad => \inst|iVMCalc|LessThan7~1_combout\,
	combout => \inst|iVMCalc|LessThan7~4_combout\);

-- Location: LCCOMB_X33_Y23_N28
\inst|iVMCalc|LessThan7~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan7~5_combout\ = (\inst|iVMCalc|LessThan7~4_combout\ & (!\inst|iVMCalc|counter\(28) & (!\inst|iVMCalc|counter\(29) & !\inst|iVMCalc|counter\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|LessThan7~4_combout\,
	datab => \inst|iVMCalc|counter\(28),
	datac => \inst|iVMCalc|counter\(29),
	datad => \inst|iVMCalc|counter\(27),
	combout => \inst|iVMCalc|LessThan7~5_combout\);

-- Location: LCCOMB_X31_Y21_N6
\inst|iDL2|LSPflag~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LSPflag~0_combout\ = \inst_gen|xcolumn[7]~_Duplicate_2_regout\ $ (\inst_gen|xcolumn[6]~_Duplicate_2_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	combout => \inst|iDL2|LSPflag~0_combout\);

-- Location: LCCOMB_X33_Y23_N14
\inst|iVMCalc|LessThan7~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan7~6_combout\ = (!\inst|iVMCalc|counter\(28) & !\inst|iVMCalc|counter\(27))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(28),
	datad => \inst|iVMCalc|counter\(27),
	combout => \inst|iVMCalc|LessThan7~6_combout\);

-- Location: LCCOMB_X33_Y23_N16
\inst|iVMCalc|LessThan2~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan2~18_combout\ = (\inst|iVMCalc|counter\(10)) # ((\inst|iVMCalc|LessThan2~16_combout\) # ((!\inst|iVMCalc|LessThan7~4_combout\) # (!\inst|iVMCalc|LessThan7~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(10),
	datab => \inst|iVMCalc|LessThan2~16_combout\,
	datac => \inst|iVMCalc|LessThan7~6_combout\,
	datad => \inst|iVMCalc|LessThan7~4_combout\,
	combout => \inst|iVMCalc|LessThan2~18_combout\);

-- Location: LCCOMB_X33_Y23_N12
\inst|iVMCalc|MuxAddress~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|MuxAddress~2_combout\ = (\inst|iVMCalc|LessThan7~5_combout\ & ((\inst|iVMCalc|LessThan2~18_combout\) # (\inst|iVMCalc|secondImage~regout\ $ (\inst|iVMCalc|LessThan6~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|secondImage~regout\,
	datab => \inst|iVMCalc|LessThan6~20_combout\,
	datac => \inst|iVMCalc|LessThan2~18_combout\,
	datad => \inst|iVMCalc|LessThan7~5_combout\,
	combout => \inst|iVMCalc|MuxAddress~2_combout\);

-- Location: LCCOMB_X34_Y18_N18
\inst|iDL2|LSPflag:romID[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LSPflag:romID[1]~0_combout\ = (\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & (!\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & ((!\inst_gen|xcolumn[6]~_Duplicate_2_regout\) # (!\inst_gen|xcolumn[5]~_Duplicate_2_regout\)))) # 
-- (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & \inst_gen|xcolumn[7]~_Duplicate_2_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	combout => \inst|iDL2|LSPflag:romID[1]~0_combout\);

-- Location: LCCOMB_X29_Y19_N2
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~0_combout\ = (\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0) & (((\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1))))) 
-- # (!\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a4~portadataout\))) # 
-- (!\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a0~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a0~portadataout\,
	datab => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a4~portadataout\,
	datac => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datad => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1),
	combout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~0_combout\);

-- Location: LCCOMB_X29_Y19_N10
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\ = (\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~0_combout\ & 
-- (((\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a6~portadataout\) # (!\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # 
-- (!\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~0_combout\ & (\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a2~portadataout\ & 
-- ((\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~0_combout\,
	datab => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a2~portadataout\,
	datac => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a6~portadataout\,
	datad => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\);

-- Location: LCCOMB_X38_Y17_N30
\inst|iDL2|LessThan13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan13~0_combout\ = (!\inst|iDL2|Add1~38_combout\ & (!\inst|iDL2|Add1~40_combout\ & (!\inst|iDL2|Add1~36_combout\ & !\inst|iDL2|Add1~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add1~38_combout\,
	datab => \inst|iDL2|Add1~40_combout\,
	datac => \inst|iDL2|Add1~36_combout\,
	datad => \inst|iDL2|Add1~34_combout\,
	combout => \inst|iDL2|LessThan13~0_combout\);

-- Location: LCCOMB_X38_Y17_N24
\inst|iDL2|LessThan13~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan13~1_combout\ = ((!\inst|iDL2|Add1~22_combout\) # (!\inst|iDL2|Add1~20_combout\)) # (!\inst|iDL2|Add1~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add1~24_combout\,
	datac => \inst|iDL2|Add1~20_combout\,
	datad => \inst|iDL2|Add1~22_combout\,
	combout => \inst|iDL2|LessThan13~1_combout\);

-- Location: LCCOMB_X38_Y18_N0
\inst|iDL2|LessThan13~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan13~2_combout\ = (!\inst|iDL2|Add1~14_combout\ & (!\inst|iDL2|Add1~16_combout\ & (!\inst|iDL2|Add1~10_combout\ & !\inst|iDL2|Add1~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add1~14_combout\,
	datab => \inst|iDL2|Add1~16_combout\,
	datac => \inst|iDL2|Add1~10_combout\,
	datad => \inst|iDL2|Add1~12_combout\,
	combout => \inst|iDL2|LessThan13~2_combout\);

-- Location: LCCOMB_X38_Y17_N26
\inst|iDL2|LessThan13~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan13~3_combout\ = (\inst|iDL2|LessThan13~1_combout\) # ((\inst|iDL2|LessThan13~2_combout\ & !\inst|iDL2|Add1~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LessThan13~1_combout\,
	datac => \inst|iDL2|LessThan13~2_combout\,
	datad => \inst|iDL2|Add1~18_combout\,
	combout => \inst|iDL2|LessThan13~3_combout\);

-- Location: LCCOMB_X38_Y17_N28
\inst|iDL2|LessThan13~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan13~4_combout\ = (!\inst|iDL2|Add1~32_combout\ & (!\inst|iDL2|Add1~30_combout\ & (!\inst|iDL2|Add1~26_combout\ & !\inst|iDL2|Add1~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add1~32_combout\,
	datab => \inst|iDL2|Add1~30_combout\,
	datac => \inst|iDL2|Add1~26_combout\,
	datad => \inst|iDL2|Add1~28_combout\,
	combout => \inst|iDL2|LessThan13~4_combout\);

-- Location: LCCOMB_X38_Y17_N22
\inst|iDL2|LessThan13~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan13~5_combout\ = (\inst|iDL2|Add1~42_combout\) # ((\inst|iDL2|LessThan13~4_combout\ & (\inst|iDL2|LessThan13~0_combout\ & \inst|iDL2|LessThan13~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LessThan13~4_combout\,
	datab => \inst|iDL2|LessThan13~0_combout\,
	datac => \inst|iDL2|Add1~42_combout\,
	datad => \inst|iDL2|LessThan13~3_combout\,
	combout => \inst|iDL2|LessThan13~5_combout\);

-- Location: LCCOMB_X33_Y23_N4
\inst|iVMCalc|sor~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|sor~0_combout\ = ((!\inst|iVMCalc|counter\(10) & \inst|iVMCalc|LessThan0~18_combout\)) # (!\inst|iVMCalc|LessThan1~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|LessThan1~20_combout\,
	datac => \inst|iVMCalc|counter\(10),
	datad => \inst|iVMCalc|LessThan0~18_combout\,
	combout => \inst|iVMCalc|sor~0_combout\);

-- Location: LCCOMB_X33_Y23_N6
\inst|iVMCalc|MuxAddress[1]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|MuxAddress[1]~7_combout\ = (\inst|iVMCalc|LessThan7~5_combout\ & (((\inst|iVMCalc|LessThan2~18_combout\ & \inst|iVMCalc|LessThan3~20_combout\)) # (!\inst|iVMCalc|sor~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|LessThan2~18_combout\,
	datab => \inst|iVMCalc|sor~0_combout\,
	datac => \inst|iVMCalc|LessThan3~20_combout\,
	datad => \inst|iVMCalc|LessThan7~5_combout\,
	combout => \inst|iVMCalc|MuxAddress[1]~7_combout\);

-- Location: LCCOMB_X38_Y20_N10
\inst|iDL1|LessThan13~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan13~2_combout\ = (!\inst|iDL1|Add2~12_combout\ & (!\inst|iDL1|Add2~14_combout\ & (!\inst|iDL1|Add2~8_combout\ & !\inst|iDL1|Add2~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add2~12_combout\,
	datab => \inst|iDL1|Add2~14_combout\,
	datac => \inst|iDL1|Add2~8_combout\,
	datad => \inst|iDL1|Add2~10_combout\,
	combout => \inst|iDL1|LessThan13~2_combout\);

-- Location: LCCOMB_X32_Y21_N18
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~2_combout\ = (\inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0))))) 
-- # (!\inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a3~portadataout\))) # 
-- (!\inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a1~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a1~portadataout\,
	datab => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a3~portadataout\,
	datac => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datad => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~2_combout\);

-- Location: LCCOMB_X32_Y21_N30
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\ = (\inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~2_combout\ & 
-- ((\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a7~portadataout\) # ((!\inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1))))) # 
-- (!\inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~2_combout\ & (((\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a5~portadataout\ & 
-- \inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~2_combout\,
	datab => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a7~portadataout\,
	datac => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a5~portadataout\,
	datad => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1),
	combout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\);

-- Location: LCCOMB_X35_Y19_N22
\inst|iDL1|LSPflag:romID[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LSPflag:romID[1]~2_combout\ = (\inst_gen|yrow\(8) & (!\inst_gen|yrow\(9) & (\inst_gen|yrow\(6) $ (\inst_gen|yrow\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(6),
	datab => \inst_gen|yrow\(8),
	datac => \inst_gen|yrow\(9),
	datad => \inst_gen|yrow\(7),
	combout => \inst|iDL1|LSPflag:romID[1]~2_combout\);

-- Location: LCCOMB_X32_Y23_N6
\inst|iDL1|RGB~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|RGB~1_combout\ = \inst|iDL1|LSPflag:romID[0]~0_combout\ $ (((\inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\ & !\inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|LSPflag:romID[0]~0_combout\,
	datac => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\,
	datad => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\,
	combout => \inst|iDL1|RGB~1_combout\);

-- Location: LCCOMB_X32_Y23_N18
\inst|iDL1|VGA_B[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|VGA_B[0]~1_combout\ = (!\inst|iDL1|RGB~1_combout\ & (!\inst|iDL1|LSPflag~2_combout\ & !\inst|iDL2|LSPflag~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|RGB~1_combout\,
	datac => \inst|iDL1|LSPflag~2_combout\,
	datad => \inst|iDL2|LSPflag~4_combout\,
	combout => \inst|iDL1|VGA_B[0]~1_combout\);

-- Location: LCCOMB_X29_Y19_N12
\inst|iDL2|Equal2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Equal2~0_combout\ = (!\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\ & \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\,
	datad => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\,
	combout => \inst|iDL2|Equal2~0_combout\);

-- Location: LCCOMB_X30_Y20_N2
\inst|iDL2|LessThan15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan15~0_combout\ = (\inst|iDL2|Add5~2_combout\) # ((\inst_gen|xcolumn[1]~_Duplicate_2_regout\) # (\inst_gen|xcolumn[0]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add5~2_combout\,
	datac => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	combout => \inst|iDL2|LessThan15~0_combout\);

-- Location: LCCOMB_X32_Y23_N2
\inst|iDL1|VGA_G[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|VGA_G[0]~3_combout\ = (\inst|iDL1|VGA_G[5]~0_combout\ & ((\inst|iDL1|LessThan13~5_combout\) # ((\inst|iDL1|LessThan15~23_combout\ & !\inst|iDL1|RGB~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LessThan15~23_combout\,
	datab => \inst|iDL1|VGA_G[5]~0_combout\,
	datac => \inst|iDL1|RGB~0_combout\,
	datad => \inst|iDL1|LessThan13~5_combout\,
	combout => \inst|iDL1|VGA_G[0]~3_combout\);

-- Location: LCCOMB_X32_Y23_N10
\inst|iDL1|VGA_G[0]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|VGA_G[0]~4_combout\ = (\inst|iDL1|VGA_G[0]~3_combout\) # ((!\inst|iDL1|RGB~1_combout\ & (!\inst|iDL1|LSPflag~2_combout\ & !\inst|iDL2|LSPflag~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|RGB~1_combout\,
	datab => \inst|iDL1|VGA_G[0]~3_combout\,
	datac => \inst|iDL1|LSPflag~2_combout\,
	datad => \inst|iDL2|LSPflag~4_combout\,
	combout => \inst|iDL1|VGA_G[0]~4_combout\);

-- Location: LCCOMB_X32_Y23_N4
\inst|iDL1|VGA_R[6]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|VGA_R[6]~0_combout\ = (\inst|iDL1|VGA_G[0]~3_combout\) # ((\inst|iDL1|RGB~1_combout\ & (!\inst|iDL1|LSPflag~2_combout\ & !\inst|iDL2|LSPflag~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|RGB~1_combout\,
	datab => \inst|iDL1|VGA_G[0]~3_combout\,
	datac => \inst|iDL1|LSPflag~2_combout\,
	datad => \inst|iDL2|LSPflag~4_combout\,
	combout => \inst|iDL1|VGA_R[6]~0_combout\);

-- Location: LCCOMB_X29_Y19_N4
\inst|iDL2|RGB~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|RGB~0_combout\ = (\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\ & (\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\ $ (((\inst|iDL2|LSPflag:romID[1]~combout\) # 
-- (!\inst|iDL2|LSPflag~2_combout\))))) # (!\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\ & (((\inst|iDL2|LSPflag~2_combout\ & !\inst|iDL2|LSPflag:romID[1]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\,
	datab => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\,
	datac => \inst|iDL2|LSPflag~2_combout\,
	datad => \inst|iDL2|LSPflag:romID[1]~combout\,
	combout => \inst|iDL2|RGB~0_combout\);

-- Location: LCCOMB_X32_Y20_N0
\inst|iDL2|Add8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~1_combout\ = (\inst|iDL2|LSPflag:romID[1]~combout\ & ((\inst_gen|xcolumn[6]~_Duplicate_2_regout\ $ (\inst_gen|xcolumn[5]~_Duplicate_2_regout\)))) # (!\inst|iDL2|LSPflag:romID[1]~combout\ & (\inst_gen|yrow\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(6),
	datab => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datac => \inst|iDL2|LSPflag:romID[1]~combout\,
	datad => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	combout => \inst|iDL2|Add8~1_combout\);

-- Location: LCCOMB_X32_Y20_N2
\inst|iDL2|Add8~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~2_combout\ = (\inst|iDL2|LSPflag:romID[1]~combout\ & ((\inst_gen|xcolumn[5]~_Duplicate_2_regout\))) # (!\inst|iDL2|LSPflag:romID[1]~combout\ & (\inst_gen|yrow\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(5),
	datac => \inst|iDL2|LSPflag:romID[1]~combout\,
	datad => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	combout => \inst|iDL2|Add8~2_combout\);

-- Location: LCCOMB_X30_Y19_N4
\inst|iDL2|Add8~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~3_combout\ = (\inst|iDL2|LSPflag:romID[1]~combout\ & ((!\inst_gen|xcolumn[4]~_Duplicate_2_regout\))) # (!\inst|iDL2|LSPflag:romID[1]~combout\ & (\inst_gen|yrow\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(4),
	datab => \inst|iDL2|LSPflag:romID[1]~combout\,
	datad => \inst_gen|xcolumn[4]~_Duplicate_2_regout\,
	combout => \inst|iDL2|Add8~3_combout\);

-- Location: LCCOMB_X33_Y19_N4
\inst|iDL2|Add8~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~4_combout\ = (\inst|iDL2|LSPflag:romID[1]~combout\ & (!\inst_gen|xcolumn[3]~_Duplicate_2_regout\)) # (!\inst|iDL2|LSPflag:romID[1]~combout\ & ((\inst_gen|yrow\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag:romID[1]~combout\,
	datab => \inst_gen|xcolumn[3]~_Duplicate_2_regout\,
	datad => \inst_gen|yrow\(3),
	combout => \inst|iDL2|Add8~4_combout\);

-- Location: LCCOMB_X33_Y19_N0
\inst|iDL2|Add8~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~6_combout\ = (\inst|iDL2|LSPflag:romID[1]~combout\ & ((!\inst_gen|xcolumn[2]~_Duplicate_2_regout\))) # (!\inst|iDL2|LSPflag:romID[1]~combout\ & (\inst_gen|yrow\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag:romID[1]~combout\,
	datab => \inst_gen|yrow\(2),
	datad => \inst_gen|xcolumn[2]~_Duplicate_2_regout\,
	combout => \inst|iDL2|Add8~6_combout\);

-- Location: LCCOMB_X34_Y19_N24
\inst|iDL2|Add8~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~8_combout\ = (\inst|iDL2|LSPflag:romID[1]~combout\ & ((!\inst_gen|xcolumn[1]~_Duplicate_2_regout\))) # (!\inst|iDL2|LSPflag:romID[1]~combout\ & (\inst_gen|yrow\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(1),
	datac => \inst|iDL2|LSPflag:romID[1]~combout\,
	datad => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	combout => \inst|iDL2|Add8~8_combout\);

-- Location: LCCOMB_X32_Y20_N4
\inst|iDL2|Add8~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~9_combout\ = (\inst|iDL2|LSPflag:romID[1]~combout\ & (\inst_gen|yrow\(7) $ (((\inst_gen|yrow\(6)))))) # (!\inst|iDL2|LSPflag:romID[1]~combout\ & (((\inst|iDL2|LSPflag~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(7),
	datab => \inst|iDL2|LSPflag~0_combout\,
	datac => \inst|iDL2|LSPflag:romID[1]~combout\,
	datad => \inst_gen|yrow\(6),
	combout => \inst|iDL2|Add8~9_combout\);

-- Location: LCCOMB_X28_Y19_N10
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~0_combout\ = (!\inst|iDL2|Add8~23_combout\ & (\inst|iDL2|Mux0~2_combout\ & \inst|iDL2|Add8~21_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add8~23_combout\,
	datac => \inst|iDL2|Mux0~2_combout\,
	datad => \inst|iDL2|Add8~21_combout\,
	combout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~0_combout\);

-- Location: LCCOMB_X28_Y19_N0
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~2_combout\ = (\inst|iDL2|Add8~23_combout\ & (\inst|iDL2|Mux0~2_combout\ & \inst|iDL2|Add8~21_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add8~23_combout\,
	datac => \inst|iDL2|Mux0~2_combout\,
	datad => \inst|iDL2|Add8~21_combout\,
	combout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~2_combout\);

-- Location: LCCOMB_X33_Y21_N10
\inst|iDL1|Add9~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~6_combout\ = (\inst|iDL1|LSPflag:romID[1]~4_combout\ & ((!\inst_gen|xcolumn[5]~_Duplicate_2_regout\))) # (!\inst|iDL1|LSPflag:romID[1]~4_combout\ & (\inst_gen|yrow\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(5),
	datab => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	datac => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	combout => \inst|iDL1|Add9~6_combout\);

-- Location: LCCOMB_X31_Y20_N0
\inst|iDL1|Add9~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~7_combout\ = (\inst|iDL1|LSPflag:romID[1]~4_combout\ & (\inst_gen|xcolumn[4]~_Duplicate_2_regout\)) # (!\inst|iDL1|LSPflag:romID[1]~4_combout\ & ((\inst_gen|yrow\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[4]~_Duplicate_2_regout\,
	datac => \inst_gen|yrow\(4),
	datad => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	combout => \inst|iDL1|Add9~7_combout\);

-- Location: LCCOMB_X33_Y19_N30
\inst|iDL1|Add9~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~8_combout\ = (\inst|iDL1|LSPflag:romID[1]~4_combout\ & ((\inst_gen|xcolumn[3]~_Duplicate_2_regout\))) # (!\inst|iDL1|LSPflag:romID[1]~4_combout\ & (\inst_gen|yrow\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datab => \inst_gen|yrow\(3),
	datad => \inst_gen|xcolumn[3]~_Duplicate_2_regout\,
	combout => \inst|iDL1|Add9~8_combout\);

-- Location: LCCOMB_X33_Y19_N2
\inst|iDL1|Add9~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~10_combout\ = (\inst|iDL1|LSPflag:romID[1]~4_combout\ & ((\inst_gen|xcolumn[2]~_Duplicate_2_regout\))) # (!\inst|iDL1|LSPflag:romID[1]~4_combout\ & (\inst_gen|yrow\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(2),
	datab => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datad => \inst_gen|xcolumn[2]~_Duplicate_2_regout\,
	combout => \inst|iDL1|Add9~10_combout\);

-- Location: LCCOMB_X34_Y19_N28
\inst|iDL1|Add9~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~11_combout\ = (\inst|iDL1|LSPflag:romID[1]~4_combout\ & ((\inst_gen|xcolumn[1]~_Duplicate_2_regout\))) # (!\inst|iDL1|LSPflag:romID[1]~4_combout\ & (\inst_gen|yrow\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datac => \inst_gen|yrow\(1),
	datad => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	combout => \inst|iDL1|Add9~11_combout\);

-- Location: LCCOMB_X32_Y21_N4
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode45w[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode45w[2]~0_combout\ = ((!\inst|iDL1|Add9~25_combout\ & !\inst|iDL1|Add9~23_combout\)) # (!\inst|iDL1|LSPflag~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|LSPflag~1_combout\,
	datac => \inst|iDL1|Add9~25_combout\,
	datad => \inst|iDL1|Add9~23_combout\,
	combout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode45w[2]~0_combout\);

-- Location: LCCOMB_X32_Y21_N22
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~2_combout\ = (\inst|iDL1|LSPflag~1_combout\ & (\inst|iDL1|Add9~25_combout\ & \inst|iDL1|Add9~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|LSPflag~1_combout\,
	datac => \inst|iDL1|Add9~25_combout\,
	datad => \inst|iDL1|Add9~23_combout\,
	combout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~2_combout\);

-- Location: LCCOMB_X31_Y18_N6
\inst_gen|LessThan6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|LessThan6~0_combout\ = (\inst_gen|gen:xcounter[8]~regout\) # ((\inst_gen|gen:xcounter[7]~regout\) # (\inst_gen|gen:xcounter[6]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|gen:xcounter[8]~regout\,
	datac => \inst_gen|gen:xcounter[7]~regout\,
	datad => \inst_gen|gen:xcounter[6]~regout\,
	combout => \inst_gen|LessThan6~0_combout\);

-- Location: LCCOMB_X32_Y18_N6
\inst_gen|LessThan7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|LessThan7~1_combout\ = (!\inst_gen|gen:yr[4]~regout\ & (!\inst_gen|gen:yr[7]~regout\ & !\inst_gen|gen:yr[8]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|gen:yr[4]~regout\,
	datac => \inst_gen|gen:yr[7]~regout\,
	datad => \inst_gen|gen:yr[8]~regout\,
	combout => \inst_gen|LessThan7~1_combout\);

-- Location: LCCOMB_X34_Y18_N6
\inst|iDL1|LSPflag:romID[1]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LSPflag:romID[1]~5_combout\ = (\inst|iDL1|LSPflag:romID[1]~2_combout\ & (!\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & ((!\inst_gen|xcolumn[9]~_Duplicate_2_regout\) # (!\inst_gen|xcolumn[7]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LSPflag:romID[1]~2_combout\,
	datab => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	combout => \inst|iDL1|LSPflag:romID[1]~5_combout\);

-- Location: LCCOMB_X33_Y21_N6
\inst|iDL1|Add9~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~28_combout\ = (!\inst|iDL1|LSPflag:romID[1]~4_combout\ & (\inst_gen|xcolumn[6]~_Duplicate_2_regout\ $ (\inst_gen|xcolumn[7]~_Duplicate_2_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datac => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	combout => \inst|iDL1|Add9~28_combout\);

-- Location: LCCOMB_X33_Y23_N20
\inst|iVMCalc|MuxAddress[0]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|MuxAddress[0]~9_combout\ = ((\inst|iVMCalc|counter\(31)) # ((\inst|iVMCalc|LessThan0~18_combout\ & !\inst|iVMCalc|counter\(10)))) # (!\inst|iVMCalc|LessThan7~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|LessThan0~18_combout\,
	datab => \inst|iVMCalc|LessThan7~5_combout\,
	datac => \inst|iVMCalc|counter\(10),
	datad => \inst|iVMCalc|counter\(31),
	combout => \inst|iVMCalc|MuxAddress[0]~9_combout\);

-- Location: LCCOMB_X40_Y18_N0
\~GND\ : cycloneii_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X35_Y20_N2
\inst|iDL2|LessThan9~0_wirecell\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan9~0_wirecell_combout\ = !\inst|iDL2|LessThan9~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iDL2|LessThan9~0_combout\,
	combout => \inst|iDL2|LessThan9~0_wirecell_combout\);

-- Location: PIN_N23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\KEY[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_KEY(1),
	combout => \KEY~combout\(1));

-- Location: CLKCTRL_G8
\inst_gen|VGA_VS~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst_gen|VGA_VS~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst_gen|VGA_VS~clkctrl_outclk\);

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLOCK_50~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_CLOCK_50,
	combout => \CLOCK_50~combout\);

-- Location: PIN_P23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\KEY[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_KEY(2),
	combout => \KEY~combout\(2));

-- Location: PIN_W26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\KEY[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_KEY(3),
	combout => \KEY~combout\(3));

-- Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\KEY[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_KEY(0),
	combout => \KEY~combout\(0));

-- Location: LCCOMB_X64_Y18_N16
\inst4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4~0_combout\ = (((!\KEY~combout\(0)) # (!\KEY~combout\(3))) # (!\KEY~combout\(2))) # (!\KEY~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY~combout\(1),
	datab => \KEY~combout\(2),
	datac => \KEY~combout\(3),
	datad => \KEY~combout\(0),
	combout => \inst4~0_combout\);

-- Location: LCCOMB_X31_Y18_N8
\inst_gen|VGA_CLK~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|VGA_CLK~0_combout\ = (\inst4~0_combout\ & ((\inst_gen|VGA_CLK~regout\))) # (!\inst4~0_combout\ & (\inst_gen|gen:xcounter[0]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:xcounter[0]~regout\,
	datac => \inst_gen|VGA_CLK~regout\,
	datad => \inst4~0_combout\,
	combout => \inst_gen|VGA_CLK~0_combout\);

-- Location: LCFF_X31_Y18_N9
\inst_gen|VGA_CLK\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLOCK_50~combout\,
	datain => \inst_gen|VGA_CLK~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|VGA_CLK~regout\);

-- Location: LCCOMB_X21_Y32_N18
\inst|iPipeLine|VGA_CLK~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iPipeLine|VGA_CLK~0_combout\ = !\inst_gen|VGA_CLK~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_gen|VGA_CLK~regout\,
	combout => \inst|iPipeLine|VGA_CLK~0_combout\);

-- Location: LCFF_X21_Y32_N19
\inst|iPipeLine|VGA_CLK\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLOCK_50~clkctrl_outclk\,
	datain => \inst|iPipeLine|VGA_CLK~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_CLK~regout\);

-- Location: LCFF_X24_Y32_N25
\inst2|VGA_CLK\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~combout\,
	sdata => \inst|iPipeLine|VGA_CLK~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_CLK~regout\);

-- Location: CLKCTRL_G2
\CLOCK_50~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~clkctrl_outclk\);

-- Location: LCCOMB_X32_Y18_N10
\inst_gen|gen:yr[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:yr[0]~1_combout\ = \inst_gen|gen:yr[0]~regout\ $ (VCC)
-- \inst_gen|gen:yr[0]~2\ = CARRY(\inst_gen|gen:yr[0]~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:yr[0]~regout\,
	datad => VCC,
	combout => \inst_gen|gen:yr[0]~1_combout\,
	cout => \inst_gen|gen:yr[0]~2\);

-- Location: LCCOMB_X32_Y18_N12
\inst_gen|gen:yr[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:yr[1]~1_combout\ = (\inst_gen|gen:yr[1]~regout\ & (!\inst_gen|gen:yr[0]~2\)) # (!\inst_gen|gen:yr[1]~regout\ & ((\inst_gen|gen:yr[0]~2\) # (GND)))
-- \inst_gen|gen:yr[1]~2\ = CARRY((!\inst_gen|gen:yr[0]~2\) # (!\inst_gen|gen:yr[1]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:yr[1]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:yr[0]~2\,
	combout => \inst_gen|gen:yr[1]~1_combout\,
	cout => \inst_gen|gen:yr[1]~2\);

-- Location: LCCOMB_X32_Y18_N14
\inst_gen|gen:yr[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:yr[2]~1_combout\ = (\inst_gen|gen:yr[2]~regout\ & (\inst_gen|gen:yr[1]~2\ $ (GND))) # (!\inst_gen|gen:yr[2]~regout\ & (!\inst_gen|gen:yr[1]~2\ & VCC))
-- \inst_gen|gen:yr[2]~2\ = CARRY((\inst_gen|gen:yr[2]~regout\ & !\inst_gen|gen:yr[1]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|gen:yr[2]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:yr[1]~2\,
	combout => \inst_gen|gen:yr[2]~1_combout\,
	cout => \inst_gen|gen:yr[2]~2\);

-- Location: CLKCTRL_G6
\inst4~0clkctrl\ : cycloneii_clkctrl
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

-- Location: LCCOMB_X32_Y18_N20
\inst_gen|gen:yr[5]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:yr[5]~1_combout\ = (\inst_gen|gen:yr[5]~regout\ & (!\inst_gen|gen:yr[4]~2\)) # (!\inst_gen|gen:yr[5]~regout\ & ((\inst_gen|gen:yr[4]~2\) # (GND)))
-- \inst_gen|gen:yr[5]~2\ = CARRY((!\inst_gen|gen:yr[4]~2\) # (!\inst_gen|gen:yr[5]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:yr[5]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:yr[4]~2\,
	combout => \inst_gen|gen:yr[5]~1_combout\,
	cout => \inst_gen|gen:yr[5]~2\);

-- Location: LCCOMB_X31_Y18_N12
\inst_gen|gen:xcounter[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:xcounter[1]~1_combout\ = (\inst_gen|gen:xcounter[1]~regout\ & (!\inst_gen|gen:xcounter[0]~2\)) # (!\inst_gen|gen:xcounter[1]~regout\ & ((\inst_gen|gen:xcounter[0]~2\) # (GND)))
-- \inst_gen|gen:xcounter[1]~2\ = CARRY((!\inst_gen|gen:xcounter[0]~2\) # (!\inst_gen|gen:xcounter[1]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:xcounter[1]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:xcounter[0]~2\,
	combout => \inst_gen|gen:xcounter[1]~1_combout\,
	cout => \inst_gen|gen:xcounter[1]~2\);

-- Location: LCCOMB_X31_Y18_N14
\inst_gen|gen:xcounter[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:xcounter[2]~1_combout\ = (\inst_gen|gen:xcounter[2]~regout\ & (\inst_gen|gen:xcounter[1]~2\ $ (GND))) # (!\inst_gen|gen:xcounter[2]~regout\ & (!\inst_gen|gen:xcounter[1]~2\ & VCC))
-- \inst_gen|gen:xcounter[2]~2\ = CARRY((\inst_gen|gen:xcounter[2]~regout\ & !\inst_gen|gen:xcounter[1]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|gen:xcounter[2]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:xcounter[1]~2\,
	combout => \inst_gen|gen:xcounter[2]~1_combout\,
	cout => \inst_gen|gen:xcounter[2]~2\);

-- Location: LCFF_X31_Y18_N15
\inst_gen|gen:xcounter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:xcounter[2]~1_combout\,
	sclr => \inst_gen|LessThan6~3_combout\,
	ena => \ALT_INV_inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:xcounter[2]~regout\);

-- Location: LCCOMB_X31_Y18_N16
\inst_gen|gen:xcounter[3]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:xcounter[3]~1_combout\ = (\inst_gen|gen:xcounter[3]~regout\ & (!\inst_gen|gen:xcounter[2]~2\)) # (!\inst_gen|gen:xcounter[3]~regout\ & ((\inst_gen|gen:xcounter[2]~2\) # (GND)))
-- \inst_gen|gen:xcounter[3]~2\ = CARRY((!\inst_gen|gen:xcounter[2]~2\) # (!\inst_gen|gen:xcounter[3]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:xcounter[3]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:xcounter[2]~2\,
	combout => \inst_gen|gen:xcounter[3]~1_combout\,
	cout => \inst_gen|gen:xcounter[3]~2\);

-- Location: LCCOMB_X31_Y18_N18
\inst_gen|gen:xcounter[4]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:xcounter[4]~1_combout\ = (\inst_gen|gen:xcounter[4]~regout\ & (\inst_gen|gen:xcounter[3]~2\ $ (GND))) # (!\inst_gen|gen:xcounter[4]~regout\ & (!\inst_gen|gen:xcounter[3]~2\ & VCC))
-- \inst_gen|gen:xcounter[4]~2\ = CARRY((\inst_gen|gen:xcounter[4]~regout\ & !\inst_gen|gen:xcounter[3]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|gen:xcounter[4]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:xcounter[3]~2\,
	combout => \inst_gen|gen:xcounter[4]~1_combout\,
	cout => \inst_gen|gen:xcounter[4]~2\);

-- Location: LCFF_X31_Y18_N19
\inst_gen|gen:xcounter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:xcounter[4]~1_combout\,
	sclr => \inst_gen|LessThan6~3_combout\,
	ena => \ALT_INV_inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:xcounter[4]~regout\);

-- Location: LCCOMB_X31_Y18_N20
\inst_gen|gen:xcounter[5]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:xcounter[5]~1_combout\ = (\inst_gen|gen:xcounter[5]~regout\ & (!\inst_gen|gen:xcounter[4]~2\)) # (!\inst_gen|gen:xcounter[5]~regout\ & ((\inst_gen|gen:xcounter[4]~2\) # (GND)))
-- \inst_gen|gen:xcounter[5]~2\ = CARRY((!\inst_gen|gen:xcounter[4]~2\) # (!\inst_gen|gen:xcounter[5]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:xcounter[5]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:xcounter[4]~2\,
	combout => \inst_gen|gen:xcounter[5]~1_combout\,
	cout => \inst_gen|gen:xcounter[5]~2\);

-- Location: LCFF_X31_Y18_N21
\inst_gen|gen:xcounter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:xcounter[5]~1_combout\,
	sclr => \inst_gen|LessThan6~3_combout\,
	ena => \ALT_INV_inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:xcounter[5]~regout\);

-- Location: LCFF_X31_Y18_N13
\inst_gen|gen:xcounter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:xcounter[1]~1_combout\,
	sclr => \inst_gen|LessThan6~3_combout\,
	ena => \ALT_INV_inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:xcounter[1]~regout\);

-- Location: LCCOMB_X31_Y18_N0
\inst_gen|LessThan6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|LessThan6~1_combout\ = (((!\inst_gen|gen:xcounter[1]~regout\) # (!\inst_gen|gen:xcounter[5]~regout\)) # (!\inst_gen|gen:xcounter[2]~regout\)) # (!\inst_gen|gen:xcounter[0]~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:xcounter[0]~regout\,
	datab => \inst_gen|gen:xcounter[2]~regout\,
	datac => \inst_gen|gen:xcounter[5]~regout\,
	datad => \inst_gen|gen:xcounter[1]~regout\,
	combout => \inst_gen|LessThan6~1_combout\);

-- Location: LCFF_X31_Y18_N17
\inst_gen|gen:xcounter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:xcounter[3]~1_combout\,
	sclr => \inst_gen|LessThan6~3_combout\,
	ena => \ALT_INV_inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:xcounter[3]~regout\);

-- Location: LCCOMB_X31_Y18_N2
\inst_gen|LessThan6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|LessThan6~2_combout\ = (!\inst_gen|LessThan6~1_combout\ & (\inst_gen|gen:xcounter[3]~regout\ & \inst_gen|gen:xcounter[4]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|LessThan6~1_combout\,
	datac => \inst_gen|gen:xcounter[3]~regout\,
	datad => \inst_gen|gen:xcounter[4]~regout\,
	combout => \inst_gen|LessThan6~2_combout\);

-- Location: LCCOMB_X31_Y18_N22
\inst_gen|gen:xcounter[6]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:xcounter[6]~1_combout\ = (\inst_gen|gen:xcounter[6]~regout\ & (\inst_gen|gen:xcounter[5]~2\ $ (GND))) # (!\inst_gen|gen:xcounter[6]~regout\ & (!\inst_gen|gen:xcounter[5]~2\ & VCC))
-- \inst_gen|gen:xcounter[6]~2\ = CARRY((\inst_gen|gen:xcounter[6]~regout\ & !\inst_gen|gen:xcounter[5]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|gen:xcounter[6]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:xcounter[5]~2\,
	combout => \inst_gen|gen:xcounter[6]~1_combout\,
	cout => \inst_gen|gen:xcounter[6]~2\);

-- Location: LCFF_X31_Y18_N23
\inst_gen|gen:xcounter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:xcounter[6]~1_combout\,
	sclr => \inst_gen|LessThan6~3_combout\,
	ena => \ALT_INV_inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:xcounter[6]~regout\);

-- Location: LCCOMB_X31_Y18_N24
\inst_gen|gen:xcounter[7]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:xcounter[7]~1_combout\ = (\inst_gen|gen:xcounter[7]~regout\ & (!\inst_gen|gen:xcounter[6]~2\)) # (!\inst_gen|gen:xcounter[7]~regout\ & ((\inst_gen|gen:xcounter[6]~2\) # (GND)))
-- \inst_gen|gen:xcounter[7]~2\ = CARRY((!\inst_gen|gen:xcounter[6]~2\) # (!\inst_gen|gen:xcounter[7]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:xcounter[7]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:xcounter[6]~2\,
	combout => \inst_gen|gen:xcounter[7]~1_combout\,
	cout => \inst_gen|gen:xcounter[7]~2\);

-- Location: LCCOMB_X31_Y18_N26
\inst_gen|gen:xcounter[8]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:xcounter[8]~1_combout\ = (\inst_gen|gen:xcounter[8]~regout\ & (\inst_gen|gen:xcounter[7]~2\ $ (GND))) # (!\inst_gen|gen:xcounter[8]~regout\ & (!\inst_gen|gen:xcounter[7]~2\ & VCC))
-- \inst_gen|gen:xcounter[8]~2\ = CARRY((\inst_gen|gen:xcounter[8]~regout\ & !\inst_gen|gen:xcounter[7]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|gen:xcounter[8]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:xcounter[7]~2\,
	combout => \inst_gen|gen:xcounter[8]~1_combout\,
	cout => \inst_gen|gen:xcounter[8]~2\);

-- Location: LCFF_X31_Y18_N27
\inst_gen|gen:xcounter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:xcounter[8]~1_combout\,
	sclr => \inst_gen|LessThan6~3_combout\,
	ena => \ALT_INV_inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:xcounter[8]~regout\);

-- Location: LCCOMB_X31_Y18_N28
\inst_gen|gen:xcounter[9]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:xcounter[9]~1_combout\ = (\inst_gen|gen:xcounter[9]~regout\ & (!\inst_gen|gen:xcounter[8]~2\)) # (!\inst_gen|gen:xcounter[9]~regout\ & ((\inst_gen|gen:xcounter[8]~2\) # (GND)))
-- \inst_gen|gen:xcounter[9]~2\ = CARRY((!\inst_gen|gen:xcounter[8]~2\) # (!\inst_gen|gen:xcounter[9]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:xcounter[9]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:xcounter[8]~2\,
	combout => \inst_gen|gen:xcounter[9]~1_combout\,
	cout => \inst_gen|gen:xcounter[9]~2\);

-- Location: LCFF_X31_Y18_N29
\inst_gen|gen:xcounter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:xcounter[9]~1_combout\,
	sclr => \inst_gen|LessThan6~3_combout\,
	ena => \ALT_INV_inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:xcounter[9]~regout\);

-- Location: LCCOMB_X31_Y18_N30
\inst_gen|gen:xcounter[10]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:xcounter[10]~1_combout\ = \inst_gen|gen:xcounter[9]~2\ $ (!\inst_gen|gen:xcounter[10]~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst_gen|gen:xcounter[10]~regout\,
	cin => \inst_gen|gen:xcounter[9]~2\,
	combout => \inst_gen|gen:xcounter[10]~1_combout\);

-- Location: LCFF_X31_Y18_N31
\inst_gen|gen:xcounter[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:xcounter[10]~1_combout\,
	sclr => \inst_gen|LessThan6~3_combout\,
	ena => \ALT_INV_inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:xcounter[10]~regout\);

-- Location: LCCOMB_X31_Y18_N4
\inst_gen|LessThan6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|LessThan6~3_combout\ = (\inst_gen|gen:xcounter[9]~regout\ & (\inst_gen|gen:xcounter[10]~regout\ & ((\inst_gen|LessThan6~0_combout\) # (\inst_gen|LessThan6~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|LessThan6~0_combout\,
	datab => \inst_gen|LessThan6~2_combout\,
	datac => \inst_gen|gen:xcounter[9]~regout\,
	datad => \inst_gen|gen:xcounter[10]~regout\,
	combout => \inst_gen|LessThan6~3_combout\);

-- Location: LCFF_X32_Y18_N21
\inst_gen|gen:yr[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:yr[5]~1_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst_gen|LessThan7~2_combout\,
	ena => \inst_gen|LessThan6~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:yr[5]~regout\);

-- Location: LCCOMB_X32_Y18_N2
\inst_gen|LessThan7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|LessThan7~0_combout\ = (!\inst_gen|gen:yr[5]~regout\ & (!\inst_gen|gen:yr[6]~regout\ & ((!\inst_gen|gen:yr[2]~regout\) # (!\inst_gen|gen:yr[3]~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:yr[3]~regout\,
	datab => \inst_gen|gen:yr[2]~regout\,
	datac => \inst_gen|gen:yr[5]~regout\,
	datad => \inst_gen|gen:yr[6]~regout\,
	combout => \inst_gen|LessThan7~0_combout\);

-- Location: LCCOMB_X32_Y18_N26
\inst_gen|gen:yr[8]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:yr[8]~1_combout\ = (\inst_gen|gen:yr[8]~regout\ & (\inst_gen|gen:yr[7]~2\ $ (GND))) # (!\inst_gen|gen:yr[8]~regout\ & (!\inst_gen|gen:yr[7]~2\ & VCC))
-- \inst_gen|gen:yr[8]~2\ = CARRY((\inst_gen|gen:yr[8]~regout\ & !\inst_gen|gen:yr[7]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|gen:yr[8]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:yr[7]~2\,
	combout => \inst_gen|gen:yr[8]~1_combout\,
	cout => \inst_gen|gen:yr[8]~2\);

-- Location: LCCOMB_X32_Y18_N28
\inst_gen|gen:yr[9]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:yr[9]~1_combout\ = \inst_gen|gen:yr[8]~2\ $ (\inst_gen|gen:yr[9]~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst_gen|gen:yr[9]~regout\,
	cin => \inst_gen|gen:yr[8]~2\,
	combout => \inst_gen|gen:yr[9]~1_combout\);

-- Location: LCFF_X32_Y18_N29
\inst_gen|gen:yr[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:yr[9]~1_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst_gen|LessThan7~2_combout\,
	ena => \inst_gen|LessThan6~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:yr[9]~regout\);

-- Location: LCCOMB_X32_Y18_N4
\inst_gen|LessThan7~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|LessThan7~2_combout\ = (\inst_gen|gen:yr[9]~regout\ & ((!\inst_gen|LessThan7~0_combout\) # (!\inst_gen|LessThan7~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|LessThan7~1_combout\,
	datab => \inst_gen|LessThan7~0_combout\,
	datad => \inst_gen|gen:yr[9]~regout\,
	combout => \inst_gen|LessThan7~2_combout\);

-- Location: LCFF_X32_Y18_N15
\inst_gen|gen:yr[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:yr[2]~1_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst_gen|LessThan7~2_combout\,
	ena => \inst_gen|LessThan6~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:yr[2]~regout\);

-- Location: LCCOMB_X32_Y18_N16
\inst_gen|gen:yr[3]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:yr[3]~1_combout\ = (\inst_gen|gen:yr[3]~regout\ & (!\inst_gen|gen:yr[2]~2\)) # (!\inst_gen|gen:yr[3]~regout\ & ((\inst_gen|gen:yr[2]~2\) # (GND)))
-- \inst_gen|gen:yr[3]~2\ = CARRY((!\inst_gen|gen:yr[2]~2\) # (!\inst_gen|gen:yr[3]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:yr[3]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:yr[2]~2\,
	combout => \inst_gen|gen:yr[3]~1_combout\,
	cout => \inst_gen|gen:yr[3]~2\);

-- Location: LCCOMB_X32_Y18_N18
\inst_gen|gen:yr[4]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:yr[4]~1_combout\ = (\inst_gen|gen:yr[4]~regout\ & (\inst_gen|gen:yr[3]~2\ $ (GND))) # (!\inst_gen|gen:yr[4]~regout\ & (!\inst_gen|gen:yr[3]~2\ & VCC))
-- \inst_gen|gen:yr[4]~2\ = CARRY((\inst_gen|gen:yr[4]~regout\ & !\inst_gen|gen:yr[3]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|gen:yr[4]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:yr[3]~2\,
	combout => \inst_gen|gen:yr[4]~1_combout\,
	cout => \inst_gen|gen:yr[4]~2\);

-- Location: LCFF_X32_Y18_N19
\inst_gen|gen:yr[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:yr[4]~1_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst_gen|LessThan7~2_combout\,
	ena => \inst_gen|LessThan6~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:yr[4]~regout\);

-- Location: LCCOMB_X32_Y18_N22
\inst_gen|gen:yr[6]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:yr[6]~1_combout\ = (\inst_gen|gen:yr[6]~regout\ & (\inst_gen|gen:yr[5]~2\ $ (GND))) # (!\inst_gen|gen:yr[6]~regout\ & (!\inst_gen|gen:yr[5]~2\ & VCC))
-- \inst_gen|gen:yr[6]~2\ = CARRY((\inst_gen|gen:yr[6]~regout\ & !\inst_gen|gen:yr[5]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|gen:yr[6]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:yr[5]~2\,
	combout => \inst_gen|gen:yr[6]~1_combout\,
	cout => \inst_gen|gen:yr[6]~2\);

-- Location: LCFF_X32_Y18_N23
\inst_gen|gen:yr[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:yr[6]~1_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst_gen|LessThan7~2_combout\,
	ena => \inst_gen|LessThan6~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:yr[6]~regout\);

-- Location: LCCOMB_X32_Y18_N24
\inst_gen|gen:yr[7]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen:yr[7]~1_combout\ = (\inst_gen|gen:yr[7]~regout\ & (!\inst_gen|gen:yr[6]~2\)) # (!\inst_gen|gen:yr[7]~regout\ & ((\inst_gen|gen:yr[6]~2\) # (GND)))
-- \inst_gen|gen:yr[7]~2\ = CARRY((!\inst_gen|gen:yr[6]~2\) # (!\inst_gen|gen:yr[7]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:yr[7]~regout\,
	datad => VCC,
	cin => \inst_gen|gen:yr[6]~2\,
	combout => \inst_gen|gen:yr[7]~1_combout\,
	cout => \inst_gen|gen:yr[7]~2\);

-- Location: LCFF_X32_Y18_N27
\inst_gen|gen:yr[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:yr[8]~1_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst_gen|LessThan7~2_combout\,
	ena => \inst_gen|LessThan6~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:yr[8]~regout\);

-- Location: LCCOMB_X32_Y18_N0
\inst_gen|LessThan5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|LessThan5~0_combout\ = (\inst_gen|gen:yr[7]~regout\ & (\inst_gen|gen:yr[8]~regout\ & (\inst_gen|gen:yr[5]~regout\ & \inst_gen|gen:yr[6]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:yr[7]~regout\,
	datab => \inst_gen|gen:yr[8]~regout\,
	datac => \inst_gen|gen:yr[5]~regout\,
	datad => \inst_gen|gen:yr[6]~regout\,
	combout => \inst_gen|LessThan5~0_combout\);

-- Location: LCCOMB_X34_Y18_N12
\inst_gen|gen~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen~0_combout\ = (!\inst_gen|gen:yr[9]~regout\ & (((!\inst_gen|gen:xcounter[8]~regout\ & !\inst_gen|gen:xcounter[9]~regout\)) # (!\inst_gen|gen:xcounter[10]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:xcounter[8]~regout\,
	datab => \inst_gen|gen:xcounter[10]~regout\,
	datac => \inst_gen|gen:xcounter[9]~regout\,
	datad => \inst_gen|gen:yr[9]~regout\,
	combout => \inst_gen|gen~0_combout\);

-- Location: LCCOMB_X34_Y18_N8
\inst_gen|gen~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen~1_combout\ = (\inst_gen|LessThan5~0_combout\) # (!\inst_gen|gen~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_gen|LessThan5~0_combout\,
	datad => \inst_gen|gen~0_combout\,
	combout => \inst_gen|gen~1_combout\);

-- Location: LCFF_X34_Y18_N9
\inst_gen|VGA_BLANK\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen~1_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|VGA_BLANK~regout\);

-- Location: LCCOMB_X25_Y32_N6
\inst|iPipeLine|VGA_BLANK~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iPipeLine|VGA_BLANK~feeder_combout\ = \inst_gen|VGA_BLANK~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_gen|VGA_BLANK~regout\,
	combout => \inst|iPipeLine|VGA_BLANK~feeder_combout\);

-- Location: LCFF_X25_Y32_N7
\inst|iPipeLine|VGA_BLANK\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iPipeLine|VGA_BLANK~feeder_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_BLANK~regout\);

-- Location: LCCOMB_X25_Y32_N8
\inst2|VGA_BLANK~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_BLANK~feeder_combout\ = \inst|iPipeLine|VGA_BLANK~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iPipeLine|VGA_BLANK~regout\,
	combout => \inst2|VGA_BLANK~feeder_combout\);

-- Location: LCFF_X25_Y32_N9
\inst2|VGA_BLANK\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_BLANK~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_BLANK~regout\);

-- Location: LCCOMB_X34_Y18_N30
\inst_gen|gen~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen~2_combout\ = (\inst_gen|gen:xcounter[8]~regout\ & (\inst_gen|gen:xcounter[10]~regout\ & !\inst_gen|gen:xcounter[9]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:xcounter[8]~regout\,
	datab => \inst_gen|gen:xcounter[10]~regout\,
	datac => \inst_gen|gen:xcounter[9]~regout\,
	combout => \inst_gen|gen~2_combout\);

-- Location: LCCOMB_X33_Y18_N18
\inst_gen|gen~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen~3_combout\ = (\inst_gen|gen~2_combout\ & ((\inst_gen|gen:xcounter[7]~regout\ & ((!\inst_gen|gen:xcounter[6]~regout\) # (!\inst_gen|gen:xcounter[5]~regout\))) # (!\inst_gen|gen:xcounter[7]~regout\ & ((\inst_gen|gen:xcounter[5]~regout\) # 
-- (\inst_gen|gen:xcounter[6]~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:xcounter[7]~regout\,
	datab => \inst_gen|gen:xcounter[5]~regout\,
	datac => \inst_gen|gen:xcounter[6]~regout\,
	datad => \inst_gen|gen~2_combout\,
	combout => \inst_gen|gen~3_combout\);

-- Location: LCFF_X33_Y18_N19
\inst_gen|VGA_HS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen~3_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|VGA_HS~regout\);

-- Location: LCCOMB_X25_Y32_N0
\inst|iPipeLine|VGA_HS~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iPipeLine|VGA_HS~feeder_combout\ = \inst_gen|VGA_HS~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_gen|VGA_HS~regout\,
	combout => \inst|iPipeLine|VGA_HS~feeder_combout\);

-- Location: LCFF_X25_Y32_N1
\inst|iPipeLine|VGA_HS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iPipeLine|VGA_HS~feeder_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_HS~regout\);

-- Location: LCCOMB_X25_Y32_N2
\inst2|VGA_HS~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_HS~feeder_combout\ = \inst|iPipeLine|VGA_HS~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iPipeLine|VGA_HS~regout\,
	combout => \inst2|VGA_HS~feeder_combout\);

-- Location: LCFF_X25_Y32_N3
\inst2|VGA_HS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_HS~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_HS~regout\);

-- Location: LCCOMB_X32_Y18_N30
\inst_gen|gen~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen~4_combout\ = ((\inst_gen|gen:yr[9]~regout\) # ((\inst_gen|gen:yr[2]~regout\) # (\inst_gen|gen:yr[4]~regout\))) # (!\inst_gen|gen:yr[3]~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:yr[3]~regout\,
	datab => \inst_gen|gen:yr[9]~regout\,
	datac => \inst_gen|gen:yr[2]~regout\,
	datad => \inst_gen|gen:yr[4]~regout\,
	combout => \inst_gen|gen~4_combout\);

-- Location: LCFF_X32_Y18_N13
\inst_gen|gen:yr[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:yr[1]~1_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst_gen|LessThan7~2_combout\,
	ena => \inst_gen|LessThan6~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:yr[1]~regout\);

-- Location: LCCOMB_X32_Y18_N8
\inst_gen|gen~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|gen~5_combout\ = (\inst_gen|LessThan5~0_combout\ & (!\inst_gen|gen~4_combout\ & \inst_gen|gen:yr[1]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|LessThan5~0_combout\,
	datac => \inst_gen|gen~4_combout\,
	datad => \inst_gen|gen:yr[1]~regout\,
	combout => \inst_gen|gen~5_combout\);

-- Location: LCFF_X32_Y18_N9
\inst_gen|VGA_VS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~combout\,
	datain => \inst_gen|gen~5_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|VGA_VS~regout\);

-- Location: LCCOMB_X25_Y32_N18
\inst|iPipeLine|VGA_VS~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iPipeLine|VGA_VS~feeder_combout\ = \inst_gen|VGA_VS~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_gen|VGA_VS~regout\,
	combout => \inst|iPipeLine|VGA_VS~feeder_combout\);

-- Location: LCFF_X25_Y32_N19
\inst|iPipeLine|VGA_VS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iPipeLine|VGA_VS~feeder_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_VS~regout\);

-- Location: LCCOMB_X25_Y32_N20
\inst2|VGA_VS~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_VS~feeder_combout\ = \inst|iPipeLine|VGA_VS~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iPipeLine|VGA_VS~regout\,
	combout => \inst2|VGA_VS~feeder_combout\);

-- Location: LCFF_X25_Y32_N21
\inst2|VGA_VS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_VS~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_VS~regout\);

-- Location: LCCOMB_X33_Y18_N12
\inst_gen|VGA_SYNC~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|VGA_SYNC~0_combout\ = (\inst_gen|gen~3_combout\) # ((\inst_gen|gen:yr[1]~regout\ & (!\inst_gen|gen~4_combout\ & \inst_gen|LessThan5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|gen:yr[1]~regout\,
	datab => \inst_gen|gen~3_combout\,
	datac => \inst_gen|gen~4_combout\,
	datad => \inst_gen|LessThan5~0_combout\,
	combout => \inst_gen|VGA_SYNC~0_combout\);

-- Location: LCFF_X33_Y18_N13
\inst_gen|VGA_SYNC\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|VGA_SYNC~0_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|VGA_SYNC~regout\);

-- Location: LCCOMB_X33_Y18_N8
\inst|iPipeLine|VGA_SYNC~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iPipeLine|VGA_SYNC~feeder_combout\ = \inst_gen|VGA_SYNC~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_gen|VGA_SYNC~regout\,
	combout => \inst|iPipeLine|VGA_SYNC~feeder_combout\);

-- Location: LCFF_X33_Y18_N9
\inst|iPipeLine|VGA_SYNC\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iPipeLine|VGA_SYNC~feeder_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_SYNC~regout\);

-- Location: LCFF_X21_Y32_N25
\inst2|VGA_SYNC\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst|iPipeLine|VGA_SYNC~regout\,
	sload => VCC,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_SYNC~regout\);

-- Location: LCFF_X34_Y18_N19
\inst_gen|xcolumn[9]~_Duplicate_2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:xcounter[10]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|xcolumn[9]~_Duplicate_2_regout\);

-- Location: LCFF_X31_Y18_N25
\inst_gen|gen:xcounter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:xcounter[7]~1_combout\,
	sclr => \inst_gen|LessThan6~3_combout\,
	ena => \ALT_INV_inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:xcounter[7]~regout\);

-- Location: LCFF_X30_Y19_N1
\inst_gen|xcolumn[6]~_Duplicate_2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:xcounter[7]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|xcolumn[6]~_Duplicate_2_regout\);

-- Location: LCFF_X34_Y18_N23
\inst_gen|xcolumn[7]~_Duplicate_2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:xcounter[8]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|xcolumn[7]~_Duplicate_2_regout\);

-- Location: LCCOMB_X34_Y18_N26
\inst|iDL1|LSPflag~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LSPflag~0_combout\ = (\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & \inst_gen|xcolumn[7]~_Duplicate_2_regout\))) # 
-- (!\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & !\inst_gen|xcolumn[7]~_Duplicate_2_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	combout => \inst|iDL1|LSPflag~0_combout\);

-- Location: LCCOMB_X34_Y18_N14
\inst|iDL1|LSPflag:romID[1]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LSPflag:romID[1]~3_combout\ = (\inst_gen|xcolumn[5]~_Duplicate_2_regout\) # ((\inst_gen|xcolumn[6]~_Duplicate_2_regout\) # ((\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & \inst_gen|xcolumn[7]~_Duplicate_2_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	combout => \inst|iDL1|LSPflag:romID[1]~3_combout\);

-- Location: LCFF_X34_Y18_N5
\inst_gen|xcolumn[8]~_Duplicate_2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:xcounter[9]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|xcolumn[8]~_Duplicate_2_regout\);

-- Location: LCCOMB_X34_Y18_N2
\inst|iDL1|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add0~0_combout\ = \inst_gen|xcolumn[9]~_Duplicate_2_regout\ $ (((!\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & !\inst_gen|xcolumn[7]~_Duplicate_2_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	combout => \inst|iDL1|Add0~0_combout\);

-- Location: LCCOMB_X34_Y18_N0
\inst|iDL1|LSPflag:romID[1]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LSPflag:romID[1]~4_combout\ = (\inst|iDL1|LSPflag:romID[1]~5_combout\ & ((\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & (!\inst|iDL1|LSPflag:romID[1]~3_combout\)) # (!\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & 
-- (\inst|iDL1|LSPflag:romID[1]~3_combout\ & \inst|iDL1|Add0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LSPflag:romID[1]~5_combout\,
	datab => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datac => \inst|iDL1|LSPflag:romID[1]~3_combout\,
	datad => \inst|iDL1|Add0~0_combout\,
	combout => \inst|iDL1|LSPflag:romID[1]~4_combout\);

-- Location: LCFF_X35_Y19_N9
\inst_gen|yrow[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:yr[8]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|yrow\(8));

-- Location: LCFF_X32_Y18_N25
\inst_gen|gen:yr[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:yr[7]~1_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst_gen|LessThan7~2_combout\,
	ena => \inst_gen|LessThan6~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:yr[7]~regout\);

-- Location: LCFF_X35_Y19_N11
\inst_gen|yrow[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:yr[7]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|yrow\(7));

-- Location: LCFF_X35_Y19_N23
\inst_gen|yrow[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:yr[9]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|yrow\(9));

-- Location: LCCOMB_X35_Y19_N10
\inst|iDL2|LSPflag~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LSPflag~1_combout\ = (!\inst_gen|yrow\(8) & (!\inst_gen|yrow\(9) & (\inst_gen|yrow\(6) $ (\inst_gen|yrow\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(6),
	datab => \inst_gen|yrow\(8),
	datac => \inst_gen|yrow\(7),
	datad => \inst_gen|yrow\(9),
	combout => \inst|iDL2|LSPflag~1_combout\);

-- Location: LCCOMB_X32_Y21_N0
\inst|iDL1|LSPflag~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LSPflag~1_combout\ = (\inst|iDL1|LSPflag:romID[1]~4_combout\) # ((\inst|iDL1|LSPflag~0_combout\ & \inst|iDL2|LSPflag~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|LSPflag~0_combout\,
	datac => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datad => \inst|iDL2|LSPflag~1_combout\,
	combout => \inst|iDL1|LSPflag~1_combout\);

-- Location: LCCOMB_X32_Y21_N10
\inst|iDL1|Mux0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Mux0~2_combout\ = (\inst|iDL1|Add9~25_combout\ & ((\inst|iDL1|LSPflag:romID[1]~4_combout\) # ((\inst|iDL1|LSPflag~0_combout\ & \inst|iDL2|LSPflag~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add9~25_combout\,
	datab => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datac => \inst|iDL1|LSPflag~0_combout\,
	datad => \inst|iDL2|LSPflag~1_combout\,
	combout => \inst|iDL1|Mux0~2_combout\);

-- Location: LCFF_X32_Y21_N11
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|address_reg_a[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	datain => \inst|iDL1|Mux0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|address_reg_a\(1));

-- Location: LCFF_X32_Y21_N19
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	sdata => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|address_reg_a\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1));

-- Location: LCCOMB_X32_Y21_N14
\inst|iDL1|Mux1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Mux1~2_combout\ = (\inst|iDL1|Add9~23_combout\ & ((\inst|iDL1|LSPflag:romID[1]~4_combout\) # ((\inst|iDL1|LSPflag~0_combout\ & \inst|iDL2|LSPflag~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add9~23_combout\,
	datab => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datac => \inst|iDL1|LSPflag~0_combout\,
	datad => \inst|iDL2|LSPflag~1_combout\,
	combout => \inst|iDL1|Mux1~2_combout\);

-- Location: LCFF_X32_Y21_N15
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|address_reg_a[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	datain => \inst|iDL1|Mux1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|address_reg_a\(0));

-- Location: LCFF_X32_Y21_N9
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	sdata => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|address_reg_a\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0));

-- Location: CLKCTRL_G10
\inst_gen|VGA_CLK~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst_gen|VGA_CLK~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst_gen|VGA_CLK~clkctrl_outclk\);

-- Location: LCCOMB_X33_Y21_N8
\inst|iDL1|Add9~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~4_combout\ = (\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[8]~_Duplicate_2_regout\) # ((\inst_gen|xcolumn[6]~_Duplicate_2_regout\) # (\inst_gen|xcolumn[7]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	combout => \inst|iDL1|Add9~4_combout\);

-- Location: LCFF_X35_Y19_N21
\inst_gen|yrow[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:yr[6]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|yrow\(6));

-- Location: LCFF_X35_Y20_N1
\inst_gen|xcolumn[5]~_Duplicate_2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:xcounter[6]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|xcolumn[5]~_Duplicate_2_regout\);

-- Location: LCCOMB_X35_Y19_N4
\inst|iDL1|Add9~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~5_combout\ = (\inst|iDL1|LSPflag:romID[1]~4_combout\ & (\inst_gen|xcolumn[6]~_Duplicate_2_regout\ $ (((\inst_gen|xcolumn[5]~_Duplicate_2_regout\))))) # (!\inst|iDL1|LSPflag:romID[1]~4_combout\ & (((\inst_gen|yrow\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datab => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datac => \inst_gen|yrow\(6),
	datad => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	combout => \inst|iDL1|Add9~5_combout\);

-- Location: LCCOMB_X34_Y18_N10
\inst|iDL1|Add8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add8~0_combout\ = (\inst_gen|xcolumn[7]~_Duplicate_2_regout\) # (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	combout => \inst|iDL1|Add8~0_combout\);

-- Location: LCCOMB_X34_Y18_N20
\inst|iDL1|Add9~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~9_combout\ = (!\inst|iDL1|LSPflag:romID[1]~4_combout\ & (\inst|iDL1|Add0~0_combout\ $ (((!\inst|iDL1|Add0~1_combout\ & !\inst|iDL1|Add8~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add0~1_combout\,
	datab => \inst|iDL1|Add8~0_combout\,
	datac => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datad => \inst|iDL1|Add0~0_combout\,
	combout => \inst|iDL1|Add9~9_combout\);

-- Location: LCCOMB_X33_Y21_N12
\inst|iDL1|Add9~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~27_combout\ = (!\inst|iDL1|LSPflag:romID[1]~4_combout\ & (\inst_gen|xcolumn[8]~_Duplicate_2_regout\ $ (((\inst_gen|xcolumn[6]~_Duplicate_2_regout\) # (\inst_gen|xcolumn[7]~_Duplicate_2_regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datab => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datac => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	combout => \inst|iDL1|Add9~27_combout\);

-- Location: LCFF_X32_Y18_N11
\inst_gen|gen:yr[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:yr[0]~1_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst_gen|LessThan7~2_combout\,
	ena => \inst_gen|LessThan6~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:yr[0]~regout\);

-- Location: LCFF_X33_Y19_N1
\inst_gen|yrow[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:yr[0]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|yrow\(0));

-- Location: LCFF_X30_Y19_N5
\inst_gen|xcolumn[0]~_Duplicate_2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:xcounter[1]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|xcolumn[0]~_Duplicate_2_regout\);

-- Location: LCCOMB_X31_Y20_N2
\inst|iDL1|Add9~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~12_combout\ = (\inst|iDL1|LSPflag:romID[1]~4_combout\ & ((\inst_gen|xcolumn[0]~_Duplicate_2_regout\))) # (!\inst|iDL1|LSPflag:romID[1]~4_combout\ & (\inst_gen|yrow\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|yrow\(0),
	datac => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datad => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	combout => \inst|iDL1|Add9~12_combout\);

-- Location: LCCOMB_X33_Y21_N18
\inst|iDL1|Add9~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~13_combout\ = (\inst|iDL1|Add9~28_combout\ & (\inst|iDL1|Add9~12_combout\ $ (VCC))) # (!\inst|iDL1|Add9~28_combout\ & (\inst|iDL1|Add9~12_combout\ & VCC))
-- \inst|iDL1|Add9~14\ = CARRY((\inst|iDL1|Add9~28_combout\ & \inst|iDL1|Add9~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add9~28_combout\,
	datab => \inst|iDL1|Add9~12_combout\,
	datad => VCC,
	combout => \inst|iDL1|Add9~13_combout\,
	cout => \inst|iDL1|Add9~14\);

-- Location: LCCOMB_X33_Y21_N22
\inst|iDL1|Add9~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~17_combout\ = ((\inst|iDL1|Add9~10_combout\ $ (\inst|iDL1|Add9~9_combout\ $ (!\inst|iDL1|Add9~16\)))) # (GND)
-- \inst|iDL1|Add9~18\ = CARRY((\inst|iDL1|Add9~10_combout\ & ((\inst|iDL1|Add9~9_combout\) # (!\inst|iDL1|Add9~16\))) # (!\inst|iDL1|Add9~10_combout\ & (\inst|iDL1|Add9~9_combout\ & !\inst|iDL1|Add9~16\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add9~10_combout\,
	datab => \inst|iDL1|Add9~9_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add9~16\,
	combout => \inst|iDL1|Add9~17_combout\,
	cout => \inst|iDL1|Add9~18\);

-- Location: LCCOMB_X33_Y21_N26
\inst|iDL1|Add9~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~21_combout\ = ((\inst|iDL1|Add9~7_combout\ $ (\inst|iDL1|Add9~4_combout\ $ (!\inst|iDL1|Add9~20\)))) # (GND)
-- \inst|iDL1|Add9~22\ = CARRY((\inst|iDL1|Add9~7_combout\ & ((\inst|iDL1|Add9~4_combout\) # (!\inst|iDL1|Add9~20\))) # (!\inst|iDL1|Add9~7_combout\ & (\inst|iDL1|Add9~4_combout\ & !\inst|iDL1|Add9~20\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add9~7_combout\,
	datab => \inst|iDL1|Add9~4_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add9~20\,
	combout => \inst|iDL1|Add9~21_combout\,
	cout => \inst|iDL1|Add9~22\);

-- Location: LCCOMB_X33_Y21_N28
\inst|iDL1|Add9~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~23_combout\ = (\inst|iDL1|Add9~6_combout\ & ((\inst|iDL1|Add9~4_combout\ & (\inst|iDL1|Add9~22\ & VCC)) # (!\inst|iDL1|Add9~4_combout\ & (!\inst|iDL1|Add9~22\)))) # (!\inst|iDL1|Add9~6_combout\ & ((\inst|iDL1|Add9~4_combout\ & 
-- (!\inst|iDL1|Add9~22\)) # (!\inst|iDL1|Add9~4_combout\ & ((\inst|iDL1|Add9~22\) # (GND)))))
-- \inst|iDL1|Add9~24\ = CARRY((\inst|iDL1|Add9~6_combout\ & (!\inst|iDL1|Add9~4_combout\ & !\inst|iDL1|Add9~22\)) # (!\inst|iDL1|Add9~6_combout\ & ((!\inst|iDL1|Add9~22\) # (!\inst|iDL1|Add9~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add9~6_combout\,
	datab => \inst|iDL1|Add9~4_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add9~22\,
	combout => \inst|iDL1|Add9~23_combout\,
	cout => \inst|iDL1|Add9~24\);

-- Location: LCCOMB_X33_Y21_N30
\inst|iDL1|Add9~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add9~25_combout\ = \inst|iDL1|Add9~4_combout\ $ (\inst|iDL1|Add9~24\ $ (\inst|iDL1|Add9~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add9~4_combout\,
	datad => \inst|iDL1|Add9~5_combout\,
	cin => \inst|iDL1|Add9~24\,
	combout => \inst|iDL1|Add9~25_combout\);

-- Location: LCCOMB_X32_Y21_N24
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~1_combout\ = (\inst|iDL1|LSPflag~1_combout\ & (\inst|iDL1|Add9~25_combout\ & !\inst|iDL1|Add9~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|LSPflag~1_combout\,
	datac => \inst|iDL1|Add9~25_combout\,
	datad => \inst|iDL1|Add9~23_combout\,
	combout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~1_combout\);

-- Location: LCCOMB_X32_Y21_N2
\inst|iDL1|LSPflag:romID[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LSPflag:romID[0]~0_combout\ = (\inst|iDL1|LSPflag~0_combout\ & (!\inst|iDL1|LSPflag:romID[1]~4_combout\ & \inst|iDL2|LSPflag~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|LSPflag~0_combout\,
	datac => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datad => \inst|iDL2|LSPflag~1_combout\,
	combout => \inst|iDL1|LSPflag:romID[0]~0_combout\);

-- Location: LCCOMB_X31_Y20_N4
\inst|iDL1|Mux13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Mux13~0_combout\ = (\inst_gen|yrow\(0) & ((\inst|iDL1|LSPflag:romID[1]~4_combout\) # ((\inst|iDL1|LSPflag:romID[0]~0_combout\ & !\inst_gen|xcolumn[0]~_Duplicate_2_regout\)))) # (!\inst_gen|yrow\(0) & (\inst|iDL1|LSPflag:romID[0]~0_combout\ & 
-- (!\inst_gen|xcolumn[0]~_Duplicate_2_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(0),
	datab => \inst|iDL1|LSPflag:romID[0]~0_combout\,
	datac => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datad => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	combout => \inst|iDL1|Mux13~0_combout\);

-- Location: LCFF_X35_Y20_N29
\inst_gen|xcolumn[1]~_Duplicate_2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:xcounter[2]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|xcolumn[1]~_Duplicate_2_regout\);

-- Location: LCCOMB_X34_Y19_N30
\inst|iDL1|Mux12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Mux12~0_combout\ = (\inst_gen|yrow\(1) & ((\inst|iDL1|LSPflag:romID[1]~4_combout\) # ((\inst|iDL1|LSPflag:romID[0]~0_combout\ & !\inst_gen|xcolumn[1]~_Duplicate_2_regout\)))) # (!\inst_gen|yrow\(1) & (\inst|iDL1|LSPflag:romID[0]~0_combout\ & 
-- ((!\inst_gen|xcolumn[1]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(1),
	datab => \inst|iDL1|LSPflag:romID[0]~0_combout\,
	datac => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datad => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	combout => \inst|iDL1|Mux12~0_combout\);

-- Location: LCFF_X33_Y19_N5
\inst_gen|yrow[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:yr[2]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|yrow\(2));

-- Location: LCFF_X35_Y20_N3
\inst_gen|xcolumn[2]~_Duplicate_2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:xcounter[3]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|xcolumn[2]~_Duplicate_2_regout\);

-- Location: LCCOMB_X31_Y20_N28
\inst|iDL1|Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Mux11~0_combout\ = (\inst|iDL1|LSPflag:romID[0]~0_combout\ & (((\inst_gen|yrow\(2) & \inst|iDL1|LSPflag:romID[1]~4_combout\)) # (!\inst_gen|xcolumn[2]~_Duplicate_2_regout\))) # (!\inst|iDL1|LSPflag:romID[0]~0_combout\ & (\inst_gen|yrow\(2) & 
-- ((\inst|iDL1|LSPflag:romID[1]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LSPflag:romID[0]~0_combout\,
	datab => \inst_gen|yrow\(2),
	datac => \inst_gen|xcolumn[2]~_Duplicate_2_regout\,
	datad => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	combout => \inst|iDL1|Mux11~0_combout\);

-- Location: LCCOMB_X30_Y19_N28
\inst_gen|xcolumn[3]~_Duplicate_2feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst_gen|xcolumn[3]~_Duplicate_2feeder_combout\ = \inst_gen|gen:xcounter[4]~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_gen|gen:xcounter[4]~regout\,
	combout => \inst_gen|xcolumn[3]~_Duplicate_2feeder_combout\);

-- Location: LCFF_X30_Y19_N29
\inst_gen|xcolumn[3]~_Duplicate_2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|xcolumn[3]~_Duplicate_2feeder_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|xcolumn[3]~_Duplicate_2_regout\);

-- Location: LCCOMB_X35_Y19_N30
\inst|iDL1|Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Mux10~0_combout\ = (\inst_gen|yrow\(3) & ((\inst|iDL1|LSPflag:romID[1]~4_combout\) # ((\inst|iDL1|LSPflag:romID[0]~0_combout\ & !\inst_gen|xcolumn[3]~_Duplicate_2_regout\)))) # (!\inst_gen|yrow\(3) & (\inst|iDL1|LSPflag:romID[0]~0_combout\ & 
-- (!\inst_gen|xcolumn[3]~_Duplicate_2_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(3),
	datab => \inst|iDL1|LSPflag:romID[0]~0_combout\,
	datac => \inst_gen|xcolumn[3]~_Duplicate_2_regout\,
	datad => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	combout => \inst|iDL1|Mux10~0_combout\);

-- Location: LCFF_X33_Y19_N17
\inst_gen|yrow[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:yr[4]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|yrow\(4));

-- Location: LCCOMB_X31_Y20_N30
\inst|iDL1|Mux9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Mux9~0_combout\ = (\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & (((\inst_gen|yrow\(4) & \inst|iDL1|LSPflag:romID[1]~4_combout\)))) # (!\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & ((\inst|iDL1|LSPflag:romID[0]~0_combout\) # ((\inst_gen|yrow\(4) & 
-- \inst|iDL1|LSPflag:romID[1]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[4]~_Duplicate_2_regout\,
	datab => \inst|iDL1|LSPflag:romID[0]~0_combout\,
	datac => \inst_gen|yrow\(4),
	datad => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	combout => \inst|iDL1|Mux9~0_combout\);

-- Location: LCFF_X35_Y19_N1
\inst_gen|yrow[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:yr[5]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|yrow\(5));

-- Location: LCCOMB_X35_Y19_N16
\inst|iDL1|Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Mux8~0_combout\ = (\inst|iDL1|LSPflag:romID[1]~4_combout\ & ((\inst_gen|yrow\(5)) # ((\inst|iDL1|LSPflag:romID[0]~0_combout\ & !\inst_gen|xcolumn[5]~_Duplicate_2_regout\)))) # (!\inst|iDL1|LSPflag:romID[1]~4_combout\ & 
-- (((\inst|iDL1|LSPflag:romID[0]~0_combout\ & !\inst_gen|xcolumn[5]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datab => \inst_gen|yrow\(5),
	datac => \inst|iDL1|LSPflag:romID[0]~0_combout\,
	datad => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	combout => \inst|iDL1|Mux8~0_combout\);

-- Location: LCCOMB_X35_Y19_N26
\inst|iDL1|Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Mux7~0_combout\ = (\inst|iDL1|LSPflag:romID[1]~4_combout\ & (((\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & \inst|iDL1|LSPflag:romID[0]~0_combout\)) # (!\inst_gen|yrow\(6)))) # (!\inst|iDL1|LSPflag:romID[1]~4_combout\ & 
-- (\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & ((\inst|iDL1|LSPflag:romID[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datab => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datac => \inst_gen|yrow\(6),
	datad => \inst|iDL1|LSPflag:romID[0]~0_combout\,
	combout => \inst|iDL1|Mux7~0_combout\);

-- Location: LCCOMB_X33_Y21_N16
\inst|iDL1|Mux6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Mux6~2_combout\ = (\inst|iDL1|Add9~13_combout\ & ((\inst|iDL1|LSPflag:romID[1]~4_combout\) # ((\inst|iDL1|LSPflag~0_combout\ & \inst|iDL2|LSPflag~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datab => \inst|iDL1|Add9~13_combout\,
	datac => \inst|iDL1|LSPflag~0_combout\,
	datad => \inst|iDL2|LSPflag~1_combout\,
	combout => \inst|iDL1|Mux6~2_combout\);

-- Location: LCCOMB_X33_Y21_N2
\inst|iDL1|Mux5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Mux5~2_combout\ = (\inst|iDL1|Add9~15_combout\ & ((\inst|iDL1|LSPflag:romID[1]~4_combout\) # ((\inst|iDL1|LSPflag~0_combout\ & \inst|iDL2|LSPflag~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add9~15_combout\,
	datab => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datac => \inst|iDL1|LSPflag~0_combout\,
	datad => \inst|iDL2|LSPflag~1_combout\,
	combout => \inst|iDL1|Mux5~2_combout\);

-- Location: LCCOMB_X33_Y21_N4
\inst|iDL1|Mux4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Mux4~2_combout\ = (\inst|iDL1|Add9~17_combout\ & ((\inst|iDL1|LSPflag:romID[1]~4_combout\) # ((\inst|iDL1|LSPflag~0_combout\ & \inst|iDL2|LSPflag~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datab => \inst|iDL1|Add9~17_combout\,
	datac => \inst|iDL1|LSPflag~0_combout\,
	datad => \inst|iDL2|LSPflag~1_combout\,
	combout => \inst|iDL1|Mux4~2_combout\);

-- Location: LCCOMB_X33_Y21_N14
\inst|iDL1|Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Mux3~2_combout\ = (\inst|iDL1|Add9~19_combout\ & ((\inst|iDL1|LSPflag:romID[1]~4_combout\) # ((\inst|iDL1|LSPflag~0_combout\ & \inst|iDL2|LSPflag~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add9~19_combout\,
	datab => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datac => \inst|iDL1|LSPflag~0_combout\,
	datad => \inst|iDL2|LSPflag~1_combout\,
	combout => \inst|iDL1|Mux3~2_combout\);

-- Location: LCCOMB_X33_Y21_N0
\inst|iDL1|Mux2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Mux2~2_combout\ = (\inst|iDL1|Add9~21_combout\ & ((\inst|iDL1|LSPflag:romID[1]~4_combout\) # ((\inst|iDL1|LSPflag~0_combout\ & \inst|iDL2|LSPflag~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LSPflag:romID[1]~4_combout\,
	datab => \inst|iDL1|Add9~21_combout\,
	datac => \inst|iDL1|LSPflag~0_combout\,
	datad => \inst|iDL2|LSPflag~1_combout\,
	combout => \inst|iDL1|Mux2~2_combout\);

-- Location: M4K_X52_Y21
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a4\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000001FE00007FE00000000000000000000001FE0000FFC00000000000000000000001FE0000FFC00000000000000000000001FC0001FF800000000000000000000001FC0003FF800000000000000000000001FC0003FF000000000000000000000001FC0007FF000000000000000000000001FC000FFE000000000000000000000000FE001FFC000000000000000000000000FE001FFC000000000000000000000000FF003FF80000000000000000000000007F80FFF00000000000000000000000007FE3FFF00000000000000000000000003FFFFFE00000000000000000000000003FFFFFC00000000000000000000000001FFFFF800000000",
	mem_init0 => X"000000000000000000FFFFF0000000000000000000000000003FFFE0000000000000000000000000001FFF800000000000000000000000000007FE0000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL1|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~1_combout\,
	portaaddr => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

-- Location: LCCOMB_X32_Y21_N8
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~0_combout\ = (\inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0)) # 
-- (\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a4~portadataout\)))) # (!\inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0~portadataout\ 
-- & (!\inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a0~portadataout\,
	datab => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datad => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a4~portadataout\,
	combout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~0_combout\);

-- Location: LCCOMB_X32_Y21_N28
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~0_combout\ = (\inst|iDL1|LSPflag~1_combout\ & (!\inst|iDL1|Add9~25_combout\ & \inst|iDL1|Add9~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|LSPflag~1_combout\,
	datac => \inst|iDL1|Add9~25_combout\,
	datad => \inst|iDL1|Add9~23_combout\,
	combout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~0_combout\);

-- Location: M4K_X52_Y23
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a2\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003E000000000000000000000000000001FFC00000000000000000000000000003FFF0000000000000000000000000000FFFFC000000000000000000000000001FFFFE000000000000000000000000003FFFFF00000000000000000",
	mem_init0 => X"0000000007FFFFF80000000000000000000000000FFFFFF80000000000000000000000000FFF0FFC0000000000000000000000001FFE03FC0000000000000000000000003FF801FE0000000000000000000000007FF000FE0000000000000000000000007FF000FF000000000000000000000000FFE0007F000000000000000000000001FFC0007F000000000000000000000001FF80007F000000000000000000000003FF80007F000000000000000000000003FF00007F000000000000000000000007FE00007F000000000000000000000007FE0000FF00000000000000000000000FFC0000FF00000000000000000000000FF80000FF0000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL1|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~0_combout\,
	portaaddr => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

-- Location: LCCOMB_X32_Y21_N12
\inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\ = (\inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~0_combout\ & 
-- ((\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a6~portadataout\) # ((!\inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # 
-- (!\inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~0_combout\ & (((\inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a2~portadataout\ & 
-- \inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a6~portadataout\,
	datab => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~0_combout\,
	datac => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|ram_block1a2~portadataout\,
	datad => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\);

-- Location: LCCOMB_X34_Y18_N24
\inst|iDL2|LessThan9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan9~0_combout\ = (\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[8]~_Duplicate_2_regout\) # (\inst_gen|xcolumn[7]~_Duplicate_2_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	combout => \inst|iDL2|LessThan9~0_combout\);

-- Location: LCCOMB_X35_Y19_N8
\inst|iDL2|LSPflag~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LSPflag~4_combout\ = (\inst|iDL2|LessThan11~0_combout\) # ((\inst|iDL2|LessThan9~0_combout\) # (\inst_gen|yrow\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LessThan11~0_combout\,
	datab => \inst|iDL2|LessThan9~0_combout\,
	datad => \inst_gen|yrow\(9),
	combout => \inst|iDL2|LSPflag~4_combout\);

-- Location: LCCOMB_X32_Y23_N26
\inst|iDL1|VGA_G[5]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|VGA_G[5]~0_combout\ = (!\inst|iDL2|LSPflag~4_combout\ & (((!\inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\ & !\inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\)) # 
-- (!\inst|iDL1|LSPflag~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\,
	datab => \inst|iDL1|LSPflag~1_combout\,
	datac => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\,
	datad => \inst|iDL2|LSPflag~4_combout\,
	combout => \inst|iDL1|VGA_G[5]~0_combout\);

-- Location: LCCOMB_X35_Y20_N28
\inst|iDL1|Add0~0_wirecell\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add0~0_wirecell_combout\ = !\inst|iDL1|Add0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iDL1|Add0~0_combout\,
	combout => \inst|iDL1|Add0~0_wirecell_combout\);

-- Location: LCCOMB_X34_Y18_N28
\inst|iDL1|Add0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add0~1_combout\ = \inst_gen|xcolumn[7]~_Duplicate_2_regout\ $ (\inst_gen|xcolumn[8]~_Duplicate_2_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	combout => \inst|iDL1|Add0~1_combout\);

-- Location: LCFF_X30_Y19_N3
\inst_gen|xcolumn[4]~_Duplicate_2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:xcounter[5]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|xcolumn[4]~_Duplicate_2_regout\);

-- Location: LCCOMB_X35_Y20_N4
\inst|iDL1|Add5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add5~0_combout\ = (\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & (!\inst_gen|xcolumn[0]~_Duplicate_2_regout\ & VCC)) # (!\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[0]~_Duplicate_2_regout\ $ (GND)))
-- \inst|iDL1|Add5~1\ = CARRY((!\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & !\inst_gen|xcolumn[0]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datad => VCC,
	combout => \inst|iDL1|Add5~0_combout\,
	cout => \inst|iDL1|Add5~1\);

-- Location: LCCOMB_X35_Y20_N6
\inst|iDL1|Add5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add5~2_combout\ = (\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & ((\inst|iDL1|Add5~1\) # (GND))) # (!\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & (!\inst|iDL1|Add5~1\)))) # 
-- (!\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & (!\inst|iDL1|Add5~1\)) # (!\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & (\inst|iDL1|Add5~1\ & VCC))))
-- \inst|iDL1|Add5~3\ = CARRY((\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[2]~_Duplicate_2_regout\) # (!\inst|iDL1|Add5~1\))) # (!\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & 
-- !\inst|iDL1|Add5~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[2]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL1|Add5~1\,
	combout => \inst|iDL1|Add5~2_combout\,
	cout => \inst|iDL1|Add5~3\);

-- Location: LCCOMB_X35_Y20_N8
\inst|iDL1|Add5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add5~4_combout\ = ((\inst_gen|xcolumn[3]~_Duplicate_2_regout\ $ (\inst_gen|xcolumn[2]~_Duplicate_2_regout\ $ (!\inst|iDL1|Add5~3\)))) # (GND)
-- \inst|iDL1|Add5~5\ = CARRY((\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & (!\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & !\inst|iDL1|Add5~3\)) # (!\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & ((!\inst|iDL1|Add5~3\) # 
-- (!\inst_gen|xcolumn[2]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[3]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[2]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL1|Add5~3\,
	combout => \inst|iDL1|Add5~4_combout\,
	cout => \inst|iDL1|Add5~5\);

-- Location: LCCOMB_X35_Y20_N10
\inst|iDL1|Add5~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add5~6_combout\ = (\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & ((\inst|iDL1|Add5~5\) # (GND))) # (!\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & (!\inst|iDL1|Add5~5\)))) # 
-- (!\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & (!\inst|iDL1|Add5~5\)) # (!\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & (\inst|iDL1|Add5~5\ & VCC))))
-- \inst|iDL1|Add5~7\ = CARRY((\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[4]~_Duplicate_2_regout\) # (!\inst|iDL1|Add5~5\))) # (!\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & 
-- !\inst|iDL1|Add5~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[3]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[4]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL1|Add5~5\,
	combout => \inst|iDL1|Add5~6_combout\,
	cout => \inst|iDL1|Add5~7\);

-- Location: LCCOMB_X35_Y20_N12
\inst|iDL1|Add5~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add5~8_combout\ = ((\inst_gen|xcolumn[4]~_Duplicate_2_regout\ $ (\inst_gen|xcolumn[5]~_Duplicate_2_regout\ $ (!\inst|iDL1|Add5~7\)))) # (GND)
-- \inst|iDL1|Add5~9\ = CARRY((\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & (!\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & !\inst|iDL1|Add5~7\)) # (!\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & ((!\inst|iDL1|Add5~7\) # 
-- (!\inst_gen|xcolumn[5]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[4]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL1|Add5~7\,
	combout => \inst|iDL1|Add5~8_combout\,
	cout => \inst|iDL1|Add5~9\);

-- Location: LCCOMB_X35_Y20_N14
\inst|iDL1|Add5~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add5~10_combout\ = (\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & ((\inst|iDL1|Add5~9\) # (GND))) # (!\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & (!\inst|iDL1|Add5~9\)))) # 
-- (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & (!\inst|iDL1|Add5~9\)) # (!\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & (\inst|iDL1|Add5~9\ & VCC))))
-- \inst|iDL1|Add5~11\ = CARRY((\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[5]~_Duplicate_2_regout\) # (!\inst|iDL1|Add5~9\))) # (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & 
-- !\inst|iDL1|Add5~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL1|Add5~9\,
	combout => \inst|iDL1|Add5~10_combout\,
	cout => \inst|iDL1|Add5~11\);

-- Location: LCCOMB_X35_Y20_N18
\inst|iDL1|Add5~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add5~14_combout\ = (\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & ((\inst|iDL1|Add0~1_combout\ & (\inst|iDL1|Add5~13\ & VCC)) # (!\inst|iDL1|Add0~1_combout\ & (!\inst|iDL1|Add5~13\)))) # (!\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & 
-- ((\inst|iDL1|Add0~1_combout\ & (!\inst|iDL1|Add5~13\)) # (!\inst|iDL1|Add0~1_combout\ & ((\inst|iDL1|Add5~13\) # (GND)))))
-- \inst|iDL1|Add5~15\ = CARRY((\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & (!\inst|iDL1|Add0~1_combout\ & !\inst|iDL1|Add5~13\)) # (!\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & ((!\inst|iDL1|Add5~13\) # (!\inst|iDL1|Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datab => \inst|iDL1|Add0~1_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add5~13\,
	combout => \inst|iDL1|Add5~14_combout\,
	cout => \inst|iDL1|Add5~15\);

-- Location: LCCOMB_X35_Y20_N20
\inst|iDL1|Add5~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add5~16_combout\ = ((\inst|iDL1|Add0~1_combout\ $ (\inst|iDL1|Add0~0_wirecell_combout\ $ (\inst|iDL1|Add5~15\)))) # (GND)
-- \inst|iDL1|Add5~17\ = CARRY((\inst|iDL1|Add0~1_combout\ & ((!\inst|iDL1|Add5~15\) # (!\inst|iDL1|Add0~0_wirecell_combout\))) # (!\inst|iDL1|Add0~1_combout\ & (!\inst|iDL1|Add0~0_wirecell_combout\ & !\inst|iDL1|Add5~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add0~1_combout\,
	datab => \inst|iDL1|Add0~0_wirecell_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add5~15\,
	combout => \inst|iDL1|Add5~16_combout\,
	cout => \inst|iDL1|Add5~17\);

-- Location: LCCOMB_X35_Y20_N22
\inst|iDL1|Add5~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add5~18_combout\ = (\inst|iDL2|LessThan9~0_wirecell_combout\ & ((\inst|iDL1|Add0~0_wirecell_combout\ & ((\inst|iDL1|Add5~17\) # (GND))) # (!\inst|iDL1|Add0~0_wirecell_combout\ & (!\inst|iDL1|Add5~17\)))) # 
-- (!\inst|iDL2|LessThan9~0_wirecell_combout\ & ((\inst|iDL1|Add0~0_wirecell_combout\ & (!\inst|iDL1|Add5~17\)) # (!\inst|iDL1|Add0~0_wirecell_combout\ & (\inst|iDL1|Add5~17\ & VCC))))
-- \inst|iDL1|Add5~19\ = CARRY((\inst|iDL2|LessThan9~0_wirecell_combout\ & ((\inst|iDL1|Add0~0_wirecell_combout\) # (!\inst|iDL1|Add5~17\))) # (!\inst|iDL2|LessThan9~0_wirecell_combout\ & (\inst|iDL1|Add0~0_wirecell_combout\ & !\inst|iDL1|Add5~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LessThan9~0_wirecell_combout\,
	datab => \inst|iDL1|Add0~0_wirecell_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add5~17\,
	combout => \inst|iDL1|Add5~18_combout\,
	cout => \inst|iDL1|Add5~19\);

-- Location: LCCOMB_X34_Y20_N0
\inst|iDL1|Add4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add4~1_cout\ = CARRY((!\inst|iDL1|Add5~0_combout\ & \inst_gen|xcolumn[0]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add5~0_combout\,
	datab => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datad => VCC,
	cout => \inst|iDL1|Add4~1_cout\);

-- Location: LCCOMB_X34_Y20_N22
\inst|iDL1|Add4~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add4~22_combout\ = (\inst|iDL1|Add5~22_combout\ & ((\inst|iDL1|Add4~21\) # (GND))) # (!\inst|iDL1|Add5~22_combout\ & (!\inst|iDL1|Add4~21\))
-- \inst|iDL1|Add4~23\ = CARRY((\inst|iDL1|Add5~22_combout\) # (!\inst|iDL1|Add4~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add5~22_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add4~21\,
	combout => \inst|iDL1|Add4~22_combout\,
	cout => \inst|iDL1|Add4~23\);

-- Location: LCCOMB_X34_Y20_N24
\inst|iDL1|Add4~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add4~24_combout\ = (\inst|iDL1|Add4~23\ & (((\inst|iDL2|LessThan5~0_combout\) # (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\)))) # (!\inst|iDL1|Add4~23\ & ((((\inst|iDL2|LessThan5~0_combout\) # (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\)))))
-- \inst|iDL1|Add4~25\ = CARRY((!\inst|iDL1|Add4~23\ & ((\inst|iDL2|LessThan5~0_combout\) # (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010000001011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LessThan5~0_combout\,
	datab => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL1|Add4~23\,
	combout => \inst|iDL1|Add4~24_combout\,
	cout => \inst|iDL1|Add4~25\);

-- Location: LCCOMB_X34_Y20_N26
\inst|iDL1|Add4~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add4~26_combout\ = \inst|iDL1|Add4~25\ $ (((\inst|iDL2|LessThan5~0_combout\) # (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101101001011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LessThan5~0_combout\,
	datab => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	cin => \inst|iDL1|Add4~25\,
	combout => \inst|iDL1|Add4~26_combout\);

-- Location: LCCOMB_X34_Y20_N28
\inst|iDL1|RGB~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|RGB~0_combout\ = (!\inst|iDL1|Add4~26_combout\ & ((\inst|iDL1|LessThan14~22_combout\) # ((\inst|iDL1|Add4~24_combout\) # (\inst|iDL1|Add4~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LessThan14~22_combout\,
	datab => \inst|iDL1|Add4~26_combout\,
	datac => \inst|iDL1|Add4~24_combout\,
	datad => \inst|iDL1|Add4~22_combout\,
	combout => \inst|iDL1|RGB~0_combout\);

-- Location: LCFF_X33_Y19_N31
\inst_gen|yrow[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:yr[1]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|yrow\(1));

-- Location: LCFF_X32_Y18_N17
\inst_gen|gen:yr[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst_gen|gen:yr[3]~1_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst_gen|LessThan7~2_combout\,
	ena => \inst_gen|LessThan6~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|gen:yr[3]~regout\);

-- Location: LCFF_X33_Y19_N3
\inst_gen|yrow[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => \inst_gen|gen:yr[3]~regout\,
	aclr => \inst4~0clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst_gen|yrow\(3));

-- Location: LCCOMB_X35_Y19_N28
\inst|iDL2|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add0~0_combout\ = \inst_gen|yrow\(6) $ (\inst_gen|yrow\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_gen|yrow\(6),
	datad => \inst_gen|yrow\(5),
	combout => \inst|iDL2|Add0~0_combout\);

-- Location: LCCOMB_X35_Y19_N6
\inst|iDL2|Add0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add0~1_combout\ = \inst_gen|yrow\(7) $ (((\inst_gen|yrow\(6) & \inst_gen|yrow\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(7),
	datac => \inst_gen|yrow\(6),
	datad => \inst_gen|yrow\(5),
	combout => \inst|iDL2|Add0~1_combout\);

-- Location: LCCOMB_X35_Y19_N24
\inst|iDL2|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add0~2_combout\ = \inst_gen|yrow\(8) $ (((\inst_gen|yrow\(7) & (\inst_gen|yrow\(6) & \inst_gen|yrow\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(7),
	datab => \inst_gen|yrow\(8),
	datac => \inst_gen|yrow\(6),
	datad => \inst_gen|yrow\(5),
	combout => \inst|iDL2|Add0~2_combout\);

-- Location: LCCOMB_X35_Y19_N2
\inst|iDL2|LessThan11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan11~0_combout\ = (\inst_gen|yrow\(7) & (\inst_gen|yrow\(8) & (\inst_gen|yrow\(6) & \inst_gen|yrow\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(7),
	datab => \inst_gen|yrow\(8),
	datac => \inst_gen|yrow\(6),
	datad => \inst_gen|yrow\(5),
	combout => \inst|iDL2|LessThan11~0_combout\);

-- Location: LCCOMB_X35_Y19_N18
\inst|iDL2|Add0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add0~3_combout\ = \inst|iDL2|LessThan11~0_combout\ $ (!\inst_gen|yrow\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|LessThan11~0_combout\,
	datad => \inst_gen|yrow\(9),
	combout => \inst|iDL2|Add0~3_combout\);

-- Location: LCCOMB_X35_Y19_N12
\inst|iDL2|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add0~4_combout\ = (!\inst|iDL2|LessThan11~0_combout\ & !\inst_gen|yrow\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|LessThan11~0_combout\,
	datad => \inst_gen|yrow\(9),
	combout => \inst|iDL2|Add0~4_combout\);

-- Location: DSPMULT_X39_Y19_N0
\inst|iDL2|Mult1|auto_generated|mac_mult1\ : cycloneii_mac_mult
-- pragma translate_off
GENERIC MAP (
	dataa_clock => "none",
	dataa_width => 18,
	datab_clock => "none",
	datab_width => 18,
	signa_clock => "none",
	signb_clock => "none")
-- pragma translate_on
PORT MAP (
	signa => VCC,
	signb => VCC,
	dataa => \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAA_bus\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAB_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \inst|iDL2|Mult1|auto_generated|mac_mult1_DATAOUT_bus\);

-- Location: DSPMULT_X39_Y20_N0
\inst|iDL1|Mult0|auto_generated|mac_mult1\ : cycloneii_mac_mult
-- pragma translate_off
GENERIC MAP (
	dataa_clock => "none",
	dataa_width => 18,
	datab_clock => "none",
	datab_width => 18,
	signa_clock => "none",
	signb_clock => "none")
-- pragma translate_on
PORT MAP (
	signa => VCC,
	signb => VCC,
	dataa => \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAA_bus\,
	datab => \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAB_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \inst|iDL1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\);

-- Location: LCCOMB_X38_Y20_N12
\inst|iDL1|Add2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~1_cout\ = CARRY((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT2\ & \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT2\,
	datab => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT2\,
	datad => VCC,
	cout => \inst|iDL1|Add2~1_cout\);

-- Location: LCCOMB_X38_Y20_N14
\inst|iDL1|Add2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~3_cout\ = CARRY((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT3\ & (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT3\ & !\inst|iDL1|Add2~1_cout\)) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT3\ & ((!\inst|iDL1|Add2~1_cout\) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT3\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT3\,
	datad => VCC,
	cin => \inst|iDL1|Add2~1_cout\,
	cout => \inst|iDL1|Add2~3_cout\);

-- Location: LCCOMB_X38_Y20_N16
\inst|iDL1|Add2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~5_cout\ = CARRY((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT4\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT4\) # (!\inst|iDL1|Add2~3_cout\))) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT4\ & 
-- (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT4\ & !\inst|iDL1|Add2~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT4\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT4\,
	datad => VCC,
	cin => \inst|iDL1|Add2~3_cout\,
	cout => \inst|iDL1|Add2~5_cout\);

-- Location: LCCOMB_X38_Y20_N18
\inst|iDL1|Add2~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~7_cout\ = CARRY((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT5\ & (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT5\ & !\inst|iDL1|Add2~5_cout\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT5\ & ((!\inst|iDL1|Add2~5_cout\) # 
-- (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT5\,
	datab => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT5\,
	datad => VCC,
	cin => \inst|iDL1|Add2~5_cout\,
	cout => \inst|iDL1|Add2~7_cout\);

-- Location: LCCOMB_X38_Y20_N28
\inst|iDL1|Add2~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~16_combout\ = ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT10\ $ (\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT10\ $ (!\inst|iDL1|Add2~15\)))) # (GND)
-- \inst|iDL1|Add2~17\ = CARRY((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT10\ & ((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT10\) # (!\inst|iDL1|Add2~15\))) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT10\ & 
-- (\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT10\ & !\inst|iDL1|Add2~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT10\,
	datab => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT10\,
	datad => VCC,
	cin => \inst|iDL1|Add2~15\,
	combout => \inst|iDL1|Add2~16_combout\,
	cout => \inst|iDL1|Add2~17\);

-- Location: LCCOMB_X38_Y20_N30
\inst|iDL1|Add2~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~18_combout\ = (\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT11\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT11\ & (\inst|iDL1|Add2~17\ & VCC)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT11\ & (!\inst|iDL1|Add2~17\)))) # 
-- (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT11\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT11\ & (!\inst|iDL1|Add2~17\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT11\ & ((\inst|iDL1|Add2~17\) # (GND)))))
-- \inst|iDL1|Add2~19\ = CARRY((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT11\ & (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT11\ & !\inst|iDL1|Add2~17\)) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT11\ & ((!\inst|iDL1|Add2~17\) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT11\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT11\,
	datad => VCC,
	cin => \inst|iDL1|Add2~17\,
	combout => \inst|iDL1|Add2~18_combout\,
	cout => \inst|iDL1|Add2~19\);

-- Location: LCCOMB_X38_Y19_N0
\inst|iDL1|Add2~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~20_combout\ = ((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT12\ $ (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT12\ $ (!\inst|iDL1|Add2~19\)))) # (GND)
-- \inst|iDL1|Add2~21\ = CARRY((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT12\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT12\) # (!\inst|iDL1|Add2~19\))) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT12\ & 
-- (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT12\ & !\inst|iDL1|Add2~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT12\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT12\,
	datad => VCC,
	cin => \inst|iDL1|Add2~19\,
	combout => \inst|iDL1|Add2~20_combout\,
	cout => \inst|iDL1|Add2~21\);

-- Location: LCCOMB_X38_Y19_N2
\inst|iDL1|Add2~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~22_combout\ = (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT13\ & ((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT13\ & (\inst|iDL1|Add2~21\ & VCC)) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT13\ & (!\inst|iDL1|Add2~21\)))) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT13\ & ((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT13\ & (!\inst|iDL1|Add2~21\)) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT13\ & ((\inst|iDL1|Add2~21\) # (GND)))))
-- \inst|iDL1|Add2~23\ = CARRY((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT13\ & (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT13\ & !\inst|iDL1|Add2~21\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT13\ & ((!\inst|iDL1|Add2~21\) # 
-- (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT13\,
	datab => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT13\,
	datad => VCC,
	cin => \inst|iDL1|Add2~21\,
	combout => \inst|iDL1|Add2~22_combout\,
	cout => \inst|iDL1|Add2~23\);

-- Location: LCCOMB_X38_Y19_N4
\inst|iDL1|Add2~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~24_combout\ = ((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT14\ $ (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT14\ $ (!\inst|iDL1|Add2~23\)))) # (GND)
-- \inst|iDL1|Add2~25\ = CARRY((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT14\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT14\) # (!\inst|iDL1|Add2~23\))) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT14\ & 
-- (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT14\ & !\inst|iDL1|Add2~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT14\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT14\,
	datad => VCC,
	cin => \inst|iDL1|Add2~23\,
	combout => \inst|iDL1|Add2~24_combout\,
	cout => \inst|iDL1|Add2~25\);

-- Location: LCCOMB_X38_Y19_N6
\inst|iDL1|Add2~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~26_combout\ = (\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT15\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\ & (\inst|iDL1|Add2~25\ & VCC)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\ & (!\inst|iDL1|Add2~25\)))) # 
-- (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT15\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\ & (!\inst|iDL1|Add2~25\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\ & ((\inst|iDL1|Add2~25\) # (GND)))))
-- \inst|iDL1|Add2~27\ = CARRY((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT15\ & (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\ & !\inst|iDL1|Add2~25\)) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT15\ & ((!\inst|iDL1|Add2~25\) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT15\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT15\,
	datad => VCC,
	cin => \inst|iDL1|Add2~25\,
	combout => \inst|iDL1|Add2~26_combout\,
	cout => \inst|iDL1|Add2~27\);

-- Location: LCCOMB_X38_Y19_N8
\inst|iDL1|Add2~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~28_combout\ = ((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT16\ $ (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT16\ $ (!\inst|iDL1|Add2~27\)))) # (GND)
-- \inst|iDL1|Add2~29\ = CARRY((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT16\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT16\) # (!\inst|iDL1|Add2~27\))) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT16\ & 
-- (\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT16\ & !\inst|iDL1|Add2~27\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT16\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT16\,
	datad => VCC,
	cin => \inst|iDL1|Add2~27\,
	combout => \inst|iDL1|Add2~28_combout\,
	cout => \inst|iDL1|Add2~29\);

-- Location: LCCOMB_X38_Y19_N12
\inst|iDL1|Add2~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~32_combout\ = ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT18\ $ (\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT18\ $ (!\inst|iDL1|Add2~31\)))) # (GND)
-- \inst|iDL1|Add2~33\ = CARRY((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT18\ & ((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT18\) # (!\inst|iDL1|Add2~31\))) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT18\ & 
-- (\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT18\ & !\inst|iDL1|Add2~31\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT18\,
	datab => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT18\,
	datad => VCC,
	cin => \inst|iDL1|Add2~31\,
	combout => \inst|iDL1|Add2~32_combout\,
	cout => \inst|iDL1|Add2~33\);

-- Location: LCCOMB_X38_Y19_N14
\inst|iDL1|Add2~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add2~34_combout\ = (\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT19\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\ & (\inst|iDL1|Add2~33\ & VCC)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\ & (!\inst|iDL1|Add2~33\)))) # 
-- (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT19\ & ((\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\ & (!\inst|iDL1|Add2~33\)) # (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\ & ((\inst|iDL1|Add2~33\) # (GND)))))
-- \inst|iDL1|Add2~35\ = CARRY((\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT19\ & (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\ & !\inst|iDL1|Add2~33\)) # (!\inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT19\ & ((!\inst|iDL1|Add2~33\) # 
-- (!\inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Mult0|auto_generated|mac_out2~DATAOUT19\,
	datab => \inst|iDL2|Mult1|auto_generated|mac_out2~DATAOUT19\,
	datad => VCC,
	cin => \inst|iDL1|Add2~33\,
	combout => \inst|iDL1|Add2~34_combout\,
	cout => \inst|iDL1|Add2~35\);

-- Location: LCCOMB_X38_Y19_N22
\inst|iDL1|LessThan13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan13~0_combout\ = (!\inst|iDL1|Add2~36_combout\ & (!\inst|iDL1|Add2~38_combout\ & (!\inst|iDL1|Add2~34_combout\ & !\inst|iDL1|Add2~32_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add2~36_combout\,
	datab => \inst|iDL1|Add2~38_combout\,
	datac => \inst|iDL1|Add2~34_combout\,
	datad => \inst|iDL1|Add2~32_combout\,
	combout => \inst|iDL1|LessThan13~0_combout\);

-- Location: LCCOMB_X38_Y19_N24
\inst|iDL1|LessThan13~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan13~4_combout\ = (!\inst|iDL1|Add2~30_combout\ & (!\inst|iDL1|Add2~28_combout\ & (!\inst|iDL1|Add2~24_combout\ & !\inst|iDL1|Add2~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add2~30_combout\,
	datab => \inst|iDL1|Add2~28_combout\,
	datac => \inst|iDL1|Add2~24_combout\,
	datad => \inst|iDL1|Add2~26_combout\,
	combout => \inst|iDL1|LessThan13~4_combout\);

-- Location: LCCOMB_X38_Y20_N0
\inst|iDL1|LessThan13~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan13~1_combout\ = ((!\inst|iDL1|Add2~18_combout\) # (!\inst|iDL1|Add2~22_combout\)) # (!\inst|iDL1|Add2~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add2~20_combout\,
	datac => \inst|iDL1|Add2~22_combout\,
	datad => \inst|iDL1|Add2~18_combout\,
	combout => \inst|iDL1|LessThan13~1_combout\);

-- Location: LCCOMB_X38_Y20_N4
\inst|iDL1|LessThan13~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan13~3_combout\ = (\inst|iDL1|LessThan13~1_combout\) # ((\inst|iDL1|LessThan13~2_combout\ & !\inst|iDL1|Add2~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LessThan13~2_combout\,
	datab => \inst|iDL1|Add2~16_combout\,
	datad => \inst|iDL1|LessThan13~1_combout\,
	combout => \inst|iDL1|LessThan13~3_combout\);

-- Location: LCCOMB_X32_Y23_N0
\inst|iDL1|LessThan13~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan13~5_combout\ = (\inst|iDL1|Add2~40_combout\) # ((\inst|iDL1|LessThan13~0_combout\ & (\inst|iDL1|LessThan13~4_combout\ & \inst|iDL1|LessThan13~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add2~40_combout\,
	datab => \inst|iDL1|LessThan13~0_combout\,
	datac => \inst|iDL1|LessThan13~4_combout\,
	datad => \inst|iDL1|LessThan13~3_combout\,
	combout => \inst|iDL1|LessThan13~5_combout\);

-- Location: LCCOMB_X32_Y23_N24
\inst|iDL1|VGA_B[6]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|VGA_B[6]~0_combout\ = (!\inst|iDL1|LessThan15~23_combout\ & (\inst|iDL1|VGA_G[5]~0_combout\ & (!\inst|iDL1|RGB~0_combout\ & !\inst|iDL1|LessThan13~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LessThan15~23_combout\,
	datab => \inst|iDL1|VGA_G[5]~0_combout\,
	datac => \inst|iDL1|RGB~0_combout\,
	datad => \inst|iDL1|LessThan13~5_combout\,
	combout => \inst|iDL1|VGA_B[6]~0_combout\);

-- Location: LCFF_X32_Y23_N25
\inst|iPipeLine|VGA_B1[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iDL1|VGA_B[6]~0_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_B1\(6));

-- Location: LCCOMB_X30_Y19_N0
\inst|iDL2|Add8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~0_combout\ = (\inst_gen|xcolumn[7]~_Duplicate_2_regout\) # ((\inst_gen|xcolumn[8]~_Duplicate_2_regout\) # ((\inst_gen|xcolumn[6]~_Duplicate_2_regout\) # (\inst_gen|xcolumn[9]~_Duplicate_2_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	combout => \inst|iDL2|Add8~0_combout\);

-- Location: LCCOMB_X34_Y18_N16
\inst|iDL2|Add7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add7~0_combout\ = \inst_gen|xcolumn[9]~_Duplicate_2_regout\ $ (((\inst_gen|xcolumn[8]~_Duplicate_2_regout\) # ((\inst_gen|xcolumn[6]~_Duplicate_2_regout\) # (\inst_gen|xcolumn[7]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	combout => \inst|iDL2|Add7~0_combout\);

-- Location: LCCOMB_X35_Y19_N0
\inst|iDL2|LessThan6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan6~0_combout\ = ((!\inst_gen|yrow\(6) & !\inst_gen|yrow\(7))) # (!\inst_gen|yrow\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(6),
	datab => \inst_gen|yrow\(8),
	datad => \inst_gen|yrow\(7),
	combout => \inst|iDL2|LessThan6~0_combout\);

-- Location: LCCOMB_X29_Y19_N14
\inst|iDL2|Add8~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~5_combout\ = (\inst|iDL2|LSPflag:romID[1]~1_combout\ & ((\inst|iDL2|LessThan6~0_combout\ & ((\inst|iDL2|Add7~0_combout\) # (\inst_gen|yrow\(9)))) # (!\inst|iDL2|LessThan6~0_combout\ & ((!\inst_gen|yrow\(9)))))) # 
-- (!\inst|iDL2|LSPflag:romID[1]~1_combout\ & (\inst|iDL2|Add7~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag:romID[1]~1_combout\,
	datab => \inst|iDL2|Add7~0_combout\,
	datac => \inst|iDL2|LessThan6~0_combout\,
	datad => \inst_gen|yrow\(9),
	combout => \inst|iDL2|Add8~5_combout\);

-- Location: LCCOMB_X29_Y19_N26
\inst|iDL2|LSPflag:romID[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LSPflag:romID[1]~combout\ = (\inst|iDL2|LSPflag:romID[1]~1_combout\ & ((\inst_gen|yrow\(9)) # (!\inst|iDL2|LessThan6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag:romID[1]~1_combout\,
	datac => \inst|iDL2|LessThan6~0_combout\,
	datad => \inst_gen|yrow\(9),
	combout => \inst|iDL2|LSPflag:romID[1]~combout\);

-- Location: LCCOMB_X30_Y19_N30
\inst|iDL2|Add8~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~7_combout\ = (!\inst|iDL2|LSPflag:romID[1]~combout\ & (\inst_gen|xcolumn[8]~_Duplicate_2_regout\ $ (((!\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & !\inst_gen|xcolumn[6]~_Duplicate_2_regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datad => \inst|iDL2|LSPflag:romID[1]~combout\,
	combout => \inst|iDL2|Add8~7_combout\);

-- Location: LCCOMB_X29_Y19_N30
\inst|iDL2|Add8~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~10_combout\ = (\inst|iDL2|LSPflag:romID[1]~combout\ & (!\inst_gen|xcolumn[0]~_Duplicate_2_regout\)) # (!\inst|iDL2|LSPflag:romID[1]~combout\ & ((\inst_gen|yrow\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datab => \inst|iDL2|LSPflag:romID[1]~combout\,
	datad => \inst_gen|yrow\(0),
	combout => \inst|iDL2|Add8~10_combout\);

-- Location: LCCOMB_X28_Y19_N16
\inst|iDL2|Add8~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~11_combout\ = (\inst|iDL2|Add8~9_combout\ & (\inst|iDL2|Add8~10_combout\ & VCC)) # (!\inst|iDL2|Add8~9_combout\ & (\inst|iDL2|Add8~10_combout\ $ (VCC)))
-- \inst|iDL2|Add8~12\ = CARRY((!\inst|iDL2|Add8~9_combout\ & \inst|iDL2|Add8~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add8~9_combout\,
	datab => \inst|iDL2|Add8~10_combout\,
	datad => VCC,
	combout => \inst|iDL2|Add8~11_combout\,
	cout => \inst|iDL2|Add8~12\);

-- Location: LCCOMB_X28_Y19_N18
\inst|iDL2|Add8~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~13_combout\ = (\inst|iDL2|Add8~8_combout\ & ((\inst|iDL2|Add8~7_combout\ & (\inst|iDL2|Add8~12\ & VCC)) # (!\inst|iDL2|Add8~7_combout\ & (!\inst|iDL2|Add8~12\)))) # (!\inst|iDL2|Add8~8_combout\ & ((\inst|iDL2|Add8~7_combout\ & 
-- (!\inst|iDL2|Add8~12\)) # (!\inst|iDL2|Add8~7_combout\ & ((\inst|iDL2|Add8~12\) # (GND)))))
-- \inst|iDL2|Add8~14\ = CARRY((\inst|iDL2|Add8~8_combout\ & (!\inst|iDL2|Add8~7_combout\ & !\inst|iDL2|Add8~12\)) # (!\inst|iDL2|Add8~8_combout\ & ((!\inst|iDL2|Add8~12\) # (!\inst|iDL2|Add8~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add8~8_combout\,
	datab => \inst|iDL2|Add8~7_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add8~12\,
	combout => \inst|iDL2|Add8~13_combout\,
	cout => \inst|iDL2|Add8~14\);

-- Location: LCCOMB_X28_Y19_N20
\inst|iDL2|Add8~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~15_combout\ = ((\inst|iDL2|Add8~6_combout\ $ (\inst|iDL2|Add8~5_combout\ $ (\inst|iDL2|Add8~14\)))) # (GND)
-- \inst|iDL2|Add8~16\ = CARRY((\inst|iDL2|Add8~6_combout\ & ((!\inst|iDL2|Add8~14\) # (!\inst|iDL2|Add8~5_combout\))) # (!\inst|iDL2|Add8~6_combout\ & (!\inst|iDL2|Add8~5_combout\ & !\inst|iDL2|Add8~14\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add8~6_combout\,
	datab => \inst|iDL2|Add8~5_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add8~14\,
	combout => \inst|iDL2|Add8~15_combout\,
	cout => \inst|iDL2|Add8~16\);

-- Location: LCCOMB_X28_Y19_N22
\inst|iDL2|Add8~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~17_combout\ = (\inst|iDL2|Add8~4_combout\ & ((\inst|iDL2|Add8~0_combout\ & (!\inst|iDL2|Add8~16\)) # (!\inst|iDL2|Add8~0_combout\ & (\inst|iDL2|Add8~16\ & VCC)))) # (!\inst|iDL2|Add8~4_combout\ & ((\inst|iDL2|Add8~0_combout\ & 
-- ((\inst|iDL2|Add8~16\) # (GND))) # (!\inst|iDL2|Add8~0_combout\ & (!\inst|iDL2|Add8~16\))))
-- \inst|iDL2|Add8~18\ = CARRY((\inst|iDL2|Add8~4_combout\ & (\inst|iDL2|Add8~0_combout\ & !\inst|iDL2|Add8~16\)) # (!\inst|iDL2|Add8~4_combout\ & ((\inst|iDL2|Add8~0_combout\) # (!\inst|iDL2|Add8~16\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add8~4_combout\,
	datab => \inst|iDL2|Add8~0_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add8~16\,
	combout => \inst|iDL2|Add8~17_combout\,
	cout => \inst|iDL2|Add8~18\);

-- Location: LCCOMB_X28_Y19_N24
\inst|iDL2|Add8~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~19_combout\ = ((\inst|iDL2|Add8~3_combout\ $ (\inst|iDL2|Add8~0_combout\ $ (\inst|iDL2|Add8~18\)))) # (GND)
-- \inst|iDL2|Add8~20\ = CARRY((\inst|iDL2|Add8~3_combout\ & ((!\inst|iDL2|Add8~18\) # (!\inst|iDL2|Add8~0_combout\))) # (!\inst|iDL2|Add8~3_combout\ & (!\inst|iDL2|Add8~0_combout\ & !\inst|iDL2|Add8~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add8~3_combout\,
	datab => \inst|iDL2|Add8~0_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add8~18\,
	combout => \inst|iDL2|Add8~19_combout\,
	cout => \inst|iDL2|Add8~20\);

-- Location: LCCOMB_X28_Y19_N26
\inst|iDL2|Add8~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~21_combout\ = (\inst|iDL2|Add8~2_combout\ & ((\inst|iDL2|Add8~0_combout\ & (!\inst|iDL2|Add8~20\)) # (!\inst|iDL2|Add8~0_combout\ & (\inst|iDL2|Add8~20\ & VCC)))) # (!\inst|iDL2|Add8~2_combout\ & ((\inst|iDL2|Add8~0_combout\ & 
-- ((\inst|iDL2|Add8~20\) # (GND))) # (!\inst|iDL2|Add8~0_combout\ & (!\inst|iDL2|Add8~20\))))
-- \inst|iDL2|Add8~22\ = CARRY((\inst|iDL2|Add8~2_combout\ & (\inst|iDL2|Add8~0_combout\ & !\inst|iDL2|Add8~20\)) # (!\inst|iDL2|Add8~2_combout\ & ((\inst|iDL2|Add8~0_combout\) # (!\inst|iDL2|Add8~20\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add8~2_combout\,
	datab => \inst|iDL2|Add8~0_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add8~20\,
	combout => \inst|iDL2|Add8~21_combout\,
	cout => \inst|iDL2|Add8~22\);

-- Location: LCCOMB_X28_Y19_N28
\inst|iDL2|Add8~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add8~23_combout\ = \inst|iDL2|Add8~1_combout\ $ (\inst|iDL2|Add8~0_combout\ $ (!\inst|iDL2|Add8~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add8~1_combout\,
	datab => \inst|iDL2|Add8~0_combout\,
	cin => \inst|iDL2|Add8~22\,
	combout => \inst|iDL2|Add8~23_combout\);

-- Location: LCCOMB_X35_Y19_N20
\inst|iDL2|LessThan7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan7~0_combout\ = (!\inst_gen|yrow\(9) & (((!\inst_gen|yrow\(6)) # (!\inst_gen|yrow\(8))) # (!\inst_gen|yrow\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(7),
	datab => \inst_gen|yrow\(8),
	datac => \inst_gen|yrow\(6),
	datad => \inst_gen|yrow\(9),
	combout => \inst|iDL2|LessThan7~0_combout\);

-- Location: LCCOMB_X34_Y18_N22
\inst|iDL2|LSPflag:romID[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LSPflag:romID[1]~1_combout\ = (\inst|iDL2|LSPflag:romID[1]~0_combout\ & (\inst|iDL2|LessThan7~0_combout\ & (\inst_gen|xcolumn[8]~_Duplicate_2_regout\ $ (!\inst_gen|xcolumn[7]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag:romID[1]~0_combout\,
	datab => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datad => \inst|iDL2|LessThan7~0_combout\,
	combout => \inst|iDL2|LSPflag:romID[1]~1_combout\);

-- Location: LCCOMB_X28_Y19_N8
\inst|iDL2|Mux0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux0~2_combout\ = (\inst|iDL2|LSPflag~2_combout\) # ((\inst|iDL2|LSPflag:romID[1]~1_combout\ & !\inst|iDL2|LessThan6~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag~2_combout\,
	datab => \inst|iDL2|LSPflag:romID[1]~1_combout\,
	datac => \inst|iDL2|LessThan6~0_combout\,
	combout => \inst|iDL2|Mux0~2_combout\);

-- Location: LCCOMB_X28_Y19_N6
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode45w[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode45w[2]~0_combout\ = ((!\inst|iDL2|Add8~23_combout\ & !\inst|iDL2|Add8~21_combout\)) # (!\inst|iDL2|Mux0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add8~23_combout\,
	datac => \inst|iDL2|Mux0~2_combout\,
	datad => \inst|iDL2|Add8~21_combout\,
	combout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode45w[2]~0_combout\);

-- Location: LCCOMB_X29_Y19_N16
\inst|iDL2|LSPflag:romID[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LSPflag:romID[0]~0_combout\ = (\inst|iDL2|LSPflag~2_combout\ & (((\inst|iDL2|LessThan6~0_combout\ & !\inst_gen|yrow\(9))) # (!\inst|iDL2|LSPflag:romID[1]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag~2_combout\,
	datab => \inst|iDL2|LessThan6~0_combout\,
	datac => \inst|iDL2|LSPflag:romID[1]~1_combout\,
	datad => \inst_gen|yrow\(9),
	combout => \inst|iDL2|LSPflag:romID[0]~0_combout\);

-- Location: LCCOMB_X29_Y19_N20
\inst|iDL2|Mux13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux13~0_combout\ = (\inst_gen|xcolumn[0]~_Duplicate_2_regout\ & ((\inst|iDL2|LSPflag:romID[0]~0_combout\) # ((\inst|iDL2|LSPflag:romID[1]~combout\ & \inst_gen|yrow\(0))))) # (!\inst_gen|xcolumn[0]~_Duplicate_2_regout\ & 
-- (\inst|iDL2|LSPflag:romID[1]~combout\ & ((\inst_gen|yrow\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datab => \inst|iDL2|LSPflag:romID[1]~combout\,
	datac => \inst|iDL2|LSPflag:romID[0]~0_combout\,
	datad => \inst_gen|yrow\(0),
	combout => \inst|iDL2|Mux13~0_combout\);

-- Location: LCCOMB_X34_Y19_N26
\inst|iDL2|Mux12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux12~0_combout\ = (\inst_gen|yrow\(1) & ((\inst|iDL2|LSPflag:romID[1]~combout\) # ((\inst|iDL2|LSPflag:romID[0]~0_combout\ & \inst_gen|xcolumn[1]~_Duplicate_2_regout\)))) # (!\inst_gen|yrow\(1) & (\inst|iDL2|LSPflag:romID[0]~0_combout\ & 
-- ((\inst_gen|xcolumn[1]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(1),
	datab => \inst|iDL2|LSPflag:romID[0]~0_combout\,
	datac => \inst|iDL2|LSPflag:romID[1]~combout\,
	datad => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	combout => \inst|iDL2|Mux12~0_combout\);

-- Location: LCCOMB_X33_Y19_N6
\inst|iDL2|Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux11~0_combout\ = (\inst|iDL2|LSPflag:romID[0]~0_combout\ & ((\inst_gen|xcolumn[2]~_Duplicate_2_regout\) # ((\inst_gen|yrow\(2) & \inst|iDL2|LSPflag:romID[1]~combout\)))) # (!\inst|iDL2|LSPflag:romID[0]~0_combout\ & (\inst_gen|yrow\(2) & 
-- (\inst|iDL2|LSPflag:romID[1]~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag:romID[0]~0_combout\,
	datab => \inst_gen|yrow\(2),
	datac => \inst|iDL2|LSPflag:romID[1]~combout\,
	datad => \inst_gen|xcolumn[2]~_Duplicate_2_regout\,
	combout => \inst|iDL2|Mux11~0_combout\);

-- Location: LCCOMB_X29_Y19_N18
\inst|iDL2|Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux10~0_combout\ = (\inst|iDL2|LSPflag:romID[0]~0_combout\ & ((\inst_gen|xcolumn[3]~_Duplicate_2_regout\) # ((\inst|iDL2|LSPflag:romID[1]~combout\ & \inst_gen|yrow\(3))))) # (!\inst|iDL2|LSPflag:romID[0]~0_combout\ & 
-- (\inst|iDL2|LSPflag:romID[1]~combout\ & (\inst_gen|yrow\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag:romID[0]~0_combout\,
	datab => \inst|iDL2|LSPflag:romID[1]~combout\,
	datac => \inst_gen|yrow\(3),
	datad => \inst_gen|xcolumn[3]~_Duplicate_2_regout\,
	combout => \inst|iDL2|Mux10~0_combout\);

-- Location: LCCOMB_X30_Y19_N2
\inst|iDL2|Mux9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux9~0_combout\ = (\inst_gen|yrow\(4) & ((\inst|iDL2|LSPflag:romID[1]~combout\) # ((\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & \inst|iDL2|LSPflag:romID[0]~0_combout\)))) # (!\inst_gen|yrow\(4) & (((\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & 
-- \inst|iDL2|LSPflag:romID[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(4),
	datab => \inst|iDL2|LSPflag:romID[1]~combout\,
	datac => \inst_gen|xcolumn[4]~_Duplicate_2_regout\,
	datad => \inst|iDL2|LSPflag:romID[0]~0_combout\,
	combout => \inst|iDL2|Mux9~0_combout\);

-- Location: LCCOMB_X32_Y20_N6
\inst|iDL2|Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux8~0_combout\ = (\inst_gen|yrow\(5) & ((\inst|iDL2|LSPflag:romID[1]~combout\) # ((\inst|iDL2|LSPflag:romID[0]~0_combout\ & \inst_gen|xcolumn[5]~_Duplicate_2_regout\)))) # (!\inst_gen|yrow\(5) & (\inst|iDL2|LSPflag:romID[0]~0_combout\ & 
-- ((\inst_gen|xcolumn[5]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(5),
	datab => \inst|iDL2|LSPflag:romID[0]~0_combout\,
	datac => \inst|iDL2|LSPflag:romID[1]~combout\,
	datad => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	combout => \inst|iDL2|Mux8~0_combout\);

-- Location: LCCOMB_X32_Y20_N30
\inst|iDL2|Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux7~0_combout\ = (\inst|iDL2|LSPflag:romID[0]~0_combout\ & (((!\inst_gen|xcolumn[6]~_Duplicate_2_regout\)))) # (!\inst|iDL2|LSPflag:romID[0]~0_combout\ & (!\inst_gen|yrow\(6) & (\inst|iDL2|LSPflag:romID[1]~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(6),
	datab => \inst|iDL2|LSPflag:romID[0]~0_combout\,
	datac => \inst|iDL2|LSPflag:romID[1]~combout\,
	datad => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	combout => \inst|iDL2|Mux7~0_combout\);

-- Location: LCCOMB_X28_Y19_N2
\inst|iDL2|Mux6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux6~2_combout\ = (\inst|iDL2|Add8~11_combout\ & ((\inst|iDL2|LSPflag~2_combout\) # ((\inst|iDL2|LSPflag:romID[1]~1_combout\ & !\inst|iDL2|LessThan6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag~2_combout\,
	datab => \inst|iDL2|LSPflag:romID[1]~1_combout\,
	datac => \inst|iDL2|LessThan6~0_combout\,
	datad => \inst|iDL2|Add8~11_combout\,
	combout => \inst|iDL2|Mux6~2_combout\);

-- Location: LCCOMB_X28_Y19_N12
\inst|iDL2|Mux5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux5~2_combout\ = (\inst|iDL2|Add8~13_combout\ & ((\inst|iDL2|LSPflag~2_combout\) # ((\inst|iDL2|LSPflag:romID[1]~1_combout\ & !\inst|iDL2|LessThan6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag~2_combout\,
	datab => \inst|iDL2|LSPflag:romID[1]~1_combout\,
	datac => \inst|iDL2|LessThan6~0_combout\,
	datad => \inst|iDL2|Add8~13_combout\,
	combout => \inst|iDL2|Mux5~2_combout\);

-- Location: LCCOMB_X28_Y19_N30
\inst|iDL2|Mux4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux4~2_combout\ = (\inst|iDL2|Add8~15_combout\ & ((\inst|iDL2|LSPflag~2_combout\) # ((\inst|iDL2|LSPflag:romID[1]~1_combout\ & !\inst|iDL2|LessThan6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag~2_combout\,
	datab => \inst|iDL2|LSPflag:romID[1]~1_combout\,
	datac => \inst|iDL2|LessThan6~0_combout\,
	datad => \inst|iDL2|Add8~15_combout\,
	combout => \inst|iDL2|Mux4~2_combout\);

-- Location: LCCOMB_X29_Y19_N24
\inst|iDL2|Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux3~2_combout\ = (\inst|iDL2|Add8~17_combout\ & ((\inst|iDL2|LSPflag~2_combout\) # ((!\inst|iDL2|LessThan6~0_combout\ & \inst|iDL2|LSPflag:romID[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag~2_combout\,
	datab => \inst|iDL2|LessThan6~0_combout\,
	datac => \inst|iDL2|LSPflag:romID[1]~1_combout\,
	datad => \inst|iDL2|Add8~17_combout\,
	combout => \inst|iDL2|Mux3~2_combout\);

-- Location: LCCOMB_X28_Y19_N14
\inst|iDL2|Mux2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux2~2_combout\ = (\inst|iDL2|Add8~19_combout\ & ((\inst|iDL2|LSPflag~2_combout\) # ((\inst|iDL2|LSPflag:romID[1]~1_combout\ & !\inst|iDL2|LessThan6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag~2_combout\,
	datab => \inst|iDL2|LSPflag:romID[1]~1_combout\,
	datac => \inst|iDL2|LessThan6~0_combout\,
	datad => \inst|iDL2|Add8~19_combout\,
	combout => \inst|iDL2|Mux2~2_combout\);

-- Location: M4K_X13_Y18
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a1\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000003FFFFFFFC000000000000000000000001FFFFFFFC0000000000000000000000007FFFFFFC0000000000000000000000003FFFFFFC0000000000000000000000001FFFFFFC00000000000000000000000007FFFFFC00000000000000000000000003FFFFFC00000000000000000000000001FFFFFC000000000000000000000000007FFFFE000000000000000000000000003FFFFE000000000000000000000000001FFFFE0000000000000000000000000007FFFE0000000000000000000000000003FFFE0000000000000000000000000001FFFE00000000000000000000000000007FFE00000000000000000000000000003FFC0",
	mem_init0 => X"0000000000000000000000000001FF8000000000000000000000000000007F8000000000000000000000000000003F0000000000000000000000000000000C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL2|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode45w[2]~0_combout\,
	portaaddr => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\);

-- Location: LCCOMB_X29_Y19_N8
\inst|iDL2|Mux0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux0~3_combout\ = (\inst|iDL2|Add8~23_combout\ & ((\inst|iDL2|LSPflag~2_combout\) # ((!\inst|iDL2|LessThan6~0_combout\ & \inst|iDL2|LSPflag:romID[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag~2_combout\,
	datab => \inst|iDL2|LessThan6~0_combout\,
	datac => \inst|iDL2|LSPflag:romID[1]~1_combout\,
	datad => \inst|iDL2|Add8~23_combout\,
	combout => \inst|iDL2|Mux0~3_combout\);

-- Location: LCFF_X29_Y19_N9
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|address_reg_a[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	datain => \inst|iDL2|Mux0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|address_reg_a\(1));

-- Location: LCFF_X29_Y19_N23
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	sdata => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|address_reg_a\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1));

-- Location: LCCOMB_X29_Y19_N0
\inst|iDL2|Mux1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Mux1~2_combout\ = (\inst|iDL2|Add8~21_combout\ & ((\inst|iDL2|LSPflag~2_combout\) # ((!\inst|iDL2|LessThan6~0_combout\ & \inst|iDL2|LSPflag:romID[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag~2_combout\,
	datab => \inst|iDL2|LessThan6~0_combout\,
	datac => \inst|iDL2|LSPflag:romID[1]~1_combout\,
	datad => \inst|iDL2|Add8~21_combout\,
	combout => \inst|iDL2|Mux1~2_combout\);

-- Location: LCFF_X29_Y19_N1
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|address_reg_a[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	datain => \inst|iDL2|Mux1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|address_reg_a\(0));

-- Location: LCFF_X29_Y19_N3
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	sdata => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|address_reg_a\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0));

-- Location: LCCOMB_X29_Y19_N22
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~2_combout\ = (\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0))))) 
-- # (!\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a3~portadataout\)) # 
-- (!\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a1~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a3~portadataout\,
	datab => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a1~portadataout\,
	datac => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datad => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~2_combout\);

-- Location: LCCOMB_X28_Y19_N4
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~1_combout\ = (\inst|iDL2|Add8~23_combout\ & (\inst|iDL2|Mux0~2_combout\ & !\inst|iDL2|Add8~21_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add8~23_combout\,
	datac => \inst|iDL2|Mux0~2_combout\,
	datad => \inst|iDL2|Add8~21_combout\,
	combout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~1_combout\);

-- Location: M4K_X52_Y18
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a5\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"03FFFFFFC0000000000000000000000003FFFFFFE0000000000000000000000003FFFFFFF8000000000000000000000003FFFFFFFC000000000000000000000003FFFFFFFE000000000000000000000003FCFFFFFF000000000000000000000003FC7FFFFFC00000000000000000000003FC3FFFFFE00000000000000000000003F80FFFFFF00000000000000000000007F807FFFFFC0000000000000000000007F803FFFFFE0000000000000000000007F800FFFFFF0000000000000000000007F8007FFFFF8000000000000000000007F8003FFFFF800000000000000000000FF0001FFFFF800000000000000000000FF00007FFFF80000000000000000000",
	mem_init0 => X"0FF00003FFFF800000000000000000000FF00001FFFF800000000000000000001FF000007FFF800000000000000000001FE000003FFF000000000000000000001FE000001FFF000000000000000000001FE0000007FE000000000000000000001FC0000003FC000000000000000000003FC0000001F8000000000000000000003F8000000070000000000000000000001F0000000000000000000000000000001E0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "romPicture2.mif",
	init_file_layout => "port_a",
	logical_ram_name => "DisplayLogic2Mux:inst|DisplayLogic2:iDL2|romPicture2:rom_inst|altsyncram:altsyncram_component|altsyncram_2o71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_disable_ce_on_output_registers => "on",
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 2,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 1,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \inst_gen|ALT_INV_VGA_CLK~clkctrl_outclk\,
	ena0 => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|deep_decode|w_anode66w[2]~1_combout\,
	portaaddr => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\);

-- Location: LCCOMB_X29_Y19_N28
\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\ = (\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~2_combout\ & 
-- ((\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a7~portadataout\) # ((!\inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1))))) # 
-- (!\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~2_combout\ & (((\inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a5~portadataout\ & 
-- \inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a7~portadataout\,
	datab => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~2_combout\,
	datac => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|ram_block1a5~portadataout\,
	datad => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|out_address_reg_a\(1),
	combout => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\);

-- Location: LCCOMB_X31_Y21_N8
\inst|iDL2|LSPflag~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LSPflag~2_combout\ = (\inst|iDL2|LSPflag~0_combout\ & (\inst|iDL2|LSPflag~1_combout\ & (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & !\inst_gen|xcolumn[8]~_Duplicate_2_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag~0_combout\,
	datab => \inst|iDL2|LSPflag~1_combout\,
	datac => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	combout => \inst|iDL2|LSPflag~2_combout\);

-- Location: LCCOMB_X29_Y19_N6
\inst|iDL2|LSPflag~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LSPflag~3_combout\ = (\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\ & (((\inst|iDL2|LSPflag~2_combout\) # (\inst|iDL2|LSPflag:romID[1]~combout\)))) # 
-- (!\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\ & (\inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\ & ((\inst|iDL2|LSPflag~2_combout\) # 
-- (\inst|iDL2|LSPflag:romID[1]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\,
	datab => \inst|iDL2|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\,
	datac => \inst|iDL2|LSPflag~2_combout\,
	datad => \inst|iDL2|LSPflag:romID[1]~combout\,
	combout => \inst|iDL2|LSPflag~3_combout\);

-- Location: LCCOMB_X31_Y23_N30
\inst|iDL2|VGA_B[2]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|VGA_B[2]~6_combout\ = (!\inst|iDL2|LessThan11~0_combout\ & (!\inst|iDL2|LSPflag~3_combout\ & (!\inst_gen|yrow\(9) & !\inst|iDL2|LessThan9~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LessThan11~0_combout\,
	datab => \inst|iDL2|LSPflag~3_combout\,
	datac => \inst_gen|yrow\(9),
	datad => \inst|iDL2|LessThan9~0_combout\,
	combout => \inst|iDL2|VGA_B[2]~6_combout\);

-- Location: LCCOMB_X33_Y19_N8
\inst|iDL2|Add2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add2~0_combout\ = (\inst_gen|yrow\(2) & (\inst_gen|yrow\(0) $ (VCC))) # (!\inst_gen|yrow\(2) & (\inst_gen|yrow\(0) & VCC))
-- \inst|iDL2|Add2~1\ = CARRY((\inst_gen|yrow\(2) & \inst_gen|yrow\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(2),
	datab => \inst_gen|yrow\(0),
	datad => VCC,
	combout => \inst|iDL2|Add2~0_combout\,
	cout => \inst|iDL2|Add2~1\);

-- Location: LCCOMB_X33_Y19_N10
\inst|iDL2|Add2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add2~2_combout\ = (\inst_gen|yrow\(1) & ((\inst_gen|yrow\(3) & (\inst|iDL2|Add2~1\ & VCC)) # (!\inst_gen|yrow\(3) & (!\inst|iDL2|Add2~1\)))) # (!\inst_gen|yrow\(1) & ((\inst_gen|yrow\(3) & (!\inst|iDL2|Add2~1\)) # (!\inst_gen|yrow\(3) & 
-- ((\inst|iDL2|Add2~1\) # (GND)))))
-- \inst|iDL2|Add2~3\ = CARRY((\inst_gen|yrow\(1) & (!\inst_gen|yrow\(3) & !\inst|iDL2|Add2~1\)) # (!\inst_gen|yrow\(1) & ((!\inst|iDL2|Add2~1\) # (!\inst_gen|yrow\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(1),
	datab => \inst_gen|yrow\(3),
	datad => VCC,
	cin => \inst|iDL2|Add2~1\,
	combout => \inst|iDL2|Add2~2_combout\,
	cout => \inst|iDL2|Add2~3\);

-- Location: LCCOMB_X33_Y19_N16
\inst|iDL2|Add2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add2~8_combout\ = ((\inst_gen|yrow\(4) $ (\inst_gen|yrow\(6) $ (!\inst|iDL2|Add2~7\)))) # (GND)
-- \inst|iDL2|Add2~9\ = CARRY((\inst_gen|yrow\(4) & ((\inst_gen|yrow\(6)) # (!\inst|iDL2|Add2~7\))) # (!\inst_gen|yrow\(4) & (\inst_gen|yrow\(6) & !\inst|iDL2|Add2~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(4),
	datab => \inst_gen|yrow\(6),
	datad => VCC,
	cin => \inst|iDL2|Add2~7\,
	combout => \inst|iDL2|Add2~8_combout\,
	cout => \inst|iDL2|Add2~9\);

-- Location: LCCOMB_X33_Y19_N20
\inst|iDL2|Add2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add2~12_combout\ = ((\inst_gen|yrow\(8) $ (\inst_gen|yrow\(6) $ (!\inst|iDL2|Add2~11\)))) # (GND)
-- \inst|iDL2|Add2~13\ = CARRY((\inst_gen|yrow\(8) & ((\inst_gen|yrow\(6)) # (!\inst|iDL2|Add2~11\))) # (!\inst_gen|yrow\(8) & (\inst_gen|yrow\(6) & !\inst|iDL2|Add2~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(8),
	datab => \inst_gen|yrow\(6),
	datad => VCC,
	cin => \inst|iDL2|Add2~11\,
	combout => \inst|iDL2|Add2~12_combout\,
	cout => \inst|iDL2|Add2~13\);

-- Location: LCCOMB_X33_Y19_N22
\inst|iDL2|Add2~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add2~14_combout\ = (\inst_gen|yrow\(9) & ((\inst_gen|yrow\(7) & (\inst|iDL2|Add2~13\ & VCC)) # (!\inst_gen|yrow\(7) & (!\inst|iDL2|Add2~13\)))) # (!\inst_gen|yrow\(9) & ((\inst_gen|yrow\(7) & (!\inst|iDL2|Add2~13\)) # (!\inst_gen|yrow\(7) & 
-- ((\inst|iDL2|Add2~13\) # (GND)))))
-- \inst|iDL2|Add2~15\ = CARRY((\inst_gen|yrow\(9) & (!\inst_gen|yrow\(7) & !\inst|iDL2|Add2~13\)) # (!\inst_gen|yrow\(9) & ((!\inst|iDL2|Add2~13\) # (!\inst_gen|yrow\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(9),
	datab => \inst_gen|yrow\(7),
	datad => VCC,
	cin => \inst|iDL2|Add2~13\,
	combout => \inst|iDL2|Add2~14_combout\,
	cout => \inst|iDL2|Add2~15\);

-- Location: LCCOMB_X33_Y19_N28
\inst|iDL2|Add2~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add2~20_combout\ = !\inst|iDL2|Add2~19\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst|iDL2|Add2~19\,
	combout => \inst|iDL2|Add2~20_combout\);

-- Location: LCCOMB_X30_Y19_N6
\inst|iDL2|Add4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add4~0_combout\ = (\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[0]~_Duplicate_2_regout\ $ (VCC))) # (!\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[0]~_Duplicate_2_regout\ & VCC))
-- \inst|iDL2|Add4~1\ = CARRY((\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & \inst_gen|xcolumn[0]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datad => VCC,
	combout => \inst|iDL2|Add4~0_combout\,
	cout => \inst|iDL2|Add4~1\);

-- Location: LCCOMB_X30_Y19_N8
\inst|iDL2|Add4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add4~2_combout\ = (\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & (\inst|iDL2|Add4~1\ & VCC)) # (!\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & (!\inst|iDL2|Add4~1\)))) # 
-- (!\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & (!\inst|iDL2|Add4~1\)) # (!\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & ((\inst|iDL2|Add4~1\) # (GND)))))
-- \inst|iDL2|Add4~3\ = CARRY((\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & (!\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & !\inst|iDL2|Add4~1\)) # (!\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & ((!\inst|iDL2|Add4~1\) # 
-- (!\inst_gen|xcolumn[2]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[2]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL2|Add4~1\,
	combout => \inst|iDL2|Add4~2_combout\,
	cout => \inst|iDL2|Add4~3\);

-- Location: LCCOMB_X30_Y19_N12
\inst|iDL2|Add4~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add4~6_combout\ = (\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & (\inst|iDL2|Add4~5\ & VCC)) # (!\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & (!\inst|iDL2|Add4~5\)))) # 
-- (!\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & (!\inst|iDL2|Add4~5\)) # (!\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & ((\inst|iDL2|Add4~5\) # (GND)))))
-- \inst|iDL2|Add4~7\ = CARRY((\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & (!\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & !\inst|iDL2|Add4~5\)) # (!\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & ((!\inst|iDL2|Add4~5\) # 
-- (!\inst_gen|xcolumn[4]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[3]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[4]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL2|Add4~5\,
	combout => \inst|iDL2|Add4~6_combout\,
	cout => \inst|iDL2|Add4~7\);

-- Location: LCCOMB_X30_Y19_N14
\inst|iDL2|Add4~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add4~8_combout\ = ((\inst_gen|xcolumn[5]~_Duplicate_2_regout\ $ (\inst_gen|xcolumn[4]~_Duplicate_2_regout\ $ (!\inst|iDL2|Add4~7\)))) # (GND)
-- \inst|iDL2|Add4~9\ = CARRY((\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[4]~_Duplicate_2_regout\) # (!\inst|iDL2|Add4~7\))) # (!\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & 
-- !\inst|iDL2|Add4~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[4]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL2|Add4~7\,
	combout => \inst|iDL2|Add4~8_combout\,
	cout => \inst|iDL2|Add4~9\);

-- Location: LCCOMB_X30_Y19_N16
\inst|iDL2|Add4~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add4~10_combout\ = (\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & (\inst|iDL2|Add4~9\ & VCC)) # (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & (!\inst|iDL2|Add4~9\)))) # 
-- (!\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & (!\inst|iDL2|Add4~9\)) # (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & ((\inst|iDL2|Add4~9\) # (GND)))))
-- \inst|iDL2|Add4~11\ = CARRY((\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & !\inst|iDL2|Add4~9\)) # (!\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & ((!\inst|iDL2|Add4~9\) # 
-- (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL2|Add4~9\,
	combout => \inst|iDL2|Add4~10_combout\,
	cout => \inst|iDL2|Add4~11\);

-- Location: LCCOMB_X30_Y19_N18
\inst|iDL2|Add4~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add4~12_combout\ = ((\inst_gen|xcolumn[7]~_Duplicate_2_regout\ $ (\inst_gen|xcolumn[6]~_Duplicate_2_regout\ $ (!\inst|iDL2|Add4~11\)))) # (GND)
-- \inst|iDL2|Add4~13\ = CARRY((\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[6]~_Duplicate_2_regout\) # (!\inst|iDL2|Add4~11\))) # (!\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & 
-- !\inst|iDL2|Add4~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL2|Add4~11\,
	combout => \inst|iDL2|Add4~12_combout\,
	cout => \inst|iDL2|Add4~13\);

-- Location: LCCOMB_X30_Y19_N20
\inst|iDL2|Add4~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add4~14_combout\ = (\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & (\inst|iDL2|Add4~13\ & VCC)) # (!\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & (!\inst|iDL2|Add4~13\)))) # 
-- (!\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & (!\inst|iDL2|Add4~13\)) # (!\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & ((\inst|iDL2|Add4~13\) # (GND)))))
-- \inst|iDL2|Add4~15\ = CARRY((\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & (!\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & !\inst|iDL2|Add4~13\)) # (!\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & ((!\inst|iDL2|Add4~13\) # 
-- (!\inst_gen|xcolumn[8]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL2|Add4~13\,
	combout => \inst|iDL2|Add4~14_combout\,
	cout => \inst|iDL2|Add4~15\);

-- Location: LCCOMB_X30_Y19_N22
\inst|iDL2|Add4~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add4~16_combout\ = ((\inst_gen|xcolumn[9]~_Duplicate_2_regout\ $ (\inst_gen|xcolumn[8]~_Duplicate_2_regout\ $ (!\inst|iDL2|Add4~15\)))) # (GND)
-- \inst|iDL2|Add4~17\ = CARRY((\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & ((\inst_gen|xcolumn[8]~_Duplicate_2_regout\) # (!\inst|iDL2|Add4~15\))) # (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & 
-- !\inst|iDL2|Add4~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL2|Add4~15\,
	combout => \inst|iDL2|Add4~16_combout\,
	cout => \inst|iDL2|Add4~17\);

-- Location: LCCOMB_X30_Y19_N24
\inst|iDL2|Add4~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add4~18_combout\ = (\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & (!\inst|iDL2|Add4~17\)) # (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & ((\inst|iDL2|Add4~17\) # (GND)))
-- \inst|iDL2|Add4~19\ = CARRY((!\inst|iDL2|Add4~17\) # (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iDL2|Add4~17\,
	combout => \inst|iDL2|Add4~18_combout\,
	cout => \inst|iDL2|Add4~19\);

-- Location: LCCOMB_X31_Y19_N0
\inst|iDL2|Add3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add3~1_cout\ = CARRY((!\inst|iDL2|Add4~0_combout\ & !\inst_gen|xcolumn[0]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add4~0_combout\,
	datab => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datad => VCC,
	cout => \inst|iDL2|Add3~1_cout\);

-- Location: LCCOMB_X31_Y19_N4
\inst|iDL2|Add3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add3~4_combout\ = (\inst|iDL2|Add4~4_combout\ & (!\inst|iDL2|Add3~3\ & VCC)) # (!\inst|iDL2|Add4~4_combout\ & (\inst|iDL2|Add3~3\ $ (GND)))
-- \inst|iDL2|Add3~5\ = CARRY((!\inst|iDL2|Add4~4_combout\ & !\inst|iDL2|Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add4~4_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add3~3\,
	combout => \inst|iDL2|Add3~4_combout\,
	cout => \inst|iDL2|Add3~5\);

-- Location: LCCOMB_X31_Y19_N6
\inst|iDL2|Add3~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add3~6_combout\ = (\inst|iDL2|Add4~6_combout\ & (!\inst|iDL2|Add3~5\)) # (!\inst|iDL2|Add4~6_combout\ & (\inst|iDL2|Add3~5\ & VCC))
-- \inst|iDL2|Add3~7\ = CARRY((\inst|iDL2|Add4~6_combout\ & !\inst|iDL2|Add3~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add4~6_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add3~5\,
	combout => \inst|iDL2|Add3~6_combout\,
	cout => \inst|iDL2|Add3~7\);

-- Location: LCCOMB_X31_Y19_N10
\inst|iDL2|Add3~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add3~10_combout\ = (\inst|iDL2|Add4~10_combout\ & ((\inst|iDL2|Add3~9\) # (GND))) # (!\inst|iDL2|Add4~10_combout\ & (!\inst|iDL2|Add3~9\))
-- \inst|iDL2|Add3~11\ = CARRY((\inst|iDL2|Add4~10_combout\) # (!\inst|iDL2|Add3~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add4~10_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add3~9\,
	combout => \inst|iDL2|Add3~10_combout\,
	cout => \inst|iDL2|Add3~11\);

-- Location: LCCOMB_X31_Y19_N16
\inst|iDL2|Add3~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add3~16_combout\ = (\inst|iDL2|Add4~16_combout\ & (!\inst|iDL2|Add3~15\ & VCC)) # (!\inst|iDL2|Add4~16_combout\ & (\inst|iDL2|Add3~15\ $ (GND)))
-- \inst|iDL2|Add3~17\ = CARRY((!\inst|iDL2|Add4~16_combout\ & !\inst|iDL2|Add3~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add4~16_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add3~15\,
	combout => \inst|iDL2|Add3~16_combout\,
	cout => \inst|iDL2|Add3~17\);

-- Location: LCCOMB_X31_Y19_N18
\inst|iDL2|Add3~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add3~18_combout\ = (\inst|iDL2|Add4~18_combout\ & (!\inst|iDL2|Add3~17\)) # (!\inst|iDL2|Add4~18_combout\ & (\inst|iDL2|Add3~17\ & VCC))
-- \inst|iDL2|Add3~19\ = CARRY((\inst|iDL2|Add4~18_combout\ & !\inst|iDL2|Add3~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add4~18_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add3~17\,
	combout => \inst|iDL2|Add3~18_combout\,
	cout => \inst|iDL2|Add3~19\);

-- Location: LCCOMB_X32_Y19_N4
\inst|iDL2|LessThan14~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan14~1_cout\ = CARRY((!\inst_gen|yrow\(1) & \inst_gen|xcolumn[0]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(1),
	datab => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datad => VCC,
	cout => \inst|iDL2|LessThan14~1_cout\);

-- Location: LCCOMB_X32_Y19_N6
\inst|iDL2|LessThan14~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan14~3_cout\ = CARRY((\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & (\inst|iDL2|Add2~0_combout\ & !\inst|iDL2|LessThan14~1_cout\)) # (!\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & ((\inst|iDL2|Add2~0_combout\) # 
-- (!\inst|iDL2|LessThan14~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	datab => \inst|iDL2|Add2~0_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan14~1_cout\,
	cout => \inst|iDL2|LessThan14~3_cout\);

-- Location: LCCOMB_X32_Y19_N8
\inst|iDL2|LessThan14~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan14~5_cout\ = CARRY((\inst|iDL2|Add3~2_combout\ & ((!\inst|iDL2|LessThan14~3_cout\) # (!\inst|iDL2|Add2~2_combout\))) # (!\inst|iDL2|Add3~2_combout\ & (!\inst|iDL2|Add2~2_combout\ & !\inst|iDL2|LessThan14~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add3~2_combout\,
	datab => \inst|iDL2|Add2~2_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan14~3_cout\,
	cout => \inst|iDL2|LessThan14~5_cout\);

-- Location: LCCOMB_X32_Y19_N10
\inst|iDL2|LessThan14~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan14~7_cout\ = CARRY((\inst|iDL2|Add2~4_combout\ & ((!\inst|iDL2|LessThan14~5_cout\) # (!\inst|iDL2|Add3~4_combout\))) # (!\inst|iDL2|Add2~4_combout\ & (!\inst|iDL2|Add3~4_combout\ & !\inst|iDL2|LessThan14~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add2~4_combout\,
	datab => \inst|iDL2|Add3~4_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan14~5_cout\,
	cout => \inst|iDL2|LessThan14~7_cout\);

-- Location: LCCOMB_X32_Y19_N12
\inst|iDL2|LessThan14~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan14~9_cout\ = CARRY((\inst|iDL2|Add2~6_combout\ & (\inst|iDL2|Add3~6_combout\ & !\inst|iDL2|LessThan14~7_cout\)) # (!\inst|iDL2|Add2~6_combout\ & ((\inst|iDL2|Add3~6_combout\) # (!\inst|iDL2|LessThan14~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add2~6_combout\,
	datab => \inst|iDL2|Add3~6_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan14~7_cout\,
	cout => \inst|iDL2|LessThan14~9_cout\);

-- Location: LCCOMB_X32_Y19_N14
\inst|iDL2|LessThan14~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan14~11_cout\ = CARRY((\inst|iDL2|Add3~8_combout\ & (\inst|iDL2|Add2~8_combout\ & !\inst|iDL2|LessThan14~9_cout\)) # (!\inst|iDL2|Add3~8_combout\ & ((\inst|iDL2|Add2~8_combout\) # (!\inst|iDL2|LessThan14~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add3~8_combout\,
	datab => \inst|iDL2|Add2~8_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan14~9_cout\,
	cout => \inst|iDL2|LessThan14~11_cout\);

-- Location: LCCOMB_X32_Y19_N16
\inst|iDL2|LessThan14~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan14~13_cout\ = CARRY((\inst|iDL2|Add2~10_combout\ & (\inst|iDL2|Add3~10_combout\ & !\inst|iDL2|LessThan14~11_cout\)) # (!\inst|iDL2|Add2~10_combout\ & ((\inst|iDL2|Add3~10_combout\) # (!\inst|iDL2|LessThan14~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add2~10_combout\,
	datab => \inst|iDL2|Add3~10_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan14~11_cout\,
	cout => \inst|iDL2|LessThan14~13_cout\);

-- Location: LCCOMB_X32_Y19_N18
\inst|iDL2|LessThan14~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan14~15_cout\ = CARRY((\inst|iDL2|Add3~12_combout\ & (\inst|iDL2|Add2~12_combout\ & !\inst|iDL2|LessThan14~13_cout\)) # (!\inst|iDL2|Add3~12_combout\ & ((\inst|iDL2|Add2~12_combout\) # (!\inst|iDL2|LessThan14~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add3~12_combout\,
	datab => \inst|iDL2|Add2~12_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan14~13_cout\,
	cout => \inst|iDL2|LessThan14~15_cout\);

-- Location: LCCOMB_X32_Y19_N20
\inst|iDL2|LessThan14~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan14~17_cout\ = CARRY((\inst|iDL2|Add3~14_combout\ & ((!\inst|iDL2|LessThan14~15_cout\) # (!\inst|iDL2|Add2~14_combout\))) # (!\inst|iDL2|Add3~14_combout\ & (!\inst|iDL2|Add2~14_combout\ & !\inst|iDL2|LessThan14~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add3~14_combout\,
	datab => \inst|iDL2|Add2~14_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan14~15_cout\,
	cout => \inst|iDL2|LessThan14~17_cout\);

-- Location: LCCOMB_X32_Y19_N22
\inst|iDL2|LessThan14~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan14~19_cout\ = CARRY((\inst|iDL2|Add2~16_combout\ & ((!\inst|iDL2|LessThan14~17_cout\) # (!\inst|iDL2|Add3~16_combout\))) # (!\inst|iDL2|Add2~16_combout\ & (!\inst|iDL2|Add3~16_combout\ & !\inst|iDL2|LessThan14~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add2~16_combout\,
	datab => \inst|iDL2|Add3~16_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan14~17_cout\,
	cout => \inst|iDL2|LessThan14~19_cout\);

-- Location: LCCOMB_X32_Y19_N24
\inst|iDL2|LessThan14~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan14~21_cout\ = CARRY((\inst|iDL2|Add2~18_combout\ & (\inst|iDL2|Add3~18_combout\ & !\inst|iDL2|LessThan14~19_cout\)) # (!\inst|iDL2|Add2~18_combout\ & ((\inst|iDL2|Add3~18_combout\) # (!\inst|iDL2|LessThan14~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add2~18_combout\,
	datab => \inst|iDL2|Add3~18_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan14~19_cout\,
	cout => \inst|iDL2|LessThan14~21_cout\);

-- Location: LCCOMB_X32_Y19_N26
\inst|iDL2|LessThan14~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan14~22_combout\ = (\inst|iDL2|Add3~20_combout\ & ((\inst|iDL2|LessThan14~21_cout\) # (!\inst|iDL2|Add2~20_combout\))) # (!\inst|iDL2|Add3~20_combout\ & (\inst|iDL2|LessThan14~21_cout\ & !\inst|iDL2|Add2~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add3~20_combout\,
	datad => \inst|iDL2|Add2~20_combout\,
	cin => \inst|iDL2|LessThan14~21_cout\,
	combout => \inst|iDL2|LessThan14~22_combout\);

-- Location: LCCOMB_X30_Y19_N26
\inst|iDL2|Add4~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add4~20_combout\ = !\inst|iDL2|Add4~19\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst|iDL2|Add4~19\,
	combout => \inst|iDL2|Add4~20_combout\);

-- Location: LCCOMB_X31_Y19_N22
\inst|iDL2|Add3~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add3~22_combout\ = \inst|iDL2|Add3~21\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst|iDL2|Add3~21\,
	combout => \inst|iDL2|Add3~22_combout\);

-- Location: LCCOMB_X31_Y23_N4
\inst|iDL2|VGA_B[7]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|VGA_B[7]~7_combout\ = (\inst|iDL2|VGA_B[2]~6_combout\ & ((\inst|iDL2|LessThan13~5_combout\) # ((!\inst|iDL2|Add3~22_combout\) # (!\inst|iDL2|LessThan14~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LessThan13~5_combout\,
	datab => \inst|iDL2|VGA_B[2]~6_combout\,
	datac => \inst|iDL2|LessThan14~22_combout\,
	datad => \inst|iDL2|Add3~22_combout\,
	combout => \inst|iDL2|VGA_B[7]~7_combout\);

-- Location: LCFF_X31_Y23_N5
\inst|iPipeLine|VGA_B2[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iDL2|VGA_B[7]~7_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_B2\(7));

-- Location: LCCOMB_X34_Y24_N2
\inst|iVMCalc|counter[1]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[1]~31_combout\ = \inst|iVMCalc|counter\(1) $ (VCC)
-- \inst|iVMCalc|counter[1]~32\ = CARRY(\inst|iVMCalc|counter\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(1),
	datad => VCC,
	combout => \inst|iVMCalc|counter[1]~31_combout\,
	cout => \inst|iVMCalc|counter[1]~32\);

-- Location: LCCOMB_X34_Y24_N12
\inst|iVMCalc|counter[6]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[6]~41_combout\ = (\inst|iVMCalc|counter\(6) & (!\inst|iVMCalc|counter[5]~40\)) # (!\inst|iVMCalc|counter\(6) & ((\inst|iVMCalc|counter[5]~40\) # (GND)))
-- \inst|iVMCalc|counter[6]~42\ = CARRY((!\inst|iVMCalc|counter[5]~40\) # (!\inst|iVMCalc|counter\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(6),
	datad => VCC,
	cin => \inst|iVMCalc|counter[5]~40\,
	combout => \inst|iVMCalc|counter[6]~41_combout\,
	cout => \inst|iVMCalc|counter[6]~42\);

-- Location: LCFF_X34_Y24_N13
\inst|iVMCalc|counter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[6]~41_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(6));

-- Location: LCCOMB_X32_Y22_N0
\inst|iVMCalc|LessThan7~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan7~7_combout\ = ((!\inst|iVMCalc|counter\(8) & ((!\inst|iVMCalc|counter\(6)) # (!\inst|iVMCalc|counter\(7))))) # (!\inst|iVMCalc|counter\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(8),
	datab => \inst|iVMCalc|counter\(9),
	datac => \inst|iVMCalc|counter\(7),
	datad => \inst|iVMCalc|counter\(6),
	combout => \inst|iVMCalc|LessThan7~7_combout\);

-- Location: LCCOMB_X33_Y23_N8
\inst|iVMCalc|LessThan7~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan7~8_combout\ = (!\inst|iVMCalc|counter\(10) & \inst|iVMCalc|LessThan7~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(10),
	datac => \inst|iVMCalc|LessThan7~7_combout\,
	combout => \inst|iVMCalc|LessThan7~8_combout\);

-- Location: LCCOMB_X33_Y23_N2
\inst|iVMCalc|LessThan7~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan7~9_combout\ = (!\inst|iVMCalc|counter\(31) & (((\inst|iVMCalc|counter\(30)) # (!\inst|iVMCalc|LessThan7~8_combout\)) # (!\inst|iVMCalc|LessThan7~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|LessThan7~5_combout\,
	datab => \inst|iVMCalc|counter\(31),
	datac => \inst|iVMCalc|LessThan7~8_combout\,
	datad => \inst|iVMCalc|counter\(30),
	combout => \inst|iVMCalc|LessThan7~9_combout\);

-- Location: LCFF_X34_Y24_N3
\inst|iVMCalc|counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[1]~31_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(1));

-- Location: LCCOMB_X34_Y24_N4
\inst|iVMCalc|counter[2]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[2]~33_combout\ = (\inst|iVMCalc|counter\(2) & (!\inst|iVMCalc|counter[1]~32\)) # (!\inst|iVMCalc|counter\(2) & ((\inst|iVMCalc|counter[1]~32\) # (GND)))
-- \inst|iVMCalc|counter[2]~34\ = CARRY((!\inst|iVMCalc|counter[1]~32\) # (!\inst|iVMCalc|counter\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(2),
	datad => VCC,
	cin => \inst|iVMCalc|counter[1]~32\,
	combout => \inst|iVMCalc|counter[2]~33_combout\,
	cout => \inst|iVMCalc|counter[2]~34\);

-- Location: LCFF_X34_Y24_N5
\inst|iVMCalc|counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[2]~33_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(2));

-- Location: LCCOMB_X34_Y24_N6
\inst|iVMCalc|counter[3]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[3]~35_combout\ = (\inst|iVMCalc|counter\(3) & (\inst|iVMCalc|counter[2]~34\ $ (GND))) # (!\inst|iVMCalc|counter\(3) & (!\inst|iVMCalc|counter[2]~34\ & VCC))
-- \inst|iVMCalc|counter[3]~36\ = CARRY((\inst|iVMCalc|counter\(3) & !\inst|iVMCalc|counter[2]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(3),
	datad => VCC,
	cin => \inst|iVMCalc|counter[2]~34\,
	combout => \inst|iVMCalc|counter[3]~35_combout\,
	cout => \inst|iVMCalc|counter[3]~36\);

-- Location: LCCOMB_X34_Y24_N8
\inst|iVMCalc|counter[4]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[4]~37_combout\ = (\inst|iVMCalc|counter\(4) & (!\inst|iVMCalc|counter[3]~36\)) # (!\inst|iVMCalc|counter\(4) & ((\inst|iVMCalc|counter[3]~36\) # (GND)))
-- \inst|iVMCalc|counter[4]~38\ = CARRY((!\inst|iVMCalc|counter[3]~36\) # (!\inst|iVMCalc|counter\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(4),
	datad => VCC,
	cin => \inst|iVMCalc|counter[3]~36\,
	combout => \inst|iVMCalc|counter[4]~37_combout\,
	cout => \inst|iVMCalc|counter[4]~38\);

-- Location: LCFF_X34_Y24_N9
\inst|iVMCalc|counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[4]~37_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(4));

-- Location: LCCOMB_X34_Y24_N10
\inst|iVMCalc|counter[5]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[5]~39_combout\ = (\inst|iVMCalc|counter\(5) & (\inst|iVMCalc|counter[4]~38\ $ (GND))) # (!\inst|iVMCalc|counter\(5) & (!\inst|iVMCalc|counter[4]~38\ & VCC))
-- \inst|iVMCalc|counter[5]~40\ = CARRY((\inst|iVMCalc|counter\(5) & !\inst|iVMCalc|counter[4]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(5),
	datad => VCC,
	cin => \inst|iVMCalc|counter[4]~38\,
	combout => \inst|iVMCalc|counter[5]~39_combout\,
	cout => \inst|iVMCalc|counter[5]~40\);

-- Location: LCCOMB_X34_Y24_N14
\inst|iVMCalc|counter[7]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[7]~43_combout\ = (\inst|iVMCalc|counter\(7) & (\inst|iVMCalc|counter[6]~42\ $ (GND))) # (!\inst|iVMCalc|counter\(7) & (!\inst|iVMCalc|counter[6]~42\ & VCC))
-- \inst|iVMCalc|counter[7]~44\ = CARRY((\inst|iVMCalc|counter\(7) & !\inst|iVMCalc|counter[6]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(7),
	datad => VCC,
	cin => \inst|iVMCalc|counter[6]~42\,
	combout => \inst|iVMCalc|counter[7]~43_combout\,
	cout => \inst|iVMCalc|counter[7]~44\);

-- Location: LCFF_X34_Y24_N15
\inst|iVMCalc|counter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[7]~43_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(7));

-- Location: LCCOMB_X34_Y24_N16
\inst|iVMCalc|counter[8]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[8]~45_combout\ = (\inst|iVMCalc|counter\(8) & (!\inst|iVMCalc|counter[7]~44\)) # (!\inst|iVMCalc|counter\(8) & ((\inst|iVMCalc|counter[7]~44\) # (GND)))
-- \inst|iVMCalc|counter[8]~46\ = CARRY((!\inst|iVMCalc|counter[7]~44\) # (!\inst|iVMCalc|counter\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(8),
	datad => VCC,
	cin => \inst|iVMCalc|counter[7]~44\,
	combout => \inst|iVMCalc|counter[8]~45_combout\,
	cout => \inst|iVMCalc|counter[8]~46\);

-- Location: LCCOMB_X34_Y24_N18
\inst|iVMCalc|counter[9]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[9]~47_combout\ = (\inst|iVMCalc|counter\(9) & (\inst|iVMCalc|counter[8]~46\ $ (GND))) # (!\inst|iVMCalc|counter\(9) & (!\inst|iVMCalc|counter[8]~46\ & VCC))
-- \inst|iVMCalc|counter[9]~48\ = CARRY((\inst|iVMCalc|counter\(9) & !\inst|iVMCalc|counter[8]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(9),
	datad => VCC,
	cin => \inst|iVMCalc|counter[8]~46\,
	combout => \inst|iVMCalc|counter[9]~47_combout\,
	cout => \inst|iVMCalc|counter[9]~48\);

-- Location: LCFF_X34_Y24_N19
\inst|iVMCalc|counter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[9]~47_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(9));

-- Location: LCCOMB_X34_Y24_N20
\inst|iVMCalc|counter[10]~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[10]~49_combout\ = (\inst|iVMCalc|counter\(10) & (!\inst|iVMCalc|counter[9]~48\)) # (!\inst|iVMCalc|counter\(10) & ((\inst|iVMCalc|counter[9]~48\) # (GND)))
-- \inst|iVMCalc|counter[10]~50\ = CARRY((!\inst|iVMCalc|counter[9]~48\) # (!\inst|iVMCalc|counter\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(10),
	datad => VCC,
	cin => \inst|iVMCalc|counter[9]~48\,
	combout => \inst|iVMCalc|counter[10]~49_combout\,
	cout => \inst|iVMCalc|counter[10]~50\);

-- Location: LCCOMB_X34_Y24_N22
\inst|iVMCalc|counter[11]~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[11]~51_combout\ = (\inst|iVMCalc|counter\(11) & (\inst|iVMCalc|counter[10]~50\ $ (GND))) # (!\inst|iVMCalc|counter\(11) & (!\inst|iVMCalc|counter[10]~50\ & VCC))
-- \inst|iVMCalc|counter[11]~52\ = CARRY((\inst|iVMCalc|counter\(11) & !\inst|iVMCalc|counter[10]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(11),
	datad => VCC,
	cin => \inst|iVMCalc|counter[10]~50\,
	combout => \inst|iVMCalc|counter[11]~51_combout\,
	cout => \inst|iVMCalc|counter[11]~52\);

-- Location: LCFF_X34_Y24_N23
\inst|iVMCalc|counter[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[11]~51_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(11));

-- Location: LCCOMB_X34_Y24_N26
\inst|iVMCalc|counter[13]~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[13]~55_combout\ = (\inst|iVMCalc|counter\(13) & (\inst|iVMCalc|counter[12]~54\ $ (GND))) # (!\inst|iVMCalc|counter\(13) & (!\inst|iVMCalc|counter[12]~54\ & VCC))
-- \inst|iVMCalc|counter[13]~56\ = CARRY((\inst|iVMCalc|counter\(13) & !\inst|iVMCalc|counter[12]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(13),
	datad => VCC,
	cin => \inst|iVMCalc|counter[12]~54\,
	combout => \inst|iVMCalc|counter[13]~55_combout\,
	cout => \inst|iVMCalc|counter[13]~56\);

-- Location: LCFF_X34_Y24_N27
\inst|iVMCalc|counter[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[13]~55_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(13));

-- Location: LCCOMB_X34_Y24_N28
\inst|iVMCalc|counter[14]~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[14]~57_combout\ = (\inst|iVMCalc|counter\(14) & (!\inst|iVMCalc|counter[13]~56\)) # (!\inst|iVMCalc|counter\(14) & ((\inst|iVMCalc|counter[13]~56\) # (GND)))
-- \inst|iVMCalc|counter[14]~58\ = CARRY((!\inst|iVMCalc|counter[13]~56\) # (!\inst|iVMCalc|counter\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(14),
	datad => VCC,
	cin => \inst|iVMCalc|counter[13]~56\,
	combout => \inst|iVMCalc|counter[14]~57_combout\,
	cout => \inst|iVMCalc|counter[14]~58\);

-- Location: LCFF_X34_Y24_N29
\inst|iVMCalc|counter[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[14]~57_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(14));

-- Location: LCCOMB_X34_Y24_N30
\inst|iVMCalc|counter[15]~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[15]~59_combout\ = (\inst|iVMCalc|counter\(15) & (\inst|iVMCalc|counter[14]~58\ $ (GND))) # (!\inst|iVMCalc|counter\(15) & (!\inst|iVMCalc|counter[14]~58\ & VCC))
-- \inst|iVMCalc|counter[15]~60\ = CARRY((\inst|iVMCalc|counter\(15) & !\inst|iVMCalc|counter[14]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(15),
	datad => VCC,
	cin => \inst|iVMCalc|counter[14]~58\,
	combout => \inst|iVMCalc|counter[15]~59_combout\,
	cout => \inst|iVMCalc|counter[15]~60\);

-- Location: LCFF_X34_Y24_N31
\inst|iVMCalc|counter[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[15]~59_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(15));

-- Location: LCCOMB_X34_Y23_N0
\inst|iVMCalc|counter[16]~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[16]~61_combout\ = (\inst|iVMCalc|counter\(16) & (!\inst|iVMCalc|counter[15]~60\)) # (!\inst|iVMCalc|counter\(16) & ((\inst|iVMCalc|counter[15]~60\) # (GND)))
-- \inst|iVMCalc|counter[16]~62\ = CARRY((!\inst|iVMCalc|counter[15]~60\) # (!\inst|iVMCalc|counter\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(16),
	datad => VCC,
	cin => \inst|iVMCalc|counter[15]~60\,
	combout => \inst|iVMCalc|counter[16]~61_combout\,
	cout => \inst|iVMCalc|counter[16]~62\);

-- Location: LCFF_X34_Y23_N1
\inst|iVMCalc|counter[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[16]~61_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(16));

-- Location: LCCOMB_X34_Y23_N2
\inst|iVMCalc|counter[17]~63\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[17]~63_combout\ = (\inst|iVMCalc|counter\(17) & (\inst|iVMCalc|counter[16]~62\ $ (GND))) # (!\inst|iVMCalc|counter\(17) & (!\inst|iVMCalc|counter[16]~62\ & VCC))
-- \inst|iVMCalc|counter[17]~64\ = CARRY((\inst|iVMCalc|counter\(17) & !\inst|iVMCalc|counter[16]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(17),
	datad => VCC,
	cin => \inst|iVMCalc|counter[16]~62\,
	combout => \inst|iVMCalc|counter[17]~63_combout\,
	cout => \inst|iVMCalc|counter[17]~64\);

-- Location: LCFF_X34_Y23_N3
\inst|iVMCalc|counter[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[17]~63_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(17));

-- Location: LCCOMB_X34_Y23_N4
\inst|iVMCalc|counter[18]~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[18]~65_combout\ = (\inst|iVMCalc|counter\(18) & (!\inst|iVMCalc|counter[17]~64\)) # (!\inst|iVMCalc|counter\(18) & ((\inst|iVMCalc|counter[17]~64\) # (GND)))
-- \inst|iVMCalc|counter[18]~66\ = CARRY((!\inst|iVMCalc|counter[17]~64\) # (!\inst|iVMCalc|counter\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(18),
	datad => VCC,
	cin => \inst|iVMCalc|counter[17]~64\,
	combout => \inst|iVMCalc|counter[18]~65_combout\,
	cout => \inst|iVMCalc|counter[18]~66\);

-- Location: LCFF_X34_Y23_N5
\inst|iVMCalc|counter[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[18]~65_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(18));

-- Location: LCCOMB_X34_Y23_N8
\inst|iVMCalc|counter[20]~69\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[20]~69_combout\ = (\inst|iVMCalc|counter\(20) & (!\inst|iVMCalc|counter[19]~68\)) # (!\inst|iVMCalc|counter\(20) & ((\inst|iVMCalc|counter[19]~68\) # (GND)))
-- \inst|iVMCalc|counter[20]~70\ = CARRY((!\inst|iVMCalc|counter[19]~68\) # (!\inst|iVMCalc|counter\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(20),
	datad => VCC,
	cin => \inst|iVMCalc|counter[19]~68\,
	combout => \inst|iVMCalc|counter[20]~69_combout\,
	cout => \inst|iVMCalc|counter[20]~70\);

-- Location: LCFF_X34_Y23_N9
\inst|iVMCalc|counter[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[20]~69_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(20));

-- Location: LCCOMB_X34_Y23_N14
\inst|iVMCalc|counter[23]~75\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[23]~75_combout\ = (\inst|iVMCalc|counter\(23) & (\inst|iVMCalc|counter[22]~74\ $ (GND))) # (!\inst|iVMCalc|counter\(23) & (!\inst|iVMCalc|counter[22]~74\ & VCC))
-- \inst|iVMCalc|counter[23]~76\ = CARRY((\inst|iVMCalc|counter\(23) & !\inst|iVMCalc|counter[22]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(23),
	datad => VCC,
	cin => \inst|iVMCalc|counter[22]~74\,
	combout => \inst|iVMCalc|counter[23]~75_combout\,
	cout => \inst|iVMCalc|counter[23]~76\);

-- Location: LCFF_X34_Y23_N15
\inst|iVMCalc|counter[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[23]~75_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(23));

-- Location: LCCOMB_X34_Y23_N18
\inst|iVMCalc|counter[25]~79\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[25]~79_combout\ = (\inst|iVMCalc|counter\(25) & (\inst|iVMCalc|counter[24]~78\ $ (GND))) # (!\inst|iVMCalc|counter\(25) & (!\inst|iVMCalc|counter[24]~78\ & VCC))
-- \inst|iVMCalc|counter[25]~80\ = CARRY((\inst|iVMCalc|counter\(25) & !\inst|iVMCalc|counter[24]~78\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(25),
	datad => VCC,
	cin => \inst|iVMCalc|counter[24]~78\,
	combout => \inst|iVMCalc|counter[25]~79_combout\,
	cout => \inst|iVMCalc|counter[25]~80\);

-- Location: LCFF_X34_Y23_N19
\inst|iVMCalc|counter[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[25]~79_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(25));

-- Location: LCCOMB_X34_Y23_N22
\inst|iVMCalc|counter[27]~83\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[27]~83_combout\ = (\inst|iVMCalc|counter\(27) & (\inst|iVMCalc|counter[26]~82\ $ (GND))) # (!\inst|iVMCalc|counter\(27) & (!\inst|iVMCalc|counter[26]~82\ & VCC))
-- \inst|iVMCalc|counter[27]~84\ = CARRY((\inst|iVMCalc|counter\(27) & !\inst|iVMCalc|counter[26]~82\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(27),
	datad => VCC,
	cin => \inst|iVMCalc|counter[26]~82\,
	combout => \inst|iVMCalc|counter[27]~83_combout\,
	cout => \inst|iVMCalc|counter[27]~84\);

-- Location: LCFF_X34_Y23_N23
\inst|iVMCalc|counter[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[27]~83_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(27));

-- Location: LCCOMB_X34_Y23_N26
\inst|iVMCalc|counter[29]~87\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[29]~87_combout\ = (\inst|iVMCalc|counter\(29) & (\inst|iVMCalc|counter[28]~86\ $ (GND))) # (!\inst|iVMCalc|counter\(29) & (!\inst|iVMCalc|counter[28]~86\ & VCC))
-- \inst|iVMCalc|counter[29]~88\ = CARRY((\inst|iVMCalc|counter\(29) & !\inst|iVMCalc|counter[28]~86\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(29),
	datad => VCC,
	cin => \inst|iVMCalc|counter[28]~86\,
	combout => \inst|iVMCalc|counter[29]~87_combout\,
	cout => \inst|iVMCalc|counter[29]~88\);

-- Location: LCFF_X34_Y23_N27
\inst|iVMCalc|counter[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[29]~87_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(29));

-- Location: LCCOMB_X34_Y23_N28
\inst|iVMCalc|counter[30]~89\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[30]~89_combout\ = (\inst|iVMCalc|counter\(30) & (!\inst|iVMCalc|counter[29]~88\)) # (!\inst|iVMCalc|counter\(30) & ((\inst|iVMCalc|counter[29]~88\) # (GND)))
-- \inst|iVMCalc|counter[30]~90\ = CARRY((!\inst|iVMCalc|counter[29]~88\) # (!\inst|iVMCalc|counter\(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|counter\(30),
	datad => VCC,
	cin => \inst|iVMCalc|counter[29]~88\,
	combout => \inst|iVMCalc|counter[30]~89_combout\,
	cout => \inst|iVMCalc|counter[30]~90\);

-- Location: LCFF_X34_Y23_N29
\inst|iVMCalc|counter[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[30]~89_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(30));

-- Location: LCCOMB_X34_Y23_N30
\inst|iVMCalc|counter[31]~91\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|counter[31]~91_combout\ = \inst|iVMCalc|counter[30]~90\ $ (!\inst|iVMCalc|counter\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst|iVMCalc|counter\(31),
	cin => \inst|iVMCalc|counter[30]~90\,
	combout => \inst|iVMCalc|counter[31]~91_combout\);

-- Location: LCFF_X34_Y23_N31
\inst|iVMCalc|counter[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[31]~91_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(31));

-- Location: LCCOMB_X33_Y23_N26
\inst|iVMCalc|MuxAddress[1]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|MuxAddress[1]~8_combout\ = ((\inst|iVMCalc|counter\(31)) # (\inst|iVMCalc|counter\(30))) # (!\inst|iVMCalc|MuxAddress[1]~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|MuxAddress[1]~7_combout\,
	datab => \inst|iVMCalc|counter\(31),
	datad => \inst|iVMCalc|counter\(30),
	combout => \inst|iVMCalc|MuxAddress[1]~8_combout\);

-- Location: LCFF_X33_Y23_N27
\inst|iPipeLine|MuxAddress[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMCalc|MuxAddress[1]~8_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|MuxAddress\(1));

-- Location: LCCOMB_X31_Y23_N16
\inst|iVMux|Mux16~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux16~0_combout\ = (\inst|iPipeLine|MuxAddress\(0) & (\inst|iPipeLine|VGA_B2\(7) $ (((\inst|iPipeLine|VGA_B1\(6) & !\inst|iPipeLine|MuxAddress\(1)))))) # (!\inst|iPipeLine|MuxAddress\(0) & ((\inst|iPipeLine|VGA_B1\(6)) # 
-- ((\inst|iPipeLine|VGA_B2\(7) & !\inst|iPipeLine|MuxAddress\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|MuxAddress\(0),
	datab => \inst|iPipeLine|VGA_B1\(6),
	datac => \inst|iPipeLine|VGA_B2\(7),
	datad => \inst|iPipeLine|MuxAddress\(1),
	combout => \inst|iVMux|Mux16~0_combout\);

-- Location: LCFF_X31_Y23_N17
\inst2|VGA_B[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux16~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_B\(9));

-- Location: LCCOMB_X31_Y23_N10
\inst|iVMux|Mux17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux17~0_combout\ = (\inst|iPipeLine|VGA_B1\(6) & ((!\inst|iPipeLine|MuxAddress\(1)) # (!\inst|iPipeLine|MuxAddress\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|MuxAddress\(0),
	datab => \inst|iPipeLine|VGA_B1\(6),
	datad => \inst|iPipeLine|MuxAddress\(1),
	combout => \inst|iVMux|Mux17~0_combout\);

-- Location: LCFF_X31_Y23_N11
\inst2|VGA_B[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux17~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_B\(8));

-- Location: LCFF_X34_Y24_N21
\inst|iVMCalc|counter[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[10]~49_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(10));

-- Location: LCFF_X34_Y24_N17
\inst|iVMCalc|counter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[8]~45_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(8));

-- Location: LCFF_X34_Y24_N11
\inst|iVMCalc|counter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[5]~39_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(5));

-- Location: LCFF_X34_Y24_N7
\inst|iVMCalc|counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|counter[3]~35_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	sclr => \inst|iVMCalc|LessThan7~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|counter\(3));

-- Location: LCCOMB_X32_Y22_N2
\inst|iVMCalc|LessThan3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan3~1_cout\ = CARRY(\inst_gen|xcolumn[0]~_Duplicate_2_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datad => VCC,
	cout => \inst|iVMCalc|LessThan3~1_cout\);

-- Location: LCCOMB_X32_Y22_N4
\inst|iVMCalc|LessThan3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan3~3_cout\ = CARRY((\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & (\inst|iVMCalc|counter\(1) & !\inst|iVMCalc|LessThan3~1_cout\)) # (!\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & ((\inst|iVMCalc|counter\(1)) # 
-- (!\inst|iVMCalc|LessThan3~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(1),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan3~1_cout\,
	cout => \inst|iVMCalc|LessThan3~3_cout\);

-- Location: LCCOMB_X32_Y22_N6
\inst|iVMCalc|LessThan3~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan3~5_cout\ = CARRY((\inst|iVMCalc|counter\(2) & (\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & !\inst|iVMCalc|LessThan3~3_cout\)) # (!\inst|iVMCalc|counter\(2) & ((\inst_gen|xcolumn[2]~_Duplicate_2_regout\) # 
-- (!\inst|iVMCalc|LessThan3~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(2),
	datab => \inst_gen|xcolumn[2]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan3~3_cout\,
	cout => \inst|iVMCalc|LessThan3~5_cout\);

-- Location: LCCOMB_X32_Y22_N8
\inst|iVMCalc|LessThan3~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan3~7_cout\ = CARRY((\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & (\inst|iVMCalc|counter\(3) & !\inst|iVMCalc|LessThan3~5_cout\)) # (!\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & ((\inst|iVMCalc|counter\(3)) # 
-- (!\inst|iVMCalc|LessThan3~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[3]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(3),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan3~5_cout\,
	cout => \inst|iVMCalc|LessThan3~7_cout\);

-- Location: LCCOMB_X32_Y22_N10
\inst|iVMCalc|LessThan3~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan3~9_cout\ = CARRY((\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & ((!\inst|iVMCalc|LessThan3~7_cout\) # (!\inst|iVMCalc|counter\(4)))) # (!\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & (!\inst|iVMCalc|counter\(4) & 
-- !\inst|iVMCalc|LessThan3~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[4]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(4),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan3~7_cout\,
	cout => \inst|iVMCalc|LessThan3~9_cout\);

-- Location: LCCOMB_X32_Y22_N12
\inst|iVMCalc|LessThan3~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan3~11_cout\ = CARRY((\inst|iVMCalc|Add1~0_combout\ & (\inst|iVMCalc|counter\(5) & !\inst|iVMCalc|LessThan3~9_cout\)) # (!\inst|iVMCalc|Add1~0_combout\ & ((\inst|iVMCalc|counter\(5)) # (!\inst|iVMCalc|LessThan3~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|Add1~0_combout\,
	datab => \inst|iVMCalc|counter\(5),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan3~9_cout\,
	cout => \inst|iVMCalc|LessThan3~11_cout\);

-- Location: LCCOMB_X32_Y22_N14
\inst|iVMCalc|LessThan3~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan3~13_cout\ = CARRY((\inst|iVMCalc|Add1~2_combout\ & ((!\inst|iVMCalc|LessThan3~11_cout\) # (!\inst|iVMCalc|counter\(6)))) # (!\inst|iVMCalc|Add1~2_combout\ & (!\inst|iVMCalc|counter\(6) & !\inst|iVMCalc|LessThan3~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|Add1~2_combout\,
	datab => \inst|iVMCalc|counter\(6),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan3~11_cout\,
	cout => \inst|iVMCalc|LessThan3~13_cout\);

-- Location: LCCOMB_X32_Y22_N16
\inst|iVMCalc|LessThan3~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan3~15_cout\ = CARRY((\inst|iVMCalc|counter\(7) & ((!\inst|iVMCalc|LessThan3~13_cout\) # (!\inst|iVMCalc|Add1~4_combout\))) # (!\inst|iVMCalc|counter\(7) & (!\inst|iVMCalc|Add1~4_combout\ & !\inst|iVMCalc|LessThan3~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(7),
	datab => \inst|iVMCalc|Add1~4_combout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan3~13_cout\,
	cout => \inst|iVMCalc|LessThan3~15_cout\);

-- Location: LCCOMB_X32_Y22_N18
\inst|iVMCalc|LessThan3~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan3~17_cout\ = CARRY((\inst|iVMCalc|Add1~6_combout\ & ((!\inst|iVMCalc|LessThan3~15_cout\) # (!\inst|iVMCalc|counter\(8)))) # (!\inst|iVMCalc|Add1~6_combout\ & (!\inst|iVMCalc|counter\(8) & !\inst|iVMCalc|LessThan3~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|Add1~6_combout\,
	datab => \inst|iVMCalc|counter\(8),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan3~15_cout\,
	cout => \inst|iVMCalc|LessThan3~17_cout\);

-- Location: LCCOMB_X32_Y22_N20
\inst|iVMCalc|LessThan3~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan3~19_cout\ = CARRY((\inst|iVMCalc|Add1~8_combout\ & (\inst|iVMCalc|counter\(9) & !\inst|iVMCalc|LessThan3~17_cout\)) # (!\inst|iVMCalc|Add1~8_combout\ & ((\inst|iVMCalc|counter\(9)) # (!\inst|iVMCalc|LessThan3~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|Add1~8_combout\,
	datab => \inst|iVMCalc|counter\(9),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan3~17_cout\,
	cout => \inst|iVMCalc|LessThan3~19_cout\);

-- Location: LCCOMB_X32_Y22_N22
\inst|iVMCalc|LessThan3~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan3~20_combout\ = (\inst|iVMCalc|Add1~10_combout\ & ((!\inst|iVMCalc|counter\(10)) # (!\inst|iVMCalc|LessThan3~19_cout\))) # (!\inst|iVMCalc|Add1~10_combout\ & (!\inst|iVMCalc|LessThan3~19_cout\ & !\inst|iVMCalc|counter\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|Add1~10_combout\,
	datad => \inst|iVMCalc|counter\(10),
	cin => \inst|iVMCalc|LessThan3~19_cout\,
	combout => \inst|iVMCalc|LessThan3~20_combout\);

-- Location: LCCOMB_X33_Y23_N30
\inst|iVMCalc|MuxAddress~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|MuxAddress~3_combout\ = (\inst|iVMCalc|MuxAddress~2_combout\ & (!\inst|iVMCalc|counter\(31) & (\inst|iVMCalc|LessThan3~20_combout\ & !\inst|iVMCalc|counter\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|MuxAddress~2_combout\,
	datab => \inst|iVMCalc|counter\(31),
	datac => \inst|iVMCalc|LessThan3~20_combout\,
	datad => \inst|iVMCalc|counter\(30),
	combout => \inst|iVMCalc|MuxAddress~3_combout\);

-- Location: LCCOMB_X31_Y22_N14
\inst|iVMCalc|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add0~0_combout\ = (\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[3]~_Duplicate_2_regout\ $ (VCC))) # (!\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & VCC))
-- \inst|iVMCalc|Add0~1\ = CARRY((\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & \inst_gen|xcolumn[3]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[2]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[3]~_Duplicate_2_regout\,
	datad => VCC,
	combout => \inst|iVMCalc|Add0~0_combout\,
	cout => \inst|iVMCalc|Add0~1\);

-- Location: LCCOMB_X31_Y22_N16
\inst|iVMCalc|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add0~2_combout\ = (\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & (!\inst|iVMCalc|Add0~1\)) # (!\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & ((\inst|iVMCalc|Add0~1\) # (GND)))
-- \inst|iVMCalc|Add0~3\ = CARRY((!\inst|iVMCalc|Add0~1\) # (!\inst_gen|xcolumn[4]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_gen|xcolumn[4]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|Add0~1\,
	combout => \inst|iVMCalc|Add0~2_combout\,
	cout => \inst|iVMCalc|Add0~3\);

-- Location: LCCOMB_X31_Y22_N24
\inst|iVMCalc|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add0~10_combout\ = (\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & (!\inst|iVMCalc|Add0~9\)) # (!\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & ((\inst|iVMCalc|Add0~9\) # (GND)))
-- \inst|iVMCalc|Add0~11\ = CARRY((!\inst|iVMCalc|Add0~9\) # (!\inst_gen|xcolumn[8]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|Add0~9\,
	combout => \inst|iVMCalc|Add0~10_combout\,
	cout => \inst|iVMCalc|Add0~11\);

-- Location: LCCOMB_X31_Y22_N28
\inst|iVMCalc|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add0~14_combout\ = \inst|iVMCalc|Add0~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst|iVMCalc|Add0~13\,
	combout => \inst|iVMCalc|Add0~14_combout\);

-- Location: LCCOMB_X30_Y22_N2
\inst|iVMCalc|LessThan1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan1~1_cout\ = CARRY(\inst_gen|xcolumn[0]~_Duplicate_2_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datad => VCC,
	cout => \inst|iVMCalc|LessThan1~1_cout\);

-- Location: LCCOMB_X30_Y22_N4
\inst|iVMCalc|LessThan1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan1~3_cout\ = CARRY((\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & (\inst|iVMCalc|counter\(1) & !\inst|iVMCalc|LessThan1~1_cout\)) # (!\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & ((\inst|iVMCalc|counter\(1)) # 
-- (!\inst|iVMCalc|LessThan1~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(1),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan1~1_cout\,
	cout => \inst|iVMCalc|LessThan1~3_cout\);

-- Location: LCCOMB_X30_Y22_N6
\inst|iVMCalc|LessThan1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan1~5_cout\ = CARRY((\inst|iVMCalc|counter\(2) & (!\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & !\inst|iVMCalc|LessThan1~3_cout\)) # (!\inst|iVMCalc|counter\(2) & ((!\inst|iVMCalc|LessThan1~3_cout\) # 
-- (!\inst_gen|xcolumn[2]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(2),
	datab => \inst_gen|xcolumn[2]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan1~3_cout\,
	cout => \inst|iVMCalc|LessThan1~5_cout\);

-- Location: LCCOMB_X30_Y22_N8
\inst|iVMCalc|LessThan1~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan1~7_cout\ = CARRY((\inst|iVMCalc|counter\(3) & ((!\inst|iVMCalc|LessThan1~5_cout\) # (!\inst|iVMCalc|Add0~0_combout\))) # (!\inst|iVMCalc|counter\(3) & (!\inst|iVMCalc|Add0~0_combout\ & !\inst|iVMCalc|LessThan1~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(3),
	datab => \inst|iVMCalc|Add0~0_combout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan1~5_cout\,
	cout => \inst|iVMCalc|LessThan1~7_cout\);

-- Location: LCCOMB_X30_Y22_N10
\inst|iVMCalc|LessThan1~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan1~9_cout\ = CARRY((\inst|iVMCalc|counter\(4) & (\inst|iVMCalc|Add0~2_combout\ & !\inst|iVMCalc|LessThan1~7_cout\)) # (!\inst|iVMCalc|counter\(4) & ((\inst|iVMCalc|Add0~2_combout\) # (!\inst|iVMCalc|LessThan1~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(4),
	datab => \inst|iVMCalc|Add0~2_combout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan1~7_cout\,
	cout => \inst|iVMCalc|LessThan1~9_cout\);

-- Location: LCCOMB_X30_Y22_N12
\inst|iVMCalc|LessThan1~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan1~11_cout\ = CARRY((\inst|iVMCalc|Add0~4_combout\ & (\inst|iVMCalc|counter\(5) & !\inst|iVMCalc|LessThan1~9_cout\)) # (!\inst|iVMCalc|Add0~4_combout\ & ((\inst|iVMCalc|counter\(5)) # (!\inst|iVMCalc|LessThan1~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|Add0~4_combout\,
	datab => \inst|iVMCalc|counter\(5),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan1~9_cout\,
	cout => \inst|iVMCalc|LessThan1~11_cout\);

-- Location: LCCOMB_X30_Y22_N14
\inst|iVMCalc|LessThan1~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan1~13_cout\ = CARRY((\inst|iVMCalc|Add0~6_combout\ & ((!\inst|iVMCalc|LessThan1~11_cout\) # (!\inst|iVMCalc|counter\(6)))) # (!\inst|iVMCalc|Add0~6_combout\ & (!\inst|iVMCalc|counter\(6) & !\inst|iVMCalc|LessThan1~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|Add0~6_combout\,
	datab => \inst|iVMCalc|counter\(6),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan1~11_cout\,
	cout => \inst|iVMCalc|LessThan1~13_cout\);

-- Location: LCCOMB_X30_Y22_N16
\inst|iVMCalc|LessThan1~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan1~15_cout\ = CARRY((\inst|iVMCalc|Add0~8_combout\ & (\inst|iVMCalc|counter\(7) & !\inst|iVMCalc|LessThan1~13_cout\)) # (!\inst|iVMCalc|Add0~8_combout\ & ((\inst|iVMCalc|counter\(7)) # (!\inst|iVMCalc|LessThan1~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|Add0~8_combout\,
	datab => \inst|iVMCalc|counter\(7),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan1~13_cout\,
	cout => \inst|iVMCalc|LessThan1~15_cout\);

-- Location: LCCOMB_X30_Y22_N18
\inst|iVMCalc|LessThan1~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan1~17_cout\ = CARRY((\inst|iVMCalc|counter\(8) & (\inst|iVMCalc|Add0~10_combout\ & !\inst|iVMCalc|LessThan1~15_cout\)) # (!\inst|iVMCalc|counter\(8) & ((\inst|iVMCalc|Add0~10_combout\) # (!\inst|iVMCalc|LessThan1~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(8),
	datab => \inst|iVMCalc|Add0~10_combout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan1~15_cout\,
	cout => \inst|iVMCalc|LessThan1~17_cout\);

-- Location: LCCOMB_X30_Y22_N20
\inst|iVMCalc|LessThan1~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan1~19_cout\ = CARRY((\inst|iVMCalc|Add0~12_combout\ & (\inst|iVMCalc|counter\(9) & !\inst|iVMCalc|LessThan1~17_cout\)) # (!\inst|iVMCalc|Add0~12_combout\ & ((\inst|iVMCalc|counter\(9)) # (!\inst|iVMCalc|LessThan1~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|Add0~12_combout\,
	datab => \inst|iVMCalc|counter\(9),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan1~17_cout\,
	cout => \inst|iVMCalc|LessThan1~19_cout\);

-- Location: LCCOMB_X30_Y22_N22
\inst|iVMCalc|LessThan1~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan1~20_combout\ = (\inst|iVMCalc|Add0~14_combout\ & ((!\inst|iVMCalc|counter\(10)) # (!\inst|iVMCalc|LessThan1~19_cout\))) # (!\inst|iVMCalc|Add0~14_combout\ & (!\inst|iVMCalc|LessThan1~19_cout\ & !\inst|iVMCalc|counter\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|Add0~14_combout\,
	datad => \inst|iVMCalc|counter\(10),
	cin => \inst|iVMCalc|LessThan1~19_cout\,
	combout => \inst|iVMCalc|LessThan1~20_combout\);

-- Location: LCCOMB_X33_Y23_N22
\inst|iVMCalc|MuxAddress[0]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|MuxAddress[0]~10_combout\ = (\inst|iVMCalc|MuxAddress[0]~9_combout\) # ((!\inst|iVMCalc|counter\(31) & ((\inst|iVMCalc|counter\(30)) # (!\inst|iVMCalc|LessThan1~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|MuxAddress[0]~9_combout\,
	datab => \inst|iVMCalc|counter\(31),
	datac => \inst|iVMCalc|LessThan1~20_combout\,
	datad => \inst|iVMCalc|counter\(30),
	combout => \inst|iVMCalc|MuxAddress[0]~10_combout\);

-- Location: LCCOMB_X31_Y21_N0
\inst|iVMCalc|Add2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add2~0_combout\ = (\inst_gen|xcolumn[9]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & \inst_gen|xcolumn[8]~_Duplicate_2_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	combout => \inst|iVMCalc|Add2~0_combout\);

-- Location: LCCOMB_X31_Y21_N2
\inst|iVMCalc|Add2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add2~1_combout\ = \inst_gen|xcolumn[9]~_Duplicate_2_regout\ $ (((\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & (\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & \inst_gen|xcolumn[8]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datab => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	combout => \inst|iVMCalc|Add2~1_combout\);

-- Location: LCCOMB_X31_Y21_N4
\inst|iVMCalc|Add2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|Add2~2_combout\ = \inst_gen|xcolumn[8]~_Duplicate_2_regout\ $ (((\inst_gen|xcolumn[7]~_Duplicate_2_regout\ & \inst_gen|xcolumn[6]~_Duplicate_2_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	datac => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	combout => \inst|iVMCalc|Add2~2_combout\);

-- Location: LCCOMB_X31_Y21_N10
\inst|iVMCalc|LessThan6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan6~1_cout\ = CARRY(\inst_gen|xcolumn[0]~_Duplicate_2_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datad => VCC,
	cout => \inst|iVMCalc|LessThan6~1_cout\);

-- Location: LCCOMB_X31_Y21_N12
\inst|iVMCalc|LessThan6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan6~3_cout\ = CARRY((\inst|iVMCalc|counter\(1) & ((!\inst|iVMCalc|LessThan6~1_cout\) # (!\inst_gen|xcolumn[1]~_Duplicate_2_regout\))) # (!\inst|iVMCalc|counter\(1) & (!\inst_gen|xcolumn[1]~_Duplicate_2_regout\ & 
-- !\inst|iVMCalc|LessThan6~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(1),
	datab => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan6~1_cout\,
	cout => \inst|iVMCalc|LessThan6~3_cout\);

-- Location: LCCOMB_X31_Y21_N14
\inst|iVMCalc|LessThan6~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan6~5_cout\ = CARRY((\inst|iVMCalc|counter\(2) & (\inst_gen|xcolumn[2]~_Duplicate_2_regout\ & !\inst|iVMCalc|LessThan6~3_cout\)) # (!\inst|iVMCalc|counter\(2) & ((\inst_gen|xcolumn[2]~_Duplicate_2_regout\) # 
-- (!\inst|iVMCalc|LessThan6~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(2),
	datab => \inst_gen|xcolumn[2]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan6~3_cout\,
	cout => \inst|iVMCalc|LessThan6~5_cout\);

-- Location: LCCOMB_X31_Y21_N16
\inst|iVMCalc|LessThan6~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan6~7_cout\ = CARRY((\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & (\inst|iVMCalc|counter\(3) & !\inst|iVMCalc|LessThan6~5_cout\)) # (!\inst_gen|xcolumn[3]~_Duplicate_2_regout\ & ((\inst|iVMCalc|counter\(3)) # 
-- (!\inst|iVMCalc|LessThan6~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[3]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(3),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan6~5_cout\,
	cout => \inst|iVMCalc|LessThan6~7_cout\);

-- Location: LCCOMB_X31_Y21_N18
\inst|iVMCalc|LessThan6~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan6~9_cout\ = CARRY((\inst|iVMCalc|counter\(4) & (\inst_gen|xcolumn[4]~_Duplicate_2_regout\ & !\inst|iVMCalc|LessThan6~7_cout\)) # (!\inst|iVMCalc|counter\(4) & ((\inst_gen|xcolumn[4]~_Duplicate_2_regout\) # 
-- (!\inst|iVMCalc|LessThan6~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(4),
	datab => \inst_gen|xcolumn[4]~_Duplicate_2_regout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan6~7_cout\,
	cout => \inst|iVMCalc|LessThan6~9_cout\);

-- Location: LCCOMB_X31_Y21_N20
\inst|iVMCalc|LessThan6~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan6~11_cout\ = CARRY((\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & (\inst|iVMCalc|counter\(5) & !\inst|iVMCalc|LessThan6~9_cout\)) # (!\inst_gen|xcolumn[5]~_Duplicate_2_regout\ & ((\inst|iVMCalc|counter\(5)) # 
-- (!\inst|iVMCalc|LessThan6~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[5]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(5),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan6~9_cout\,
	cout => \inst|iVMCalc|LessThan6~11_cout\);

-- Location: LCCOMB_X31_Y21_N22
\inst|iVMCalc|LessThan6~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan6~13_cout\ = CARRY((\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & (!\inst|iVMCalc|counter\(6) & !\inst|iVMCalc|LessThan6~11_cout\)) # (!\inst_gen|xcolumn[6]~_Duplicate_2_regout\ & ((!\inst|iVMCalc|LessThan6~11_cout\) # 
-- (!\inst|iVMCalc|counter\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[6]~_Duplicate_2_regout\,
	datab => \inst|iVMCalc|counter\(6),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan6~11_cout\,
	cout => \inst|iVMCalc|LessThan6~13_cout\);

-- Location: LCCOMB_X31_Y21_N24
\inst|iVMCalc|LessThan6~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan6~15_cout\ = CARRY((\inst|iDL2|LSPflag~0_combout\ & (\inst|iVMCalc|counter\(7) & !\inst|iVMCalc|LessThan6~13_cout\)) # (!\inst|iDL2|LSPflag~0_combout\ & ((\inst|iVMCalc|counter\(7)) # (!\inst|iVMCalc|LessThan6~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LSPflag~0_combout\,
	datab => \inst|iVMCalc|counter\(7),
	datad => VCC,
	cin => \inst|iVMCalc|LessThan6~13_cout\,
	cout => \inst|iVMCalc|LessThan6~15_cout\);

-- Location: LCCOMB_X31_Y21_N26
\inst|iVMCalc|LessThan6~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan6~17_cout\ = CARRY((\inst|iVMCalc|counter\(8) & (\inst|iVMCalc|Add2~2_combout\ & !\inst|iVMCalc|LessThan6~15_cout\)) # (!\inst|iVMCalc|counter\(8) & ((\inst|iVMCalc|Add2~2_combout\) # (!\inst|iVMCalc|LessThan6~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(8),
	datab => \inst|iVMCalc|Add2~2_combout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan6~15_cout\,
	cout => \inst|iVMCalc|LessThan6~17_cout\);

-- Location: LCCOMB_X31_Y21_N28
\inst|iVMCalc|LessThan6~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan6~19_cout\ = CARRY((\inst|iVMCalc|counter\(9) & ((!\inst|iVMCalc|LessThan6~17_cout\) # (!\inst|iVMCalc|Add2~1_combout\))) # (!\inst|iVMCalc|counter\(9) & (!\inst|iVMCalc|Add2~1_combout\ & !\inst|iVMCalc|LessThan6~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|counter\(9),
	datab => \inst|iVMCalc|Add2~1_combout\,
	datad => VCC,
	cin => \inst|iVMCalc|LessThan6~17_cout\,
	cout => \inst|iVMCalc|LessThan6~19_cout\);

-- Location: LCCOMB_X31_Y21_N30
\inst|iVMCalc|LessThan6~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|LessThan6~20_combout\ = (\inst|iVMCalc|Add2~0_combout\ & ((!\inst|iVMCalc|counter\(10)) # (!\inst|iVMCalc|LessThan6~19_cout\))) # (!\inst|iVMCalc|Add2~0_combout\ & (!\inst|iVMCalc|LessThan6~19_cout\ & !\inst|iVMCalc|counter\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iVMCalc|Add2~0_combout\,
	datad => \inst|iVMCalc|counter\(10),
	cin => \inst|iVMCalc|LessThan6~19_cout\,
	combout => \inst|iVMCalc|LessThan6~20_combout\);

-- Location: LCCOMB_X33_Y23_N10
\inst|iVMCalc|secondImage~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|secondImage~0_combout\ = \inst|iVMCalc|secondImage~regout\ $ (\inst|iVMCalc|LessThan7~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|iVMCalc|secondImage~regout\,
	datad => \inst|iVMCalc|LessThan7~9_combout\,
	combout => \inst|iVMCalc|secondImage~0_combout\);

-- Location: LCFF_X33_Y23_N11
\inst|iVMCalc|secondImage\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst_gen|ALT_INV_VGA_VS~clkctrl_outclk\,
	datain => \inst|iVMCalc|secondImage~0_combout\,
	aclr => \inst4~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iVMCalc|secondImage~regout\);

-- Location: LCCOMB_X33_Y23_N24
\inst|iVMCalc|MuxAddress[0]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|MuxAddress[0]~4_combout\ = (\inst|iVMCalc|LessThan3~20_combout\ & (((\inst|iVMCalc|secondImage~regout\)))) # (!\inst|iVMCalc|LessThan3~20_combout\ & (\inst|iVMCalc|LessThan6~20_combout\ & (\inst|iDL2|Add1~0_combout\ $ 
-- (!\inst|iVMCalc|secondImage~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add1~0_combout\,
	datab => \inst|iVMCalc|LessThan6~20_combout\,
	datac => \inst|iVMCalc|LessThan3~20_combout\,
	datad => \inst|iVMCalc|secondImage~regout\,
	combout => \inst|iVMCalc|MuxAddress[0]~4_combout\);

-- Location: LCCOMB_X33_Y23_N18
\inst|iVMCalc|MuxAddress[0]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|MuxAddress[0]~5_combout\ = (\inst|iVMCalc|counter\(31)) # ((\inst|iVMCalc|LessThan7~5_combout\ & (\inst|iVMCalc|MuxAddress[0]~4_combout\ & !\inst|iVMCalc|counter\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|LessThan7~5_combout\,
	datab => \inst|iVMCalc|counter\(31),
	datac => \inst|iVMCalc|MuxAddress[0]~4_combout\,
	datad => \inst|iVMCalc|counter\(30),
	combout => \inst|iVMCalc|MuxAddress[0]~5_combout\);

-- Location: LCCOMB_X33_Y23_N0
\inst|iVMCalc|MuxAddress[0]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMCalc|MuxAddress[0]~6_combout\ = (\inst|iVMCalc|MuxAddress[0]~10_combout\ & ((\inst|iVMCalc|MuxAddress~3_combout\) # (\inst|iVMCalc|secondImage~regout\ $ (\inst|iVMCalc|MuxAddress[0]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iVMCalc|secondImage~regout\,
	datab => \inst|iVMCalc|MuxAddress~3_combout\,
	datac => \inst|iVMCalc|MuxAddress[0]~10_combout\,
	datad => \inst|iVMCalc|MuxAddress[0]~5_combout\,
	combout => \inst|iVMCalc|MuxAddress[0]~6_combout\);

-- Location: LCFF_X33_Y23_N1
\inst|iPipeLine|MuxAddress[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMCalc|MuxAddress[0]~6_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|MuxAddress\(0));

-- Location: LCCOMB_X31_Y23_N6
\inst|iDL2|VGA_B[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|VGA_B[4]~4_combout\ = (\inst|iDL2|LSPflag~3_combout\ & (!\inst|iDL2|LSPflag~4_combout\ & (\inst|iDL2|Equal2~0_combout\ $ (!\inst|iDL2|LSPflag:romID[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Equal2~0_combout\,
	datab => \inst|iDL2|LSPflag~3_combout\,
	datac => \inst|iDL2|LSPflag:romID[0]~0_combout\,
	datad => \inst|iDL2|LSPflag~4_combout\,
	combout => \inst|iDL2|VGA_B[4]~4_combout\);

-- Location: LCFF_X31_Y23_N7
\inst|iPipeLine|VGA_B2[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iDL2|VGA_B[4]~4_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_B2\(4));

-- Location: LCCOMB_X24_Y32_N28
\inst|iVMux|Mux19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux19~0_combout\ = (\inst|iPipeLine|VGA_B1\(0) & ((\inst|iPipeLine|MuxAddress\(1) $ (!\inst|iPipeLine|VGA_B2\(4))) # (!\inst|iPipeLine|MuxAddress\(0)))) # (!\inst|iPipeLine|VGA_B1\(0) & (\inst|iPipeLine|VGA_B2\(4) & 
-- ((\inst|iPipeLine|MuxAddress\(0)) # (!\inst|iPipeLine|MuxAddress\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|VGA_B1\(0),
	datab => \inst|iPipeLine|MuxAddress\(0),
	datac => \inst|iPipeLine|MuxAddress\(1),
	datad => \inst|iPipeLine|VGA_B2\(4),
	combout => \inst|iVMux|Mux19~0_combout\);

-- Location: LCFF_X24_Y32_N29
\inst2|VGA_B[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux19~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_B\(6));

-- Location: LCCOMB_X30_Y20_N8
\inst|iDL2|Add5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add5~1_cout\ = CARRY((!\inst_gen|xcolumn[0]~_Duplicate_2_regout\ & !\inst|iDL2|Add4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datab => \inst|iDL2|Add4~0_combout\,
	datad => VCC,
	cout => \inst|iDL2|Add5~1_cout\);

-- Location: LCCOMB_X30_Y20_N14
\inst|iDL2|Add5~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add5~6_combout\ = (\inst|iDL2|Add4~6_combout\ & ((\inst|iDL2|Add5~5\) # (GND))) # (!\inst|iDL2|Add4~6_combout\ & (!\inst|iDL2|Add5~5\))
-- \inst|iDL2|Add5~7\ = CARRY((\inst|iDL2|Add4~6_combout\) # (!\inst|iDL2|Add5~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add4~6_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add5~5\,
	combout => \inst|iDL2|Add5~6_combout\,
	cout => \inst|iDL2|Add5~7\);

-- Location: LCCOMB_X30_Y20_N18
\inst|iDL2|Add5~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add5~10_combout\ = (\inst|iDL2|Add4~10_combout\ & ((\inst|iDL2|Add5~9\) # (GND))) # (!\inst|iDL2|Add4~10_combout\ & (!\inst|iDL2|Add5~9\))
-- \inst|iDL2|Add5~11\ = CARRY((\inst|iDL2|Add4~10_combout\) # (!\inst|iDL2|Add5~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add4~10_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add5~9\,
	combout => \inst|iDL2|Add5~10_combout\,
	cout => \inst|iDL2|Add5~11\);

-- Location: LCCOMB_X30_Y20_N22
\inst|iDL2|Add5~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add5~14_combout\ = (\inst|iDL2|Add4~14_combout\ & (!\inst|iDL2|Add5~13\)) # (!\inst|iDL2|Add4~14_combout\ & (\inst|iDL2|Add5~13\ & VCC))
-- \inst|iDL2|Add5~15\ = CARRY((\inst|iDL2|Add4~14_combout\ & !\inst|iDL2|Add5~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL2|Add4~14_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add5~13\,
	combout => \inst|iDL2|Add5~14_combout\,
	cout => \inst|iDL2|Add5~15\);

-- Location: LCCOMB_X30_Y20_N24
\inst|iDL2|Add5~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add5~16_combout\ = (\inst|iDL2|Add4~16_combout\ & (\inst|iDL2|Add5~15\ $ (GND))) # (!\inst|iDL2|Add4~16_combout\ & ((GND) # (!\inst|iDL2|Add5~15\)))
-- \inst|iDL2|Add5~17\ = CARRY((!\inst|iDL2|Add5~15\) # (!\inst|iDL2|Add4~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add4~16_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add5~15\,
	combout => \inst|iDL2|Add5~16_combout\,
	cout => \inst|iDL2|Add5~17\);

-- Location: LCCOMB_X30_Y20_N26
\inst|iDL2|Add5~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add5~18_combout\ = (\inst|iDL2|Add4~18_combout\ & (!\inst|iDL2|Add5~17\)) # (!\inst|iDL2|Add4~18_combout\ & (\inst|iDL2|Add5~17\ & VCC))
-- \inst|iDL2|Add5~19\ = CARRY((\inst|iDL2|Add4~18_combout\ & !\inst|iDL2|Add5~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add4~18_combout\,
	datad => VCC,
	cin => \inst|iDL2|Add5~17\,
	combout => \inst|iDL2|Add5~18_combout\,
	cout => \inst|iDL2|Add5~19\);

-- Location: LCCOMB_X30_Y20_N30
\inst|iDL2|Add5~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|Add5~22_combout\ = \inst|iDL2|Add5~21\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst|iDL2|Add5~21\,
	combout => \inst|iDL2|Add5~22_combout\);

-- Location: LCCOMB_X31_Y20_N6
\inst|iDL2|LessThan15~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan15~2_cout\ = CARRY(\inst|iDL2|LessThan15~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LessThan15~0_combout\,
	datad => VCC,
	cout => \inst|iDL2|LessThan15~2_cout\);

-- Location: LCCOMB_X31_Y20_N8
\inst|iDL2|LessThan15~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan15~4_cout\ = CARRY((\inst|iDL2|Add5~4_combout\ & (\inst_gen|yrow\(0) & !\inst|iDL2|LessThan15~2_cout\)) # (!\inst|iDL2|Add5~4_combout\ & ((\inst_gen|yrow\(0)) # (!\inst|iDL2|LessThan15~2_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add5~4_combout\,
	datab => \inst_gen|yrow\(0),
	datad => VCC,
	cin => \inst|iDL2|LessThan15~2_cout\,
	cout => \inst|iDL2|LessThan15~4_cout\);

-- Location: LCCOMB_X31_Y20_N10
\inst|iDL2|LessThan15~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan15~6_cout\ = CARRY((\inst_gen|yrow\(1) & (\inst|iDL2|Add5~6_combout\ & !\inst|iDL2|LessThan15~4_cout\)) # (!\inst_gen|yrow\(1) & ((\inst|iDL2|Add5~6_combout\) # (!\inst|iDL2|LessThan15~4_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(1),
	datab => \inst|iDL2|Add5~6_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan15~4_cout\,
	cout => \inst|iDL2|LessThan15~6_cout\);

-- Location: LCCOMB_X31_Y20_N12
\inst|iDL2|LessThan15~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan15~8_cout\ = CARRY((\inst|iDL2|Add5~8_combout\ & (\inst_gen|yrow\(2) & !\inst|iDL2|LessThan15~6_cout\)) # (!\inst|iDL2|Add5~8_combout\ & ((\inst_gen|yrow\(2)) # (!\inst|iDL2|LessThan15~6_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add5~8_combout\,
	datab => \inst_gen|yrow\(2),
	datad => VCC,
	cin => \inst|iDL2|LessThan15~6_cout\,
	cout => \inst|iDL2|LessThan15~8_cout\);

-- Location: LCCOMB_X31_Y20_N14
\inst|iDL2|LessThan15~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan15~10_cout\ = CARRY((\inst_gen|yrow\(3) & (\inst|iDL2|Add5~10_combout\ & !\inst|iDL2|LessThan15~8_cout\)) # (!\inst_gen|yrow\(3) & ((\inst|iDL2|Add5~10_combout\) # (!\inst|iDL2|LessThan15~8_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(3),
	datab => \inst|iDL2|Add5~10_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan15~8_cout\,
	cout => \inst|iDL2|LessThan15~10_cout\);

-- Location: LCCOMB_X31_Y20_N16
\inst|iDL2|LessThan15~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan15~12_cout\ = CARRY((\inst|iDL2|Add5~12_combout\ & (\inst_gen|yrow\(4) & !\inst|iDL2|LessThan15~10_cout\)) # (!\inst|iDL2|Add5~12_combout\ & ((\inst_gen|yrow\(4)) # (!\inst|iDL2|LessThan15~10_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add5~12_combout\,
	datab => \inst_gen|yrow\(4),
	datad => VCC,
	cin => \inst|iDL2|LessThan15~10_cout\,
	cout => \inst|iDL2|LessThan15~12_cout\);

-- Location: LCCOMB_X31_Y20_N18
\inst|iDL2|LessThan15~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan15~14_cout\ = CARRY((\inst_gen|yrow\(5) & (\inst|iDL2|Add5~14_combout\ & !\inst|iDL2|LessThan15~12_cout\)) # (!\inst_gen|yrow\(5) & ((\inst|iDL2|Add5~14_combout\) # (!\inst|iDL2|LessThan15~12_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(5),
	datab => \inst|iDL2|Add5~14_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan15~12_cout\,
	cout => \inst|iDL2|LessThan15~14_cout\);

-- Location: LCCOMB_X31_Y20_N20
\inst|iDL2|LessThan15~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan15~16_cout\ = CARRY((\inst_gen|yrow\(6) & ((!\inst|iDL2|LessThan15~14_cout\) # (!\inst|iDL2|Add5~16_combout\))) # (!\inst_gen|yrow\(6) & (!\inst|iDL2|Add5~16_combout\ & !\inst|iDL2|LessThan15~14_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(6),
	datab => \inst|iDL2|Add5~16_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan15~14_cout\,
	cout => \inst|iDL2|LessThan15~16_cout\);

-- Location: LCCOMB_X31_Y20_N22
\inst|iDL2|LessThan15~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan15~18_cout\ = CARRY((\inst_gen|yrow\(7) & (\inst|iDL2|Add5~18_combout\ & !\inst|iDL2|LessThan15~16_cout\)) # (!\inst_gen|yrow\(7) & ((\inst|iDL2|Add5~18_combout\) # (!\inst|iDL2|LessThan15~16_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(7),
	datab => \inst|iDL2|Add5~18_combout\,
	datad => VCC,
	cin => \inst|iDL2|LessThan15~16_cout\,
	cout => \inst|iDL2|LessThan15~18_cout\);

-- Location: LCCOMB_X31_Y20_N24
\inst|iDL2|LessThan15~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan15~20_cout\ = CARRY((\inst|iDL2|Add5~20_combout\ & (\inst_gen|yrow\(8) & !\inst|iDL2|LessThan15~18_cout\)) # (!\inst|iDL2|Add5~20_combout\ & ((\inst_gen|yrow\(8)) # (!\inst|iDL2|LessThan15~18_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add5~20_combout\,
	datab => \inst_gen|yrow\(8),
	datad => VCC,
	cin => \inst|iDL2|LessThan15~18_cout\,
	cout => \inst|iDL2|LessThan15~20_cout\);

-- Location: LCCOMB_X31_Y20_N26
\inst|iDL2|LessThan15~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan15~21_combout\ = (\inst|iDL2|Add5~22_combout\ & (!\inst|iDL2|LessThan15~20_cout\ & !\inst_gen|yrow\(9))) # (!\inst|iDL2|Add5~22_combout\ & ((!\inst_gen|yrow\(9)) # (!\inst|iDL2|LessThan15~20_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|Add5~22_combout\,
	datad => \inst_gen|yrow\(9),
	cin => \inst|iDL2|LessThan15~20_cout\,
	combout => \inst|iDL2|LessThan15~21_combout\);

-- Location: LCCOMB_X31_Y23_N2
\inst|iDL2|VGA_G[6]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|VGA_G[6]~1_combout\ = (\inst|iDL2|Add5~22_combout\ & \inst|iDL2|LessThan15~21_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|iDL2|Add5~22_combout\,
	datad => \inst|iDL2|LessThan15~21_combout\,
	combout => \inst|iDL2|VGA_G[6]~1_combout\);

-- Location: LCCOMB_X31_Y23_N24
\inst|iDL2|VGA_G[6]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|VGA_G[6]~0_combout\ = (\inst|iDL2|LessThan14~22_combout\ & \inst|iDL2|Add3~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|iDL2|LessThan14~22_combout\,
	datad => \inst|iDL2|Add3~22_combout\,
	combout => \inst|iDL2|VGA_G[6]~0_combout\);

-- Location: LCCOMB_X31_Y23_N8
\inst|iDL2|VGA_B[2]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|VGA_B[2]~5_combout\ = (\inst|iDL2|VGA_B[2]~6_combout\ & ((\inst|iDL2|LessThan13~5_combout\) # ((\inst|iDL2|VGA_G[6]~1_combout\ & !\inst|iDL2|VGA_G[6]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LessThan13~5_combout\,
	datab => \inst|iDL2|VGA_G[6]~1_combout\,
	datac => \inst|iDL2|VGA_G[6]~0_combout\,
	datad => \inst|iDL2|VGA_B[2]~6_combout\,
	combout => \inst|iDL2|VGA_B[2]~5_combout\);

-- Location: LCFF_X31_Y23_N9
\inst|iPipeLine|VGA_B2[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iDL2|VGA_B[2]~5_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_B2\(2));

-- Location: LCCOMB_X24_Y32_N16
\inst|iVMux|Mux20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux20~0_combout\ = (\inst|iPipeLine|VGA_B1\(0) & ((\inst|iPipeLine|MuxAddress\(1) $ (!\inst|iPipeLine|VGA_B2\(2))) # (!\inst|iPipeLine|MuxAddress\(0)))) # (!\inst|iPipeLine|VGA_B1\(0) & (\inst|iPipeLine|VGA_B2\(2) & 
-- ((\inst|iPipeLine|MuxAddress\(0)) # (!\inst|iPipeLine|MuxAddress\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|VGA_B1\(0),
	datab => \inst|iPipeLine|MuxAddress\(0),
	datac => \inst|iPipeLine|MuxAddress\(1),
	datad => \inst|iPipeLine|VGA_B2\(2),
	combout => \inst|iVMux|Mux20~0_combout\);

-- Location: LCFF_X24_Y32_N17
\inst2|VGA_B[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux20~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_B\(5));

-- Location: LCCOMB_X32_Y23_N20
\inst|iDL1|LSPflag~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LSPflag~2_combout\ = ((!\inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\ & !\inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\)) # (!\inst|iDL1|LSPflag~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[1]~3_combout\,
	datac => \inst|iDL1|rom_inst|altsyncram_component|auto_generated|mux2|result_node[0]~1_combout\,
	datad => \inst|iDL1|LSPflag~1_combout\,
	combout => \inst|iDL1|LSPflag~2_combout\);

-- Location: LCCOMB_X32_Y23_N16
\inst|iDL1|VGA_B[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|VGA_B[2]~2_combout\ = (\inst|iDL1|LSPflag~2_combout\ & (((\inst|iDL1|LessThan13~5_combout\) # (\inst|iDL1|RGB~0_combout\)))) # (!\inst|iDL1|LSPflag~2_combout\ & (\inst|iDL1|RGB~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|RGB~1_combout\,
	datab => \inst|iDL1|LessThan13~5_combout\,
	datac => \inst|iDL1|LSPflag~2_combout\,
	datad => \inst|iDL1|RGB~0_combout\,
	combout => \inst|iDL1|VGA_B[2]~2_combout\);

-- Location: LCCOMB_X34_Y18_N4
\inst|iDL2|LessThan5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|LessThan5~0_combout\ = (!\inst_gen|xcolumn[8]~_Duplicate_2_regout\ & !\inst_gen|xcolumn[7]~_Duplicate_2_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_gen|xcolumn[8]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[7]~_Duplicate_2_regout\,
	combout => \inst|iDL2|LessThan5~0_combout\);

-- Location: LCCOMB_X33_Y20_N4
\inst|iDL1|Add6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add6~1_cout\ = CARRY((\inst_gen|xcolumn[0]~_Duplicate_2_regout\ & !\inst|iDL1|Add5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datab => \inst|iDL1|Add5~0_combout\,
	datad => VCC,
	cout => \inst|iDL1|Add6~1_cout\);

-- Location: LCCOMB_X33_Y20_N8
\inst|iDL1|Add6~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add6~4_combout\ = (\inst|iDL1|Add5~4_combout\ & (!\inst|iDL1|Add6~3\ & VCC)) # (!\inst|iDL1|Add5~4_combout\ & (\inst|iDL1|Add6~3\ $ (GND)))
-- \inst|iDL1|Add6~5\ = CARRY((!\inst|iDL1|Add5~4_combout\ & !\inst|iDL1|Add6~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add5~4_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add6~3\,
	combout => \inst|iDL1|Add6~4_combout\,
	cout => \inst|iDL1|Add6~5\);

-- Location: LCCOMB_X33_Y20_N10
\inst|iDL1|Add6~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add6~6_combout\ = (\inst|iDL1|Add5~6_combout\ & ((\inst|iDL1|Add6~5\) # (GND))) # (!\inst|iDL1|Add5~6_combout\ & (!\inst|iDL1|Add6~5\))
-- \inst|iDL1|Add6~7\ = CARRY((\inst|iDL1|Add5~6_combout\) # (!\inst|iDL1|Add6~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add5~6_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add6~5\,
	combout => \inst|iDL1|Add6~6_combout\,
	cout => \inst|iDL1|Add6~7\);

-- Location: LCCOMB_X33_Y20_N12
\inst|iDL1|Add6~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add6~8_combout\ = (\inst|iDL1|Add5~8_combout\ & (!\inst|iDL1|Add6~7\ & VCC)) # (!\inst|iDL1|Add5~8_combout\ & (\inst|iDL1|Add6~7\ $ (GND)))
-- \inst|iDL1|Add6~9\ = CARRY((!\inst|iDL1|Add5~8_combout\ & !\inst|iDL1|Add6~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add5~8_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add6~7\,
	combout => \inst|iDL1|Add6~8_combout\,
	cout => \inst|iDL1|Add6~9\);

-- Location: LCCOMB_X33_Y20_N14
\inst|iDL1|Add6~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add6~10_combout\ = (\inst|iDL1|Add5~10_combout\ & ((\inst|iDL1|Add6~9\) # (GND))) # (!\inst|iDL1|Add5~10_combout\ & (!\inst|iDL1|Add6~9\))
-- \inst|iDL1|Add6~11\ = CARRY((\inst|iDL1|Add5~10_combout\) # (!\inst|iDL1|Add6~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add5~10_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add6~9\,
	combout => \inst|iDL1|Add6~10_combout\,
	cout => \inst|iDL1|Add6~11\);

-- Location: LCCOMB_X33_Y20_N18
\inst|iDL1|Add6~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add6~14_combout\ = (\inst|iDL1|Add5~14_combout\ & (!\inst|iDL1|Add6~13\)) # (!\inst|iDL1|Add5~14_combout\ & (\inst|iDL1|Add6~13\ & VCC))
-- \inst|iDL1|Add6~15\ = CARRY((\inst|iDL1|Add5~14_combout\ & !\inst|iDL1|Add6~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add5~14_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add6~13\,
	combout => \inst|iDL1|Add6~14_combout\,
	cout => \inst|iDL1|Add6~15\);

-- Location: LCCOMB_X33_Y20_N20
\inst|iDL1|Add6~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add6~16_combout\ = (\inst|iDL1|Add5~16_combout\ & (\inst|iDL1|Add6~15\ $ (GND))) # (!\inst|iDL1|Add5~16_combout\ & ((GND) # (!\inst|iDL1|Add6~15\)))
-- \inst|iDL1|Add6~17\ = CARRY((!\inst|iDL1|Add6~15\) # (!\inst|iDL1|Add5~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add5~16_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add6~15\,
	combout => \inst|iDL1|Add6~16_combout\,
	cout => \inst|iDL1|Add6~17\);

-- Location: LCCOMB_X33_Y20_N22
\inst|iDL1|Add6~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add6~18_combout\ = (\inst|iDL1|Add5~18_combout\ & (!\inst|iDL1|Add6~17\)) # (!\inst|iDL1|Add5~18_combout\ & (\inst|iDL1|Add6~17\ & VCC))
-- \inst|iDL1|Add6~19\ = CARRY((\inst|iDL1|Add5~18_combout\ & !\inst|iDL1|Add6~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add5~18_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add6~17\,
	combout => \inst|iDL1|Add6~18_combout\,
	cout => \inst|iDL1|Add6~19\);

-- Location: LCCOMB_X33_Y20_N24
\inst|iDL1|Add6~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add6~20_combout\ = (\inst|iDL1|Add5~20_combout\ & (\inst|iDL1|Add6~19\ $ (GND))) # (!\inst|iDL1|Add5~20_combout\ & ((GND) # (!\inst|iDL1|Add6~19\)))
-- \inst|iDL1|Add6~21\ = CARRY((!\inst|iDL1|Add6~19\) # (!\inst|iDL1|Add5~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add5~20_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add6~19\,
	combout => \inst|iDL1|Add6~20_combout\,
	cout => \inst|iDL1|Add6~21\);

-- Location: LCCOMB_X33_Y20_N28
\inst|iDL1|Add6~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add6~24_combout\ = (\inst|iDL1|Add6~23\ & (((\inst|iDL2|LessThan5~0_combout\) # (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\)))) # (!\inst|iDL1|Add6~23\ & ((((\inst|iDL2|LessThan5~0_combout\) # (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\)))))
-- \inst|iDL1|Add6~25\ = CARRY((!\inst|iDL1|Add6~23\ & ((\inst|iDL2|LessThan5~0_combout\) # (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001000001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datab => \inst|iDL2|LessThan5~0_combout\,
	datad => VCC,
	cin => \inst|iDL1|Add6~23\,
	combout => \inst|iDL1|Add6~24_combout\,
	cout => \inst|iDL1|Add6~25\);

-- Location: LCCOMB_X33_Y20_N30
\inst|iDL1|Add6~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|Add6~26_combout\ = \inst|iDL1|Add6~25\ $ (((\inst|iDL2|LessThan5~0_combout\) # (!\inst_gen|xcolumn[9]~_Duplicate_2_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|xcolumn[9]~_Duplicate_2_regout\,
	datad => \inst|iDL2|LessThan5~0_combout\,
	cin => \inst|iDL1|Add6~25\,
	combout => \inst|iDL1|Add6~26_combout\);

-- Location: LCCOMB_X33_Y20_N0
\inst|iDL1|LessThan15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan15~0_combout\ = (\inst|iDL1|Add6~2_combout\) # ((!\inst_gen|xcolumn[1]~_Duplicate_2_regout\) # (!\inst_gen|xcolumn[0]~_Duplicate_2_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add6~2_combout\,
	datac => \inst_gen|xcolumn[0]~_Duplicate_2_regout\,
	datad => \inst_gen|xcolumn[1]~_Duplicate_2_regout\,
	combout => \inst|iDL1|LessThan15~0_combout\);

-- Location: LCCOMB_X32_Y20_N8
\inst|iDL1|LessThan15~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan15~2_cout\ = CARRY(\inst|iDL1|LessThan15~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|LessThan15~0_combout\,
	datad => VCC,
	cout => \inst|iDL1|LessThan15~2_cout\);

-- Location: LCCOMB_X32_Y20_N10
\inst|iDL1|LessThan15~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan15~4_cout\ = CARRY((\inst_gen|yrow\(0) & ((!\inst|iDL1|LessThan15~2_cout\) # (!\inst|iDL1|Add6~4_combout\))) # (!\inst_gen|yrow\(0) & (!\inst|iDL1|Add6~4_combout\ & !\inst|iDL1|LessThan15~2_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(0),
	datab => \inst|iDL1|Add6~4_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan15~2_cout\,
	cout => \inst|iDL1|LessThan15~4_cout\);

-- Location: LCCOMB_X32_Y20_N12
\inst|iDL1|LessThan15~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan15~6_cout\ = CARRY((\inst_gen|yrow\(1) & (\inst|iDL1|Add6~6_combout\ & !\inst|iDL1|LessThan15~4_cout\)) # (!\inst_gen|yrow\(1) & ((\inst|iDL1|Add6~6_combout\) # (!\inst|iDL1|LessThan15~4_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(1),
	datab => \inst|iDL1|Add6~6_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan15~4_cout\,
	cout => \inst|iDL1|LessThan15~6_cout\);

-- Location: LCCOMB_X32_Y20_N14
\inst|iDL1|LessThan15~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan15~8_cout\ = CARRY((\inst_gen|yrow\(2) & ((!\inst|iDL1|LessThan15~6_cout\) # (!\inst|iDL1|Add6~8_combout\))) # (!\inst_gen|yrow\(2) & (!\inst|iDL1|Add6~8_combout\ & !\inst|iDL1|LessThan15~6_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(2),
	datab => \inst|iDL1|Add6~8_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan15~6_cout\,
	cout => \inst|iDL1|LessThan15~8_cout\);

-- Location: LCCOMB_X32_Y20_N16
\inst|iDL1|LessThan15~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan15~10_cout\ = CARRY((\inst_gen|yrow\(3) & (\inst|iDL1|Add6~10_combout\ & !\inst|iDL1|LessThan15~8_cout\)) # (!\inst_gen|yrow\(3) & ((\inst|iDL1|Add6~10_combout\) # (!\inst|iDL1|LessThan15~8_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(3),
	datab => \inst|iDL1|Add6~10_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan15~8_cout\,
	cout => \inst|iDL1|LessThan15~10_cout\);

-- Location: LCCOMB_X32_Y20_N18
\inst|iDL1|LessThan15~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan15~12_cout\ = CARRY((\inst|iDL1|Add6~12_combout\ & (\inst_gen|yrow\(4) & !\inst|iDL1|LessThan15~10_cout\)) # (!\inst|iDL1|Add6~12_combout\ & ((\inst_gen|yrow\(4)) # (!\inst|iDL1|LessThan15~10_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add6~12_combout\,
	datab => \inst_gen|yrow\(4),
	datad => VCC,
	cin => \inst|iDL1|LessThan15~10_cout\,
	cout => \inst|iDL1|LessThan15~12_cout\);

-- Location: LCCOMB_X32_Y20_N20
\inst|iDL1|LessThan15~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan15~14_cout\ = CARRY((\inst_gen|yrow\(5) & (\inst|iDL1|Add6~14_combout\ & !\inst|iDL1|LessThan15~12_cout\)) # (!\inst_gen|yrow\(5) & ((\inst|iDL1|Add6~14_combout\) # (!\inst|iDL1|LessThan15~12_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(5),
	datab => \inst|iDL1|Add6~14_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan15~12_cout\,
	cout => \inst|iDL1|LessThan15~14_cout\);

-- Location: LCCOMB_X32_Y20_N22
\inst|iDL1|LessThan15~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan15~16_cout\ = CARRY((\inst_gen|yrow\(6) & ((!\inst|iDL1|LessThan15~14_cout\) # (!\inst|iDL1|Add6~16_combout\))) # (!\inst_gen|yrow\(6) & (!\inst|iDL1|Add6~16_combout\ & !\inst|iDL1|LessThan15~14_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(6),
	datab => \inst|iDL1|Add6~16_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan15~14_cout\,
	cout => \inst|iDL1|LessThan15~16_cout\);

-- Location: LCCOMB_X32_Y20_N24
\inst|iDL1|LessThan15~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan15~18_cout\ = CARRY((\inst_gen|yrow\(7) & (\inst|iDL1|Add6~18_combout\ & !\inst|iDL1|LessThan15~16_cout\)) # (!\inst_gen|yrow\(7) & ((\inst|iDL1|Add6~18_combout\) # (!\inst|iDL1|LessThan15~16_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(7),
	datab => \inst|iDL1|Add6~18_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan15~16_cout\,
	cout => \inst|iDL1|LessThan15~18_cout\);

-- Location: LCCOMB_X32_Y20_N26
\inst|iDL1|LessThan15~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan15~20_cout\ = CARRY((\inst_gen|yrow\(8) & ((!\inst|iDL1|LessThan15~18_cout\) # (!\inst|iDL1|Add6~20_combout\))) # (!\inst_gen|yrow\(8) & (!\inst|iDL1|Add6~20_combout\ & !\inst|iDL1|LessThan15~18_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_gen|yrow\(8),
	datab => \inst|iDL1|Add6~20_combout\,
	datad => VCC,
	cin => \inst|iDL1|LessThan15~18_cout\,
	cout => \inst|iDL1|LessThan15~20_cout\);

-- Location: LCCOMB_X32_Y20_N28
\inst|iDL1|LessThan15~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan15~21_combout\ = (\inst|iDL1|Add6~22_combout\ & ((!\inst_gen|yrow\(9)) # (!\inst|iDL1|LessThan15~20_cout\))) # (!\inst|iDL1|Add6~22_combout\ & (!\inst|iDL1|LessThan15~20_cout\ & !\inst_gen|yrow\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|Add6~22_combout\,
	datad => \inst_gen|yrow\(9),
	cin => \inst|iDL1|LessThan15~20_cout\,
	combout => \inst|iDL1|LessThan15~21_combout\);

-- Location: LCCOMB_X33_Y20_N2
\inst|iDL1|LessThan15~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|LessThan15~23_combout\ = (!\inst|iDL1|Add6~26_combout\ & ((\inst|iDL1|LessThan15~21_combout\) # (\inst|iDL1|Add6~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|Add6~26_combout\,
	datac => \inst|iDL1|LessThan15~21_combout\,
	datad => \inst|iDL1|Add6~24_combout\,
	combout => \inst|iDL1|LessThan15~23_combout\);

-- Location: LCCOMB_X32_Y23_N28
\inst|iDL1|VGA_B[2]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|VGA_B[2]~3_combout\ = (!\inst|iDL2|LSPflag~4_combout\ & (!\inst|iDL1|VGA_B[2]~2_combout\ & ((!\inst|iDL1|LessThan15~23_combout\) # (!\inst|iDL1|LSPflag~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LSPflag~2_combout\,
	datab => \inst|iDL2|LSPflag~4_combout\,
	datac => \inst|iDL1|VGA_B[2]~2_combout\,
	datad => \inst|iDL1|LessThan15~23_combout\,
	combout => \inst|iDL1|VGA_B[2]~3_combout\);

-- Location: LCFF_X32_Y23_N29
\inst|iPipeLine|VGA_B1[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iDL1|VGA_B[2]~3_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_B1\(2));

-- Location: LCCOMB_X24_Y32_N10
\inst|iVMux|Mux21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux21~0_combout\ = (\inst|iPipeLine|MuxAddress\(0) & (\inst|iPipeLine|VGA_B2\(2) $ (((!\inst|iPipeLine|MuxAddress\(1) & \inst|iPipeLine|VGA_B1\(2)))))) # (!\inst|iPipeLine|MuxAddress\(0) & ((\inst|iPipeLine|VGA_B1\(2)) # 
-- ((\inst|iPipeLine|VGA_B2\(2) & !\inst|iPipeLine|MuxAddress\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011011110001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|VGA_B2\(2),
	datab => \inst|iPipeLine|MuxAddress\(0),
	datac => \inst|iPipeLine|MuxAddress\(1),
	datad => \inst|iPipeLine|VGA_B1\(2),
	combout => \inst|iVMux|Mux21~0_combout\);

-- Location: LCFF_X24_Y32_N11
\inst2|VGA_B[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux21~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_B\(4));

-- Location: LCCOMB_X24_Y32_N2
\inst|iVMux|Mux22~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux22~0_combout\ = (\inst|iPipeLine|VGA_B1\(0) & ((!\inst|iPipeLine|MuxAddress\(1)) # (!\inst|iPipeLine|MuxAddress\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|VGA_B1\(0),
	datab => \inst|iPipeLine|MuxAddress\(0),
	datac => \inst|iPipeLine|MuxAddress\(1),
	combout => \inst|iVMux|Mux22~0_combout\);

-- Location: LCFF_X24_Y32_N3
\inst2|VGA_B[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux22~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_B\(3));

-- Location: LCCOMB_X24_Y32_N12
\inst2|VGA_B[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_B[2]~feeder_combout\ = \inst|iVMux|Mux22~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iVMux|Mux22~0_combout\,
	combout => \inst2|VGA_B[2]~feeder_combout\);

-- Location: LCFF_X24_Y32_N13
\inst2|VGA_B[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_B[2]~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_B\(2));

-- Location: LCCOMB_X24_Y32_N4
\inst2|VGA_B[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_B[1]~feeder_combout\ = \inst|iVMux|Mux22~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iVMux|Mux22~0_combout\,
	combout => \inst2|VGA_B[1]~feeder_combout\);

-- Location: LCFF_X24_Y32_N5
\inst2|VGA_B[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_B[1]~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_B\(1));

-- Location: LCCOMB_X24_Y32_N0
\inst2|VGA_B[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_B[0]~feeder_combout\ = \inst|iVMux|Mux22~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iVMux|Mux22~0_combout\,
	combout => \inst2|VGA_B[0]~feeder_combout\);

-- Location: LCFF_X24_Y32_N1
\inst2|VGA_B[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_B[0]~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_B\(0));

-- Location: LCCOMB_X32_Y23_N30
\inst|iDL1|VGA_G[7]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|VGA_G[7]~1_combout\ = (\inst|iDL1|VGA_G[5]~0_combout\ & ((\inst|iDL1|LessThan13~5_combout\) # ((\inst|iDL1|LessThan15~23_combout\ & !\inst|iDL1|RGB~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LessThan15~23_combout\,
	datab => \inst|iDL1|VGA_G[5]~0_combout\,
	datac => \inst|iDL1|RGB~0_combout\,
	datad => \inst|iDL1|LessThan13~5_combout\,
	combout => \inst|iDL1|VGA_G[7]~1_combout\);

-- Location: LCFF_X32_Y23_N31
\inst|iPipeLine|VGA_G1[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iDL1|VGA_G[7]~1_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_G1\(7));

-- Location: LCCOMB_X24_Y32_N26
\inst|iVMux|Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux8~0_combout\ = (\inst|iPipeLine|VGA_G1\(7) & ((\inst|iPipeLine|VGA_B2\(2) $ (!\inst|iPipeLine|MuxAddress\(1))) # (!\inst|iPipeLine|MuxAddress\(0)))) # (!\inst|iPipeLine|VGA_G1\(7) & (\inst|iPipeLine|VGA_B2\(2) & 
-- ((\inst|iPipeLine|MuxAddress\(0)) # (!\inst|iPipeLine|MuxAddress\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|VGA_B2\(2),
	datab => \inst|iPipeLine|VGA_G1\(7),
	datac => \inst|iPipeLine|MuxAddress\(1),
	datad => \inst|iPipeLine|MuxAddress\(0),
	combout => \inst|iVMux|Mux8~0_combout\);

-- Location: LCFF_X24_Y32_N27
\inst2|VGA_G[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux8~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_G\(9));

-- Location: LCCOMB_X31_Y23_N26
\inst|iDL2|VGA_G[6]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|VGA_G[6]~2_combout\ = (\inst|iDL2|VGA_B[2]~6_combout\ & ((\inst|iDL2|LessThan13~5_combout\) # ((\inst|iDL2|VGA_G[6]~1_combout\) # (\inst|iDL2|VGA_G[6]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LessThan13~5_combout\,
	datab => \inst|iDL2|VGA_G[6]~1_combout\,
	datac => \inst|iDL2|VGA_G[6]~0_combout\,
	datad => \inst|iDL2|VGA_B[2]~6_combout\,
	combout => \inst|iDL2|VGA_G[6]~2_combout\);

-- Location: LCFF_X31_Y23_N27
\inst|iPipeLine|VGA_G2[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iDL2|VGA_G[6]~2_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_G2\(6));

-- Location: LCCOMB_X32_Y23_N8
\inst|iDL1|VGA_G[5]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|VGA_G[5]~2_combout\ = (\inst|iDL1|VGA_G[5]~0_combout\ & ((\inst|iDL1|LessThan15~23_combout\) # ((\inst|iDL1|RGB~0_combout\) # (\inst|iDL1|LessThan13~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL1|LessThan15~23_combout\,
	datab => \inst|iDL1|VGA_G[5]~0_combout\,
	datac => \inst|iDL1|RGB~0_combout\,
	datad => \inst|iDL1|LessThan13~5_combout\,
	combout => \inst|iDL1|VGA_G[5]~2_combout\);

-- Location: LCFF_X32_Y23_N9
\inst|iPipeLine|VGA_G1[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iDL1|VGA_G[5]~2_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_G1\(5));

-- Location: LCCOMB_X31_Y23_N28
\inst|iVMux|Mux9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux9~0_combout\ = (\inst|iPipeLine|MuxAddress\(0) & (\inst|iPipeLine|VGA_G2\(6) $ (((\inst|iPipeLine|VGA_G1\(5) & !\inst|iPipeLine|MuxAddress\(1)))))) # (!\inst|iPipeLine|MuxAddress\(0) & ((\inst|iPipeLine|VGA_G1\(5)) # 
-- ((\inst|iPipeLine|VGA_G2\(6) & !\inst|iPipeLine|MuxAddress\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|MuxAddress\(0),
	datab => \inst|iPipeLine|VGA_G2\(6),
	datac => \inst|iPipeLine|VGA_G1\(5),
	datad => \inst|iPipeLine|MuxAddress\(1),
	combout => \inst|iVMux|Mux9~0_combout\);

-- Location: LCFF_X31_Y23_N29
\inst2|VGA_G[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux9~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_G\(8));

-- Location: LCCOMB_X31_Y23_N22
\inst|iVMux|Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux10~0_combout\ = (\inst|iPipeLine|MuxAddress\(0) & (\inst|iPipeLine|VGA_B2\(2) $ (((\inst|iPipeLine|VGA_G1\(5) & !\inst|iPipeLine|MuxAddress\(1)))))) # (!\inst|iPipeLine|MuxAddress\(0) & ((\inst|iPipeLine|VGA_G1\(5)) # 
-- ((\inst|iPipeLine|VGA_B2\(2) & !\inst|iPipeLine|MuxAddress\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|MuxAddress\(0),
	datab => \inst|iPipeLine|VGA_G1\(5),
	datac => \inst|iPipeLine|VGA_B2\(2),
	datad => \inst|iPipeLine|MuxAddress\(1),
	combout => \inst|iVMux|Mux10~0_combout\);

-- Location: LCFF_X31_Y23_N23
\inst2|VGA_G[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux10~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_G\(7));

-- Location: LCCOMB_X24_Y32_N8
\inst|iVMux|Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux11~0_combout\ = (\inst|iPipeLine|VGA_G1\(0) & ((\inst|iPipeLine|MuxAddress\(1) $ (!\inst|iPipeLine|VGA_B2\(4))) # (!\inst|iPipeLine|MuxAddress\(0)))) # (!\inst|iPipeLine|VGA_G1\(0) & (\inst|iPipeLine|VGA_B2\(4) & 
-- ((\inst|iPipeLine|MuxAddress\(0)) # (!\inst|iPipeLine|MuxAddress\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|VGA_G1\(0),
	datab => \inst|iPipeLine|MuxAddress\(0),
	datac => \inst|iPipeLine|MuxAddress\(1),
	datad => \inst|iPipeLine|VGA_B2\(4),
	combout => \inst|iVMux|Mux11~0_combout\);

-- Location: LCFF_X24_Y32_N9
\inst2|VGA_G[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux11~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_G\(6));

-- Location: LCCOMB_X24_Y32_N6
\inst|iVMux|Mux12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux12~0_combout\ = (\inst|iPipeLine|VGA_G1\(0) & ((!\inst|iPipeLine|MuxAddress\(1)) # (!\inst|iPipeLine|MuxAddress\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|VGA_G1\(0),
	datab => \inst|iPipeLine|MuxAddress\(0),
	datac => \inst|iPipeLine|MuxAddress\(1),
	combout => \inst|iVMux|Mux12~0_combout\);

-- Location: LCCOMB_X21_Y32_N2
\inst2|VGA_G[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_G[5]~feeder_combout\ = \inst|iVMux|Mux12~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iVMux|Mux12~0_combout\,
	combout => \inst2|VGA_G[5]~feeder_combout\);

-- Location: LCFF_X21_Y32_N3
\inst2|VGA_G[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_G[5]~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_G\(5));

-- Location: LCCOMB_X24_Y32_N18
\inst|iVMux|Mux13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux13~0_combout\ = (\inst|iPipeLine|VGA_G1\(0) & ((\inst|iPipeLine|MuxAddress\(1) $ (!\inst|iPipeLine|VGA_B2\(2))) # (!\inst|iPipeLine|MuxAddress\(0)))) # (!\inst|iPipeLine|VGA_G1\(0) & (\inst|iPipeLine|VGA_B2\(2) & 
-- ((\inst|iPipeLine|MuxAddress\(0)) # (!\inst|iPipeLine|MuxAddress\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|VGA_G1\(0),
	datab => \inst|iPipeLine|MuxAddress\(0),
	datac => \inst|iPipeLine|MuxAddress\(1),
	datad => \inst|iPipeLine|VGA_B2\(2),
	combout => \inst|iVMux|Mux13~0_combout\);

-- Location: LCFF_X24_Y32_N19
\inst2|VGA_G[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux13~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_G\(4));

-- Location: LCCOMB_X24_Y32_N30
\inst2|VGA_G[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_G[3]~feeder_combout\ = \inst|iVMux|Mux13~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iVMux|Mux13~0_combout\,
	combout => \inst2|VGA_G[3]~feeder_combout\);

-- Location: LCFF_X24_Y32_N31
\inst2|VGA_G[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_G[3]~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_G\(3));

-- Location: LCCOMB_X21_Y32_N12
\inst2|VGA_G[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_G[2]~feeder_combout\ = \inst|iVMux|Mux12~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iVMux|Mux12~0_combout\,
	combout => \inst2|VGA_G[2]~feeder_combout\);

-- Location: LCFF_X21_Y32_N13
\inst2|VGA_G[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_G[2]~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_G\(2));

-- Location: LCCOMB_X21_Y32_N6
\inst2|VGA_G[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_G[1]~feeder_combout\ = \inst|iVMux|Mux12~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iVMux|Mux12~0_combout\,
	combout => \inst2|VGA_G[1]~feeder_combout\);

-- Location: LCFF_X21_Y32_N7
\inst2|VGA_G[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_G[1]~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_G\(1));

-- Location: LCFF_X24_Y32_N7
\inst2|VGA_G[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux12~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_G\(0));

-- Location: LCCOMB_X31_Y23_N20
\inst|iDL2|VGA_R[7]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|VGA_R[7]~0_combout\ = (\inst|iDL2|VGA_B[2]~6_combout\ & ((\inst|iDL2|LessThan13~5_combout\) # ((\inst|iDL2|VGA_G[6]~1_combout\ & !\inst|iDL2|VGA_G[6]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|LessThan13~5_combout\,
	datab => \inst|iDL2|VGA_G[6]~1_combout\,
	datac => \inst|iDL2|VGA_G[6]~0_combout\,
	datad => \inst|iDL2|VGA_B[2]~6_combout\,
	combout => \inst|iDL2|VGA_R[7]~0_combout\);

-- Location: LCCOMB_X31_Y23_N12
\inst|iDL2|VGA_R[7]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|VGA_R[7]~1_combout\ = (\inst|iDL2|VGA_R[7]~0_combout\) # ((\inst|iDL2|RGB~0_combout\ & (\inst|iDL2|LSPflag~3_combout\ & !\inst|iDL2|LSPflag~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|RGB~0_combout\,
	datab => \inst|iDL2|LSPflag~3_combout\,
	datac => \inst|iDL2|VGA_R[7]~0_combout\,
	datad => \inst|iDL2|LSPflag~4_combout\,
	combout => \inst|iDL2|VGA_R[7]~1_combout\);

-- Location: LCFF_X31_Y23_N13
\inst|iPipeLine|VGA_R2[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iDL2|VGA_R[7]~1_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_R2\(7));

-- Location: LCCOMB_X31_Y23_N0
\inst|iVMux|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux0~0_combout\ = (\inst|iPipeLine|VGA_R1\(6) & ((\inst|iPipeLine|MuxAddress\(1) $ (!\inst|iPipeLine|VGA_R2\(7))) # (!\inst|iPipeLine|MuxAddress\(0)))) # (!\inst|iPipeLine|VGA_R1\(6) & (\inst|iPipeLine|VGA_R2\(7) & 
-- ((\inst|iPipeLine|MuxAddress\(0)) # (!\inst|iPipeLine|MuxAddress\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|VGA_R1\(6),
	datab => \inst|iPipeLine|MuxAddress\(1),
	datac => \inst|iPipeLine|VGA_R2\(7),
	datad => \inst|iPipeLine|MuxAddress\(0),
	combout => \inst|iVMux|Mux0~0_combout\);

-- Location: LCFF_X31_Y23_N1
\inst2|VGA_R[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux0~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_R\(9));

-- Location: LCCOMB_X31_Y23_N18
\inst|iVMux|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux1~0_combout\ = (\inst|iPipeLine|VGA_R1\(6) & ((\inst|iPipeLine|MuxAddress\(1) $ (!\inst|iPipeLine|VGA_B2\(2))) # (!\inst|iPipeLine|MuxAddress\(0)))) # (!\inst|iPipeLine|VGA_R1\(6) & (\inst|iPipeLine|VGA_B2\(2) & 
-- ((\inst|iPipeLine|MuxAddress\(0)) # (!\inst|iPipeLine|MuxAddress\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|VGA_R1\(6),
	datab => \inst|iPipeLine|MuxAddress\(1),
	datac => \inst|iPipeLine|VGA_B2\(2),
	datad => \inst|iPipeLine|MuxAddress\(0),
	combout => \inst|iVMux|Mux1~0_combout\);

-- Location: LCFF_X31_Y23_N19
\inst2|VGA_R[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux1~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_R\(8));

-- Location: LCCOMB_X24_Y32_N14
\inst2|VGA_R[7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_R[7]~feeder_combout\ = \inst|iVMux|Mux8~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iVMux|Mux8~0_combout\,
	combout => \inst2|VGA_R[7]~feeder_combout\);

-- Location: LCFF_X24_Y32_N15
\inst2|VGA_R[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_R[7]~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_R\(7));

-- Location: LCCOMB_X31_Y23_N14
\inst|iDL2|VGA_R[4]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL2|VGA_R[4]~2_combout\ = (\inst|iDL2|VGA_R[7]~0_combout\) # ((!\inst|iDL2|RGB~0_combout\ & (\inst|iDL2|LSPflag~3_combout\ & !\inst|iDL2|LSPflag~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iDL2|RGB~0_combout\,
	datab => \inst|iDL2|LSPflag~3_combout\,
	datac => \inst|iDL2|VGA_R[7]~0_combout\,
	datad => \inst|iDL2|LSPflag~4_combout\,
	combout => \inst|iDL2|VGA_R[4]~2_combout\);

-- Location: LCFF_X31_Y23_N15
\inst|iPipeLine|VGA_R2[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iDL2|VGA_R[4]~2_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_R2\(4));

-- Location: LCCOMB_X24_Y32_N20
\inst|iVMux|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux3~0_combout\ = (\inst|iPipeLine|VGA_G1\(0) & ((\inst|iPipeLine|VGA_R2\(4) $ (!\inst|iPipeLine|MuxAddress\(1))) # (!\inst|iPipeLine|MuxAddress\(0)))) # (!\inst|iPipeLine|VGA_G1\(0) & (\inst|iPipeLine|VGA_R2\(4) & 
-- ((\inst|iPipeLine|MuxAddress\(0)) # (!\inst|iPipeLine|MuxAddress\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|iPipeLine|VGA_G1\(0),
	datab => \inst|iPipeLine|VGA_R2\(4),
	datac => \inst|iPipeLine|MuxAddress\(1),
	datad => \inst|iPipeLine|MuxAddress\(0),
	combout => \inst|iVMux|Mux3~0_combout\);

-- Location: LCFF_X24_Y32_N21
\inst2|VGA_R[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux3~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_R\(6));

-- Location: LCCOMB_X21_Y32_N0
\inst2|VGA_R[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_R[5]~feeder_combout\ = \inst|iVMux|Mux12~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iVMux|Mux12~0_combout\,
	combout => \inst2|VGA_R[5]~feeder_combout\);

-- Location: LCFF_X21_Y32_N1
\inst2|VGA_R[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_R[5]~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_R\(5));

-- Location: LCCOMB_X32_Y23_N22
\inst|iDL1|VGA_R[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iDL1|VGA_R[2]~1_combout\ = (\inst|iDL1|VGA_G[7]~1_combout\) # ((!\inst|iDL1|LSPflag~2_combout\ & !\inst|iDL2|LSPflag~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iDL1|VGA_G[7]~1_combout\,
	datac => \inst|iDL1|LSPflag~2_combout\,
	datad => \inst|iDL2|LSPflag~4_combout\,
	combout => \inst|iDL1|VGA_R[2]~1_combout\);

-- Location: LCFF_X32_Y23_N23
\inst|iPipeLine|VGA_R1[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iDL1|VGA_R[2]~1_combout\,
	ena => \inst_gen|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|iPipeLine|VGA_R1\(2));

-- Location: LCCOMB_X24_Y32_N22
\inst|iVMux|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|iVMux|Mux5~0_combout\ = (\inst|iPipeLine|VGA_R1\(2) & ((!\inst|iPipeLine|MuxAddress\(0)) # (!\inst|iPipeLine|MuxAddress\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|iPipeLine|VGA_R1\(2),
	datac => \inst|iPipeLine|MuxAddress\(1),
	datad => \inst|iPipeLine|MuxAddress\(0),
	combout => \inst|iVMux|Mux5~0_combout\);

-- Location: LCFF_X24_Y32_N23
\inst2|VGA_R[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst|iVMux|Mux5~0_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_R\(4));

-- Location: LCCOMB_X21_Y32_N10
\inst2|VGA_R[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_R[3]~feeder_combout\ = \inst|iVMux|Mux12~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iVMux|Mux12~0_combout\,
	combout => \inst2|VGA_R[3]~feeder_combout\);

-- Location: LCFF_X21_Y32_N11
\inst2|VGA_R[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_R[3]~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_R\(3));

-- Location: LCCOMB_X21_Y32_N4
\inst2|VGA_R[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_R[2]~feeder_combout\ = \inst|iVMux|Mux12~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iVMux|Mux12~0_combout\,
	combout => \inst2|VGA_R[2]~feeder_combout\);

-- Location: LCFF_X21_Y32_N5
\inst2|VGA_R[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_R[2]~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_R\(2));

-- Location: LCCOMB_X21_Y32_N22
\inst2|VGA_R[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_R[1]~feeder_combout\ = \inst|iVMux|Mux12~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iVMux|Mux12~0_combout\,
	combout => \inst2|VGA_R[1]~feeder_combout\);

-- Location: LCFF_X21_Y32_N23
\inst2|VGA_R[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_R[1]~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_R\(1));

-- Location: LCCOMB_X21_Y32_N8
\inst2|VGA_R[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|VGA_R[0]~feeder_combout\ = \inst|iVMux|Mux12~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|iVMux|Mux12~0_combout\,
	combout => \inst2|VGA_R[0]~feeder_combout\);

-- Location: LCFF_X21_Y32_N9
\inst2|VGA_R[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \inst2|VGA_R[0]~feeder_combout\,
	ena => \inst|iPipeLine|VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|VGA_R\(0));

-- Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_CLK~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|ALT_INV_VGA_CLK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_CLK);

-- Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_BLANK~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|ALT_INV_VGA_BLANK~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_BLANK);

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_HS~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|ALT_INV_VGA_HS~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_HS);

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_VS~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|ALT_INV_VGA_VS~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_VS);

-- Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_SYNC~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|ALT_INV_VGA_SYNC~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_SYNC);

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_B[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_B\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_B(9));

-- Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_B[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_B\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_B(8));

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_B[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_B(7));

-- Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_B[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_B\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_B(6));

-- Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_B[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_B\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_B(5));

-- Location: PIN_J10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_B[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_B\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_B(4));

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_B[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_B\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_B(3));

-- Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_B[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_B\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_B(2));

-- Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_B[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_B\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_B(1));

-- Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_B[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_B\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_B(0));

-- Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_G[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_G\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_G(9));

-- Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_G[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_G\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_G(8));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_G[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_G\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_G(7));

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_G[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_G\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_G(6));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_G[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_G\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_G(5));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_G[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_G\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_G(4));

-- Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_G[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_G\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_G(3));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_G[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_G\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_G(2));

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_G[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_G\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_G(1));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_G[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_G\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_G(0));

-- Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_R[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_R\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_R(9));

-- Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_R[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_R\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_R(8));

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_R[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_R\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_R(7));

-- Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_R[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_R\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_R(6));

-- Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_R[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_R\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_R(5));

-- Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_R[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_R\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_R(4));

-- Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_R[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_R\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_R(3));

-- Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_R[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_R\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_R(2));

-- Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_R[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_R\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_R(1));

-- Location: PIN_C8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\VGA_R[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|VGA_R\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_R(0));
END structure;


