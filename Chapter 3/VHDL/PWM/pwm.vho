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

-- DATE "05/14/2020 15:14:03"

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
	direction_in : IN std_logic;
	pwmout : BUFFER std_logic;
	direction_out : BUFFER std_logic
	);
END pwm;

-- Design Ports Information
-- pwmout	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- direction_out	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- direction_in	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[4]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[6]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[5]	=>  Location: PIN_U3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[7]	=>  Location: PIN_V3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[0]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[1]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[2]	=>  Location: PIN_V2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[3]	=>  Location: PIN_V1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- adjust	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_direction_in : std_logic;
SIGNAL ww_pwmout : std_logic;
SIGNAL ww_direction_out : std_logic;
SIGNAL \pwmout~output_o\ : std_logic;
SIGNAL \direction_out~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \D[7]~input_o\ : std_logic;
SIGNAL \D[4]~input_o\ : std_logic;
SIGNAL \D[5]~input_o\ : std_logic;
SIGNAL \D[6]~input_o\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][10]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][9]~0_combout\ : std_logic;
SIGNAL \D[2]~input_o\ : std_logic;
SIGNAL \D[3]~input_o\ : std_logic;
SIGNAL \D[0]~input_o\ : std_logic;
SIGNAL \D[1]~input_o\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][12]~2_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][8]~1_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][11]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][7]~3_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][6]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][10]~combout\ : std_logic;
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
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33_sumout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \adjust~input_o\ : std_logic;
SIGNAL \D_new[1]~0_combout\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
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
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \D_current[0]~0_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][12]~8_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][11]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~38\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41_sumout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37_sumout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13_sumout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17_sumout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29_sumout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25_sumout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21_sumout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \pwmout~0_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \pwmout~3_combout\ : std_logic;
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
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \Add1~21_sumout\ : std_logic;
SIGNAL \Add1~25_sumout\ : std_logic;
SIGNAL \pwmout~1_combout\ : std_logic;
SIGNAL \pwmout~4_combout\ : std_logic;
SIGNAL \pwmout~reg0_q\ : std_logic;
SIGNAL \direction_in~input_o\ : std_logic;
SIGNAL \Equal0~0DUPLICATE_combout\ : std_logic;
SIGNAL \direction_out~0_combout\ : std_logic;
SIGNAL \direction_out~reg0_q\ : std_logic;
SIGNAL D_new : std_logic_vector(7 DOWNTO 0);
SIGNAL D_current : std_logic_vector(7 DOWNTO 0);
SIGNAL counter : std_logic_vector(8 DOWNTO 0);
SIGNAL \ALT_INV_Equal0~0DUPLICATE_combout\ : std_logic;
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
SIGNAL \ALT_INV_direction_in~input_o\ : std_logic;
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
SIGNAL \ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_pwmout~3_combout\ : std_logic;
SIGNAL \ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL \ALT_INV_pwmout~2_combout\ : std_logic;
SIGNAL \ALT_INV_pwmout~1_combout\ : std_logic;
SIGNAL \ALT_INV_pwmout~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1~2_combout\ : std_logic;
SIGNAL ALT_INV_D_current : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_Equal1~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ALT_INV_direction_out~reg0_q\ : std_logic;
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
ww_direction_in <= direction_in;
pwmout <= ww_pwmout;
direction_out <= ww_direction_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Equal0~0DUPLICATE_combout\ <= NOT \Equal0~0DUPLICATE_combout\;
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
\ALT_INV_direction_in~input_o\ <= NOT \direction_in~input_o\;
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
\ALT_INV_Equal0~1_combout\ <= NOT \Equal0~1_combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\ALT_INV_pwmout~3_combout\ <= NOT \pwmout~3_combout\;
\ALT_INV_Equal2~0_combout\ <= NOT \Equal2~0_combout\;
\ALT_INV_pwmout~2_combout\ <= NOT \pwmout~2_combout\;
\ALT_INV_pwmout~1_combout\ <= NOT \pwmout~1_combout\;
\ALT_INV_pwmout~0_combout\ <= NOT \pwmout~0_combout\;
\ALT_INV_Equal1~2_combout\ <= NOT \Equal1~2_combout\;
ALT_INV_D_current(4) <= NOT D_current(4);
ALT_INV_D_current(3) <= NOT D_current(3);
ALT_INV_D_current(2) <= NOT D_current(2);
\ALT_INV_Equal1~1_combout\ <= NOT \Equal1~1_combout\;
ALT_INV_D_current(1) <= NOT D_current(1);
ALT_INV_D_current(0) <= NOT D_current(0);
\ALT_INV_Equal1~0_combout\ <= NOT \Equal1~0_combout\;
ALT_INV_D_current(7) <= NOT D_current(7);
ALT_INV_D_current(6) <= NOT D_current(6);
ALT_INV_D_current(5) <= NOT D_current(5);
\ALT_INV_direction_out~reg0_q\ <= NOT \direction_out~reg0_q\;
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

-- Location: IOOBUF_X48_Y0_N33
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

-- Location: IOOBUF_X48_Y0_N98
\direction_out~output\ : arriaii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \direction_out~reg0_q\,
	devoe => ww_devoe,
	o => \direction_out~output_o\);

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

-- Location: IOIBUF_X47_Y0_N94
\D[7]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(7),
	o => \D[7]~input_o\);

-- Location: IOIBUF_X48_Y0_N63
\D[4]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(4),
	o => \D[4]~input_o\);

-- Location: IOIBUF_X47_Y0_N32
\D[5]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(5),
	o => \D[5]~input_o\);

-- Location: IOIBUF_X47_Y0_N1
\D[6]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(6),
	o => \D[6]~input_o\);

-- Location: LABCELL_X47_Y3_N26
\Mult0|mult_core|romout[1][10]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][10]~combout\ = ( \D[6]~input_o\ & ( !\D[4]~input_o\ $ (\D[5]~input_o\) ) ) # ( !\D[6]~input_o\ & ( (!\D[4]~input_o\ & (\D[7]~input_o\ & !\D[5]~input_o\)) # (\D[4]~input_o\ & ((\D[5]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100001101000011010000110100001111000011110000111100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[7]~input_o\,
	datab => \ALT_INV_D[4]~input_o\,
	datac => \ALT_INV_D[5]~input_o\,
	dataf => \ALT_INV_D[6]~input_o\,
	combout => \Mult0|mult_core|romout[1][10]~combout\);

-- Location: LABCELL_X47_Y3_N30
\Mult0|mult_core|romout[1][9]~0\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][9]~0_combout\ = ( \D[6]~input_o\ & ( !\D[4]~input_o\ ) ) # ( !\D[6]~input_o\ & ( (!\D[4]~input_o\ & ((\D[5]~input_o\) # (\D[7]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100110001001100010011000100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[7]~input_o\,
	datab => \ALT_INV_D[4]~input_o\,
	datac => \ALT_INV_D[5]~input_o\,
	dataf => \ALT_INV_D[6]~input_o\,
	combout => \Mult0|mult_core|romout[1][9]~0_combout\);

-- Location: IOIBUF_X45_Y0_N1
\D[2]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(2),
	o => \D[2]~input_o\);

-- Location: IOIBUF_X45_Y0_N63
\D[3]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(3),
	o => \D[3]~input_o\);

-- Location: IOIBUF_X45_Y0_N32
\D[0]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(0),
	o => \D[0]~input_o\);

-- Location: IOIBUF_X47_Y0_N63
\D[1]~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(1),
	o => \D[1]~input_o\);

-- Location: MLABCELL_X46_Y3_N8
\Mult0|mult_core|romout[0][12]~2\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][12]~2_combout\ = ( \D[0]~input_o\ & ( \D[1]~input_o\ & ( \D[3]~input_o\ ) ) ) # ( !\D[0]~input_o\ & ( \D[1]~input_o\ & ( \D[3]~input_o\ ) ) ) # ( \D[0]~input_o\ & ( !\D[1]~input_o\ & ( \D[3]~input_o\ ) ) ) # ( !\D[0]~input_o\ & 
-- ( !\D[1]~input_o\ & ( (\D[2]~input_o\ & \D[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000001111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[2]~input_o\,
	datad => \ALT_INV_D[3]~input_o\,
	datae => \ALT_INV_D[0]~input_o\,
	dataf => \ALT_INV_D[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][12]~2_combout\);

-- Location: LABCELL_X47_Y3_N24
\Mult0|mult_core|romout[1][8]~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][8]~1_combout\ = ( \D[5]~input_o\ ) # ( !\D[5]~input_o\ & ( ((\D[6]~input_o\) # (\D[4]~input_o\)) # (\D[7]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111101111111011111110111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[7]~input_o\,
	datab => \ALT_INV_D[4]~input_o\,
	datac => \ALT_INV_D[6]~input_o\,
	dataf => \ALT_INV_D[5]~input_o\,
	combout => \Mult0|mult_core|romout[1][8]~1_combout\);

-- Location: MLABCELL_X46_Y3_N14
\Mult0|mult_core|romout[0][11]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][11]~combout\ = ( \D[0]~input_o\ & ( \D[1]~input_o\ & ( \D[2]~input_o\ ) ) ) # ( !\D[0]~input_o\ & ( \D[1]~input_o\ & ( \D[2]~input_o\ ) ) ) # ( \D[0]~input_o\ & ( !\D[1]~input_o\ & ( \D[2]~input_o\ ) ) ) # ( !\D[0]~input_o\ & ( 
-- !\D[1]~input_o\ & ( (\D[3]~input_o\ & !\D[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000000000001111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_D[3]~input_o\,
	datad => \ALT_INV_D[2]~input_o\,
	datae => \ALT_INV_D[0]~input_o\,
	dataf => \ALT_INV_D[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][11]~combout\);

-- Location: LABCELL_X47_Y3_N28
\Mult0|mult_core|romout[1][7]~3\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][7]~3_combout\ = ( \D[5]~input_o\ & ( (!\D[7]~input_o\) # ((!\D[4]~input_o\ & !\D[6]~input_o\)) ) ) # ( !\D[5]~input_o\ & ( (!\D[7]~input_o\ & ((\D[6]~input_o\) # (\D[4]~input_o\))) # (\D[7]~input_o\ & ((!\D[6]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101001111010011110100111101011101010111010101110101011101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[7]~input_o\,
	datab => \ALT_INV_D[4]~input_o\,
	datac => \ALT_INV_D[6]~input_o\,
	dataf => \ALT_INV_D[5]~input_o\,
	combout => \Mult0|mult_core|romout[1][7]~3_combout\);

-- Location: LABCELL_X47_Y3_N34
\Mult0|mult_core|romout[1][6]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][6]~combout\ = ( \D[6]~input_o\ & ( (!\D[5]~input_o\) # (\D[7]~input_o\) ) ) # ( !\D[6]~input_o\ & ( (!\D[7]~input_o\ & ((\D[5]~input_o\) # (\D[4]~input_o\))) # (\D[7]~input_o\ & (\D[4]~input_o\ & \D[5]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101100101011001010110010101111110101111101011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[7]~input_o\,
	datab => \ALT_INV_D[4]~input_o\,
	datac => \ALT_INV_D[5]~input_o\,
	dataf => \ALT_INV_D[6]~input_o\,
	combout => \Mult0|mult_core|romout[1][6]~combout\);

-- Location: MLABCELL_X46_Y3_N18
\Mult0|mult_core|romout[0][10]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][10]~combout\ = ( \D[0]~input_o\ & ( \D[1]~input_o\ ) ) # ( !\D[0]~input_o\ & ( !\D[1]~input_o\ & ( (\D[3]~input_o\) # (\D[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[2]~input_o\,
	datac => \ALT_INV_D[3]~input_o\,
	datae => \ALT_INV_D[0]~input_o\,
	dataf => \ALT_INV_D[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][10]~combout\);

-- Location: MLABCELL_X46_Y3_N30
\Mult0|mult_core|romout[0][9]~4\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][9]~4_combout\ = ( !\D[0]~input_o\ & ( \D[1]~input_o\ ) ) # ( !\D[0]~input_o\ & ( !\D[1]~input_o\ & ( (\D[2]~input_o\) # (\D[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_D[3]~input_o\,
	datad => \ALT_INV_D[2]~input_o\,
	datae => \ALT_INV_D[0]~input_o\,
	dataf => \ALT_INV_D[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][9]~4_combout\);

-- Location: LABCELL_X47_Y3_N32
\Mult0|mult_core|romout[1][5]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][5]~combout\ = ( \D[5]~input_o\ & ( !\D[7]~input_o\ $ (((\D[4]~input_o\ & !\D[6]~input_o\))) ) ) # ( !\D[5]~input_o\ & ( !\D[7]~input_o\ $ (((!\D[4]~input_o\) # (\D[6]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110010101100101011001010110010110011010100110101001101010011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[7]~input_o\,
	datab => \ALT_INV_D[4]~input_o\,
	datac => \ALT_INV_D[6]~input_o\,
	dataf => \ALT_INV_D[5]~input_o\,
	combout => \Mult0|mult_core|romout[1][5]~combout\);

-- Location: MLABCELL_X46_Y3_N34
\Mult0|mult_core|romout[0][8]~6\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][8]~6_combout\ = ( \D[0]~input_o\ & ( \D[1]~input_o\ ) ) # ( !\D[0]~input_o\ & ( \D[1]~input_o\ ) ) # ( \D[0]~input_o\ & ( !\D[1]~input_o\ ) ) # ( !\D[0]~input_o\ & ( !\D[1]~input_o\ & ( (\D[2]~input_o\) # (\D[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_D[3]~input_o\,
	datad => \ALT_INV_D[2]~input_o\,
	datae => \ALT_INV_D[0]~input_o\,
	dataf => \ALT_INV_D[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][8]~6_combout\);

-- Location: LABCELL_X47_Y3_N22
\Mult0|mult_core|romout[1][4]~5\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][4]~5_combout\ = !\D[6]~input_o\ $ (!\D[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010010110100101101001011010010110100101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[6]~input_o\,
	datac => \ALT_INV_D[4]~input_o\,
	combout => \Mult0|mult_core|romout[1][4]~5_combout\);

-- Location: MLABCELL_X46_Y3_N22
\Mult0|mult_core|romout[0][7]~7\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][7]~7_combout\ = ( \D[0]~input_o\ & ( \D[1]~input_o\ & ( !\D[3]~input_o\ ) ) ) # ( !\D[0]~input_o\ & ( \D[1]~input_o\ & ( (!\D[2]~input_o\) # (!\D[3]~input_o\) ) ) ) # ( \D[0]~input_o\ & ( !\D[1]~input_o\ & ( (!\D[2]~input_o\) # 
-- (!\D[3]~input_o\) ) ) ) # ( !\D[0]~input_o\ & ( !\D[1]~input_o\ & ( !\D[2]~input_o\ $ (!\D[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010111110101111101011111010111110101111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[2]~input_o\,
	datac => \ALT_INV_D[3]~input_o\,
	datae => \ALT_INV_D[0]~input_o\,
	dataf => \ALT_INV_D[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][7]~7_combout\);

-- Location: MLABCELL_X46_Y3_N26
\Mult0|mult_core|romout[0][6]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][6]~combout\ = ( \D[0]~input_o\ & ( \D[1]~input_o\ & ( (!\D[2]~input_o\) # (\D[3]~input_o\) ) ) ) # ( !\D[0]~input_o\ & ( \D[1]~input_o\ & ( !\D[3]~input_o\ $ (\D[2]~input_o\) ) ) ) # ( \D[0]~input_o\ & ( !\D[1]~input_o\ & ( 
-- (!\D[3]~input_o\) # (\D[2]~input_o\) ) ) ) # ( !\D[0]~input_o\ & ( !\D[1]~input_o\ & ( \D[2]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111110011001111111111001100001100111111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_D[3]~input_o\,
	datad => \ALT_INV_D[2]~input_o\,
	datae => \ALT_INV_D[0]~input_o\,
	dataf => \ALT_INV_D[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][6]~combout\);

-- Location: LABCELL_X47_Y3_N0
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_cout\ = CARRY(( \D[4]~input_o\ ) + ( \Mult0|mult_core|romout[0][6]~combout\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_D[4]~input_o\,
	dataf => \Mult0|mult_core|ALT_INV_romout[0][6]~combout\,
	cin => GND,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_cout\);

-- Location: LABCELL_X47_Y3_N2
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_cout\ = CARRY(( \Mult0|mult_core|romout[0][7]~7_combout\ ) + ( \D[5]~input_o\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mult0|mult_core|ALT_INV_romout[0][7]~7_combout\,
	dataf => \ALT_INV_D[5]~input_o\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_cout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_cout\);

-- Location: LABCELL_X47_Y3_N4
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_cout\ = CARRY(( \Mult0|mult_core|romout[1][4]~5_combout\ ) + ( \Mult0|mult_core|romout[0][8]~6_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mult0|mult_core|ALT_INV_romout[0][8]~6_combout\,
	datad => \Mult0|mult_core|ALT_INV_romout[1][4]~5_combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_cout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_cout\);

-- Location: LABCELL_X47_Y3_N6
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

-- Location: LABCELL_X47_Y3_N8
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17_sumout\ = SUM(( \Mult0|mult_core|romout[1][6]~combout\ ) + ( \Mult0|mult_core|romout[0][10]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\ = CARRY(( \Mult0|mult_core|romout[1][6]~combout\ ) + ( \Mult0|mult_core|romout[0][10]~combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mult0|mult_core|ALT_INV_romout[1][6]~combout\,
	dataf => \Mult0|mult_core|ALT_INV_romout[0][10]~combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\);

-- Location: LABCELL_X47_Y3_N10
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21_sumout\ = SUM(( \Mult0|mult_core|romout[0][11]~combout\ ) + ( \Mult0|mult_core|romout[1][7]~3_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\ = CARRY(( \Mult0|mult_core|romout[0][11]~combout\ ) + ( \Mult0|mult_core|romout[1][7]~3_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mult0|mult_core|ALT_INV_romout[0][11]~combout\,
	dataf => \Mult0|mult_core|ALT_INV_romout[1][7]~3_combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\);

-- Location: LABCELL_X47_Y3_N12
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25_sumout\ = SUM(( \Mult0|mult_core|romout[0][12]~2_combout\ ) + ( \Mult0|mult_core|romout[1][8]~1_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26\ = CARRY(( \Mult0|mult_core|romout[0][12]~2_combout\ ) + ( \Mult0|mult_core|romout[1][8]~1_combout\ ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mult0|mult_core|ALT_INV_romout[0][12]~2_combout\,
	dataf => \Mult0|mult_core|ALT_INV_romout[1][8]~1_combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26\);

-- Location: LABCELL_X47_Y3_N14
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29_sumout\ = SUM(( \Mult0|mult_core|romout[1][9]~0_combout\ ) + ( GND ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~30\ = CARRY(( \Mult0|mult_core|romout[1][9]~0_combout\ ) + ( GND ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mult0|mult_core|ALT_INV_romout[1][9]~0_combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~30\);

-- Location: LABCELL_X47_Y3_N16
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

-- Location: IOIBUF_X45_Y0_N94
\adjust~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_adjust,
	o => \adjust~input_o\);

-- Location: MLABCELL_X46_Y3_N38
\D_new[1]~0\ : arriaii_lcell_comb
-- Equation(s):
-- \D_new[1]~0_combout\ = ( \adjust~input_o\ & ( !\rst~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_rst~input_o\,
	dataf => \ALT_INV_adjust~input_o\,
	combout => \D_new[1]~0_combout\);

-- Location: FF_X47_Y3_N17
\D_new[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33_sumout\,
	ena => \D_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_new(5));

-- Location: MLABCELL_X49_Y3_N20
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

-- Location: MLABCELL_X49_Y3_N10
\Equal0~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( !counter(2) & ( (counter(0) & counter(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_counter(0),
	datad => ALT_INV_counter(1),
	dataf => ALT_INV_counter(2),
	combout => \Equal0~1_combout\);

-- Location: MLABCELL_X49_Y3_N12
\Equal0~2\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = ( \Equal0~0_combout\ & ( \Equal0~1_combout\ & ( !counter(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter(3),
	datae => \ALT_INV_Equal0~0_combout\,
	dataf => \ALT_INV_Equal0~1_combout\,
	combout => \Equal0~2_combout\);

-- Location: FF_X49_Y3_N21
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
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(0));

-- Location: MLABCELL_X49_Y3_N22
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

-- Location: FF_X49_Y3_N23
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
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(1));

-- Location: MLABCELL_X49_Y3_N24
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

-- Location: FF_X49_Y3_N25
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
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(2));

-- Location: MLABCELL_X49_Y3_N26
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

-- Location: FF_X49_Y3_N27
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
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(3));

-- Location: MLABCELL_X49_Y3_N28
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

-- Location: FF_X49_Y3_N29
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
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(4));

-- Location: MLABCELL_X49_Y3_N30
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

-- Location: FF_X49_Y3_N31
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
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(5));

-- Location: MLABCELL_X49_Y3_N32
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

-- Location: FF_X49_Y3_N33
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
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(6));

-- Location: MLABCELL_X49_Y3_N34
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

-- Location: FF_X49_Y3_N35
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
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(7));

-- Location: MLABCELL_X49_Y3_N36
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

-- Location: FF_X49_Y3_N37
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
	sclr => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(8));

-- Location: MLABCELL_X49_Y3_N4
\Equal0~0\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( counter(8) & ( counter(4) & ( (counter(5) & (counter(6) & counter(7))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_counter(5),
	datac => ALT_INV_counter(6),
	datad => ALT_INV_counter(7),
	datae => ALT_INV_counter(8),
	dataf => ALT_INV_counter(4),
	combout => \Equal0~0_combout\);

-- Location: MLABCELL_X49_Y3_N8
\D_current[0]~0\ : arriaii_lcell_comb
-- Equation(s):
-- \D_current[0]~0_combout\ = ( \Equal0~1_combout\ & ( (!\rst~input_o\ & (\Equal0~0_combout\ & !counter(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001100000000000000110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_rst~input_o\,
	datac => \ALT_INV_Equal0~0_combout\,
	datad => ALT_INV_counter(3),
	dataf => \ALT_INV_Equal0~1_combout\,
	combout => \D_current[0]~0_combout\);

-- Location: FF_X49_Y3_N19
\D_current[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => D_new(5),
	sload => VCC,
	ena => \D_current[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_current(5));

-- Location: LABCELL_X47_Y3_N38
\Mult0|mult_core|romout[1][12]~8\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][12]~8_combout\ = ( \D[5]~input_o\ & ( \D[7]~input_o\ ) ) # ( !\D[5]~input_o\ & ( (\D[7]~input_o\ & ((\D[6]~input_o\) # (\D[4]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101010101000001010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_D[7]~input_o\,
	datac => \ALT_INV_D[4]~input_o\,
	datad => \ALT_INV_D[6]~input_o\,
	dataf => \ALT_INV_D[5]~input_o\,
	combout => \Mult0|mult_core|romout[1][12]~8_combout\);

-- Location: LABCELL_X47_Y3_N36
\Mult0|mult_core|romout[1][11]\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][11]~combout\ = ( \D[5]~input_o\ & ( \D[6]~input_o\ ) ) # ( !\D[5]~input_o\ & ( (!\D[4]~input_o\ & (\D[7]~input_o\ & !\D[6]~input_o\)) # (\D[4]~input_o\ & ((\D[6]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000110011000011000011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_D[4]~input_o\,
	datac => \ALT_INV_D[7]~input_o\,
	datad => \ALT_INV_D[6]~input_o\,
	dataf => \ALT_INV_D[5]~input_o\,
	combout => \Mult0|mult_core|romout[1][11]~combout\);

-- Location: LABCELL_X47_Y3_N18
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37\ : arriaii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37_sumout\ = SUM(( \Mult0|mult_core|romout[1][11]~combout\ ) + ( GND ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34\ ))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~38\ = CARRY(( \Mult0|mult_core|romout[1][11]~combout\ ) + ( GND ) + ( \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mult0|mult_core|ALT_INV_romout[1][11]~combout\,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34\,
	sumout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37_sumout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~38\);

-- Location: LABCELL_X47_Y3_N20
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

-- Location: FF_X47_Y3_N21
\D_new[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41_sumout\,
	ena => \D_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_new(7));

-- Location: FF_X49_Y3_N15
\D_current[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => D_new(7),
	sload => VCC,
	ena => \D_current[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_current(7));

-- Location: FF_X47_Y3_N19
\D_new[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37_sumout\,
	ena => \D_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_new(6));

-- Location: FF_X50_Y3_N7
\D_current[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => D_new(6),
	sload => VCC,
	ena => \D_current[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_current(6));

-- Location: MLABCELL_X49_Y3_N0
\Equal1~0\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = ( counter(7) & ( D_current(6) & ( (counter(6) & (D_current(7) & (!D_current(5) $ (counter(5))))) ) ) ) # ( !counter(7) & ( D_current(6) & ( (counter(6) & (!D_current(7) & (!D_current(5) $ (counter(5))))) ) ) ) # ( counter(7) & ( 
-- !D_current(6) & ( (!counter(6) & (D_current(7) & (!D_current(5) $ (counter(5))))) ) ) ) # ( !counter(7) & ( !D_current(6) & ( (!counter(6) & (!D_current(7) & (!D_current(5) $ (counter(5))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001000000000000000000001001000000001001000000000000000000001001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_D_current(5),
	datab => ALT_INV_counter(5),
	datac => ALT_INV_counter(6),
	datad => ALT_INV_D_current(7),
	datae => ALT_INV_counter(7),
	dataf => ALT_INV_D_current(6),
	combout => \Equal1~0_combout\);

-- Location: FF_X47_Y3_N7
\D_new[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13_sumout\,
	ena => \D_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_new(0));

-- Location: FF_X50_Y3_N11
\D_current[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => D_new(0),
	sload => VCC,
	ena => \D_current[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_current(0));

-- Location: FF_X47_Y3_N9
\D_new[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17_sumout\,
	ena => \D_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_new(1));

-- Location: FF_X50_Y3_N1
\D_current[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => D_new(1),
	sload => VCC,
	ena => \D_current[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_current(1));

-- Location: LABCELL_X50_Y3_N36
\Equal1~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = ( D_current(0) & ( D_current(1) & ( (counter(1) & (counter(0) & !counter(8))) ) ) ) # ( !D_current(0) & ( D_current(1) & ( (counter(1) & (!counter(0) & !counter(8))) ) ) ) # ( D_current(0) & ( !D_current(1) & ( (!counter(1) & 
-- (counter(0) & !counter(8))) ) ) ) # ( !D_current(0) & ( !D_current(1) & ( (!counter(1) & (!counter(0) & !counter(8))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000000011000000000000110000000000000000001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_counter(1),
	datac => ALT_INV_counter(0),
	datad => ALT_INV_counter(8),
	datae => ALT_INV_D_current(0),
	dataf => ALT_INV_D_current(1),
	combout => \Equal1~1_combout\);

-- Location: FF_X47_Y3_N15
\D_new[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29_sumout\,
	ena => \D_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_new(4));

-- Location: FF_X49_Y3_N3
\D_current[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => D_new(4),
	sload => VCC,
	ena => \D_current[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_current(4));

-- Location: FF_X47_Y3_N13
\D_new[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25_sumout\,
	ena => \D_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_new(3));

-- Location: FF_X50_Y3_N17
\D_current[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => D_new(3),
	sload => VCC,
	ena => \D_current[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_current(3));

-- Location: FF_X47_Y3_N11
\D_new[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21_sumout\,
	ena => \D_new[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_new(2));

-- Location: FF_X50_Y3_N39
\D_current[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => D_new(2),
	sload => VCC,
	ena => \D_current[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => D_current(2));

-- Location: MLABCELL_X49_Y3_N16
\Equal1~2\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = ( D_current(3) & ( D_current(2) & ( (counter(2) & (counter(3) & (!counter(4) $ (D_current(4))))) ) ) ) # ( !D_current(3) & ( D_current(2) & ( (counter(2) & (!counter(3) & (!counter(4) $ (D_current(4))))) ) ) ) # ( D_current(3) & ( 
-- !D_current(2) & ( (!counter(2) & (counter(3) & (!counter(4) $ (D_current(4))))) ) ) ) # ( !D_current(3) & ( !D_current(2) & ( (!counter(2) & (!counter(3) & (!counter(4) $ (D_current(4))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001000000000000000000001001000000001001000000000000000000001001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter(4),
	datab => ALT_INV_D_current(4),
	datac => ALT_INV_counter(2),
	datad => ALT_INV_counter(3),
	datae => ALT_INV_D_current(3),
	dataf => ALT_INV_D_current(2),
	combout => \Equal1~2_combout\);

-- Location: LABCELL_X50_Y3_N12
\pwmout~0\ : arriaii_lcell_comb
-- Equation(s):
-- \pwmout~0_combout\ = ( \Equal1~2_combout\ & ( (\pwmout~reg0_q\ & ((!\Equal1~0_combout\) # (!\Equal1~1_combout\))) ) ) # ( !\Equal1~2_combout\ & ( \pwmout~reg0_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010100000101010101010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pwmout~reg0_q\,
	datac => \ALT_INV_Equal1~0_combout\,
	datad => \ALT_INV_Equal1~1_combout\,
	dataf => \ALT_INV_Equal1~2_combout\,
	combout => \pwmout~0_combout\);

-- Location: LABCELL_X50_Y3_N14
\Equal2~0\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = ( counter(0) & ( !D_current(0) ) ) # ( !counter(0) & ( D_current(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_D_current(0),
	dataf => ALT_INV_counter(0),
	combout => \Equal2~0_combout\);

-- Location: LABCELL_X50_Y3_N20
\Add1~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( !D_current(1) ) + ( !D_current(0) ) + ( !VCC ))
-- \Add1~2\ = CARRY(( !D_current(1) ) + ( !D_current(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_D_current(1),
	dataf => ALT_INV_D_current(0),
	cin => GND,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\);

-- Location: LABCELL_X50_Y3_N18
\pwmout~3\ : arriaii_lcell_comb
-- Equation(s):
-- \pwmout~3_combout\ = ( \Equal1~1_combout\ & ( \Add1~1_sumout\ & ( (counter(1) & (!\Equal2~0_combout\ & ((!\Equal1~2_combout\) # (!\Equal1~0_combout\)))) ) ) ) # ( !\Equal1~1_combout\ & ( \Add1~1_sumout\ & ( (counter(1) & !\Equal2~0_combout\) ) ) ) # ( 
-- \Equal1~1_combout\ & ( !\Add1~1_sumout\ & ( (!counter(1) & (!\Equal2~0_combout\ & ((!\Equal1~2_combout\) # (!\Equal1~0_combout\)))) ) ) ) # ( !\Equal1~1_combout\ & ( !\Add1~1_sumout\ & ( (!counter(1) & !\Equal2~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000000001000100010001000100010001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter(1),
	datab => \ALT_INV_Equal2~0_combout\,
	datac => \ALT_INV_Equal1~2_combout\,
	datad => \ALT_INV_Equal1~0_combout\,
	datae => \ALT_INV_Equal1~1_combout\,
	dataf => \ALT_INV_Add1~1_sumout\,
	combout => \pwmout~3_combout\);

-- Location: LABCELL_X50_Y3_N22
\Add1~5\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( VCC ) + ( !D_current(2) ) + ( \Add1~2\ ))
-- \Add1~6\ = CARRY(( VCC ) + ( !D_current(2) ) + ( \Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_D_current(2),
	cin => \Add1~2\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\);

-- Location: LABCELL_X50_Y3_N24
\Add1~9\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( GND ) + ( !D_current(3) ) + ( \Add1~6\ ))
-- \Add1~10\ = CARRY(( GND ) + ( !D_current(3) ) + ( \Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_D_current(3),
	cin => \Add1~6\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\);

-- Location: LABCELL_X50_Y3_N26
\Add1~13\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( VCC ) + ( !D_current(4) ) + ( \Add1~10\ ))
-- \Add1~14\ = CARRY(( VCC ) + ( !D_current(4) ) + ( \Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_D_current(4),
	cin => \Add1~10\,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\);

-- Location: LABCELL_X50_Y3_N28
\Add1~17\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( VCC ) + ( !D_current(5) ) + ( \Add1~14\ ))
-- \Add1~18\ = CARRY(( VCC ) + ( !D_current(5) ) + ( \Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_D_current(5),
	cin => \Add1~14\,
	sumout => \Add1~17_sumout\,
	cout => \Add1~18\);

-- Location: LABCELL_X50_Y3_N30
\Add1~21\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~21_sumout\ = SUM(( VCC ) + ( !D_current(6) ) + ( \Add1~18\ ))
-- \Add1~22\ = CARRY(( VCC ) + ( !D_current(6) ) + ( \Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_D_current(6),
	cin => \Add1~18\,
	sumout => \Add1~21_sumout\,
	cout => \Add1~22\);

-- Location: LABCELL_X50_Y3_N32
\Add1~25\ : arriaii_lcell_comb
-- Equation(s):
-- \Add1~25_sumout\ = SUM(( VCC ) + ( !D_current(7) ) + ( \Add1~22\ ))
-- \Add1~26\ = CARRY(( VCC ) + ( !D_current(7) ) + ( \Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_D_current(7),
	cin => \Add1~22\,
	sumout => \Add1~25_sumout\,
	cout => \Add1~26\);

-- Location: LABCELL_X50_Y3_N34
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

-- Location: LABCELL_X50_Y3_N4
\pwmout~2\ : arriaii_lcell_comb
-- Equation(s):
-- \pwmout~2_combout\ = ( \Add1~5_sumout\ & ( \Add1~13_sumout\ & ( (counter(2) & (counter(4) & (!counter(3) $ (\Add1~9_sumout\)))) ) ) ) # ( !\Add1~5_sumout\ & ( \Add1~13_sumout\ & ( (!counter(2) & (counter(4) & (!counter(3) $ (\Add1~9_sumout\)))) ) ) ) # ( 
-- \Add1~5_sumout\ & ( !\Add1~13_sumout\ & ( (counter(2) & (!counter(4) & (!counter(3) $ (\Add1~9_sumout\)))) ) ) ) # ( !\Add1~5_sumout\ & ( !\Add1~13_sumout\ & ( (!counter(2) & (!counter(4) & (!counter(3) $ (\Add1~9_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001000000000010000010000000000000000100000100000000001000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter(2),
	datab => ALT_INV_counter(3),
	datac => \ALT_INV_Add1~9_sumout\,
	datad => ALT_INV_counter(4),
	datae => \ALT_INV_Add1~5_sumout\,
	dataf => \ALT_INV_Add1~13_sumout\,
	combout => \pwmout~2_combout\);

-- Location: LABCELL_X50_Y3_N2
\pwmout~1\ : arriaii_lcell_comb
-- Equation(s):
-- \pwmout~1_combout\ = ( \Add1~21_sumout\ & ( \Add1~25_sumout\ & ( (counter(6) & (counter(7) & (!counter(5) $ (\Add1~17_sumout\)))) ) ) ) # ( !\Add1~21_sumout\ & ( \Add1~25_sumout\ & ( (!counter(6) & (counter(7) & (!counter(5) $ (\Add1~17_sumout\)))) ) ) ) 
-- # ( \Add1~21_sumout\ & ( !\Add1~25_sumout\ & ( (counter(6) & (!counter(7) & (!counter(5) $ (\Add1~17_sumout\)))) ) ) ) # ( !\Add1~21_sumout\ & ( !\Add1~25_sumout\ & ( (!counter(6) & (!counter(7) & (!counter(5) $ (\Add1~17_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000001000010000000000010000100000000000100001000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter(6),
	datab => ALT_INV_counter(7),
	datac => ALT_INV_counter(5),
	datad => \ALT_INV_Add1~17_sumout\,
	datae => \ALT_INV_Add1~21_sumout\,
	dataf => \ALT_INV_Add1~25_sumout\,
	combout => \pwmout~1_combout\);

-- Location: LABCELL_X50_Y3_N8
\pwmout~4\ : arriaii_lcell_comb
-- Equation(s):
-- \pwmout~4_combout\ = ( \pwmout~2_combout\ & ( \pwmout~1_combout\ & ( ((\pwmout~3_combout\ & (!counter(8) $ (!\Add1~29_sumout\)))) # (\pwmout~0_combout\) ) ) ) # ( !\pwmout~2_combout\ & ( \pwmout~1_combout\ & ( \pwmout~0_combout\ ) ) ) # ( 
-- \pwmout~2_combout\ & ( !\pwmout~1_combout\ & ( \pwmout~0_combout\ ) ) ) # ( !\pwmout~2_combout\ & ( !\pwmout~1_combout\ & ( \pwmout~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101011101011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pwmout~0_combout\,
	datab => ALT_INV_counter(8),
	datac => \ALT_INV_pwmout~3_combout\,
	datad => \ALT_INV_Add1~29_sumout\,
	datae => \ALT_INV_pwmout~2_combout\,
	dataf => \ALT_INV_pwmout~1_combout\,
	combout => \pwmout~4_combout\);

-- Location: FF_X50_Y3_N9
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

-- Location: IOIBUF_X48_Y0_N1
\direction_in~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_direction_in,
	o => \direction_in~input_o\);

-- Location: MLABCELL_X49_Y3_N6
\Equal0~0DUPLICATE\ : arriaii_lcell_comb
-- Equation(s):
-- \Equal0~0DUPLICATE_combout\ = ( counter(8) & ( counter(4) & ( (counter(5) & (counter(7) & counter(6))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_counter(5),
	datac => ALT_INV_counter(7),
	datad => ALT_INV_counter(6),
	datae => ALT_INV_counter(8),
	dataf => ALT_INV_counter(4),
	combout => \Equal0~0DUPLICATE_combout\);

-- Location: MLABCELL_X49_Y3_N38
\direction_out~0\ : arriaii_lcell_comb
-- Equation(s):
-- \direction_out~0_combout\ = ( \Equal0~1_combout\ & ( (!counter(3) & ((!\Equal0~0DUPLICATE_combout\ & ((\direction_out~reg0_q\))) # (\Equal0~0DUPLICATE_combout\ & (\direction_in~input_o\)))) # (counter(3) & (((\direction_out~reg0_q\)))) ) ) # ( 
-- !\Equal0~1_combout\ & ( \direction_out~reg0_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000100111101110000010011110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_direction_in~input_o\,
	datab => ALT_INV_counter(3),
	datac => \ALT_INV_Equal0~0DUPLICATE_combout\,
	datad => \ALT_INV_direction_out~reg0_q\,
	dataf => \ALT_INV_Equal0~1_combout\,
	combout => \direction_out~0_combout\);

-- Location: FF_X49_Y3_N39
\direction_out~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \direction_out~0_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \direction_out~reg0_q\);

ww_pwmout <= \pwmout~output_o\;

ww_direction_out <= \direction_out~output_o\;
END structure;


