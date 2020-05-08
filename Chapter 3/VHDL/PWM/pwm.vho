-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"

-- DATE "05/05/2020 20:00:59"

-- 
-- Device: Altera EP2AGX45CU17I3 Package UFBGA358
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ARRIAII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ARRIAII.ARRIAII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	pwm IS
    PORT (
	set : IN std_logic;
	rst : IN std_logic;
	clk : IN std_logic;
	duty : IN std_logic_vector(7 DOWNTO 0);
	pwm_out : OUT std_logic
	);
END pwm;

-- Design Ports Information
-- pwm_out	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- duty[4]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- duty[6]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- duty[5]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- duty[7]	=>  Location: PIN_V4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- duty[0]	=>  Location: PIN_Y1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- duty[1]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- duty[2]	=>  Location: PIN_W1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- duty[3]	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- set	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF pwm IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_set : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_duty : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_pwm_out : std_logic;
SIGNAL \pwm_out~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \duty[5]~input_o\ : std_logic;
SIGNAL \duty[6]~input_o\ : std_logic;
SIGNAL \duty[4]~input_o\ : std_logic;
SIGNAL \duty[7]~input_o\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][11]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][10]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][9]~0_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][8]~1_combout\ : std_logic;
SIGNAL \duty[3]~input_o\ : std_logic;
SIGNAL \duty[0]~input_o\ : std_logic;
SIGNAL \duty[2]~input_o\ : std_logic;
SIGNAL \duty[1]~input_o\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][12]~2_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][7]~3_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][11]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][10]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][6]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][9]~4_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][5]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][8]~6_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][4]~5_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][7]~7_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][6]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_cout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_cout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_cout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~30\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37_sumout\ : std_logic;
SIGNAL \set~input_o\ : std_logic;
SIGNAL \half_new[1]~0_combout\ : std_logic;
SIGNAL \half[0]~0_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][12]~8_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~38\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41_sumout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33_sumout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29_sumout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25_sumout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21_sumout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17_sumout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13_sumout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \pwm_out~0_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \pwm_out~3_combout\ : std_logic;
SIGNAL \Add1~2\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~10\ : std_logic;
SIGNAL \Add1~14\ : std_logic;
SIGNAL \Add1~18\ : std_logic;
SIGNAL \Add1~22\ : std_logic;
SIGNAL \Add1~26\ : std_logic;
SIGNAL \Add1~29_sumout\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \pwm_out~2_combout\ : std_logic;
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \Add1~21_sumout\ : std_logic;
SIGNAL \Add1~25_sumout\ : std_logic;
SIGNAL \pwm_out~1_combout\ : std_logic;
SIGNAL \pwm_out~4_combout\ : std_logic;
SIGNAL \pwm_out~reg0_q\ : std_logic;
SIGNAL half_new : std_logic_vector(7 DOWNTO 0);
SIGNAL half : std_logic_vector(7 DOWNTO 0);
SIGNAL count : std_logic_vector(8 DOWNTO 0);
SIGNAL \Mult0|mult_core|ALT_INV_romout[1][5]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[0][10]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[1][6]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[0][11]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[1][7]~3_combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[0][12]~2_combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[1][8]~1_combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[1][9]~0_combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[1][10]~combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_pwm_out~3_combout\ : std_logic;
SIGNAL \ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL \ALT_INV_pwm_out~2_combout\ : std_logic;
SIGNAL \ALT_INV_pwm_out~1_combout\ : std_logic;
SIGNAL \ALT_INV_pwm_out~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1~2_combout\ : std_logic;
SIGNAL ALT_INV_half : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_Equal1~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ALT_INV_pwm_out~reg0_q\ : std_logic;
SIGNAL \ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~25_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~21_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL ALT_INV_count : std_logic_vector(8 DOWNTO 0);
SIGNAL \ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \ALT_INV_rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_set~input_o\ : std_logic;
SIGNAL \ALT_INV_duty[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_duty[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_duty[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_duty[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_duty[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_duty[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_duty[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_duty[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[1][12]~8_combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[1][11]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[0][6]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[0][7]~7_combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[0][8]~6_combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[1][4]~5_combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[0][9]~4_combout\ : std_logic;

BEGIN

ww_set <= set;
ww_rst <= rst;
ww_clk <= clk;
ww_duty <= duty;
pwm_out <= ww_pwm_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\Mult0|mult_core|ALT_INV_romout[1][5]~combout\ <= NOT \Mult0|mult_core|romout[1][5]~combout\;
\Mult0|mult_core|ALT_INV_romout[0][10]~combout\ <= NOT \Mult0|mult_core|romout[0][10]~combout\;
\Mult0|mult_core|ALT_INV_romout[1][6]~combout\ <= NOT \Mult0|mult_core|romout[1][6]~combout\;
\Mult0|mult_core|ALT_INV_romout[0][11]~combout\ <= NOT \Mult0|mult_core|romout[0][11]~combout\;
\Mult0|mult_core|ALT_INV_romout[1][7]~3_combout\ <= NOT \Mult0|mult_core|romout[1][7]~3_combout\;
\Mult0|mult_core|ALT_INV_romout[0][12]~2_combout\ <= NOT \Mult0|mult_core|romout[0][12]~2_combout\;
\Mult0|mult_core|ALT_INV_romout[1][8]~1_combout\ <= NOT \Mult0|mult_core|romout[1][8]~1_combout\;
\Mult0|mult_core|ALT_INV_romout[1][9]~0_combout\ <= NOT \Mult0|mult_core|romout[1][9]~0_combout\;
\Mult0|mult_core|ALT_INV_romout[1][10]~combout\ <= NOT \Mult0|mult_core|romout[1][10]~combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\ALT_INV_pwm_out~3_combout\ <= NOT \pwm_out~3_combout\;
\ALT_INV_Equal2~0_combout\ <= NOT \Equal2~0_combout\;
\ALT_INV_pwm_out~2_combout\ <= NOT \pwm_out~2_combout\;
\ALT_INV_pwm_out~1_combout\ <= NOT \pwm_out~1_combout\;
\ALT_INV_pwm_out~0_combout\ <= NOT \pwm_out~0_combout\;
\ALT_INV_Equal1~2_combout\ <= NOT \Equal1~2_combout\;
ALT_INV_half(4) <= NOT half(4);
ALT_INV_half(3) <= NOT half(3);
ALT_INV_half(2) <= NOT half(2);
\ALT_INV_Equal1~1_combout\ <= NOT \Equal1~1_combout\;
ALT_INV_half(1) <= NOT half(1);
ALT_INV_half(0) <= NOT half(0);
\ALT_INV_Equal1~0_combout\ <= NOT \Equal1~0_combout\;
ALT_INV_half(7) <= NOT half(7);
ALT_INV_half(6) <= NOT half(6);
ALT_INV_half(5) <= NOT half(5);
\ALT_INV_pwm_out~reg0_q\ <= NOT \pwm_out~reg0_q\;
\ALT_INV_Add1~29_sumout\ <= NOT \Add1~29_sumout\;
\ALT_INV_Add1~25_sumout\ <= NOT \Add1~25_sumout\;
\ALT_INV_Add1~21_sumout\ <= NOT \Add1~21_sumout\;
\ALT_INV_Add1~17_sumout\ <= NOT \Add1~17_sumout\;
\ALT_INV_Add1~13_sumout\ <= NOT \Add1~13_sumout\;
ALT_INV_count(2) <= NOT count(2);
ALT_INV_count(1) <= NOT count(1);
ALT_INV_count(0) <= NOT count(0);
ALT_INV_count(7) <= NOT count(7);
ALT_INV_count(6) <= NOT count(6);
ALT_INV_count(5) <= NOT count(5);
\ALT_INV_Add1~9_sumout\ <= NOT \Add1~9_sumout\;
ALT_INV_count(8) <= NOT count(8);
\ALT_INV_Add1~5_sumout\ <= NOT \Add1~5_sumout\;
\ALT_INV_Add1~1_sumout\ <= NOT \Add1~1_sumout\;
ALT_INV_count(4) <= NOT count(4);
ALT_INV_count(3) <= NOT count(3);
\ALT_INV_rst~inputclkctrl_outclk\ <= NOT \rst~inputclkctrl_outclk\;
\ALT_INV_set~input_o\ <= NOT \set~input_o\;
\ALT_INV_duty[3]~input_o\ <= NOT \duty[3]~input_o\;
\ALT_INV_duty[2]~input_o\ <= NOT \duty[2]~input_o\;
\ALT_INV_duty[1]~input_o\ <= NOT \duty[1]~input_o\;
\ALT_INV_duty[0]~input_o\ <= NOT \duty[0]~input_o\;
\ALT_INV_duty[7]~input_o\ <= NOT \duty[7]~input_o\;
\ALT_INV_duty[5]~input_o\ <= NOT \duty[5]~input_o\;
\ALT_INV_duty[6]~input_o\ <= NOT \duty[6]~input_o\;
\ALT_INV_duty[4]~input_o\ <= NOT \duty[4]~input_o\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\Mult0|mult_core|ALT_INV_romout[1][12]~8_combout\ <= NOT \Mult0|mult_core|romout[1][12]~8_combout\;
\Mult0|mult_core|ALT_INV_romout[1][11]~combout\ <= NOT \Mult0|mult_core|romout[1][11]~combout\;
\Mult0|mult_core|ALT_INV_romout[0][6]~combout\ <= NOT \Mult0|mult_core|romout[0][6]~combout\;
\Mult0|mult_core|ALT_INV_romout[0][7]~7_combout\ <= NOT \Mult0|mult_core|romout[0][7]~7_combout\;
\Mult0|mult_core|ALT_INV_romout[0][8]~6_combout\ <= NOT \Mult0|mult_core|romout[0][8]~6_combout\;
\Mult0|mult_core|ALT_INV_romout[1][4]~5_combout\ <= NOT \Mult0|mult_core|romout[1][4]~5_combout\;
\Mult0|mult_core|ALT_INV_romout[0][9]~4_combout\ <= NOT \Mult0|mult_core|romout[0][9]~4_combout\;

-- Location: IOOBUF_X43_Y0_N36
\pwm_out~output\ : arriaii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pwm_out~reg0_q\,
	devoe => ww_devoe,
	o => \pwm_out~output_o\);

-- Location: IOIBUF_X26_Y0_N32
\clk~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G7
\clk~inputclkctrl\ : arriaii_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LABCELL_X43_Y3_N20
\Add0~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( count(0) ) + ( VCC ) + ( !VCC ))
-- \Add0~2\ = CARRY(( count(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(0),
	cin => GND,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: IOIBUF_X26_Y0_N94
\rst~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: CLKCTRL_G6
\rst~inputclkctrl\ : arriaii_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst~inputclkctrl_outclk\);

-- Location: LABCELL_X43_Y3_N14
\Equal0~0\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( count(5) & ( count(6) & ( (count(8) & (count(7) & count(4))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(8),
	datac => ALT_INV_count(7),
	datad => ALT_INV_count(4),
	datae => ALT_INV_count(5),
	dataf => ALT_INV_count(6),
	combout => \Equal0~0_combout\);

-- Location: LABCELL_X43_Y3_N6
\Equal0~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( !count(3) & ( \Equal0~0_combout\ & ( (!count(2) & (count(1) & count(0))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(2),
	datac => ALT_INV_count(1),
	datad => ALT_INV_count(0),
	datae => ALT_INV_count(3),
	dataf => \ALT_INV_Equal0~0_combout\,
	combout => \Equal0~1_combout\);

-- Location: FF_X43_Y3_N21
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~1_sumout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sclr => \Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

-- Location: LABCELL_X43_Y3_N22
\Add0~5\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( count(1) ) + ( GND ) + ( \Add0~2\ ))
-- \Add0~6\ = CARRY(( count(1) ) + ( GND ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(1),
	cin => \Add0~2\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: FF_X43_Y3_N23
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~5_sumout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sclr => \Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

-- Location: LABCELL_X43_Y3_N24
\Add0~9\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( count(2) ) + ( GND ) + ( \Add0~6\ ))
-- \Add0~10\ = CARRY(( count(2) ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(2),
	cin => \Add0~6\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: FF_X43_Y3_N25
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~9_sumout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sclr => \Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

-- Location: LABCELL_X43_Y3_N26
\Add0~13\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( count(3) ) + ( GND ) + ( \Add0~10\ ))
-- \Add0~14\ = CARRY(( count(3) ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(3),
	cin => \Add0~10\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X43_Y3_N27
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~13_sumout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sclr => \Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: LABCELL_X43_Y3_N28
\Add0~17\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( count(4) ) + ( GND ) + ( \Add0~14\ ))
-- \Add0~18\ = CARRY(( count(4) ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(4),
	cin => \Add0~14\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X43_Y3_N29
\count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~17_sumout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sclr => \Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(4));

-- Location: LABCELL_X43_Y3_N30
\Add0~21\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( count(5) ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~22\ = CARRY(( count(5) ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(5),
	cin => \Add0~18\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X43_Y3_N31
\count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~21_sumout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sclr => \Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(5));

-- Location: LABCELL_X43_Y3_N32
\Add0~25\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( count(6) ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~26\ = CARRY(( count(6) ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(6),
	cin => \Add0~22\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X43_Y3_N33
\count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~25_sumout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sclr => \Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(6));

-- Location: LABCELL_X43_Y3_N34
\Add0~29\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( count(7) ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~30\ = CARRY(( count(7) ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(7),
	cin => \Add0~26\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: FF_X43_Y3_N35
\count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~29_sumout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sclr => \Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(7));

-- Location: LABCELL_X43_Y3_N36
\Add0~33\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( count(8) ) + ( GND ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(8),
	cin => \Add0~30\,
	sumout => \Add0~33_sumout\);

-- Location: FF_X43_Y3_N37
\count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~33_sumout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sclr => \Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(8));

-- Location: IOIBUF_X43_Y0_N94
\duty[5]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_duty(5),
	o => \duty[5]~input_o\);

-- Location: IOIBUF_X45_Y0_N94
\duty[6]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_duty(6),
	o => \duty[6]~input_o\);

-- Location: IOIBUF_X43_Y0_N63
\duty[4]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_duty(4),
	o => \duty[4]~input_o\);

-- Location: IOIBUF_X43_Y0_N1
\duty[7]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_duty(7),
	o => \duty[7]~input_o\);

-- Location: LABCELL_X40_Y3_N4
\Mult0|mult_core|romout[1][11]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][11]~combout\ = ( \duty[7]~input_o\ & ( !\duty[6]~input_o\ $ (((\duty[4]~input_o\) # (\duty[5]~input_o\))) ) ) # ( !\duty[7]~input_o\ & ( (\duty[6]~input_o\ & ((\duty[4]~input_o\) # (\duty[5]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001100010011100100111001001100010011000100111001001110010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[5]~input_o\,
	datab => \ALT_INV_duty[6]~input_o\,
	datac => \ALT_INV_duty[4]~input_o\,
	datae => \ALT_INV_duty[7]~input_o\,
	combout => \Mult0|mult_core|romout[1][11]~combout\);

-- Location: LABCELL_X40_Y3_N26
\Mult0|mult_core|romout[1][10]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][10]~combout\ = ( \duty[7]~input_o\ & ( \duty[5]~input_o\ & ( \duty[4]~input_o\ ) ) ) # ( !\duty[7]~input_o\ & ( \duty[5]~input_o\ & ( \duty[4]~input_o\ ) ) ) # ( \duty[7]~input_o\ & ( !\duty[5]~input_o\ & ( !\duty[4]~input_o\ ) 
-- ) ) # ( !\duty[7]~input_o\ & ( !\duty[5]~input_o\ & ( (!\duty[4]~input_o\ & \duty[6]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010101010101010101001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[4]~input_o\,
	datac => \ALT_INV_duty[6]~input_o\,
	datae => \ALT_INV_duty[7]~input_o\,
	dataf => \ALT_INV_duty[5]~input_o\,
	combout => \Mult0|mult_core|romout[1][10]~combout\);

-- Location: LABCELL_X40_Y3_N38
\Mult0|mult_core|romout[1][9]~0\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][9]~0_combout\ = ( \duty[7]~input_o\ & ( !\duty[4]~input_o\ ) ) # ( !\duty[7]~input_o\ & ( (!\duty[4]~input_o\ & ((\duty[6]~input_o\) # (\duty[5]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011100000000111111110000000001110111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[5]~input_o\,
	datab => \ALT_INV_duty[6]~input_o\,
	datad => \ALT_INV_duty[4]~input_o\,
	datae => \ALT_INV_duty[7]~input_o\,
	combout => \Mult0|mult_core|romout[1][9]~0_combout\);

-- Location: LABCELL_X40_Y3_N18
\Mult0|mult_core|romout[1][8]~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][8]~1_combout\ = ( \duty[7]~input_o\ & ( \duty[5]~input_o\ ) ) # ( !\duty[7]~input_o\ & ( \duty[5]~input_o\ ) ) # ( \duty[7]~input_o\ & ( !\duty[5]~input_o\ ) ) # ( !\duty[7]~input_o\ & ( !\duty[5]~input_o\ & ( 
-- (\duty[6]~input_o\) # (\duty[4]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[4]~input_o\,
	datac => \ALT_INV_duty[6]~input_o\,
	datae => \ALT_INV_duty[7]~input_o\,
	dataf => \ALT_INV_duty[5]~input_o\,
	combout => \Mult0|mult_core|romout[1][8]~1_combout\);

-- Location: IOIBUF_X33_Y0_N32
\duty[3]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_duty(3),
	o => \duty[3]~input_o\);

-- Location: IOIBUF_X33_Y0_N63
\duty[0]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_duty(0),
	o => \duty[0]~input_o\);

-- Location: IOIBUF_X33_Y0_N1
\duty[2]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_duty(2),
	o => \duty[2]~input_o\);

-- Location: IOIBUF_X33_Y0_N94
\duty[1]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_duty(1),
	o => \duty[1]~input_o\);

-- Location: LABCELL_X38_Y3_N24
\Mult0|mult_core|romout[0][12]~2\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][12]~2_combout\ = ( \duty[2]~input_o\ & ( \duty[1]~input_o\ & ( \duty[3]~input_o\ ) ) ) # ( !\duty[2]~input_o\ & ( \duty[1]~input_o\ & ( \duty[3]~input_o\ ) ) ) # ( \duty[2]~input_o\ & ( !\duty[1]~input_o\ & ( \duty[3]~input_o\ ) 
-- ) ) # ( !\duty[2]~input_o\ & ( !\duty[1]~input_o\ & ( (\duty[3]~input_o\ & \duty[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[3]~input_o\,
	datac => \ALT_INV_duty[0]~input_o\,
	datae => \ALT_INV_duty[2]~input_o\,
	dataf => \ALT_INV_duty[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][12]~2_combout\);

-- Location: LABCELL_X40_Y3_N30
\Mult0|mult_core|romout[1][7]~3\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][7]~3_combout\ = ( \duty[7]~input_o\ & ( (!\duty[6]~input_o\ & ((!\duty[5]~input_o\) # (!\duty[4]~input_o\))) ) ) # ( !\duty[7]~input_o\ & ( ((\duty[4]~input_o\) # (\duty[6]~input_o\)) # (\duty[5]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011111111111110011001000100001110111111111111100110010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[5]~input_o\,
	datab => \ALT_INV_duty[6]~input_o\,
	datad => \ALT_INV_duty[4]~input_o\,
	datae => \ALT_INV_duty[7]~input_o\,
	combout => \Mult0|mult_core|romout[1][7]~3_combout\);

-- Location: LABCELL_X38_Y3_N30
\Mult0|mult_core|romout[0][11]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][11]~combout\ = ( \duty[2]~input_o\ & ( \duty[1]~input_o\ ) ) # ( \duty[2]~input_o\ & ( !\duty[1]~input_o\ & ( \duty[0]~input_o\ ) ) ) # ( !\duty[2]~input_o\ & ( !\duty[1]~input_o\ & ( (!\duty[0]~input_o\ & \duty[3]~input_o\) ) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010010101010101010100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[0]~input_o\,
	datad => \ALT_INV_duty[3]~input_o\,
	datae => \ALT_INV_duty[2]~input_o\,
	dataf => \ALT_INV_duty[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][11]~combout\);

-- Location: LABCELL_X38_Y3_N10
\Mult0|mult_core|romout[0][10]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][10]~combout\ = ( \duty[2]~input_o\ & ( \duty[1]~input_o\ & ( \duty[0]~input_o\ ) ) ) # ( !\duty[2]~input_o\ & ( \duty[1]~input_o\ & ( \duty[0]~input_o\ ) ) ) # ( \duty[2]~input_o\ & ( !\duty[1]~input_o\ & ( !\duty[0]~input_o\ ) 
-- ) ) # ( !\duty[2]~input_o\ & ( !\duty[1]~input_o\ & ( (!\duty[0]~input_o\ & \duty[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010101010101010101001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[0]~input_o\,
	datad => \ALT_INV_duty[3]~input_o\,
	datae => \ALT_INV_duty[2]~input_o\,
	dataf => \ALT_INV_duty[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][10]~combout\);

-- Location: LABCELL_X40_Y3_N34
\Mult0|mult_core|romout[1][6]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][6]~combout\ = ( \duty[7]~input_o\ & ( ((\duty[5]~input_o\ & \duty[4]~input_o\)) # (\duty[6]~input_o\) ) ) # ( !\duty[7]~input_o\ & ( (!\duty[5]~input_o\ & ((\duty[4]~input_o\) # (\duty[6]~input_o\))) # (\duty[5]~input_o\ & 
-- (!\duty[6]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011011101110001100110111011101100110111011100011001101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[5]~input_o\,
	datab => \ALT_INV_duty[6]~input_o\,
	datad => \ALT_INV_duty[4]~input_o\,
	datae => \ALT_INV_duty[7]~input_o\,
	combout => \Mult0|mult_core|romout[1][6]~combout\);

-- Location: LABCELL_X38_Y3_N20
\Mult0|mult_core|romout[0][9]~4\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][9]~4_combout\ = ( \duty[2]~input_o\ & ( \duty[1]~input_o\ & ( !\duty[0]~input_o\ ) ) ) # ( !\duty[2]~input_o\ & ( \duty[1]~input_o\ & ( !\duty[0]~input_o\ ) ) ) # ( \duty[2]~input_o\ & ( !\duty[1]~input_o\ & ( !\duty[0]~input_o\ 
-- ) ) ) # ( !\duty[2]~input_o\ & ( !\duty[1]~input_o\ & ( (\duty[3]~input_o\ & !\duty[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[3]~input_o\,
	datac => \ALT_INV_duty[0]~input_o\,
	datae => \ALT_INV_duty[2]~input_o\,
	dataf => \ALT_INV_duty[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][9]~4_combout\);

-- Location: LABCELL_X40_Y3_N22
\Mult0|mult_core|romout[1][5]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][5]~combout\ = ( \duty[7]~input_o\ & ( \duty[5]~input_o\ & ( (\duty[4]~input_o\ & !\duty[6]~input_o\) ) ) ) # ( !\duty[7]~input_o\ & ( \duty[5]~input_o\ & ( (!\duty[4]~input_o\) # (\duty[6]~input_o\) ) ) ) # ( \duty[7]~input_o\ & 
-- ( !\duty[5]~input_o\ & ( (!\duty[4]~input_o\) # (\duty[6]~input_o\) ) ) ) # ( !\duty[7]~input_o\ & ( !\duty[5]~input_o\ & ( (\duty[4]~input_o\ & !\duty[6]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000101011111010111110101111101011110101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[4]~input_o\,
	datac => \ALT_INV_duty[6]~input_o\,
	datae => \ALT_INV_duty[7]~input_o\,
	dataf => \ALT_INV_duty[5]~input_o\,
	combout => \Mult0|mult_core|romout[1][5]~combout\);

-- Location: LABCELL_X38_Y3_N18
\Mult0|mult_core|romout[0][8]~6\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][8]~6_combout\ = ( \duty[2]~input_o\ & ( \duty[1]~input_o\ ) ) # ( !\duty[2]~input_o\ & ( \duty[1]~input_o\ ) ) # ( \duty[2]~input_o\ & ( !\duty[1]~input_o\ ) ) # ( !\duty[2]~input_o\ & ( !\duty[1]~input_o\ & ( 
-- (\duty[3]~input_o\) # (\duty[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[0]~input_o\,
	datad => \ALT_INV_duty[3]~input_o\,
	datae => \ALT_INV_duty[2]~input_o\,
	dataf => \ALT_INV_duty[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][8]~6_combout\);

-- Location: LABCELL_X40_Y3_N10
\Mult0|mult_core|romout[1][4]~5\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][4]~5_combout\ = ( \duty[6]~input_o\ & ( !\duty[4]~input_o\ ) ) # ( !\duty[6]~input_o\ & ( \duty[4]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111111111110000000000000000111111111111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_duty[4]~input_o\,
	datae => \ALT_INV_duty[6]~input_o\,
	combout => \Mult0|mult_core|romout[1][4]~5_combout\);

-- Location: LABCELL_X38_Y3_N38
\Mult0|mult_core|romout[0][7]~7\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][7]~7_combout\ = ( \duty[2]~input_o\ & ( \duty[1]~input_o\ & ( !\duty[3]~input_o\ ) ) ) # ( !\duty[2]~input_o\ & ( \duty[1]~input_o\ & ( (!\duty[3]~input_o\) # (!\duty[0]~input_o\) ) ) ) # ( \duty[2]~input_o\ & ( 
-- !\duty[1]~input_o\ & ( !\duty[3]~input_o\ ) ) ) # ( !\duty[2]~input_o\ & ( !\duty[1]~input_o\ & ( (\duty[0]~input_o\) # (\duty[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111111111101010101010101011111111101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[3]~input_o\,
	datad => \ALT_INV_duty[0]~input_o\,
	datae => \ALT_INV_duty[2]~input_o\,
	dataf => \ALT_INV_duty[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][7]~7_combout\);

-- Location: LABCELL_X38_Y3_N32
\Mult0|mult_core|romout[0][6]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][6]~combout\ = ( \duty[2]~input_o\ & ( \duty[1]~input_o\ & ( \duty[3]~input_o\ ) ) ) # ( !\duty[2]~input_o\ & ( \duty[1]~input_o\ & ( (!\duty[3]~input_o\) # (\duty[0]~input_o\) ) ) ) # ( \duty[2]~input_o\ & ( !\duty[1]~input_o\ ) 
-- ) # ( !\duty[2]~input_o\ & ( !\duty[1]~input_o\ & ( (\duty[0]~input_o\ & !\duty[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000111111111111111111110101111101010000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[0]~input_o\,
	datac => \ALT_INV_duty[3]~input_o\,
	datae => \ALT_INV_duty[2]~input_o\,
	dataf => \ALT_INV_duty[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][6]~combout\);

-- Location: MLABCELL_X39_Y3_N0
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_cout\ = CARRY(( \Mult0|mult_core|romout[0][6]~combout\ ) + ( \duty[4]~input_o\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mult0|mult_core|ALT_INV_romout[0][6]~combout\,
	dataf => \ALT_INV_duty[4]~input_o\,
	cin => GND,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_cout\);

-- Location: MLABCELL_X39_Y3_N2
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_cout\ = CARRY(( \Mult0|mult_core|romout[0][7]~7_combout\ ) + ( \duty[5]~input_o\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mult0|mult_core|ALT_INV_romout[0][7]~7_combout\,
	dataf => \ALT_INV_duty[5]~input_o\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_cout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_cout\);

-- Location: MLABCELL_X39_Y3_N4
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_cout\ = CARRY(( \Mult0|mult_core|romout[0][8]~6_combout\ ) + ( \Mult0|mult_core|romout[1][4]~5_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mult0|mult_core|ALT_INV_romout[0][8]~6_combout\,
	dataf => \Mult0|mult_core|ALT_INV_romout[1][4]~5_combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_cout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_cout\);

-- Location: MLABCELL_X39_Y3_N6
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13_sumout\ = SUM(( \Mult0|mult_core|romout[0][9]~4_combout\ ) + ( \Mult0|mult_core|romout[1][5]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_cout\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\ = CARRY(( \Mult0|mult_core|romout[0][9]~4_combout\ ) + ( \Mult0|mult_core|romout[1][5]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|mult_core|ALT_INV_romout[0][9]~4_combout\,
	dataf => \Mult0|mult_core|ALT_INV_romout[1][5]~combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_cout\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\);

-- Location: MLABCELL_X39_Y3_N8
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17_sumout\ = SUM(( \Mult0|mult_core|romout[0][10]~combout\ ) + ( \Mult0|mult_core|romout[1][6]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\ = CARRY(( \Mult0|mult_core|romout[0][10]~combout\ ) + ( \Mult0|mult_core|romout[1][6]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mult0|mult_core|ALT_INV_romout[0][10]~combout\,
	dataf => \Mult0|mult_core|ALT_INV_romout[1][6]~combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\);

-- Location: MLABCELL_X39_Y3_N10
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21_sumout\ = SUM(( \Mult0|mult_core|romout[1][7]~3_combout\ ) + ( \Mult0|mult_core|romout[0][11]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\ = CARRY(( \Mult0|mult_core|romout[1][7]~3_combout\ ) + ( \Mult0|mult_core|romout[0][11]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mult0|mult_core|ALT_INV_romout[1][7]~3_combout\,
	dataf => \Mult0|mult_core|ALT_INV_romout[0][11]~combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\);

-- Location: MLABCELL_X39_Y3_N12
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25_sumout\ = SUM(( \Mult0|mult_core|romout[1][8]~1_combout\ ) + ( \Mult0|mult_core|romout[0][12]~2_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26\ = CARRY(( \Mult0|mult_core|romout[1][8]~1_combout\ ) + ( \Mult0|mult_core|romout[0][12]~2_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mult0|mult_core|ALT_INV_romout[1][8]~1_combout\,
	dataf => \Mult0|mult_core|ALT_INV_romout[0][12]~2_combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26\);

-- Location: MLABCELL_X39_Y3_N14
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29_sumout\ = SUM(( GND ) + ( \Mult0|mult_core|romout[1][9]~0_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~30\ = CARRY(( GND ) + ( \Mult0|mult_core|romout[1][9]~0_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \Mult0|mult_core|ALT_INV_romout[1][9]~0_combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~30\);

-- Location: MLABCELL_X39_Y3_N16
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33_sumout\ = SUM(( \Mult0|mult_core|romout[1][10]~combout\ ) + ( GND ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~30\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34\ = CARRY(( \Mult0|mult_core|romout[1][10]~combout\ ) + ( GND ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mult0|mult_core|ALT_INV_romout[1][10]~combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~30\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34\);

-- Location: MLABCELL_X39_Y3_N18
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37_sumout\ = SUM(( GND ) + ( \Mult0|mult_core|romout[1][11]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~38\ = CARRY(( GND ) + ( \Mult0|mult_core|romout[1][11]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \Mult0|mult_core|ALT_INV_romout[1][11]~combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~38\);

-- Location: IOIBUF_X32_Y0_N32
\set~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_set,
	o => \set~input_o\);

-- Location: MLABCELL_X39_Y3_N32
\half_new[1]~0\ : arriaii_lcell_comb
-- Equation(s):
-- \half_new[1]~0_combout\ = ( \set~input_o\ & ( !\rst~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_rst~input_o\,
	dataf => \ALT_INV_set~input_o\,
	combout => \half_new[1]~0_combout\);

-- Location: FF_X39_Y3_N19
\half_new[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37_sumout\,
	ena => \half_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half_new(6));

-- Location: LABCELL_X43_Y3_N18
\half[0]~0\ : arriaii_lcell_comb
-- Equation(s):
-- \half[0]~0_combout\ = ( !count(3) & ( \Equal0~0_combout\ & ( (!count(2) & (!\rst~input_o\ & (count(1) & count(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000010000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(2),
	datab => \ALT_INV_rst~input_o\,
	datac => ALT_INV_count(1),
	datad => ALT_INV_count(0),
	datae => ALT_INV_count(3),
	dataf => \ALT_INV_Equal0~0_combout\,
	combout => \half[0]~0_combout\);

-- Location: FF_X43_Y3_N11
\half[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => half_new(6),
	sload => VCC,
	ena => \half[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half(6));

-- Location: LABCELL_X40_Y3_N0
\Mult0|mult_core|romout[1][12]~8\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][12]~8_combout\ = ( \duty[7]~input_o\ & ( \duty[5]~input_o\ ) ) # ( \duty[7]~input_o\ & ( !\duty[5]~input_o\ & ( (\duty[6]~input_o\) # (\duty[4]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101011111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_duty[4]~input_o\,
	datad => \ALT_INV_duty[6]~input_o\,
	datae => \ALT_INV_duty[7]~input_o\,
	dataf => \ALT_INV_duty[5]~input_o\,
	combout => \Mult0|mult_core|romout[1][12]~8_combout\);

-- Location: MLABCELL_X39_Y3_N20
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41_sumout\ = SUM(( GND ) + ( \Mult0|mult_core|romout[1][12]~8_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \Mult0|mult_core|ALT_INV_romout[1][12]~8_combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~38\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41_sumout\);

-- Location: FF_X39_Y3_N21
\half_new[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41_sumout\,
	ena => \half_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half_new(7));

-- Location: FF_X43_Y3_N13
\half[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => half_new(7),
	sload => VCC,
	ena => \half[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half(7));

-- Location: FF_X39_Y3_N17
\half_new[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33_sumout\,
	ena => \half_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half_new(5));

-- Location: FF_X42_Y3_N15
\half[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => half_new(5),
	sload => VCC,
	ena => \half[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half(5));

-- Location: LABCELL_X43_Y3_N2
\Equal1~0\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = ( count(7) & ( half(5) & ( (count(5) & (half(7) & (!count(6) $ (half(6))))) ) ) ) # ( !count(7) & ( half(5) & ( (count(5) & (!half(7) & (!count(6) $ (half(6))))) ) ) ) # ( count(7) & ( !half(5) & ( (!count(5) & (half(7) & (!count(6) $ 
-- (half(6))))) ) ) ) # ( !count(7) & ( !half(5) & ( (!count(5) & (!half(7) & (!count(6) $ (half(6))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001000000000000000000001001000000001001000000000000000000001001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(6),
	datab => ALT_INV_half(6),
	datac => ALT_INV_count(5),
	datad => ALT_INV_half(7),
	datae => ALT_INV_count(7),
	dataf => ALT_INV_half(5),
	combout => \Equal1~0_combout\);

-- Location: FF_X39_Y3_N15
\half_new[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29_sumout\,
	ena => \half_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half_new(4));

-- Location: FF_X42_Y3_N9
\half[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => half_new(4),
	sload => VCC,
	ena => \half[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half(4));

-- Location: FF_X39_Y3_N13
\half_new[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25_sumout\,
	ena => \half_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half_new(3));

-- Location: FF_X42_Y3_N7
\half[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => half_new(3),
	sload => VCC,
	ena => \half[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half(3));

-- Location: FF_X39_Y3_N11
\half_new[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21_sumout\,
	ena => \half_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half_new(2));

-- Location: FF_X42_Y3_N3
\half[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => half_new(2),
	sload => VCC,
	ena => \half[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half(2));

-- Location: MLABCELL_X42_Y3_N0
\Equal1~2\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = ( count(3) & ( half(2) & ( (count(2) & (half(3) & (!half(4) $ (count(4))))) ) ) ) # ( !count(3) & ( half(2) & ( (count(2) & (!half(3) & (!half(4) $ (count(4))))) ) ) ) # ( count(3) & ( !half(2) & ( (!count(2) & (half(3) & (!half(4) $ 
-- (count(4))))) ) ) ) # ( !count(3) & ( !half(2) & ( (!count(2) & (!half(3) & (!half(4) $ (count(4))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000001000000000010000000010000100000000100000000001000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_half(4),
	datab => ALT_INV_count(2),
	datac => ALT_INV_half(3),
	datad => ALT_INV_count(4),
	datae => ALT_INV_count(3),
	dataf => ALT_INV_half(2),
	combout => \Equal1~2_combout\);

-- Location: FF_X39_Y3_N9
\half_new[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17_sumout\,
	ena => \half_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half_new(1));

-- Location: FF_X43_Y3_N5
\half[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => half_new(1),
	sload => VCC,
	ena => \half[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half(1));

-- Location: FF_X39_Y3_N7
\half_new[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13_sumout\,
	ena => \half_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half_new(0));

-- Location: FF_X42_Y3_N19
\half[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => half_new(0),
	sload => VCC,
	ena => \half[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => half(0));

-- Location: LABCELL_X43_Y3_N8
\Equal1~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = ( count(1) & ( count(0) & ( (!count(8) & (half(1) & half(0))) ) ) ) # ( !count(1) & ( count(0) & ( (!count(8) & (!half(1) & half(0))) ) ) ) # ( count(1) & ( !count(0) & ( (!count(8) & (half(1) & !half(0))) ) ) ) # ( !count(1) & ( 
-- !count(0) & ( (!count(8) & (!half(1) & !half(0))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000000011000000000000000000110000000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(8),
	datac => ALT_INV_half(1),
	datad => ALT_INV_half(0),
	datae => ALT_INV_count(1),
	dataf => ALT_INV_count(0),
	combout => \Equal1~1_combout\);

-- Location: MLABCELL_X42_Y3_N36
\pwm_out~0\ : arriaii_lcell_comb
-- Equation(s):
-- \pwm_out~0_combout\ = ( \Equal1~1_combout\ & ( (\pwm_out~reg0_q\ & ((!\Equal1~0_combout\) # (!\Equal1~2_combout\))) ) ) # ( !\Equal1~1_combout\ & ( \pwm_out~reg0_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100000011001100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_pwm_out~reg0_q\,
	datac => \ALT_INV_Equal1~0_combout\,
	datad => \ALT_INV_Equal1~2_combout\,
	dataf => \ALT_INV_Equal1~1_combout\,
	combout => \pwm_out~0_combout\);

-- Location: MLABCELL_X42_Y3_N38
\Equal2~0\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = ( half(0) & ( !count(0) ) ) # ( !half(0) & ( count(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(0),
	dataf => ALT_INV_half(0),
	combout => \Equal2~0_combout\);

-- Location: MLABCELL_X42_Y3_N20
\Add1~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( !half(0) ) + ( !half(1) ) + ( !VCC ))
-- \Add1~2\ = CARRY(( !half(0) ) + ( !half(1) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_half(0),
	dataf => ALT_INV_half(1),
	cin => GND,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\);

-- Location: MLABCELL_X42_Y3_N4
\pwm_out~3\ : arriaii_lcell_comb
-- Equation(s):
-- \pwm_out~3_combout\ = ( \Equal1~2_combout\ & ( \Add1~1_sumout\ & ( (count(1) & (!\Equal2~0_combout\ & ((!\Equal1~0_combout\) # (!\Equal1~1_combout\)))) ) ) ) # ( !\Equal1~2_combout\ & ( \Add1~1_sumout\ & ( (count(1) & !\Equal2~0_combout\) ) ) ) # ( 
-- \Equal1~2_combout\ & ( !\Add1~1_sumout\ & ( (!count(1) & (!\Equal2~0_combout\ & ((!\Equal1~0_combout\) # (!\Equal1~1_combout\)))) ) ) ) # ( !\Equal1~2_combout\ & ( !\Add1~1_sumout\ & ( (!count(1) & !\Equal2~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000110000001000000000110000001100000011000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal1~0_combout\,
	datab => ALT_INV_count(1),
	datac => \ALT_INV_Equal2~0_combout\,
	datad => \ALT_INV_Equal1~1_combout\,
	datae => \ALT_INV_Equal1~2_combout\,
	dataf => \ALT_INV_Add1~1_sumout\,
	combout => \pwm_out~3_combout\);

-- Location: MLABCELL_X42_Y3_N22
\Add1~5\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( VCC ) + ( !half(2) ) + ( \Add1~2\ ))
-- \Add1~6\ = CARRY(( VCC ) + ( !half(2) ) + ( \Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_half(2),
	cin => \Add1~2\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\);

-- Location: MLABCELL_X42_Y3_N24
\Add1~9\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( GND ) + ( !half(3) ) + ( \Add1~6\ ))
-- \Add1~10\ = CARRY(( GND ) + ( !half(3) ) + ( \Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_half(3),
	cin => \Add1~6\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\);

-- Location: MLABCELL_X42_Y3_N26
\Add1~13\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( !half(4) ) + ( VCC ) + ( \Add1~10\ ))
-- \Add1~14\ = CARRY(( !half(4) ) + ( VCC ) + ( \Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_half(4),
	cin => \Add1~10\,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\);

-- Location: MLABCELL_X42_Y3_N28
\Add1~17\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( VCC ) + ( !half(5) ) + ( \Add1~14\ ))
-- \Add1~18\ = CARRY(( VCC ) + ( !half(5) ) + ( \Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_half(5),
	cin => \Add1~14\,
	sumout => \Add1~17_sumout\,
	cout => \Add1~18\);

-- Location: MLABCELL_X42_Y3_N30
\Add1~21\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~21_sumout\ = SUM(( VCC ) + ( !half(6) ) + ( \Add1~18\ ))
-- \Add1~22\ = CARRY(( VCC ) + ( !half(6) ) + ( \Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_half(6),
	cin => \Add1~18\,
	sumout => \Add1~21_sumout\,
	cout => \Add1~22\);

-- Location: MLABCELL_X42_Y3_N32
\Add1~25\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~25_sumout\ = SUM(( !half(7) ) + ( VCC ) + ( \Add1~22\ ))
-- \Add1~26\ = CARRY(( !half(7) ) + ( VCC ) + ( \Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_half(7),
	cin => \Add1~22\,
	sumout => \Add1~25_sumout\,
	cout => \Add1~26\);

-- Location: MLABCELL_X42_Y3_N34
\Add1~29\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~29_sumout\ = SUM(( VCC ) + ( GND ) + ( \Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \Add1~26\,
	sumout => \Add1~29_sumout\);

-- Location: MLABCELL_X42_Y3_N12
\pwm_out~2\ : arriaii_lcell_comb
-- Equation(s):
-- \pwm_out~2_combout\ = ( \Add1~5_sumout\ & ( \Add1~13_sumout\ & ( (count(4) & (count(2) & (!count(3) $ (\Add1~9_sumout\)))) ) ) ) # ( !\Add1~5_sumout\ & ( \Add1~13_sumout\ & ( (count(4) & (!count(2) & (!count(3) $ (\Add1~9_sumout\)))) ) ) ) # ( 
-- \Add1~5_sumout\ & ( !\Add1~13_sumout\ & ( (!count(4) & (count(2) & (!count(3) $ (\Add1~9_sumout\)))) ) ) ) # ( !\Add1~5_sumout\ & ( !\Add1~13_sumout\ & ( (!count(4) & (!count(2) & (!count(3) $ (\Add1~9_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001000000000000000001000001001000001000000000000000001000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(4),
	datab => ALT_INV_count(3),
	datac => \ALT_INV_Add1~9_sumout\,
	datad => ALT_INV_count(2),
	datae => \ALT_INV_Add1~5_sumout\,
	dataf => \ALT_INV_Add1~13_sumout\,
	combout => \pwm_out~2_combout\);

-- Location: MLABCELL_X42_Y3_N10
\pwm_out~1\ : arriaii_lcell_comb
-- Equation(s):
-- \pwm_out~1_combout\ = ( \Add1~21_sumout\ & ( \Add1~25_sumout\ & ( (count(7) & (count(6) & (!count(5) $ (\Add1~17_sumout\)))) ) ) ) # ( !\Add1~21_sumout\ & ( \Add1~25_sumout\ & ( (count(7) & (!count(6) & (!count(5) $ (\Add1~17_sumout\)))) ) ) ) # ( 
-- \Add1~21_sumout\ & ( !\Add1~25_sumout\ & ( (!count(7) & (count(6) & (!count(5) $ (\Add1~17_sumout\)))) ) ) ) # ( !\Add1~21_sumout\ & ( !\Add1~25_sumout\ & ( (!count(7) & (!count(6) & (!count(5) $ (\Add1~17_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000001000001000000000001001000000000001000001000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(7),
	datab => ALT_INV_count(6),
	datac => ALT_INV_count(5),
	datad => \ALT_INV_Add1~17_sumout\,
	datae => \ALT_INV_Add1~21_sumout\,
	dataf => \ALT_INV_Add1~25_sumout\,
	combout => \pwm_out~1_combout\);

-- Location: MLABCELL_X42_Y3_N16
\pwm_out~4\ : arriaii_lcell_comb
-- Equation(s):
-- \pwm_out~4_combout\ = ( \pwm_out~2_combout\ & ( \pwm_out~1_combout\ & ( ((\pwm_out~3_combout\ & (!count(8) $ (!\Add1~29_sumout\)))) # (\pwm_out~0_combout\) ) ) ) # ( !\pwm_out~2_combout\ & ( \pwm_out~1_combout\ & ( \pwm_out~0_combout\ ) ) ) # ( 
-- \pwm_out~2_combout\ & ( !\pwm_out~1_combout\ & ( \pwm_out~0_combout\ ) ) ) # ( !\pwm_out~2_combout\ & ( !\pwm_out~1_combout\ & ( \pwm_out~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011011100111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(8),
	datab => \ALT_INV_pwm_out~0_combout\,
	datac => \ALT_INV_pwm_out~3_combout\,
	datad => \ALT_INV_Add1~29_sumout\,
	datae => \ALT_INV_pwm_out~2_combout\,
	dataf => \ALT_INV_pwm_out~1_combout\,
	combout => \pwm_out~4_combout\);

-- Location: FF_X42_Y3_N17
\pwm_out~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pwm_out~4_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pwm_out~reg0_q\);

ww_pwm_out <= \pwm_out~output_o\;
END structure;


