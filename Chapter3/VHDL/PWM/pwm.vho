-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "05/06/2020 16:50:11"

-- 
-- Device: Altera EP2AGX45CU17C4 Package UFBGA358
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
	clk : IN std_logic;
	rst : IN std_logic;
	D : IN std_logic_vector(7 DOWNTO 0);
	adjust : IN std_logic;
	pwmout : OUT std_logic;
	direction : OUT std_logic
	);
END pwm;

-- Design Ports Information
-- pwmout	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- direction	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[4]	=>  Location: PIN_V1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[6]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[5]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[7]	=>  Location: PIN_V2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[0]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[1]	=>  Location: PIN_V4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[2]	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[3]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- adjust	=>  Location: PIN_U3,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_D : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_adjust : std_logic;
SIGNAL ww_pwmout : std_logic;
SIGNAL ww_direction : std_logic;
SIGNAL \pwmout~output_o\ : std_logic;
SIGNAL \direction~output_o\ : std_logic;
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
SIGNAL \D[7]~input_o\ : std_logic;
SIGNAL \D[5]~input_o\ : std_logic;
SIGNAL \D[4]~input_o\ : std_logic;
SIGNAL \D[6]~input_o\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][12]~8_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][11]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][10]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][9]~0_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][8]~1_combout\ : std_logic;
SIGNAL \D[3]~input_o\ : std_logic;
SIGNAL \D[2]~input_o\ : std_logic;
SIGNAL \D[1]~input_o\ : std_logic;
SIGNAL \D[0]~input_o\ : std_logic;
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
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~38\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41_sumout\ : std_logic;
SIGNAL \adjust~input_o\ : std_logic;
SIGNAL \halfDnew[1]~0_combout\ : std_logic;
SIGNAL \halfD[0]~0_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37_sumout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33_sumout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29_sumout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25_sumout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21_sumout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13_sumout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17_sumout\ : std_logic;
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
SIGNAL \pwmout~2_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \pwmout~3_combout\ : std_logic;
SIGNAL \pwmout~0_combout\ : std_logic;
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \Add1~21_sumout\ : std_logic;
SIGNAL \Add1~25_sumout\ : std_logic;
SIGNAL \pwmout~1_combout\ : std_logic;
SIGNAL \pwmout~4_combout\ : std_logic;
SIGNAL \pwmout~reg0_q\ : std_logic;
SIGNAL halfDnew : std_logic_vector(7 DOWNTO 0);
SIGNAL halfD : std_logic_vector(7 DOWNTO 0);
SIGNAL counter : std_logic_vector(8 DOWNTO 0);
SIGNAL \ALT_INV_rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_adjust~input_o\ : std_logic;
SIGNAL \ALT_INV_D[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_D[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_D[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_D[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_D[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_D[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_D[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_D[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[1][12]~8_combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[1][11]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[0][6]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[0][7]~7_combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[0][8]~6_combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[1][4]~5_combout\ : std_logic;
SIGNAL \Mult0|mult_core|ALT_INV_romout[0][9]~4_combout\ : std_logic;
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
SIGNAL \ALT_INV_pwmout~3_combout\ : std_logic;
SIGNAL \ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL \ALT_INV_pwmout~2_combout\ : std_logic;
SIGNAL \ALT_INV_pwmout~1_combout\ : std_logic;
SIGNAL \ALT_INV_pwmout~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1~2_combout\ : std_logic;
SIGNAL ALT_INV_halfD : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_Equal1~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ALT_INV_pwmout~reg0_q\ : std_logic;
SIGNAL \ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~25_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~21_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL ALT_INV_counter : std_logic_vector(8 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_D <= D;
ww_adjust <= adjust;
pwmout <= ww_pwmout;
direction <= ww_direction;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_rst~inputclkctrl_outclk\ <= NOT \rst~inputclkctrl_outclk\;
\ALT_INV_adjust~input_o\ <= NOT \adjust~input_o\;
\ALT_INV_D[3]~input_o\ <= NOT \D[3]~input_o\;
\ALT_INV_D[2]~input_o\ <= NOT \D[2]~input_o\;
\ALT_INV_D[1]~input_o\ <= NOT \D[1]~input_o\;
\ALT_INV_D[0]~input_o\ <= NOT \D[0]~input_o\;
\ALT_INV_D[7]~input_o\ <= NOT \D[7]~input_o\;
\ALT_INV_D[5]~input_o\ <= NOT \D[5]~input_o\;
\ALT_INV_D[6]~input_o\ <= NOT \D[6]~input_o\;
\ALT_INV_D[4]~input_o\ <= NOT \D[4]~input_o\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\Mult0|mult_core|ALT_INV_romout[1][12]~8_combout\ <= NOT \Mult0|mult_core|romout[1][12]~8_combout\;
\Mult0|mult_core|ALT_INV_romout[1][11]~combout\ <= NOT \Mult0|mult_core|romout[1][11]~combout\;
\Mult0|mult_core|ALT_INV_romout[0][6]~combout\ <= NOT \Mult0|mult_core|romout[0][6]~combout\;
\Mult0|mult_core|ALT_INV_romout[0][7]~7_combout\ <= NOT \Mult0|mult_core|romout[0][7]~7_combout\;
\Mult0|mult_core|ALT_INV_romout[0][8]~6_combout\ <= NOT \Mult0|mult_core|romout[0][8]~6_combout\;
\Mult0|mult_core|ALT_INV_romout[1][4]~5_combout\ <= NOT \Mult0|mult_core|romout[1][4]~5_combout\;
\Mult0|mult_core|ALT_INV_romout[0][9]~4_combout\ <= NOT \Mult0|mult_core|romout[0][9]~4_combout\;
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
\ALT_INV_pwmout~3_combout\ <= NOT \pwmout~3_combout\;
\ALT_INV_Equal2~0_combout\ <= NOT \Equal2~0_combout\;
\ALT_INV_pwmout~2_combout\ <= NOT \pwmout~2_combout\;
\ALT_INV_pwmout~1_combout\ <= NOT \pwmout~1_combout\;
\ALT_INV_pwmout~0_combout\ <= NOT \pwmout~0_combout\;
\ALT_INV_Equal1~2_combout\ <= NOT \Equal1~2_combout\;
ALT_INV_halfD(4) <= NOT halfD(4);
ALT_INV_halfD(3) <= NOT halfD(3);
ALT_INV_halfD(2) <= NOT halfD(2);
\ALT_INV_Equal1~1_combout\ <= NOT \Equal1~1_combout\;
ALT_INV_halfD(1) <= NOT halfD(1);
ALT_INV_halfD(0) <= NOT halfD(0);
\ALT_INV_Equal1~0_combout\ <= NOT \Equal1~0_combout\;
ALT_INV_halfD(7) <= NOT halfD(7);
ALT_INV_halfD(6) <= NOT halfD(6);
ALT_INV_halfD(5) <= NOT halfD(5);
\ALT_INV_pwmout~reg0_q\ <= NOT \pwmout~reg0_q\;
\ALT_INV_Add1~29_sumout\ <= NOT \Add1~29_sumout\;
\ALT_INV_Add1~25_sumout\ <= NOT \Add1~25_sumout\;
\ALT_INV_Add1~21_sumout\ <= NOT \Add1~21_sumout\;
\ALT_INV_Add1~17_sumout\ <= NOT \Add1~17_sumout\;
\ALT_INV_Add1~13_sumout\ <= NOT \Add1~13_sumout\;
\ALT_INV_Add1~9_sumout\ <= NOT \Add1~9_sumout\;
\ALT_INV_Add1~5_sumout\ <= NOT \Add1~5_sumout\;
\ALT_INV_Add1~1_sumout\ <= NOT \Add1~1_sumout\;
ALT_INV_counter(4) <= NOT counter(4);
ALT_INV_counter(3) <= NOT counter(3);
ALT_INV_counter(2) <= NOT counter(2);
ALT_INV_counter(1) <= NOT counter(1);
ALT_INV_counter(0) <= NOT counter(0);
ALT_INV_counter(7) <= NOT counter(7);
ALT_INV_counter(6) <= NOT counter(6);
ALT_INV_counter(5) <= NOT counter(5);
ALT_INV_counter(8) <= NOT counter(8);

-- Location: IOOBUF_X33_Y0_N33
\pwmout~output\ : arriaii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pwmout~reg0_q\,
	devoe => ww_devoe,
	o => \pwmout~output_o\);

-- Location: IOOBUF_X8_Y56_N67
\direction~output\ : arriaii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \direction~output_o\);

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

-- Location: MLABCELL_X39_Y1_N20
\Add0~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( counter(0) ) + ( VCC ) + ( !VCC ))
-- \Add0~2\ = CARRY(( counter(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter(0),
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

-- Location: MLABCELL_X39_Y1_N6
\Equal0~0\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( counter(5) & ( counter(8) & ( (counter(4) & (counter(7) & counter(6))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter(4),
	datac => ALT_INV_counter(7),
	datad => ALT_INV_counter(6),
	datae => ALT_INV_counter(5),
	dataf => ALT_INV_counter(8),
	combout => \Equal0~0_combout\);

-- Location: MLABCELL_X39_Y1_N0
\Equal0~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( !counter(3) & ( \Equal0~0_combout\ & ( (!counter(2) & (counter(0) & counter(1))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter(2),
	datac => ALT_INV_counter(0),
	datad => ALT_INV_counter(1),
	datae => ALT_INV_counter(3),
	dataf => \ALT_INV_Equal0~0_combout\,
	combout => \Equal0~1_combout\);

-- Location: FF_X39_Y1_N21
\counter[0]\ : dffeas
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
	q => counter(0));

-- Location: MLABCELL_X39_Y1_N22
\Add0~5\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( counter(1) ) + ( GND ) + ( \Add0~2\ ))
-- \Add0~6\ = CARRY(( counter(1) ) + ( GND ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter(1),
	cin => \Add0~2\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: FF_X39_Y1_N23
\counter[1]\ : dffeas
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
	q => counter(1));

-- Location: MLABCELL_X39_Y1_N24
\Add0~9\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( counter(2) ) + ( GND ) + ( \Add0~6\ ))
-- \Add0~10\ = CARRY(( counter(2) ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter(2),
	cin => \Add0~6\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: FF_X39_Y1_N25
\counter[2]\ : dffeas
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
	q => counter(2));

-- Location: MLABCELL_X39_Y1_N26
\Add0~13\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( counter(3) ) + ( GND ) + ( \Add0~10\ ))
-- \Add0~14\ = CARRY(( counter(3) ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter(3),
	cin => \Add0~10\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X39_Y1_N27
\counter[3]\ : dffeas
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
	q => counter(3));

-- Location: MLABCELL_X39_Y1_N28
\Add0~17\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( counter(4) ) + ( GND ) + ( \Add0~14\ ))
-- \Add0~18\ = CARRY(( counter(4) ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter(4),
	cin => \Add0~14\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X39_Y1_N29
\counter[4]\ : dffeas
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
	q => counter(4));

-- Location: MLABCELL_X39_Y1_N30
\Add0~21\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( counter(5) ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~22\ = CARRY(( counter(5) ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter(5),
	cin => \Add0~18\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X39_Y1_N31
\counter[5]\ : dffeas
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
	q => counter(5));

-- Location: MLABCELL_X39_Y1_N32
\Add0~25\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( counter(6) ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~26\ = CARRY(( counter(6) ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter(6),
	cin => \Add0~22\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X39_Y1_N33
\counter[6]\ : dffeas
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
	q => counter(6));

-- Location: MLABCELL_X39_Y1_N34
\Add0~29\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( counter(7) ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~30\ = CARRY(( counter(7) ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter(7),
	cin => \Add0~26\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: FF_X39_Y1_N35
\counter[7]\ : dffeas
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
	q => counter(7));

-- Location: MLABCELL_X39_Y1_N36
\Add0~33\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( counter(8) ) + ( GND ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter(8),
	cin => \Add0~30\,
	sumout => \Add0~33_sumout\);

-- Location: FF_X39_Y1_N37
\counter[8]\ : dffeas
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
	q => counter(8));

-- Location: IOIBUF_X45_Y0_N1
\D[7]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(7),
	o => \D[7]~input_o\);

-- Location: IOIBUF_X45_Y0_N94
\D[5]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(5),
	o => \D[5]~input_o\);

-- Location: IOIBUF_X45_Y0_N63
\D[4]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(4),
	o => \D[4]~input_o\);

-- Location: IOIBUF_X45_Y0_N32
\D[6]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(6),
	o => \D[6]~input_o\);

-- Location: LABCELL_X45_Y1_N32
\Mult0|mult_core|romout[1][12]~8\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][12]~8_combout\ = ( \D[4]~input_o\ & ( \D[6]~input_o\ & ( \D[7]~input_o\ ) ) ) # ( !\D[4]~input_o\ & ( \D[6]~input_o\ & ( \D[7]~input_o\ ) ) ) # ( \D[4]~input_o\ & ( !\D[6]~input_o\ & ( \D[7]~input_o\ ) ) ) # ( !\D[4]~input_o\ & 
-- ( !\D[6]~input_o\ & ( (\D[7]~input_o\ & \D[5]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[7]~input_o\,
	datad => \ALT_INV_D[5]~input_o\,
	datae => \ALT_INV_D[4]~input_o\,
	dataf => \ALT_INV_D[6]~input_o\,
	combout => \Mult0|mult_core|romout[1][12]~8_combout\);

-- Location: LABCELL_X45_Y1_N22
\Mult0|mult_core|romout[1][11]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][11]~combout\ = ( \D[5]~input_o\ & ( \D[6]~input_o\ ) ) # ( !\D[5]~input_o\ & ( \D[6]~input_o\ & ( \D[4]~input_o\ ) ) ) # ( !\D[5]~input_o\ & ( !\D[6]~input_o\ & ( (!\D[4]~input_o\ & \D[7]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000000000000001010101010101011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[4]~input_o\,
	datad => \ALT_INV_D[7]~input_o\,
	datae => \ALT_INV_D[5]~input_o\,
	dataf => \ALT_INV_D[6]~input_o\,
	combout => \Mult0|mult_core|romout[1][11]~combout\);

-- Location: LABCELL_X45_Y1_N26
\Mult0|mult_core|romout[1][10]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][10]~combout\ = ( \D[4]~input_o\ & ( \D[6]~input_o\ & ( \D[5]~input_o\ ) ) ) # ( !\D[4]~input_o\ & ( \D[6]~input_o\ & ( !\D[5]~input_o\ ) ) ) # ( \D[4]~input_o\ & ( !\D[6]~input_o\ & ( \D[5]~input_o\ ) ) ) # ( !\D[4]~input_o\ & ( 
-- !\D[6]~input_o\ & ( (\D[7]~input_o\ & !\D[5]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000000011110000111111110000111100000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[7]~input_o\,
	datac => \ALT_INV_D[5]~input_o\,
	datae => \ALT_INV_D[4]~input_o\,
	dataf => \ALT_INV_D[6]~input_o\,
	combout => \Mult0|mult_core|romout[1][10]~combout\);

-- Location: LABCELL_X45_Y1_N38
\Mult0|mult_core|romout[1][9]~0\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][9]~0_combout\ = ( \D[5]~input_o\ & ( \D[6]~input_o\ & ( !\D[4]~input_o\ ) ) ) # ( !\D[5]~input_o\ & ( \D[6]~input_o\ & ( !\D[4]~input_o\ ) ) ) # ( \D[5]~input_o\ & ( !\D[6]~input_o\ & ( !\D[4]~input_o\ ) ) ) # ( !\D[5]~input_o\ 
-- & ( !\D[6]~input_o\ & ( (!\D[4]~input_o\ & \D[7]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[4]~input_o\,
	datad => \ALT_INV_D[7]~input_o\,
	datae => \ALT_INV_D[5]~input_o\,
	dataf => \ALT_INV_D[6]~input_o\,
	combout => \Mult0|mult_core|romout[1][9]~0_combout\);

-- Location: LABCELL_X45_Y1_N16
\Mult0|mult_core|romout[1][8]~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][8]~1_combout\ = ( \D[4]~input_o\ & ( \D[6]~input_o\ ) ) # ( !\D[4]~input_o\ & ( \D[6]~input_o\ ) ) # ( \D[4]~input_o\ & ( !\D[6]~input_o\ ) ) # ( !\D[4]~input_o\ & ( !\D[6]~input_o\ & ( (\D[5]~input_o\) # (\D[7]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[7]~input_o\,
	datad => \ALT_INV_D[5]~input_o\,
	datae => \ALT_INV_D[4]~input_o\,
	dataf => \ALT_INV_D[6]~input_o\,
	combout => \Mult0|mult_core|romout[1][8]~1_combout\);

-- Location: IOIBUF_X43_Y0_N63
\D[3]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(3),
	o => \D[3]~input_o\);

-- Location: IOIBUF_X43_Y0_N32
\D[2]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(2),
	o => \D[2]~input_o\);

-- Location: IOIBUF_X43_Y0_N1
\D[1]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(1),
	o => \D[1]~input_o\);

-- Location: IOIBUF_X43_Y0_N94
\D[0]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(0),
	o => \D[0]~input_o\);

-- Location: LABCELL_X43_Y1_N8
\Mult0|mult_core|romout[0][12]~2\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][12]~2_combout\ = ( \D[0]~input_o\ & ( \D[3]~input_o\ ) ) # ( !\D[0]~input_o\ & ( (\D[3]~input_o\ & ((\D[1]~input_o\) # (\D[2]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010100010101010101010101010100010101000101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[3]~input_o\,
	datab => \ALT_INV_D[2]~input_o\,
	datac => \ALT_INV_D[1]~input_o\,
	datae => \ALT_INV_D[0]~input_o\,
	combout => \Mult0|mult_core|romout[0][12]~2_combout\);

-- Location: LABCELL_X45_Y1_N12
\Mult0|mult_core|romout[1][7]~3\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][7]~3_combout\ = ( \D[5]~input_o\ & ( \D[6]~input_o\ & ( !\D[7]~input_o\ ) ) ) # ( !\D[5]~input_o\ & ( \D[6]~input_o\ & ( !\D[7]~input_o\ ) ) ) # ( \D[5]~input_o\ & ( !\D[6]~input_o\ & ( (!\D[4]~input_o\) # (!\D[7]~input_o\) ) ) 
-- ) # ( !\D[5]~input_o\ & ( !\D[6]~input_o\ & ( (\D[7]~input_o\) # (\D[4]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111111110101111101011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[4]~input_o\,
	datac => \ALT_INV_D[7]~input_o\,
	datae => \ALT_INV_D[5]~input_o\,
	dataf => \ALT_INV_D[6]~input_o\,
	combout => \Mult0|mult_core|romout[1][7]~3_combout\);

-- Location: LABCELL_X43_Y1_N36
\Mult0|mult_core|romout[0][11]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][11]~combout\ = ( \D[3]~input_o\ & ( !\D[2]~input_o\ $ (((\D[0]~input_o\) # (\D[1]~input_o\))) ) ) # ( !\D[3]~input_o\ & ( (\D[2]~input_o\ & ((\D[0]~input_o\) # (\D[1]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001110111100010000111011100000000011101111000100001110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[1]~input_o\,
	datab => \ALT_INV_D[0]~input_o\,
	datad => \ALT_INV_D[2]~input_o\,
	datae => \ALT_INV_D[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][11]~combout\);

-- Location: LABCELL_X43_Y1_N16
\Mult0|mult_core|romout[0][10]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][10]~combout\ = ( \D[0]~input_o\ & ( \D[1]~input_o\ ) ) # ( !\D[0]~input_o\ & ( (!\D[1]~input_o\ & ((\D[2]~input_o\) # (\D[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000001110000000011110000111101110000011100000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[3]~input_o\,
	datab => \ALT_INV_D[2]~input_o\,
	datac => \ALT_INV_D[1]~input_o\,
	datae => \ALT_INV_D[0]~input_o\,
	combout => \Mult0|mult_core|romout[0][10]~combout\);

-- Location: LABCELL_X45_Y1_N10
\Mult0|mult_core|romout[1][6]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][6]~combout\ = ( \D[4]~input_o\ & ( \D[6]~input_o\ & ( (!\D[5]~input_o\) # (\D[7]~input_o\) ) ) ) # ( !\D[4]~input_o\ & ( \D[6]~input_o\ & ( (!\D[5]~input_o\) # (\D[7]~input_o\) ) ) ) # ( \D[4]~input_o\ & ( !\D[6]~input_o\ & ( 
-- (!\D[7]~input_o\) # (\D[5]~input_o\) ) ) ) # ( !\D[4]~input_o\ & ( !\D[6]~input_o\ & ( (!\D[7]~input_o\ & \D[5]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010101011111010111111110101111101011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[7]~input_o\,
	datac => \ALT_INV_D[5]~input_o\,
	datae => \ALT_INV_D[4]~input_o\,
	dataf => \ALT_INV_D[6]~input_o\,
	combout => \Mult0|mult_core|romout[1][6]~combout\);

-- Location: LABCELL_X43_Y1_N22
\Mult0|mult_core|romout[0][9]~4\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][9]~4_combout\ = ( \D[3]~input_o\ & ( !\D[0]~input_o\ ) ) # ( !\D[3]~input_o\ & ( (!\D[0]~input_o\ & ((\D[2]~input_o\) # (\D[1]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100110001001100110011001100110001001100010011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[1]~input_o\,
	datab => \ALT_INV_D[0]~input_o\,
	datac => \ALT_INV_D[2]~input_o\,
	datae => \ALT_INV_D[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][9]~4_combout\);

-- Location: LABCELL_X45_Y1_N4
\Mult0|mult_core|romout[1][5]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][5]~combout\ = ( \D[5]~input_o\ & ( \D[6]~input_o\ & ( !\D[7]~input_o\ ) ) ) # ( !\D[5]~input_o\ & ( \D[6]~input_o\ & ( \D[7]~input_o\ ) ) ) # ( \D[5]~input_o\ & ( !\D[6]~input_o\ & ( !\D[4]~input_o\ $ (\D[7]~input_o\) ) ) ) # ( 
-- !\D[5]~input_o\ & ( !\D[6]~input_o\ & ( !\D[4]~input_o\ $ (!\D[7]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010101001011010010100001111000011111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[4]~input_o\,
	datac => \ALT_INV_D[7]~input_o\,
	datae => \ALT_INV_D[5]~input_o\,
	dataf => \ALT_INV_D[6]~input_o\,
	combout => \Mult0|mult_core|romout[1][5]~combout\);

-- Location: LABCELL_X43_Y1_N32
\Mult0|mult_core|romout[0][8]~6\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][8]~6_combout\ = ( \D[0]~input_o\ ) # ( !\D[0]~input_o\ & ( ((\D[1]~input_o\) # (\D[2]~input_o\)) # (\D[3]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111101111111111111111111111101111111011111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[3]~input_o\,
	datab => \ALT_INV_D[2]~input_o\,
	datac => \ALT_INV_D[1]~input_o\,
	datae => \ALT_INV_D[0]~input_o\,
	combout => \Mult0|mult_core|romout[0][8]~6_combout\);

-- Location: LABCELL_X45_Y1_N0
\Mult0|mult_core|romout[1][4]~5\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][4]~5_combout\ = ( !\D[4]~input_o\ & ( \D[6]~input_o\ ) ) # ( \D[4]~input_o\ & ( !\D[6]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_D[4]~input_o\,
	dataf => \ALT_INV_D[6]~input_o\,
	combout => \Mult0|mult_core|romout[1][4]~5_combout\);

-- Location: LABCELL_X43_Y1_N28
\Mult0|mult_core|romout[0][7]~7\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][7]~7_combout\ = ( \D[3]~input_o\ & ( (!\D[2]~input_o\ & ((!\D[1]~input_o\) # (!\D[0]~input_o\))) ) ) # ( !\D[3]~input_o\ & ( ((\D[2]~input_o\) # (\D[0]~input_o\)) # (\D[1]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011111111111111011100000000001110111111111111110111000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[1]~input_o\,
	datab => \ALT_INV_D[0]~input_o\,
	datad => \ALT_INV_D[2]~input_o\,
	datae => \ALT_INV_D[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][7]~7_combout\);

-- Location: LABCELL_X43_Y1_N24
\Mult0|mult_core|romout[0][6]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][6]~combout\ = ( \D[0]~input_o\ & ( (!\D[3]~input_o\ & ((!\D[2]~input_o\) # (!\D[1]~input_o\))) # (\D[3]~input_o\ & ((\D[1]~input_o\) # (\D[2]~input_o\))) ) ) # ( !\D[0]~input_o\ & ( !\D[2]~input_o\ $ (((!\D[1]~input_o\) # 
-- (\D[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011100100111001101111011011110100111001001110011011110110111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[3]~input_o\,
	datab => \ALT_INV_D[2]~input_o\,
	datac => \ALT_INV_D[1]~input_o\,
	datae => \ALT_INV_D[0]~input_o\,
	combout => \Mult0|mult_core|romout[0][6]~combout\);

-- Location: MLABCELL_X44_Y1_N0
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_cout\ = CARRY(( \Mult0|mult_core|romout[0][6]~combout\ ) + ( \D[4]~input_o\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mult0|mult_core|ALT_INV_romout[0][6]~combout\,
	dataf => \ALT_INV_D[4]~input_o\,
	cin => GND,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_cout\);

-- Location: MLABCELL_X44_Y1_N2
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_cout\ = CARRY(( \D[5]~input_o\ ) + ( \Mult0|mult_core|romout[0][7]~7_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_D[5]~input_o\,
	dataf => \Mult0|mult_core|ALT_INV_romout[0][7]~7_combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_cout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_cout\);

-- Location: MLABCELL_X44_Y1_N4
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_cout\ = CARRY(( \Mult0|mult_core|romout[0][8]~6_combout\ ) + ( \Mult0|mult_core|romout[1][4]~5_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mult0|mult_core|ALT_INV_romout[0][8]~6_combout\,
	dataf => \Mult0|mult_core|ALT_INV_romout[1][4]~5_combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_cout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_cout\);

-- Location: MLABCELL_X44_Y1_N6
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13_sumout\ = SUM(( \Mult0|mult_core|romout[0][9]~4_combout\ ) + ( \Mult0|mult_core|romout[1][5]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_cout\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\ = CARRY(( \Mult0|mult_core|romout[0][9]~4_combout\ ) + ( \Mult0|mult_core|romout[1][5]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mult0|mult_core|ALT_INV_romout[0][9]~4_combout\,
	dataf => \Mult0|mult_core|ALT_INV_romout[1][5]~combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_cout\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\);

-- Location: MLABCELL_X44_Y1_N8
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17_sumout\ = SUM(( \Mult0|mult_core|romout[0][10]~combout\ ) + ( \Mult0|mult_core|romout[1][6]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\ = CARRY(( \Mult0|mult_core|romout[0][10]~combout\ ) + ( \Mult0|mult_core|romout[1][6]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mult0|mult_core|ALT_INV_romout[0][10]~combout\,
	dataf => \Mult0|mult_core|ALT_INV_romout[1][6]~combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\);

-- Location: MLABCELL_X44_Y1_N10
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21_sumout\ = SUM(( \Mult0|mult_core|romout[1][7]~3_combout\ ) + ( \Mult0|mult_core|romout[0][11]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\ = CARRY(( \Mult0|mult_core|romout[1][7]~3_combout\ ) + ( \Mult0|mult_core|romout[0][11]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|mult_core|ALT_INV_romout[1][7]~3_combout\,
	datac => \Mult0|mult_core|ALT_INV_romout[0][11]~combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\);

-- Location: MLABCELL_X44_Y1_N12
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25_sumout\ = SUM(( \Mult0|mult_core|romout[1][8]~1_combout\ ) + ( \Mult0|mult_core|romout[0][12]~2_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26\ = CARRY(( \Mult0|mult_core|romout[1][8]~1_combout\ ) + ( \Mult0|mult_core|romout[0][12]~2_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|mult_core|ALT_INV_romout[1][8]~1_combout\,
	datac => \Mult0|mult_core|ALT_INV_romout[0][12]~2_combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26\);

-- Location: MLABCELL_X44_Y1_N14
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

-- Location: MLABCELL_X44_Y1_N16
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

-- Location: MLABCELL_X44_Y1_N18
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

-- Location: MLABCELL_X44_Y1_N20
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

-- Location: IOIBUF_X47_Y0_N32
\adjust~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_adjust,
	o => \adjust~input_o\);

-- Location: MLABCELL_X44_Y1_N32
\halfDnew[1]~0\ : arriaii_lcell_comb
-- Equation(s):
-- \halfDnew[1]~0_combout\ = ( \adjust~input_o\ & ( !\rst~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_rst~input_o\,
	datae => \ALT_INV_adjust~input_o\,
	combout => \halfDnew[1]~0_combout\);

-- Location: FF_X44_Y1_N21
\halfDnew[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41_sumout\,
	ena => \halfDnew[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfDnew(7));

-- Location: MLABCELL_X39_Y1_N8
\halfD[0]~0\ : arriaii_lcell_comb
-- Equation(s):
-- \halfD[0]~0_combout\ = ( !counter(3) & ( \Equal0~0_combout\ & ( (counter(0) & (!\rst~input_o\ & (!counter(2) & counter(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter(0),
	datab => \ALT_INV_rst~input_o\,
	datac => ALT_INV_counter(2),
	datad => ALT_INV_counter(1),
	datae => ALT_INV_counter(3),
	dataf => \ALT_INV_Equal0~0_combout\,
	combout => \halfD[0]~0_combout\);

-- Location: FF_X39_Y1_N3
\halfD[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => halfDnew(7),
	sload => VCC,
	ena => \halfD[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfD(7));

-- Location: FF_X44_Y1_N19
\halfDnew[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37_sumout\,
	ena => \halfDnew[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfDnew(6));

-- Location: FF_X40_Y1_N5
\halfD[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => halfDnew(6),
	sload => VCC,
	ena => \halfD[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfD(6));

-- Location: FF_X44_Y1_N17
\halfDnew[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33_sumout\,
	ena => \halfDnew[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfDnew(5));

-- Location: FF_X40_Y1_N7
\halfD[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => halfDnew(5),
	sload => VCC,
	ena => \halfD[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfD(5));

-- Location: FF_X44_Y1_N15
\halfDnew[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29_sumout\,
	ena => \halfDnew[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfDnew(4));

-- Location: FF_X40_Y1_N39
\halfD[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => halfDnew(4),
	sload => VCC,
	ena => \halfD[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfD(4));

-- Location: FF_X44_Y1_N13
\halfDnew[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25_sumout\,
	ena => \halfDnew[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfDnew(3));

-- Location: FF_X40_Y1_N19
\halfD[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => halfDnew(3),
	sload => VCC,
	ena => \halfD[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfD(3));

-- Location: FF_X44_Y1_N11
\halfDnew[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21_sumout\,
	ena => \halfDnew[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfDnew(2));

-- Location: FF_X40_Y1_N15
\halfD[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => halfDnew(2),
	sload => VCC,
	ena => \halfD[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfD(2));

-- Location: FF_X44_Y1_N7
\halfDnew[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13_sumout\,
	ena => \halfDnew[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfDnew(0));

-- Location: FF_X40_Y1_N1
\halfD[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => halfDnew(0),
	sload => VCC,
	ena => \halfD[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfD(0));

-- Location: FF_X44_Y1_N9
\halfDnew[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17_sumout\,
	ena => \halfDnew[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfDnew(1));

-- Location: FF_X40_Y1_N11
\halfD[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => halfDnew(1),
	sload => VCC,
	ena => \halfD[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => halfD(1));

-- Location: LABCELL_X40_Y1_N20
\Add1~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( !halfD(0) ) + ( !halfD(1) ) + ( !VCC ))
-- \Add1~2\ = CARRY(( !halfD(0) ) + ( !halfD(1) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_halfD(0),
	dataf => ALT_INV_halfD(1),
	cin => GND,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\);

-- Location: LABCELL_X40_Y1_N22
\Add1~5\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( VCC ) + ( !halfD(2) ) + ( \Add1~2\ ))
-- \Add1~6\ = CARRY(( VCC ) + ( !halfD(2) ) + ( \Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_halfD(2),
	cin => \Add1~2\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\);

-- Location: LABCELL_X40_Y1_N24
\Add1~9\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( !halfD(3) ) + ( GND ) + ( \Add1~6\ ))
-- \Add1~10\ = CARRY(( !halfD(3) ) + ( GND ) + ( \Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_halfD(3),
	cin => \Add1~6\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\);

-- Location: LABCELL_X40_Y1_N26
\Add1~13\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( VCC ) + ( !halfD(4) ) + ( \Add1~10\ ))
-- \Add1~14\ = CARRY(( VCC ) + ( !halfD(4) ) + ( \Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_halfD(4),
	cin => \Add1~10\,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\);

-- Location: LABCELL_X40_Y1_N28
\Add1~17\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( VCC ) + ( !halfD(5) ) + ( \Add1~14\ ))
-- \Add1~18\ = CARRY(( VCC ) + ( !halfD(5) ) + ( \Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_halfD(5),
	cin => \Add1~14\,
	sumout => \Add1~17_sumout\,
	cout => \Add1~18\);

-- Location: LABCELL_X40_Y1_N30
\Add1~21\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~21_sumout\ = SUM(( VCC ) + ( !halfD(6) ) + ( \Add1~18\ ))
-- \Add1~22\ = CARRY(( VCC ) + ( !halfD(6) ) + ( \Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_halfD(6),
	cin => \Add1~18\,
	sumout => \Add1~21_sumout\,
	cout => \Add1~22\);

-- Location: LABCELL_X40_Y1_N32
\Add1~25\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~25_sumout\ = SUM(( VCC ) + ( !halfD(7) ) + ( \Add1~22\ ))
-- \Add1~26\ = CARRY(( VCC ) + ( !halfD(7) ) + ( \Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_halfD(7),
	cin => \Add1~22\,
	sumout => \Add1~25_sumout\,
	cout => \Add1~26\);

-- Location: LABCELL_X40_Y1_N34
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

-- Location: LABCELL_X40_Y1_N36
\pwmout~2\ : arriaii_lcell_comb
-- Equation(s):
-- \pwmout~2_combout\ = ( \Add1~5_sumout\ & ( \Add1~13_sumout\ & ( (counter(4) & (counter(2) & (!\Add1~9_sumout\ $ (counter(3))))) ) ) ) # ( !\Add1~5_sumout\ & ( \Add1~13_sumout\ & ( (counter(4) & (!counter(2) & (!\Add1~9_sumout\ $ (counter(3))))) ) ) ) # ( 
-- \Add1~5_sumout\ & ( !\Add1~13_sumout\ & ( (!counter(4) & (counter(2) & (!\Add1~9_sumout\ $ (counter(3))))) ) ) ) # ( !\Add1~5_sumout\ & ( !\Add1~13_sumout\ & ( (!counter(4) & (!counter(2) & (!\Add1~9_sumout\ $ (counter(3))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000001000001000000000001001000000000001000001000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter(4),
	datab => ALT_INV_counter(2),
	datac => \ALT_INV_Add1~9_sumout\,
	datad => ALT_INV_counter(3),
	datae => \ALT_INV_Add1~5_sumout\,
	dataf => \ALT_INV_Add1~13_sumout\,
	combout => \pwmout~2_combout\);

-- Location: MLABCELL_X39_Y1_N14
\Equal1~0\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = ( counter(5) & ( halfD(7) & ( (counter(7) & (halfD(5) & (!counter(6) $ (halfD(6))))) ) ) ) # ( !counter(5) & ( halfD(7) & ( (counter(7) & (!halfD(5) & (!counter(6) $ (halfD(6))))) ) ) ) # ( counter(5) & ( !halfD(7) & ( (!counter(7) & 
-- (halfD(5) & (!counter(6) $ (halfD(6))))) ) ) ) # ( !counter(5) & ( !halfD(7) & ( (!counter(7) & (!halfD(5) & (!counter(6) $ (halfD(6))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000001000000000010000000010000100000000100000000001000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter(6),
	datab => ALT_INV_counter(7),
	datac => ALT_INV_halfD(5),
	datad => ALT_INV_halfD(6),
	datae => ALT_INV_counter(5),
	dataf => ALT_INV_halfD(7),
	combout => \Equal1~0_combout\);

-- Location: LABCELL_X40_Y1_N12
\Equal1~2\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = ( counter(3) & ( counter(2) & ( (halfD(2) & (halfD(3) & (!halfD(4) $ (counter(4))))) ) ) ) # ( !counter(3) & ( counter(2) & ( (halfD(2) & (!halfD(3) & (!halfD(4) $ (counter(4))))) ) ) ) # ( counter(3) & ( !counter(2) & ( (!halfD(2) & 
-- (halfD(3) & (!halfD(4) $ (counter(4))))) ) ) ) # ( !counter(3) & ( !counter(2) & ( (!halfD(2) & (!halfD(3) & (!halfD(4) $ (counter(4))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000010000000000000000001000010000100001000000000000000000100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_halfD(4),
	datab => ALT_INV_halfD(2),
	datac => ALT_INV_counter(4),
	datad => ALT_INV_halfD(3),
	datae => ALT_INV_counter(3),
	dataf => ALT_INV_counter(2),
	combout => \Equal1~2_combout\);

-- Location: MLABCELL_X39_Y1_N16
\Equal1~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = ( counter(1) & ( halfD(0) & ( (!counter(8) & (counter(0) & halfD(1))) ) ) ) # ( !counter(1) & ( halfD(0) & ( (!counter(8) & (counter(0) & !halfD(1))) ) ) ) # ( counter(1) & ( !halfD(0) & ( (!counter(8) & (!counter(0) & halfD(1))) ) ) 
-- ) # ( !counter(1) & ( !halfD(0) & ( (!counter(8) & (!counter(0) & !halfD(1))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000000000001100000000001100000000000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_counter(8),
	datac => ALT_INV_counter(0),
	datad => ALT_INV_halfD(1),
	datae => ALT_INV_counter(1),
	dataf => ALT_INV_halfD(0),
	combout => \Equal1~1_combout\);

-- Location: LABCELL_X40_Y1_N6
\Equal2~0\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = ( counter(0) & ( !halfD(0) ) ) # ( !counter(0) & ( halfD(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_halfD(0),
	dataf => ALT_INV_counter(0),
	combout => \Equal2~0_combout\);

-- Location: LABCELL_X40_Y1_N8
\pwmout~3\ : arriaii_lcell_comb
-- Equation(s):
-- \pwmout~3_combout\ = ( !\Equal2~0_combout\ & ( \Add1~1_sumout\ & ( (counter(1) & ((!\Equal1~0_combout\) # ((!\Equal1~2_combout\) # (!\Equal1~1_combout\)))) ) ) ) # ( !\Equal2~0_combout\ & ( !\Add1~1_sumout\ & ( (!counter(1) & ((!\Equal1~0_combout\) # 
-- ((!\Equal1~2_combout\) # (!\Equal1~1_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101000000000000000000001010101010101000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter(1),
	datab => \ALT_INV_Equal1~0_combout\,
	datac => \ALT_INV_Equal1~2_combout\,
	datad => \ALT_INV_Equal1~1_combout\,
	datae => \ALT_INV_Equal2~0_combout\,
	dataf => \ALT_INV_Add1~1_sumout\,
	combout => \pwmout~3_combout\);

-- Location: LABCELL_X40_Y1_N4
\pwmout~0\ : arriaii_lcell_comb
-- Equation(s):
-- \pwmout~0_combout\ = ( \Equal1~0_combout\ & ( (\pwmout~reg0_q\ & ((!\Equal1~1_combout\) # (!\Equal1~2_combout\))) ) ) # ( !\Equal1~0_combout\ & ( \pwmout~reg0_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010100010101000101010001010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pwmout~reg0_q\,
	datab => \ALT_INV_Equal1~1_combout\,
	datac => \ALT_INV_Equal1~2_combout\,
	dataf => \ALT_INV_Equal1~0_combout\,
	combout => \pwmout~0_combout\);

-- Location: LABCELL_X40_Y1_N16
\pwmout~1\ : arriaii_lcell_comb
-- Equation(s):
-- \pwmout~1_combout\ = ( \Add1~21_sumout\ & ( \Add1~25_sumout\ & ( (counter(6) & (counter(7) & (!counter(5) $ (\Add1~17_sumout\)))) ) ) ) # ( !\Add1~21_sumout\ & ( \Add1~25_sumout\ & ( (!counter(6) & (counter(7) & (!counter(5) $ (\Add1~17_sumout\)))) ) ) ) 
-- # ( \Add1~21_sumout\ & ( !\Add1~25_sumout\ & ( (counter(6) & (!counter(7) & (!counter(5) $ (\Add1~17_sumout\)))) ) ) ) # ( !\Add1~21_sumout\ & ( !\Add1~25_sumout\ & ( (!counter(6) & (!counter(7) & (!counter(5) $ (\Add1~17_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000010000000000001000010000000000000000100001000000000000100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter(5),
	datab => ALT_INV_counter(6),
	datac => \ALT_INV_Add1~17_sumout\,
	datad => ALT_INV_counter(7),
	datae => \ALT_INV_Add1~21_sumout\,
	dataf => \ALT_INV_Add1~25_sumout\,
	combout => \pwmout~1_combout\);

-- Location: LABCELL_X40_Y1_N2
\pwmout~4\ : arriaii_lcell_comb
-- Equation(s):
-- \pwmout~4_combout\ = ( \pwmout~0_combout\ & ( \pwmout~1_combout\ ) ) # ( !\pwmout~0_combout\ & ( \pwmout~1_combout\ & ( (\pwmout~2_combout\ & (\pwmout~3_combout\ & (!counter(8) $ (!\Add1~29_sumout\)))) ) ) ) # ( \pwmout~0_combout\ & ( !\pwmout~1_combout\ 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000001101111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter(8),
	datab => \ALT_INV_Add1~29_sumout\,
	datac => \ALT_INV_pwmout~2_combout\,
	datad => \ALT_INV_pwmout~3_combout\,
	datae => \ALT_INV_pwmout~0_combout\,
	dataf => \ALT_INV_pwmout~1_combout\,
	combout => \pwmout~4_combout\);

-- Location: FF_X40_Y1_N3
\pwmout~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pwmout~4_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pwmout~reg0_q\);

ww_pwmout <= \pwmout~output_o\;

ww_direction <= \direction~output_o\;
END structure;


