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

-- DATE "03/05/2020 13:27:40"

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

ENTITY 	NovaBlob IS
    PORT (
	LEDR : OUT std_logic_vector(0 DOWNTO 0);
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(0 DOWNTO 0);
	SW : IN std_logic_vector(0 DOWNTO 0)
	);
END NovaBlob;

-- Design Ports Information
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF NovaBlob IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LEDR : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(0 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst2|inst|q2~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst3|inst|q2~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \instdiv|inst|q2~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst3|inst|cnt[0]~9_combout\ : std_logic;
SIGNAL \inst3|inst|cnt[0]~10\ : std_logic;
SIGNAL \inst3|inst|cnt[1]~11_combout\ : std_logic;
SIGNAL \inst3|inst|cnt[1]~12\ : std_logic;
SIGNAL \inst3|inst|cnt[2]~13_combout\ : std_logic;
SIGNAL \inst3|inst|cnt[2]~14\ : std_logic;
SIGNAL \inst3|inst|cnt[3]~15_combout\ : std_logic;
SIGNAL \inst3|inst|cnt[3]~16\ : std_logic;
SIGNAL \inst3|inst|cnt[4]~17_combout\ : std_logic;
SIGNAL \inst3|inst|cnt[4]~18\ : std_logic;
SIGNAL \inst3|inst|cnt[5]~19_combout\ : std_logic;
SIGNAL \inst3|inst|cnt[5]~20\ : std_logic;
SIGNAL \inst3|inst|cnt[6]~21_combout\ : std_logic;
SIGNAL \inst3|inst|cnt[6]~22\ : std_logic;
SIGNAL \inst3|inst|cnt[7]~23_combout\ : std_logic;
SIGNAL \inst3|inst|cnt[7]~24\ : std_logic;
SIGNAL \inst3|inst|cnt[8]~25_combout\ : std_logic;
SIGNAL \inst2|inst|cnt[0]~9_combout\ : std_logic;
SIGNAL \inst2|inst|cnt[0]~10\ : std_logic;
SIGNAL \inst2|inst|cnt[1]~11_combout\ : std_logic;
SIGNAL \inst2|inst|cnt[1]~12\ : std_logic;
SIGNAL \inst2|inst|cnt[2]~13_combout\ : std_logic;
SIGNAL \inst2|inst|cnt[2]~14\ : std_logic;
SIGNAL \inst2|inst|cnt[3]~15_combout\ : std_logic;
SIGNAL \inst2|inst|cnt[3]~16\ : std_logic;
SIGNAL \inst2|inst|cnt[4]~17_combout\ : std_logic;
SIGNAL \inst2|inst|cnt[4]~18\ : std_logic;
SIGNAL \inst2|inst|cnt[5]~19_combout\ : std_logic;
SIGNAL \inst2|inst|cnt[5]~20\ : std_logic;
SIGNAL \inst2|inst|cnt[6]~21_combout\ : std_logic;
SIGNAL \inst2|inst|cnt[6]~22\ : std_logic;
SIGNAL \inst2|inst|cnt[7]~23_combout\ : std_logic;
SIGNAL \inst2|inst|cnt[7]~24\ : std_logic;
SIGNAL \inst2|inst|cnt[8]~25_combout\ : std_logic;
SIGNAL \inst5|inst1~q\ : std_logic;
SIGNAL \inst3|inst|q2~q\ : std_logic;
SIGNAL \inst5|inst3~combout\ : std_logic;
SIGNAL \inst2|inst|q2~q\ : std_logic;
SIGNAL \inst3|inst|LessThan0~0_combout\ : std_logic;
SIGNAL \inst3|inst|LessThan0~1_combout\ : std_logic;
SIGNAL \inst3|inst|q2~0_combout\ : std_logic;
SIGNAL \inst2|inst|LessThan0~0_combout\ : std_logic;
SIGNAL \inst2|inst|LessThan0~1_combout\ : std_logic;
SIGNAL \inst2|inst|q2~0_combout\ : std_logic;
SIGNAL \instdiv|inst|q2~q\ : std_logic;
SIGNAL \inst3|inst|LessThan0~2_combout\ : std_logic;
SIGNAL \inst2|inst|LessThan0~2_combout\ : std_logic;
SIGNAL \instdiv|inst|q2~0_combout\ : std_logic;
SIGNAL \instdiv|inst|cnt~0_combout\ : std_logic;
SIGNAL \instdiv|inst|cnt~1_combout\ : std_logic;
SIGNAL \instdiv|inst|cnt~2_combout\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst2|inst|q2~clkctrl_outclk\ : std_logic;
SIGNAL \inst3|inst|q2~clkctrl_outclk\ : std_logic;
SIGNAL \instdiv|inst|q2~clkctrl_outclk\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \inst4|inst|inst2~combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \inst4|inst|inst~q\ : std_logic;
SIGNAL \inst4|inst|inst3~combout\ : std_logic;
SIGNAL \inst4|inst|inst8~q\ : std_logic;
SIGNAL \inst|inst4~0_combout\ : std_logic;
SIGNAL \inst4|inst|inst11~combout\ : std_logic;
SIGNAL \inst4|inst|inst9~q\ : std_logic;
SIGNAL \inst4|inst|inst12~combout\ : std_logic;
SIGNAL \inst4|inst|inst10~q\ : std_logic;
SIGNAL \inst|inst3~0_combout\ : std_logic;
SIGNAL \inst2|inst|cnt\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \instdiv|inst|cnt\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst3|inst|cnt\ : std_logic_vector(8 DOWNTO 0);

BEGIN

LEDR <= ww_LEDR;
ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_SW <= SW;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

\inst2|inst|q2~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst2|inst|q2~q\);

\inst3|inst|q2~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst3|inst|q2~q\);

\instdiv|inst|q2~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \instdiv|inst|q2~q\);

-- Location: FF_X3_Y36_N23
\inst3|inst|cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|inst|q2~clkctrl_outclk\,
	d => \inst3|inst|cnt[8]~25_combout\,
	sclr => \inst3|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|inst|cnt\(8));

-- Location: FF_X3_Y36_N7
\inst3|inst|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|inst|q2~clkctrl_outclk\,
	d => \inst3|inst|cnt[0]~9_combout\,
	sclr => \inst3|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|inst|cnt\(0));

-- Location: FF_X3_Y36_N9
\inst3|inst|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|inst|q2~clkctrl_outclk\,
	d => \inst3|inst|cnt[1]~11_combout\,
	sclr => \inst3|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|inst|cnt\(1));

-- Location: FF_X3_Y36_N11
\inst3|inst|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|inst|q2~clkctrl_outclk\,
	d => \inst3|inst|cnt[2]~13_combout\,
	sclr => \inst3|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|inst|cnt\(2));

-- Location: FF_X3_Y36_N13
\inst3|inst|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|inst|q2~clkctrl_outclk\,
	d => \inst3|inst|cnt[3]~15_combout\,
	sclr => \inst3|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|inst|cnt\(3));

-- Location: FF_X3_Y36_N15
\inst3|inst|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|inst|q2~clkctrl_outclk\,
	d => \inst3|inst|cnt[4]~17_combout\,
	sclr => \inst3|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|inst|cnt\(4));

-- Location: FF_X3_Y36_N17
\inst3|inst|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|inst|q2~clkctrl_outclk\,
	d => \inst3|inst|cnt[5]~19_combout\,
	sclr => \inst3|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|inst|cnt\(5));

-- Location: FF_X3_Y36_N19
\inst3|inst|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|inst|q2~clkctrl_outclk\,
	d => \inst3|inst|cnt[6]~21_combout\,
	sclr => \inst3|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|inst|cnt\(6));

-- Location: FF_X3_Y36_N21
\inst3|inst|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|inst|q2~clkctrl_outclk\,
	d => \inst3|inst|cnt[7]~23_combout\,
	sclr => \inst3|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|inst|cnt\(7));

-- Location: FF_X2_Y36_N25
\inst2|inst|cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \instdiv|inst|q2~clkctrl_outclk\,
	d => \inst2|inst|cnt[8]~25_combout\,
	sclr => \inst2|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|cnt\(8));

-- Location: FF_X2_Y36_N9
\inst2|inst|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \instdiv|inst|q2~clkctrl_outclk\,
	d => \inst2|inst|cnt[0]~9_combout\,
	sclr => \inst2|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|cnt\(0));

-- Location: FF_X2_Y36_N11
\inst2|inst|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \instdiv|inst|q2~clkctrl_outclk\,
	d => \inst2|inst|cnt[1]~11_combout\,
	sclr => \inst2|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|cnt\(1));

-- Location: FF_X2_Y36_N13
\inst2|inst|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \instdiv|inst|q2~clkctrl_outclk\,
	d => \inst2|inst|cnt[2]~13_combout\,
	sclr => \inst2|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|cnt\(2));

-- Location: FF_X2_Y36_N15
\inst2|inst|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \instdiv|inst|q2~clkctrl_outclk\,
	d => \inst2|inst|cnt[3]~15_combout\,
	sclr => \inst2|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|cnt\(3));

-- Location: FF_X2_Y36_N17
\inst2|inst|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \instdiv|inst|q2~clkctrl_outclk\,
	d => \inst2|inst|cnt[4]~17_combout\,
	sclr => \inst2|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|cnt\(4));

-- Location: FF_X2_Y36_N19
\inst2|inst|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \instdiv|inst|q2~clkctrl_outclk\,
	d => \inst2|inst|cnt[5]~19_combout\,
	sclr => \inst2|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|cnt\(5));

-- Location: FF_X2_Y36_N21
\inst2|inst|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \instdiv|inst|q2~clkctrl_outclk\,
	d => \inst2|inst|cnt[6]~21_combout\,
	sclr => \inst2|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|cnt\(6));

-- Location: FF_X2_Y36_N23
\inst2|inst|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \instdiv|inst|q2~clkctrl_outclk\,
	d => \inst2|inst|cnt[7]~23_combout\,
	sclr => \inst2|inst|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|cnt\(7));

-- Location: LCCOMB_X3_Y36_N6
\inst3|inst|cnt[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|inst|cnt[0]~9_combout\ = \inst3|inst|cnt\(0) $ (VCC)
-- \inst3|inst|cnt[0]~10\ = CARRY(\inst3|inst|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|inst|cnt\(0),
	datad => VCC,
	combout => \inst3|inst|cnt[0]~9_combout\,
	cout => \inst3|inst|cnt[0]~10\);

-- Location: LCCOMB_X3_Y36_N8
\inst3|inst|cnt[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|inst|cnt[1]~11_combout\ = (\inst3|inst|cnt\(1) & (!\inst3|inst|cnt[0]~10\)) # (!\inst3|inst|cnt\(1) & ((\inst3|inst|cnt[0]~10\) # (GND)))
-- \inst3|inst|cnt[1]~12\ = CARRY((!\inst3|inst|cnt[0]~10\) # (!\inst3|inst|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|inst|cnt\(1),
	datad => VCC,
	cin => \inst3|inst|cnt[0]~10\,
	combout => \inst3|inst|cnt[1]~11_combout\,
	cout => \inst3|inst|cnt[1]~12\);

-- Location: LCCOMB_X3_Y36_N10
\inst3|inst|cnt[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|inst|cnt[2]~13_combout\ = (\inst3|inst|cnt\(2) & (\inst3|inst|cnt[1]~12\ $ (GND))) # (!\inst3|inst|cnt\(2) & (!\inst3|inst|cnt[1]~12\ & VCC))
-- \inst3|inst|cnt[2]~14\ = CARRY((\inst3|inst|cnt\(2) & !\inst3|inst|cnt[1]~12\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|inst|cnt\(2),
	datad => VCC,
	cin => \inst3|inst|cnt[1]~12\,
	combout => \inst3|inst|cnt[2]~13_combout\,
	cout => \inst3|inst|cnt[2]~14\);

-- Location: LCCOMB_X3_Y36_N12
\inst3|inst|cnt[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|inst|cnt[3]~15_combout\ = (\inst3|inst|cnt\(3) & (!\inst3|inst|cnt[2]~14\)) # (!\inst3|inst|cnt\(3) & ((\inst3|inst|cnt[2]~14\) # (GND)))
-- \inst3|inst|cnt[3]~16\ = CARRY((!\inst3|inst|cnt[2]~14\) # (!\inst3|inst|cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|inst|cnt\(3),
	datad => VCC,
	cin => \inst3|inst|cnt[2]~14\,
	combout => \inst3|inst|cnt[3]~15_combout\,
	cout => \inst3|inst|cnt[3]~16\);

-- Location: LCCOMB_X3_Y36_N14
\inst3|inst|cnt[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|inst|cnt[4]~17_combout\ = (\inst3|inst|cnt\(4) & (\inst3|inst|cnt[3]~16\ $ (GND))) # (!\inst3|inst|cnt\(4) & (!\inst3|inst|cnt[3]~16\ & VCC))
-- \inst3|inst|cnt[4]~18\ = CARRY((\inst3|inst|cnt\(4) & !\inst3|inst|cnt[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|inst|cnt\(4),
	datad => VCC,
	cin => \inst3|inst|cnt[3]~16\,
	combout => \inst3|inst|cnt[4]~17_combout\,
	cout => \inst3|inst|cnt[4]~18\);

-- Location: LCCOMB_X3_Y36_N16
\inst3|inst|cnt[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|inst|cnt[5]~19_combout\ = (\inst3|inst|cnt\(5) & (!\inst3|inst|cnt[4]~18\)) # (!\inst3|inst|cnt\(5) & ((\inst3|inst|cnt[4]~18\) # (GND)))
-- \inst3|inst|cnt[5]~20\ = CARRY((!\inst3|inst|cnt[4]~18\) # (!\inst3|inst|cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|inst|cnt\(5),
	datad => VCC,
	cin => \inst3|inst|cnt[4]~18\,
	combout => \inst3|inst|cnt[5]~19_combout\,
	cout => \inst3|inst|cnt[5]~20\);

-- Location: LCCOMB_X3_Y36_N18
\inst3|inst|cnt[6]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|inst|cnt[6]~21_combout\ = (\inst3|inst|cnt\(6) & (\inst3|inst|cnt[5]~20\ $ (GND))) # (!\inst3|inst|cnt\(6) & (!\inst3|inst|cnt[5]~20\ & VCC))
-- \inst3|inst|cnt[6]~22\ = CARRY((\inst3|inst|cnt\(6) & !\inst3|inst|cnt[5]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|inst|cnt\(6),
	datad => VCC,
	cin => \inst3|inst|cnt[5]~20\,
	combout => \inst3|inst|cnt[6]~21_combout\,
	cout => \inst3|inst|cnt[6]~22\);

-- Location: LCCOMB_X3_Y36_N20
\inst3|inst|cnt[7]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|inst|cnt[7]~23_combout\ = (\inst3|inst|cnt\(7) & (!\inst3|inst|cnt[6]~22\)) # (!\inst3|inst|cnt\(7) & ((\inst3|inst|cnt[6]~22\) # (GND)))
-- \inst3|inst|cnt[7]~24\ = CARRY((!\inst3|inst|cnt[6]~22\) # (!\inst3|inst|cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|inst|cnt\(7),
	datad => VCC,
	cin => \inst3|inst|cnt[6]~22\,
	combout => \inst3|inst|cnt[7]~23_combout\,
	cout => \inst3|inst|cnt[7]~24\);

-- Location: LCCOMB_X3_Y36_N22
\inst3|inst|cnt[8]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|inst|cnt[8]~25_combout\ = \inst3|inst|cnt\(8) $ (!\inst3|inst|cnt[7]~24\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|inst|cnt\(8),
	cin => \inst3|inst|cnt[7]~24\,
	combout => \inst3|inst|cnt[8]~25_combout\);

-- Location: LCCOMB_X2_Y36_N8
\inst2|inst|cnt[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|inst|cnt[0]~9_combout\ = \inst2|inst|cnt\(0) $ (VCC)
-- \inst2|inst|cnt[0]~10\ = CARRY(\inst2|inst|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|inst|cnt\(0),
	datad => VCC,
	combout => \inst2|inst|cnt[0]~9_combout\,
	cout => \inst2|inst|cnt[0]~10\);

-- Location: LCCOMB_X2_Y36_N10
\inst2|inst|cnt[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|inst|cnt[1]~11_combout\ = (\inst2|inst|cnt\(1) & (!\inst2|inst|cnt[0]~10\)) # (!\inst2|inst|cnt\(1) & ((\inst2|inst|cnt[0]~10\) # (GND)))
-- \inst2|inst|cnt[1]~12\ = CARRY((!\inst2|inst|cnt[0]~10\) # (!\inst2|inst|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|cnt\(1),
	datad => VCC,
	cin => \inst2|inst|cnt[0]~10\,
	combout => \inst2|inst|cnt[1]~11_combout\,
	cout => \inst2|inst|cnt[1]~12\);

-- Location: LCCOMB_X2_Y36_N12
\inst2|inst|cnt[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|inst|cnt[2]~13_combout\ = (\inst2|inst|cnt\(2) & (\inst2|inst|cnt[1]~12\ $ (GND))) # (!\inst2|inst|cnt\(2) & (!\inst2|inst|cnt[1]~12\ & VCC))
-- \inst2|inst|cnt[2]~14\ = CARRY((\inst2|inst|cnt\(2) & !\inst2|inst|cnt[1]~12\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|cnt\(2),
	datad => VCC,
	cin => \inst2|inst|cnt[1]~12\,
	combout => \inst2|inst|cnt[2]~13_combout\,
	cout => \inst2|inst|cnt[2]~14\);

-- Location: LCCOMB_X2_Y36_N14
\inst2|inst|cnt[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|inst|cnt[3]~15_combout\ = (\inst2|inst|cnt\(3) & (!\inst2|inst|cnt[2]~14\)) # (!\inst2|inst|cnt\(3) & ((\inst2|inst|cnt[2]~14\) # (GND)))
-- \inst2|inst|cnt[3]~16\ = CARRY((!\inst2|inst|cnt[2]~14\) # (!\inst2|inst|cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|inst|cnt\(3),
	datad => VCC,
	cin => \inst2|inst|cnt[2]~14\,
	combout => \inst2|inst|cnt[3]~15_combout\,
	cout => \inst2|inst|cnt[3]~16\);

-- Location: LCCOMB_X2_Y36_N16
\inst2|inst|cnt[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|inst|cnt[4]~17_combout\ = (\inst2|inst|cnt\(4) & (\inst2|inst|cnt[3]~16\ $ (GND))) # (!\inst2|inst|cnt\(4) & (!\inst2|inst|cnt[3]~16\ & VCC))
-- \inst2|inst|cnt[4]~18\ = CARRY((\inst2|inst|cnt\(4) & !\inst2|inst|cnt[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|inst|cnt\(4),
	datad => VCC,
	cin => \inst2|inst|cnt[3]~16\,
	combout => \inst2|inst|cnt[4]~17_combout\,
	cout => \inst2|inst|cnt[4]~18\);

-- Location: LCCOMB_X2_Y36_N18
\inst2|inst|cnt[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|inst|cnt[5]~19_combout\ = (\inst2|inst|cnt\(5) & (!\inst2|inst|cnt[4]~18\)) # (!\inst2|inst|cnt\(5) & ((\inst2|inst|cnt[4]~18\) # (GND)))
-- \inst2|inst|cnt[5]~20\ = CARRY((!\inst2|inst|cnt[4]~18\) # (!\inst2|inst|cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|inst|cnt\(5),
	datad => VCC,
	cin => \inst2|inst|cnt[4]~18\,
	combout => \inst2|inst|cnt[5]~19_combout\,
	cout => \inst2|inst|cnt[5]~20\);

-- Location: LCCOMB_X2_Y36_N20
\inst2|inst|cnt[6]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|inst|cnt[6]~21_combout\ = (\inst2|inst|cnt\(6) & (\inst2|inst|cnt[5]~20\ $ (GND))) # (!\inst2|inst|cnt\(6) & (!\inst2|inst|cnt[5]~20\ & VCC))
-- \inst2|inst|cnt[6]~22\ = CARRY((\inst2|inst|cnt\(6) & !\inst2|inst|cnt[5]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|inst|cnt\(6),
	datad => VCC,
	cin => \inst2|inst|cnt[5]~20\,
	combout => \inst2|inst|cnt[6]~21_combout\,
	cout => \inst2|inst|cnt[6]~22\);

-- Location: LCCOMB_X2_Y36_N22
\inst2|inst|cnt[7]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|inst|cnt[7]~23_combout\ = (\inst2|inst|cnt\(7) & (!\inst2|inst|cnt[6]~22\)) # (!\inst2|inst|cnt\(7) & ((\inst2|inst|cnt[6]~22\) # (GND)))
-- \inst2|inst|cnt[7]~24\ = CARRY((!\inst2|inst|cnt[6]~22\) # (!\inst2|inst|cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|cnt\(7),
	datad => VCC,
	cin => \inst2|inst|cnt[6]~22\,
	combout => \inst2|inst|cnt[7]~23_combout\,
	cout => \inst2|inst|cnt[7]~24\);

-- Location: LCCOMB_X2_Y36_N24
\inst2|inst|cnt[8]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|inst|cnt[8]~25_combout\ = \inst2|inst|cnt[7]~24\ $ (!\inst2|inst|cnt\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst2|inst|cnt\(8),
	cin => \inst2|inst|cnt[7]~24\,
	combout => \inst2|inst|cnt[8]~25_combout\);

-- Location: FF_X112_Y36_N27
\inst5|inst1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|inst|q2~clkctrl_outclk\,
	d => \inst5|inst3~combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|inst1~q\);

-- Location: FF_X3_Y36_N29
\inst3|inst|q2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst2|inst|q2~q\,
	d => \inst3|inst|q2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|inst|q2~q\);

-- Location: LCCOMB_X112_Y36_N26
\inst5|inst3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|inst3~combout\ = (\inst4|inst|inst10~q\ & (!\inst|inst4~0_combout\ & ((\inst5|inst1~q\) # (\SW[0]~input_o\)))) # (!\inst4|inst|inst10~q\ & (((\inst5|inst1~q\) # (\SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst|inst10~q\,
	datab => \inst|inst4~0_combout\,
	datac => \inst5|inst1~q\,
	datad => \SW[0]~input_o\,
	combout => \inst5|inst3~combout\);

-- Location: FF_X2_Y36_N7
\inst2|inst|q2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \instdiv|inst|q2~q\,
	d => \inst2|inst|q2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|q2~q\);

-- Location: LCCOMB_X3_Y36_N26
\inst3|inst|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|inst|LessThan0~0_combout\ = (!\inst3|inst|cnt\(2) & (!\inst3|inst|cnt\(3) & ((!\inst3|inst|cnt\(0)) # (!\inst3|inst|cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|inst|cnt\(2),
	datab => \inst3|inst|cnt\(3),
	datac => \inst3|inst|cnt\(1),
	datad => \inst3|inst|cnt\(0),
	combout => \inst3|inst|LessThan0~0_combout\);

-- Location: LCCOMB_X3_Y36_N24
\inst3|inst|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|inst|LessThan0~1_combout\ = (((!\inst3|inst|cnt\(6)) # (!\inst3|inst|cnt\(4))) # (!\inst3|inst|cnt\(5))) # (!\inst3|inst|cnt\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|inst|cnt\(7),
	datab => \inst3|inst|cnt\(5),
	datac => \inst3|inst|cnt\(4),
	datad => \inst3|inst|cnt\(6),
	combout => \inst3|inst|LessThan0~1_combout\);

-- Location: LCCOMB_X3_Y36_N28
\inst3|inst|q2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|inst|q2~0_combout\ = \inst3|inst|q2~q\ $ (((\inst3|inst|cnt\(8) & (!\inst3|inst|LessThan0~1_combout\ & !\inst3|inst|LessThan0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|inst|cnt\(8),
	datab => \inst3|inst|LessThan0~1_combout\,
	datac => \inst3|inst|q2~q\,
	datad => \inst3|inst|LessThan0~0_combout\,
	combout => \inst3|inst|q2~0_combout\);

-- Location: LCCOMB_X2_Y36_N28
\inst2|inst|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|inst|LessThan0~0_combout\ = (!\inst2|inst|cnt\(2) & (!\inst2|inst|cnt\(3) & ((!\inst2|inst|cnt\(1)) # (!\inst2|inst|cnt\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|cnt\(2),
	datab => \inst2|inst|cnt\(3),
	datac => \inst2|inst|cnt\(0),
	datad => \inst2|inst|cnt\(1),
	combout => \inst2|inst|LessThan0~0_combout\);

-- Location: LCCOMB_X2_Y36_N0
\inst2|inst|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|inst|LessThan0~1_combout\ = (((!\inst2|inst|cnt\(5)) # (!\inst2|inst|cnt\(7))) # (!\inst2|inst|cnt\(6))) # (!\inst2|inst|cnt\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|cnt\(4),
	datab => \inst2|inst|cnt\(6),
	datac => \inst2|inst|cnt\(7),
	datad => \inst2|inst|cnt\(5),
	combout => \inst2|inst|LessThan0~1_combout\);

-- Location: LCCOMB_X2_Y36_N6
\inst2|inst|q2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|inst|q2~0_combout\ = \inst2|inst|q2~q\ $ (((!\inst2|inst|LessThan0~0_combout\ & (\inst2|inst|cnt\(8) & !\inst2|inst|LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|LessThan0~0_combout\,
	datab => \inst2|inst|cnt\(8),
	datac => \inst2|inst|q2~q\,
	datad => \inst2|inst|LessThan0~1_combout\,
	combout => \inst2|inst|q2~0_combout\);

-- Location: FF_X1_Y36_N7
\instdiv|inst|q2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \instdiv|inst|q2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instdiv|inst|q2~q\);

-- Location: LCCOMB_X3_Y36_N0
\inst3|inst|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|inst|LessThan0~2_combout\ = (!\inst3|inst|LessThan0~0_combout\ & (!\inst3|inst|LessThan0~1_combout\ & \inst3|inst|cnt\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|inst|LessThan0~0_combout\,
	datab => \inst3|inst|LessThan0~1_combout\,
	datac => \inst3|inst|cnt\(8),
	combout => \inst3|inst|LessThan0~2_combout\);

-- Location: LCCOMB_X2_Y36_N26
\inst2|inst|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|inst|LessThan0~2_combout\ = (\inst2|inst|cnt\(8) & (!\inst2|inst|LessThan0~0_combout\ & !\inst2|inst|LessThan0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|inst|cnt\(8),
	datac => \inst2|inst|LessThan0~0_combout\,
	datad => \inst2|inst|LessThan0~1_combout\,
	combout => \inst2|inst|LessThan0~2_combout\);

-- Location: FF_X1_Y36_N5
\instdiv|inst|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \instdiv|inst|cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instdiv|inst|cnt\(2));

-- Location: LCCOMB_X1_Y36_N6
\instdiv|inst|q2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instdiv|inst|q2~0_combout\ = \instdiv|inst|cnt\(2) $ (\instdiv|inst|q2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instdiv|inst|cnt\(2),
	datac => \instdiv|inst|q2~q\,
	combout => \instdiv|inst|q2~0_combout\);

-- Location: FF_X1_Y36_N1
\instdiv|inst|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \instdiv|inst|cnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instdiv|inst|cnt\(0));

-- Location: FF_X1_Y36_N11
\instdiv|inst|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \instdiv|inst|cnt~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \instdiv|inst|cnt\(1));

-- Location: LCCOMB_X1_Y36_N4
\instdiv|inst|cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \instdiv|inst|cnt~0_combout\ = (\instdiv|inst|cnt\(1) & (!\instdiv|inst|cnt\(2) & \instdiv|inst|cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instdiv|inst|cnt\(1),
	datac => \instdiv|inst|cnt\(2),
	datad => \instdiv|inst|cnt\(0),
	combout => \instdiv|inst|cnt~0_combout\);

-- Location: LCCOMB_X1_Y36_N0
\instdiv|inst|cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \instdiv|inst|cnt~1_combout\ = (!\instdiv|inst|cnt\(2) & !\instdiv|inst|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instdiv|inst|cnt\(2),
	datac => \instdiv|inst|cnt\(0),
	combout => \instdiv|inst|cnt~1_combout\);

-- Location: LCCOMB_X1_Y36_N10
\instdiv|inst|cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \instdiv|inst|cnt~2_combout\ = (!\instdiv|inst|cnt\(2) & (\instdiv|inst|cnt\(1) $ (\instdiv|inst|cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \instdiv|inst|cnt\(2),
	datac => \instdiv|inst|cnt\(1),
	datad => \instdiv|inst|cnt\(0),
	combout => \instdiv|inst|cnt~2_combout\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

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

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: CLKCTRL_G3
\inst2|inst|q2~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst2|inst|q2~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst2|inst|q2~clkctrl_outclk\);

-- Location: CLKCTRL_G1
\inst3|inst|q2~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst3|inst|q2~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst3|inst|q2~clkctrl_outclk\);

-- Location: CLKCTRL_G2
\instdiv|inst|q2~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \instdiv|inst|q2~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \instdiv|inst|q2~clkctrl_outclk\);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst3~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: LCCOMB_X112_Y36_N2
\inst4|inst|inst2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4|inst|inst2~combout\ = (\inst5|inst1~q\ & !\inst4|inst|inst~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|inst1~q\,
	datac => \inst4|inst|inst~q\,
	combout => \inst4|inst|inst2~combout\);

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

-- Location: FF_X112_Y36_N3
\inst4|inst|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst3|inst|q2~clkctrl_outclk\,
	d => \inst4|inst|inst2~combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|inst|inst~q\);

-- Location: LCCOMB_X112_Y36_N6
\inst4|inst|inst3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4|inst|inst3~combout\ = (\inst5|inst1~q\ & (\inst4|inst|inst8~q\ $ (\inst4|inst|inst~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|inst1~q\,
	datac => \inst4|inst|inst8~q\,
	datad => \inst4|inst|inst~q\,
	combout => \inst4|inst|inst3~combout\);

-- Location: FF_X112_Y36_N7
\inst4|inst|inst8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst3|inst|q2~clkctrl_outclk\,
	d => \inst4|inst|inst3~combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|inst|inst8~q\);

-- Location: LCCOMB_X112_Y36_N28
\inst|inst4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst4~0_combout\ = (\inst4|inst|inst~q\ & \inst4|inst|inst8~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst4|inst|inst~q\,
	datad => \inst4|inst|inst8~q\,
	combout => \inst|inst4~0_combout\);

-- Location: LCCOMB_X112_Y36_N0
\inst4|inst|inst11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4|inst|inst11~combout\ = (\inst5|inst1~q\ & (\inst4|inst|inst9~q\ $ (((\inst4|inst|inst~q\ & \inst4|inst|inst8~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|inst1~q\,
	datab => \inst4|inst|inst~q\,
	datac => \inst4|inst|inst9~q\,
	datad => \inst4|inst|inst8~q\,
	combout => \inst4|inst|inst11~combout\);

-- Location: FF_X112_Y36_N1
\inst4|inst|inst9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst3|inst|q2~clkctrl_outclk\,
	d => \inst4|inst|inst11~combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|inst|inst9~q\);

-- Location: LCCOMB_X112_Y36_N12
\inst4|inst|inst12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4|inst|inst12~combout\ = (\inst5|inst1~q\ & (\inst4|inst|inst10~q\ $ (((\inst|inst4~0_combout\ & \inst4|inst|inst9~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|inst1~q\,
	datab => \inst|inst4~0_combout\,
	datac => \inst4|inst|inst10~q\,
	datad => \inst4|inst|inst9~q\,
	combout => \inst4|inst|inst12~combout\);

-- Location: FF_X112_Y36_N13
\inst4|inst|inst10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst3|inst|q2~clkctrl_outclk\,
	d => \inst4|inst|inst12~combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|inst|inst10~q\);

-- Location: LCCOMB_X112_Y36_N24
\inst|inst3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst3~0_combout\ = (\inst4|inst|inst10~q\ & (((\inst4|inst|inst9~q\) # (!\inst4|inst|inst8~q\)))) # (!\inst4|inst|inst10~q\ & (\inst4|inst|inst~q\ & ((\inst4|inst|inst9~q\) # (!\inst4|inst|inst8~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst|inst10~q\,
	datab => \inst4|inst|inst~q\,
	datac => \inst4|inst|inst8~q\,
	datad => \inst4|inst|inst9~q\,
	combout => \inst|inst3~0_combout\);

ww_LEDR(0) <= \LEDR[0]~output_o\;
END structure;


