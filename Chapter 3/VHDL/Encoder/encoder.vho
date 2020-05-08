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

-- DATE "05/01/2020 17:35:01"

-- 
-- Device: Altera EP2AGX45CU17I3 Package UFBGA358
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ARRIAII;
LIBRARY IEEE;
LIBRARY STD;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ARRIAII.ARRIAII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.STANDARD.ALL;

ENTITY 	encoder IS
    PORT (
	a : IN std_logic;
	b : IN std_logic;
	rst : IN std_logic;
	clk : IN std_logic;
	currentPos : OUT STD.STANDARD.integer range 0 TO 15
	);
END encoder;

-- Design Ports Information
-- currentPos[0]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- currentPos[1]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- currentPos[2]	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- currentPos[3]	=>  Location: PIN_G6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF encoder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic;
SIGNAL ww_b : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_currentPos : std_logic_vector(3 DOWNTO 0);
SIGNAL \currentPos[0]~output_o\ : std_logic;
SIGNAL \currentPos[1]~output_o\ : std_logic;
SIGNAL \currentPos[2]~output_o\ : std_logic;
SIGNAL \currentPos[3]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \current[0]~0_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \a~input_o\ : std_logic;
SIGNAL \a_prev~q\ : std_logic;
SIGNAL \b~input_o\ : std_logic;
SIGNAL \b_prev~q\ : std_logic;
SIGNAL \ticked~0_combout\ : std_logic;
SIGNAL \ticked~q\ : std_logic;
SIGNAL \dir~0_combout\ : std_logic;
SIGNAL \dir~q\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL current : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_b~input_o\ : std_logic;
SIGNAL \ALT_INV_a~input_o\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \ALT_INV_b_prev~q\ : std_logic;
SIGNAL \ALT_INV_a_prev~q\ : std_logic;
SIGNAL \ALT_INV_dir~q\ : std_logic;
SIGNAL ALT_INV_current : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_a <= a;
ww_b <= b;
ww_rst <= rst;
ww_clk <= clk;
currentPos <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_currentPos));
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_rst~inputclkctrl_outclk\ <= NOT \rst~inputclkctrl_outclk\;
\ALT_INV_b~input_o\ <= NOT \b~input_o\;
\ALT_INV_a~input_o\ <= NOT \a~input_o\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\ALT_INV_b_prev~q\ <= NOT \b_prev~q\;
\ALT_INV_a_prev~q\ <= NOT \a_prev~q\;
\ALT_INV_dir~q\ <= NOT \dir~q\;
ALT_INV_current(3) <= NOT current(3);
ALT_INV_current(2) <= NOT current(2);
ALT_INV_current(1) <= NOT current(1);
ALT_INV_current(0) <= NOT current(0);

-- Location: IOOBUF_X59_Y49_N67
\currentPos[0]~output\ : arriaii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => current(0),
	devoe => ww_devoe,
	o => \currentPos[0]~output_o\);

-- Location: IOOBUF_X59_Y48_N67
\currentPos[1]~output\ : arriaii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => current(1),
	devoe => ww_devoe,
	o => \currentPos[1]~output_o\);

-- Location: IOOBUF_X59_Y49_N98
\currentPos[2]~output\ : arriaii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => current(2),
	devoe => ww_devoe,
	o => \currentPos[2]~output_o\);

-- Location: IOOBUF_X59_Y48_N98
\currentPos[3]~output\ : arriaii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => current(3),
	devoe => ww_devoe,
	o => \currentPos[3]~output_o\);

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

-- Location: LABCELL_X58_Y49_N16
\current[0]~0\ : arriaii_lcell_comb
-- Equation(s):
-- \current[0]~0_combout\ = !current(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_current(0),
	combout => \current[0]~0_combout\);

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

-- Location: IOIBUF_X59_Y49_N32
\a~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a,
	o => \a~input_o\);

-- Location: FF_X58_Y49_N23
a_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \a~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \a_prev~q\);

-- Location: IOIBUF_X59_Y49_N1
\b~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b,
	o => \b~input_o\);

-- Location: FF_X58_Y49_N25
b_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \b~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b_prev~q\);

-- Location: LABCELL_X58_Y49_N26
\ticked~0\ : arriaii_lcell_comb
-- Equation(s):
-- \ticked~0_combout\ = ( \a~input_o\ & ( \b~input_o\ & ( (!\a_prev~q\) # (!\b_prev~q\) ) ) ) # ( !\a~input_o\ & ( \b~input_o\ & ( (!\b_prev~q\) # (\a_prev~q\) ) ) ) # ( \a~input_o\ & ( !\b~input_o\ & ( (!\a_prev~q\) # (\b_prev~q\) ) ) ) # ( !\a~input_o\ & ( 
-- !\b~input_o\ & ( (\b_prev~q\) # (\a_prev~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111111100001111111111111111000011111111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_a_prev~q\,
	datad => \ALT_INV_b_prev~q\,
	datae => \ALT_INV_a~input_o\,
	dataf => \ALT_INV_b~input_o\,
	combout => \ticked~0_combout\);

-- Location: FF_X58_Y49_N27
ticked : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ticked~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ticked~q\);

-- Location: FF_X58_Y49_N17
\current[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \current[0]~0_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	ena => \ticked~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current(0));

-- Location: LABCELL_X58_Y49_N18
\dir~0\ : arriaii_lcell_comb
-- Equation(s):
-- \dir~0_combout\ = ( \b_prev~q\ & ( !\a~input_o\ ) ) # ( !\b_prev~q\ & ( \a~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a~input_o\,
	dataf => \ALT_INV_b_prev~q\,
	combout => \dir~0_combout\);

-- Location: FF_X58_Y49_N19
dir : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \dir~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dir~q\);

-- Location: LABCELL_X58_Y49_N14
\Add0~0\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = ( current(1) & ( current(0) & ( !\dir~q\ ) ) ) # ( !current(1) & ( current(0) & ( \dir~q\ ) ) ) # ( current(1) & ( !current(0) & ( \dir~q\ ) ) ) # ( !current(1) & ( !current(0) & ( !\dir~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000000000001111111100000000111111111111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_dir~q\,
	datae => ALT_INV_current(1),
	dataf => ALT_INV_current(0),
	combout => \Add0~0_combout\);

-- Location: FF_X58_Y49_N15
\current[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~0_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	ena => \ticked~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current(1));

-- Location: LABCELL_X58_Y49_N32
\Add0~1\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = ( current(2) & ( current(1) & ( (!\dir~q\) # (!current(0)) ) ) ) # ( !current(2) & ( current(1) & ( (\dir~q\ & current(0)) ) ) ) # ( current(2) & ( !current(1) & ( (current(0)) # (\dir~q\) ) ) ) # ( !current(2) & ( !current(1) & ( 
-- (!\dir~q\ & !current(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000000011111111111100000000000011111111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_dir~q\,
	datad => ALT_INV_current(0),
	datae => ALT_INV_current(2),
	dataf => ALT_INV_current(1),
	combout => \Add0~1_combout\);

-- Location: FF_X58_Y49_N33
\current[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~1_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	ena => \ticked~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current(2));

-- Location: LABCELL_X58_Y49_N36
\Add0~2\ : arriaii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = ( current(3) & ( current(1) & ( (!\dir~q\) # ((!current(2)) # (!current(0))) ) ) ) # ( !current(3) & ( current(1) & ( (\dir~q\ & (current(2) & current(0))) ) ) ) # ( current(3) & ( !current(1) & ( ((current(0)) # (current(2))) # 
-- (\dir~q\) ) ) ) # ( !current(3) & ( !current(1) & ( (!\dir~q\ & (!current(2) & !current(0))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000010111111111111100000000000001011111111111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dir~q\,
	datac => ALT_INV_current(2),
	datad => ALT_INV_current(0),
	datae => ALT_INV_current(3),
	dataf => ALT_INV_current(1),
	combout => \Add0~2_combout\);

-- Location: FF_X58_Y49_N37
\current[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~2_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	ena => \ticked~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current(3));

ww_currentPos(0) <= \currentPos[0]~output_o\;

ww_currentPos(1) <= \currentPos[1]~output_o\;

ww_currentPos(2) <= \currentPos[2]~output_o\;

ww_currentPos(3) <= \currentPos[3]~output_o\;
END structure;


