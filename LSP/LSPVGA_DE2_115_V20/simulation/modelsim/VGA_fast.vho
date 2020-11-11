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

-- DATE "09/02/2019 15:03:16"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	VGAgenerator IS
    PORT (
	ACLRN : IN std_logic;
	CLOCK_50 : IN std_logic;
	yrow : OUT IEEE.NUMERIC_STD.unsigned(9 DOWNTO 0);
	xcolumn : OUT IEEE.NUMERIC_STD.unsigned(9 DOWNTO 0);
	VGA_CLK : OUT std_logic;
	VGA_BLANK : OUT std_logic;
	VGA_HS : OUT std_logic;
	VGA_VS : OUT std_logic;
	VGA_SYNC : OUT std_logic
	);
END VGAgenerator;

-- Design Ports Information
-- yrow[0]	=>  Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- yrow[1]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- yrow[2]	=>  Location: PIN_AD10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- yrow[3]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- yrow[4]	=>  Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- yrow[5]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- yrow[6]	=>  Location: PIN_P4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- yrow[7]	=>  Location: PIN_AF9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- yrow[8]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- yrow[9]	=>  Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- xcolumn[0]	=>  Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- xcolumn[1]	=>  Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- xcolumn[2]	=>  Location: PIN_AC10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- xcolumn[3]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- xcolumn[4]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- xcolumn[5]	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- xcolumn[6]	=>  Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- xcolumn[7]	=>  Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- xcolumn[8]	=>  Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- xcolumn[9]	=>  Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_CLK	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_BLANK	=>  Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_HS	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_VS	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- VGA_SYNC	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- CLOCK_50	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ACLRN	=>  Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF VGAgenerator IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_ACLRN : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_yrow : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_xcolumn : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_VGA_CLK : std_logic;
SIGNAL ww_VGA_BLANK : std_logic;
SIGNAL ww_VGA_HS : std_logic;
SIGNAL ww_VGA_VS : std_logic;
SIGNAL ww_VGA_SYNC : std_logic;
SIGNAL \ACLRN~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK_50~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \process_0~2_combout\ : std_logic;
SIGNAL \LessThan6~0_combout\ : std_logic;
SIGNAL \LessThan6~1_combout\ : std_logic;
SIGNAL \CLOCK_50~combout\ : std_logic;
SIGNAL \CLOCK_50~clkctrl_outclk\ : std_logic;
SIGNAL \ycounter[0]~12\ : std_logic;
SIGNAL \ycounter[1]~13_combout\ : std_logic;
SIGNAL \ycounter[1]~14\ : std_logic;
SIGNAL \ycounter[2]~16_combout\ : std_logic;
SIGNAL \ACLRN~combout\ : std_logic;
SIGNAL \xc[0]~11\ : std_logic;
SIGNAL \xc[1]~12_combout\ : std_logic;
SIGNAL \ACLRN~clkctrl_outclk\ : std_logic;
SIGNAL \xc[1]~13\ : std_logic;
SIGNAL \xc[2]~15\ : std_logic;
SIGNAL \xc[3]~16_combout\ : std_logic;
SIGNAL \xc[3]~17\ : std_logic;
SIGNAL \xc[4]~19\ : std_logic;
SIGNAL \xc[5]~20_combout\ : std_logic;
SIGNAL \xc[5]~21\ : std_logic;
SIGNAL \xc[6]~23\ : std_logic;
SIGNAL \xc[7]~24_combout\ : std_logic;
SIGNAL \xc[7]~25\ : std_logic;
SIGNAL \xc[8]~26_combout\ : std_logic;
SIGNAL \xc[8]~27\ : std_logic;
SIGNAL \xc[9]~28_combout\ : std_logic;
SIGNAL \xc[6]~22_combout\ : std_logic;
SIGNAL \LessThan6~2_combout\ : std_logic;
SIGNAL \ycounter[10]~15_combout\ : std_logic;
SIGNAL \ycounter[2]~17\ : std_logic;
SIGNAL \ycounter[3]~19\ : std_logic;
SIGNAL \ycounter[4]~20_combout\ : std_logic;
SIGNAL \ycounter[4]~21\ : std_logic;
SIGNAL \ycounter[5]~22_combout\ : std_logic;
SIGNAL \ycounter[5]~23\ : std_logic;
SIGNAL \ycounter[6]~24_combout\ : std_logic;
SIGNAL \ycounter[6]~25\ : std_logic;
SIGNAL \ycounter[7]~27\ : std_logic;
SIGNAL \ycounter[8]~28_combout\ : std_logic;
SIGNAL \ycounter[7]~26_combout\ : std_logic;
SIGNAL \LessThan7~2_combout\ : std_logic;
SIGNAL \ycounter[0]~11_combout\ : std_logic;
SIGNAL \LessThan7~0_combout\ : std_logic;
SIGNAL \ycounter[3]~18_combout\ : std_logic;
SIGNAL \LessThan7~1_combout\ : std_logic;
SIGNAL \ycounter[8]~29\ : std_logic;
SIGNAL \ycounter[9]~31\ : std_logic;
SIGNAL \ycounter[10]~32_combout\ : std_logic;
SIGNAL \LessThan7~3_combout\ : std_logic;
SIGNAL \yrow[0]~reg0_regout\ : std_logic;
SIGNAL \yrow[1]~reg0_regout\ : std_logic;
SIGNAL \yrow[2]~reg0_regout\ : std_logic;
SIGNAL \yrow[3]~reg0feeder_combout\ : std_logic;
SIGNAL \yrow[3]~reg0_regout\ : std_logic;
SIGNAL \yrow[4]~reg0_regout\ : std_logic;
SIGNAL \yrow[5]~reg0_regout\ : std_logic;
SIGNAL \yrow[6]~reg0feeder_combout\ : std_logic;
SIGNAL \yrow[6]~reg0_regout\ : std_logic;
SIGNAL \yrow[7]~reg0_regout\ : std_logic;
SIGNAL \ycounter[9]~30_combout\ : std_logic;
SIGNAL \yrow[8]~reg0feeder_combout\ : std_logic;
SIGNAL \yrow[8]~reg0_regout\ : std_logic;
SIGNAL \yrow[9]~reg0_regout\ : std_logic;
SIGNAL \xc[0]~10_combout\ : std_logic;
SIGNAL \xcolumn[0]~reg0_regout\ : std_logic;
SIGNAL \xcolumn[1]~reg0feeder_combout\ : std_logic;
SIGNAL \xcolumn[1]~reg0_regout\ : std_logic;
SIGNAL \xc[2]~14_combout\ : std_logic;
SIGNAL \xcolumn[2]~reg0feeder_combout\ : std_logic;
SIGNAL \xcolumn[2]~reg0_regout\ : std_logic;
SIGNAL \xcolumn[3]~reg0feeder_combout\ : std_logic;
SIGNAL \xcolumn[3]~reg0_regout\ : std_logic;
SIGNAL \xc[4]~18_combout\ : std_logic;
SIGNAL \xcolumn[4]~reg0feeder_combout\ : std_logic;
SIGNAL \xcolumn[4]~reg0_regout\ : std_logic;
SIGNAL \xcolumn[5]~reg0_regout\ : std_logic;
SIGNAL \xcolumn[6]~reg0feeder_combout\ : std_logic;
SIGNAL \xcolumn[6]~reg0_regout\ : std_logic;
SIGNAL \xcolumn[7]~reg0_regout\ : std_logic;
SIGNAL \xcolumn[8]~reg0feeder_combout\ : std_logic;
SIGNAL \xcolumn[8]~reg0_regout\ : std_logic;
SIGNAL \xcolumn[9]~reg0_regout\ : std_logic;
SIGNAL \inst~combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \process_0~1_combout\ : std_logic;
SIGNAL \VGA_BLANK~reg0_regout\ : std_logic;
SIGNAL \process_0~3_combout\ : std_logic;
SIGNAL \VGA_HS~reg0_regout\ : std_logic;
SIGNAL \process_0~4_combout\ : std_logic;
SIGNAL \process_0~5_combout\ : std_logic;
SIGNAL \VGA_VS~reg0_regout\ : std_logic;
SIGNAL \LessThan5~0_combout\ : std_logic;
SIGNAL \VGA_SYNC~0_combout\ : std_logic;
SIGNAL \VGA_SYNC~reg0_regout\ : std_logic;
SIGNAL ycounter_s : std_logic_vector(10 DOWNTO 0);
SIGNAL ycounter : std_logic_vector(10 DOWNTO 0);
SIGNAL xc : std_logic_vector(9 DOWNTO 0);
SIGNAL \ALT_INV_ACLRN~clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_VGA_SYNC~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_VGA_VS~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_VGA_HS~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_VGA_BLANK~reg0_regout\ : std_logic;

BEGIN

ww_ACLRN <= ACLRN;
ww_CLOCK_50 <= CLOCK_50;
yrow <= IEEE.NUMERIC_STD.UNSIGNED(ww_yrow);
xcolumn <= IEEE.NUMERIC_STD.UNSIGNED(ww_xcolumn);
VGA_CLK <= ww_VGA_CLK;
VGA_BLANK <= ww_VGA_BLANK;
VGA_HS <= ww_VGA_HS;
VGA_VS <= ww_VGA_VS;
VGA_SYNC <= ww_VGA_SYNC;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\ACLRN~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \ACLRN~combout\);

\CLOCK_50~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLOCK_50~combout\);
\ALT_INV_ACLRN~clkctrl_outclk\ <= NOT \ACLRN~clkctrl_outclk\;
\ALT_INV_VGA_SYNC~reg0_regout\ <= NOT \VGA_SYNC~reg0_regout\;
\ALT_INV_VGA_VS~reg0_regout\ <= NOT \VGA_VS~reg0_regout\;
\ALT_INV_VGA_HS~reg0_regout\ <= NOT \VGA_HS~reg0_regout\;
\ALT_INV_VGA_BLANK~reg0_regout\ <= NOT \VGA_BLANK~reg0_regout\;

-- Location: LCCOMB_X23_Y27_N4
\process_0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~2_combout\ = (xc(4) & (xc(6) & xc(5))) # (!xc(4) & (!xc(6) & !xc(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => xc(4),
	datac => xc(6),
	datad => xc(5),
	combout => \process_0~2_combout\);

-- Location: LCCOMB_X23_Y27_N6
\LessThan6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan6~0_combout\ = (((!xc(0)) # (!xc(1))) # (!xc(3))) # (!xc(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => xc(2),
	datab => xc(3),
	datac => xc(1),
	datad => xc(0),
	combout => \LessThan6~0_combout\);

-- Location: LCCOMB_X23_Y27_N8
\LessThan6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan6~1_combout\ = (xc(7)) # ((xc(5)) # ((!\LessThan6~0_combout\ & xc(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan6~0_combout\,
	datab => xc(7),
	datac => xc(4),
	datad => xc(5),
	combout => \LessThan6~1_combout\);

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

-- Location: LCCOMB_X23_Y20_N10
\ycounter[0]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \ycounter[0]~11_combout\ = ycounter(0) $ (VCC)
-- \ycounter[0]~12\ = CARRY(ycounter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ycounter(0),
	datad => VCC,
	combout => \ycounter[0]~11_combout\,
	cout => \ycounter[0]~12\);

-- Location: LCCOMB_X23_Y20_N12
\ycounter[1]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \ycounter[1]~13_combout\ = (ycounter(1) & (!\ycounter[0]~12\)) # (!ycounter(1) & ((\ycounter[0]~12\) # (GND)))
-- \ycounter[1]~14\ = CARRY((!\ycounter[0]~12\) # (!ycounter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ycounter(1),
	datad => VCC,
	cin => \ycounter[0]~12\,
	combout => \ycounter[1]~13_combout\,
	cout => \ycounter[1]~14\);

-- Location: LCCOMB_X23_Y20_N14
\ycounter[2]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \ycounter[2]~16_combout\ = (ycounter(2) & (\ycounter[1]~14\ $ (GND))) # (!ycounter(2) & (!\ycounter[1]~14\ & VCC))
-- \ycounter[2]~17\ = CARRY((ycounter(2) & !\ycounter[1]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ycounter(2),
	datad => VCC,
	cin => \ycounter[1]~14\,
	combout => \ycounter[2]~16_combout\,
	cout => \ycounter[2]~17\);

-- Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ACLRN~I\ : cycloneii_io
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
	padio => ww_ACLRN,
	combout => \ACLRN~combout\);

-- Location: LCCOMB_X23_Y27_N12
\xc[0]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \xc[0]~10_combout\ = xc(0) $ (VCC)
-- \xc[0]~11\ = CARRY(xc(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => xc(0),
	datad => VCC,
	combout => \xc[0]~10_combout\,
	cout => \xc[0]~11\);

-- Location: LCCOMB_X23_Y27_N14
\xc[1]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \xc[1]~12_combout\ = (xc(1) & (!\xc[0]~11\)) # (!xc(1) & ((\xc[0]~11\) # (GND)))
-- \xc[1]~13\ = CARRY((!\xc[0]~11\) # (!xc(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => xc(1),
	datad => VCC,
	cin => \xc[0]~11\,
	combout => \xc[1]~12_combout\,
	cout => \xc[1]~13\);

-- Location: CLKCTRL_G1
\ACLRN~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \ACLRN~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \ACLRN~clkctrl_outclk\);

-- Location: LCFF_X23_Y27_N15
\xc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xc[1]~12_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sclr => \LessThan6~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => xc(1));

-- Location: LCCOMB_X23_Y27_N16
\xc[2]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \xc[2]~14_combout\ = (xc(2) & (\xc[1]~13\ $ (GND))) # (!xc(2) & (!\xc[1]~13\ & VCC))
-- \xc[2]~15\ = CARRY((xc(2) & !\xc[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => xc(2),
	datad => VCC,
	cin => \xc[1]~13\,
	combout => \xc[2]~14_combout\,
	cout => \xc[2]~15\);

-- Location: LCCOMB_X23_Y27_N18
\xc[3]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \xc[3]~16_combout\ = (xc(3) & (!\xc[2]~15\)) # (!xc(3) & ((\xc[2]~15\) # (GND)))
-- \xc[3]~17\ = CARRY((!\xc[2]~15\) # (!xc(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => xc(3),
	datad => VCC,
	cin => \xc[2]~15\,
	combout => \xc[3]~16_combout\,
	cout => \xc[3]~17\);

-- Location: LCFF_X23_Y27_N19
\xc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xc[3]~16_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sclr => \LessThan6~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => xc(3));

-- Location: LCCOMB_X23_Y27_N20
\xc[4]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \xc[4]~18_combout\ = (xc(4) & (\xc[3]~17\ $ (GND))) # (!xc(4) & (!\xc[3]~17\ & VCC))
-- \xc[4]~19\ = CARRY((xc(4) & !\xc[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => xc(4),
	datad => VCC,
	cin => \xc[3]~17\,
	combout => \xc[4]~18_combout\,
	cout => \xc[4]~19\);

-- Location: LCCOMB_X23_Y27_N22
\xc[5]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \xc[5]~20_combout\ = (xc(5) & (!\xc[4]~19\)) # (!xc(5) & ((\xc[4]~19\) # (GND)))
-- \xc[5]~21\ = CARRY((!\xc[4]~19\) # (!xc(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => xc(5),
	datad => VCC,
	cin => \xc[4]~19\,
	combout => \xc[5]~20_combout\,
	cout => \xc[5]~21\);

-- Location: LCFF_X23_Y27_N23
\xc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xc[5]~20_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sclr => \LessThan6~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => xc(5));

-- Location: LCCOMB_X23_Y27_N24
\xc[6]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \xc[6]~22_combout\ = (xc(6) & (\xc[5]~21\ $ (GND))) # (!xc(6) & (!\xc[5]~21\ & VCC))
-- \xc[6]~23\ = CARRY((xc(6) & !\xc[5]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => xc(6),
	datad => VCC,
	cin => \xc[5]~21\,
	combout => \xc[6]~22_combout\,
	cout => \xc[6]~23\);

-- Location: LCCOMB_X23_Y27_N26
\xc[7]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \xc[7]~24_combout\ = (xc(7) & (!\xc[6]~23\)) # (!xc(7) & ((\xc[6]~23\) # (GND)))
-- \xc[7]~25\ = CARRY((!\xc[6]~23\) # (!xc(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => xc(7),
	datad => VCC,
	cin => \xc[6]~23\,
	combout => \xc[7]~24_combout\,
	cout => \xc[7]~25\);

-- Location: LCFF_X23_Y27_N27
\xc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xc[7]~24_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sclr => \LessThan6~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => xc(7));

-- Location: LCCOMB_X23_Y27_N28
\xc[8]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \xc[8]~26_combout\ = (xc(8) & (\xc[7]~25\ $ (GND))) # (!xc(8) & (!\xc[7]~25\ & VCC))
-- \xc[8]~27\ = CARRY((xc(8) & !\xc[7]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => xc(8),
	datad => VCC,
	cin => \xc[7]~25\,
	combout => \xc[8]~26_combout\,
	cout => \xc[8]~27\);

-- Location: LCFF_X23_Y27_N29
\xc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xc[8]~26_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sclr => \LessThan6~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => xc(8));

-- Location: LCCOMB_X23_Y27_N30
\xc[9]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \xc[9]~28_combout\ = \xc[8]~27\ $ (xc(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => xc(9),
	cin => \xc[8]~27\,
	combout => \xc[9]~28_combout\);

-- Location: LCFF_X23_Y27_N31
\xc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xc[9]~28_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sclr => \LessThan6~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => xc(9));

-- Location: LCFF_X23_Y27_N25
\xc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xc[6]~22_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sclr => \LessThan6~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => xc(6));

-- Location: LCCOMB_X23_Y27_N10
\LessThan6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan6~2_combout\ = (xc(9) & (xc(8) & ((\LessThan6~1_combout\) # (xc(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan6~1_combout\,
	datab => xc(9),
	datac => xc(6),
	datad => xc(8),
	combout => \LessThan6~2_combout\);

-- Location: LCCOMB_X23_Y20_N0
\ycounter[10]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \ycounter[10]~15_combout\ = (\ACLRN~combout\ & \LessThan6~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ACLRN~combout\,
	datac => \LessThan6~2_combout\,
	combout => \ycounter[10]~15_combout\);

-- Location: LCFF_X23_Y20_N15
\ycounter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \ycounter[2]~16_combout\,
	sclr => \LessThan7~3_combout\,
	ena => \ycounter[10]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => ycounter(2));

-- Location: LCCOMB_X23_Y20_N16
\ycounter[3]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \ycounter[3]~18_combout\ = (ycounter(3) & (!\ycounter[2]~17\)) # (!ycounter(3) & ((\ycounter[2]~17\) # (GND)))
-- \ycounter[3]~19\ = CARRY((!\ycounter[2]~17\) # (!ycounter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ycounter(3),
	datad => VCC,
	cin => \ycounter[2]~17\,
	combout => \ycounter[3]~18_combout\,
	cout => \ycounter[3]~19\);

-- Location: LCCOMB_X23_Y20_N18
\ycounter[4]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \ycounter[4]~20_combout\ = (ycounter(4) & (\ycounter[3]~19\ $ (GND))) # (!ycounter(4) & (!\ycounter[3]~19\ & VCC))
-- \ycounter[4]~21\ = CARRY((ycounter(4) & !\ycounter[3]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ycounter(4),
	datad => VCC,
	cin => \ycounter[3]~19\,
	combout => \ycounter[4]~20_combout\,
	cout => \ycounter[4]~21\);

-- Location: LCFF_X23_Y20_N19
\ycounter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \ycounter[4]~20_combout\,
	sclr => \LessThan7~3_combout\,
	ena => \ycounter[10]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => ycounter(4));

-- Location: LCCOMB_X23_Y20_N20
\ycounter[5]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \ycounter[5]~22_combout\ = (ycounter(5) & (!\ycounter[4]~21\)) # (!ycounter(5) & ((\ycounter[4]~21\) # (GND)))
-- \ycounter[5]~23\ = CARRY((!\ycounter[4]~21\) # (!ycounter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ycounter(5),
	datad => VCC,
	cin => \ycounter[4]~21\,
	combout => \ycounter[5]~22_combout\,
	cout => \ycounter[5]~23\);

-- Location: LCFF_X23_Y20_N21
\ycounter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \ycounter[5]~22_combout\,
	sclr => \LessThan7~3_combout\,
	ena => \ycounter[10]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => ycounter(5));

-- Location: LCCOMB_X23_Y20_N22
\ycounter[6]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \ycounter[6]~24_combout\ = (ycounter(6) & (\ycounter[5]~23\ $ (GND))) # (!ycounter(6) & (!\ycounter[5]~23\ & VCC))
-- \ycounter[6]~25\ = CARRY((ycounter(6) & !\ycounter[5]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ycounter(6),
	datad => VCC,
	cin => \ycounter[5]~23\,
	combout => \ycounter[6]~24_combout\,
	cout => \ycounter[6]~25\);

-- Location: LCFF_X23_Y20_N23
\ycounter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \ycounter[6]~24_combout\,
	sclr => \LessThan7~3_combout\,
	ena => \ycounter[10]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => ycounter(6));

-- Location: LCCOMB_X23_Y20_N24
\ycounter[7]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \ycounter[7]~26_combout\ = (ycounter(7) & (!\ycounter[6]~25\)) # (!ycounter(7) & ((\ycounter[6]~25\) # (GND)))
-- \ycounter[7]~27\ = CARRY((!\ycounter[6]~25\) # (!ycounter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ycounter(7),
	datad => VCC,
	cin => \ycounter[6]~25\,
	combout => \ycounter[7]~26_combout\,
	cout => \ycounter[7]~27\);

-- Location: LCCOMB_X23_Y20_N26
\ycounter[8]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \ycounter[8]~28_combout\ = (ycounter(8) & (\ycounter[7]~27\ $ (GND))) # (!ycounter(8) & (!\ycounter[7]~27\ & VCC))
-- \ycounter[8]~29\ = CARRY((ycounter(8) & !\ycounter[7]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ycounter(8),
	datad => VCC,
	cin => \ycounter[7]~27\,
	combout => \ycounter[8]~28_combout\,
	cout => \ycounter[8]~29\);

-- Location: LCFF_X23_Y20_N27
\ycounter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \ycounter[8]~28_combout\,
	sclr => \LessThan7~3_combout\,
	ena => \ycounter[10]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => ycounter(8));

-- Location: LCFF_X23_Y20_N25
\ycounter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \ycounter[7]~26_combout\,
	sclr => \LessThan7~3_combout\,
	ena => \ycounter[10]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => ycounter(7));

-- Location: LCCOMB_X22_Y20_N28
\LessThan7~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan7~2_combout\ = (!ycounter(6) & (!ycounter(5) & (!ycounter(8) & !ycounter(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ycounter(6),
	datab => ycounter(5),
	datac => ycounter(8),
	datad => ycounter(7),
	combout => \LessThan7~2_combout\);

-- Location: LCFF_X23_Y20_N11
\ycounter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \ycounter[0]~11_combout\,
	sclr => \LessThan7~3_combout\,
	ena => \ycounter[10]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => ycounter(0));

-- Location: LCCOMB_X23_Y20_N2
\LessThan7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan7~0_combout\ = (!ycounter(1) & (!ycounter(2) & !ycounter(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ycounter(1),
	datac => ycounter(2),
	datad => ycounter(0),
	combout => \LessThan7~0_combout\);

-- Location: LCFF_X23_Y20_N17
\ycounter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \ycounter[3]~18_combout\,
	sclr => \LessThan7~3_combout\,
	ena => \ycounter[10]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => ycounter(3));

-- Location: LCCOMB_X23_Y20_N4
\LessThan7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan7~1_combout\ = (\LessThan7~0_combout\) # ((!ycounter(4)) # (!ycounter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan7~0_combout\,
	datac => ycounter(3),
	datad => ycounter(4),
	combout => \LessThan7~1_combout\);

-- Location: LCCOMB_X23_Y20_N28
\ycounter[9]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \ycounter[9]~30_combout\ = (ycounter(9) & (!\ycounter[8]~29\)) # (!ycounter(9) & ((\ycounter[8]~29\) # (GND)))
-- \ycounter[9]~31\ = CARRY((!\ycounter[8]~29\) # (!ycounter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ycounter(9),
	datad => VCC,
	cin => \ycounter[8]~29\,
	combout => \ycounter[9]~30_combout\,
	cout => \ycounter[9]~31\);

-- Location: LCCOMB_X23_Y20_N30
\ycounter[10]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \ycounter[10]~32_combout\ = \ycounter[9]~31\ $ (!ycounter(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => ycounter(10),
	cin => \ycounter[9]~31\,
	combout => \ycounter[10]~32_combout\);

-- Location: LCFF_X23_Y20_N31
\ycounter[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \ycounter[10]~32_combout\,
	sclr => \LessThan7~3_combout\,
	ena => \ycounter[10]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => ycounter(10));

-- Location: LCCOMB_X23_Y20_N6
\LessThan7~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan7~3_combout\ = (ycounter(10) & ((ycounter(9)) # ((!\LessThan7~1_combout\) # (!\LessThan7~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ycounter(9),
	datab => \LessThan7~2_combout\,
	datac => \LessThan7~1_combout\,
	datad => ycounter(10),
	combout => \LessThan7~3_combout\);

-- Location: LCFF_X23_Y20_N13
\ycounter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \ycounter[1]~13_combout\,
	sclr => \LessThan7~3_combout\,
	ena => \ycounter[10]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => ycounter(1));

-- Location: LCFF_X22_Y20_N1
\yrow[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => ycounter(1),
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sload => VCC,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \yrow[0]~reg0_regout\);

-- Location: LCFF_X22_Y20_N11
\yrow[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => ycounter(2),
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sload => VCC,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \yrow[1]~reg0_regout\);

-- Location: LCFF_X22_Y20_N5
\yrow[2]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => ycounter(3),
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sload => VCC,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \yrow[2]~reg0_regout\);

-- Location: LCCOMB_X22_Y20_N22
\yrow[3]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \yrow[3]~reg0feeder_combout\ = ycounter(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ycounter(4),
	combout => \yrow[3]~reg0feeder_combout\);

-- Location: LCFF_X22_Y20_N23
\yrow[3]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \yrow[3]~reg0feeder_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \yrow[3]~reg0_regout\);

-- Location: LCFF_X23_Y28_N1
\yrow[4]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => ycounter(5),
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sload => VCC,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \yrow[4]~reg0_regout\);

-- Location: LCFF_X22_Y20_N25
\yrow[5]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => ycounter(6),
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sload => VCC,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \yrow[5]~reg0_regout\);

-- Location: LCCOMB_X22_Y20_N26
\yrow[6]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \yrow[6]~reg0feeder_combout\ = ycounter(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ycounter(7),
	combout => \yrow[6]~reg0feeder_combout\);

-- Location: LCFF_X22_Y20_N27
\yrow[6]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \yrow[6]~reg0feeder_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \yrow[6]~reg0_regout\);

-- Location: LCFF_X22_Y20_N21
\yrow[7]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => ycounter(8),
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sload => VCC,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \yrow[7]~reg0_regout\);

-- Location: LCFF_X23_Y20_N29
\ycounter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \ycounter[9]~30_combout\,
	sclr => \LessThan7~3_combout\,
	ena => \ycounter[10]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => ycounter(9));

-- Location: LCCOMB_X23_Y28_N2
\yrow[8]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \yrow[8]~reg0feeder_combout\ = ycounter(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ycounter(9),
	combout => \yrow[8]~reg0feeder_combout\);

-- Location: LCFF_X23_Y28_N3
\yrow[8]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \yrow[8]~reg0feeder_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \yrow[8]~reg0_regout\);

-- Location: LCFF_X23_Y28_N5
\yrow[9]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => ycounter(10),
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sload => VCC,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \yrow[9]~reg0_regout\);

-- Location: LCFF_X23_Y27_N13
\xc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xc[0]~10_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sclr => \LessThan6~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => xc(0));

-- Location: LCFF_X23_Y28_N31
\xcolumn[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => xc(0),
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sload => VCC,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \xcolumn[0]~reg0_regout\);

-- Location: LCCOMB_X23_Y28_N16
\xcolumn[1]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \xcolumn[1]~reg0feeder_combout\ = xc(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => xc(1),
	combout => \xcolumn[1]~reg0feeder_combout\);

-- Location: LCFF_X23_Y28_N17
\xcolumn[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xcolumn[1]~reg0feeder_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \xcolumn[1]~reg0_regout\);

-- Location: LCFF_X23_Y27_N17
\xc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xc[2]~14_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sclr => \LessThan6~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => xc(2));

-- Location: LCCOMB_X22_Y20_N6
\xcolumn[2]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \xcolumn[2]~reg0feeder_combout\ = xc(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => xc(2),
	combout => \xcolumn[2]~reg0feeder_combout\);

-- Location: LCFF_X22_Y20_N7
\xcolumn[2]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xcolumn[2]~reg0feeder_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \xcolumn[2]~reg0_regout\);

-- Location: LCCOMB_X23_Y28_N10
\xcolumn[3]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \xcolumn[3]~reg0feeder_combout\ = xc(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => xc(3),
	combout => \xcolumn[3]~reg0feeder_combout\);

-- Location: LCFF_X23_Y28_N11
\xcolumn[3]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xcolumn[3]~reg0feeder_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \xcolumn[3]~reg0_regout\);

-- Location: LCFF_X23_Y27_N21
\xc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xc[4]~18_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sclr => \LessThan6~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => xc(4));

-- Location: LCCOMB_X23_Y27_N0
\xcolumn[4]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \xcolumn[4]~reg0feeder_combout\ = xc(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => xc(4),
	combout => \xcolumn[4]~reg0feeder_combout\);

-- Location: LCFF_X23_Y27_N1
\xcolumn[4]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xcolumn[4]~reg0feeder_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \xcolumn[4]~reg0_regout\);

-- Location: LCFF_X23_Y28_N13
\xcolumn[5]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => xc(5),
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sload => VCC,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \xcolumn[5]~reg0_regout\);

-- Location: LCCOMB_X23_Y27_N2
\xcolumn[6]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \xcolumn[6]~reg0feeder_combout\ = xc(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => xc(6),
	combout => \xcolumn[6]~reg0feeder_combout\);

-- Location: LCFF_X23_Y27_N3
\xcolumn[6]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xcolumn[6]~reg0feeder_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \xcolumn[6]~reg0_regout\);

-- Location: LCFF_X23_Y28_N23
\xcolumn[7]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => xc(7),
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sload => VCC,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \xcolumn[7]~reg0_regout\);

-- Location: LCCOMB_X23_Y28_N24
\xcolumn[8]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \xcolumn[8]~reg0feeder_combout\ = xc(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => xc(8),
	combout => \xcolumn[8]~reg0feeder_combout\);

-- Location: LCFF_X23_Y28_N25
\xcolumn[8]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \xcolumn[8]~reg0feeder_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \xcolumn[8]~reg0_regout\);

-- Location: LCFF_X23_Y28_N19
\xcolumn[9]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => xc(9),
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	sload => VCC,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \xcolumn[9]~reg0_regout\);

-- Location: LCFF_X22_Y20_N17
\ycounter_s[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	sdata => ycounter(0),
	sload => VCC,
	ena => \ACLRN~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => ycounter_s(0));

-- Location: LCCOMB_X22_Y20_N16
inst : cycloneii_lcell_comb
-- Equation(s):
-- \inst~combout\ = LCELL(ycounter_s(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => ycounter_s(0),
	combout => \inst~combout\);

-- Location: LCCOMB_X23_Y28_N20
\process_0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (!ycounter(10) & (((!xc(7) & !xc(8))) # (!xc(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ycounter(10),
	datab => xc(9),
	datac => xc(7),
	datad => xc(8),
	combout => \process_0~0_combout\);

-- Location: LCCOMB_X23_Y28_N28
\process_0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~1_combout\ = (\LessThan5~0_combout\) # (!\process_0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan5~0_combout\,
	datac => \process_0~0_combout\,
	combout => \process_0~1_combout\);

-- Location: LCFF_X23_Y28_N29
\VGA_BLANK~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \process_0~1_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \VGA_BLANK~reg0_regout\);

-- Location: LCCOMB_X23_Y28_N6
\process_0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~3_combout\ = (!\process_0~2_combout\ & (xc(9) & (xc(7) & !xc(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~2_combout\,
	datab => xc(9),
	datac => xc(7),
	datad => xc(8),
	combout => \process_0~3_combout\);

-- Location: LCFF_X23_Y28_N7
\VGA_HS~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \process_0~3_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \VGA_HS~reg0_regout\);

-- Location: LCCOMB_X23_Y20_N8
\process_0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~4_combout\ = (ycounter(5)) # (((ycounter(3)) # (!ycounter(4))) # (!ycounter(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ycounter(5),
	datab => ycounter(2),
	datac => ycounter(3),
	datad => ycounter(4),
	combout => \process_0~4_combout\);

-- Location: LCCOMB_X23_Y28_N8
\process_0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~5_combout\ = (\LessThan5~0_combout\ & (!ycounter(10) & !\process_0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan5~0_combout\,
	datac => ycounter(10),
	datad => \process_0~4_combout\,
	combout => \process_0~5_combout\);

-- Location: LCFF_X23_Y28_N9
\VGA_VS~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \process_0~5_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \VGA_VS~reg0_regout\);

-- Location: LCCOMB_X22_Y20_N2
\LessThan5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan5~0_combout\ = (ycounter(6) & (ycounter(9) & (ycounter(8) & ycounter(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ycounter(6),
	datab => ycounter(9),
	datac => ycounter(8),
	datad => ycounter(7),
	combout => \LessThan5~0_combout\);

-- Location: LCCOMB_X23_Y28_N26
\VGA_SYNC~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \VGA_SYNC~0_combout\ = (\process_0~3_combout\) # ((!\process_0~4_combout\ & (!ycounter(10) & \LessThan5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~4_combout\,
	datab => \process_0~3_combout\,
	datac => ycounter(10),
	datad => \LessThan5~0_combout\,
	combout => \VGA_SYNC~0_combout\);

-- Location: LCFF_X23_Y28_N27
\VGA_SYNC~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLOCK_50~clkctrl_outclk\,
	datain => \VGA_SYNC~0_combout\,
	aclr => \ALT_INV_ACLRN~clkctrl_outclk\,
	ena => ycounter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \VGA_SYNC~reg0_regout\);

-- Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\yrow[0]~I\ : cycloneii_io
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
	datain => \yrow[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_yrow(0));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\yrow[1]~I\ : cycloneii_io
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
	datain => \yrow[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_yrow(1));

-- Location: PIN_AD10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\yrow[2]~I\ : cycloneii_io
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
	datain => \yrow[2]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_yrow(2));

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\yrow[3]~I\ : cycloneii_io
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
	datain => \yrow[3]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_yrow(3));

-- Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\yrow[4]~I\ : cycloneii_io
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
	datain => \yrow[4]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_yrow(4));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\yrow[5]~I\ : cycloneii_io
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
	datain => \yrow[5]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_yrow(5));

-- Location: PIN_P4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\yrow[6]~I\ : cycloneii_io
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
	datain => \yrow[6]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_yrow(6));

-- Location: PIN_AF9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\yrow[7]~I\ : cycloneii_io
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
	datain => \yrow[7]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_yrow(7));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\yrow[8]~I\ : cycloneii_io
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
	datain => \yrow[8]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_yrow(8));

-- Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\yrow[9]~I\ : cycloneii_io
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
	datain => \yrow[9]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_yrow(9));

-- Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\xcolumn[0]~I\ : cycloneii_io
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
	datain => \xcolumn[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_xcolumn(0));

-- Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\xcolumn[1]~I\ : cycloneii_io
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
	datain => \xcolumn[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_xcolumn(1));

-- Location: PIN_AC10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\xcolumn[2]~I\ : cycloneii_io
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
	datain => \xcolumn[2]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_xcolumn(2));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\xcolumn[3]~I\ : cycloneii_io
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
	datain => \xcolumn[3]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_xcolumn(3));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\xcolumn[4]~I\ : cycloneii_io
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
	datain => \xcolumn[4]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_xcolumn(4));

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\xcolumn[5]~I\ : cycloneii_io
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
	datain => \xcolumn[5]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_xcolumn(5));

-- Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\xcolumn[6]~I\ : cycloneii_io
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
	datain => \xcolumn[6]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_xcolumn(6));

-- Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\xcolumn[7]~I\ : cycloneii_io
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
	datain => \xcolumn[7]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_xcolumn(7));

-- Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\xcolumn[8]~I\ : cycloneii_io
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
	datain => \xcolumn[8]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_xcolumn(8));

-- Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\xcolumn[9]~I\ : cycloneii_io
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
	datain => \xcolumn[9]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_xcolumn(9));

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
	datain => \inst~combout\,
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
	datain => \ALT_INV_VGA_BLANK~reg0_regout\,
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
	datain => \ALT_INV_VGA_HS~reg0_regout\,
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
	datain => \ALT_INV_VGA_VS~reg0_regout\,
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
	datain => \ALT_INV_VGA_SYNC~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_VGA_SYNC);
END structure;


