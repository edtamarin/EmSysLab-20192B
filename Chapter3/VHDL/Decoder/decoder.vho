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

-- DATE "05/04/2020 20:59:44"

-- 
-- Device: Altera EP2AGX45CU17C4 Package UFBGA358
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

ENTITY 	decoder IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	a : IN std_logic;
	b : IN std_logic;
	direction : BUFFER std_logic;
	position : BUFFER STD.STANDARD.integer range 0 TO 15
	);
END decoder;

-- Design Ports Information
-- direction	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[0]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[1]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[2]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[3]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF decoder IS
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
SIGNAL ww_a : std_logic;
SIGNAL ww_b : std_logic;
SIGNAL ww_direction : std_logic;
SIGNAL ww_position : std_logic_vector(3 DOWNTO 0);
SIGNAL \direction~output_o\ : std_logic;
SIGNAL \position[0]~output_o\ : std_logic;
SIGNAL \position[1]~output_o\ : std_logic;
SIGNAL \position[2]~output_o\ : std_logic;
SIGNAL \position[3]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \a~input_o\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \a_prev~q\ : std_logic;
SIGNAL \b~input_o\ : std_logic;
SIGNAL \b_new[0]~feeder_combout\ : std_logic;
SIGNAL \b_prev~q\ : std_logic;
SIGNAL \direction~0_combout\ : std_logic;
SIGNAL \direction~reg0_q\ : std_logic;
SIGNAL \position[0]~3_combout\ : std_logic;
SIGNAL \rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \position[0]~reg0_q\ : std_logic;
SIGNAL \position~0_combout\ : std_logic;
SIGNAL \position[1]~reg0_q\ : std_logic;
SIGNAL \position~1_combout\ : std_logic;
SIGNAL \position[2]~reg0_q\ : std_logic;
SIGNAL \position~2_combout\ : std_logic;
SIGNAL \position[3]~reg0_q\ : std_logic;
SIGNAL b_new : std_logic_vector(1 DOWNTO 0);
SIGNAL a_new : std_logic_vector(1 DOWNTO 0);
SIGNAL ALT_INV_b_new : std_logic_vector(1 DOWNTO 1);
SIGNAL \ALT_INV_a_prev~q\ : std_logic;
SIGNAL \ALT_INV_b_prev~q\ : std_logic;
SIGNAL ALT_INV_a_new : std_logic_vector(1 DOWNTO 1);
SIGNAL \ALT_INV_position[3]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_position[2]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_position[1]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_position[0]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_direction~reg0_q\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \ALT_INV_rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_b~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_a <= a;
ww_b <= b;
direction <= ww_direction;
position <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_position));
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
ALT_INV_b_new(1) <= NOT b_new(1);
\ALT_INV_a_prev~q\ <= NOT \a_prev~q\;
\ALT_INV_b_prev~q\ <= NOT \b_prev~q\;
ALT_INV_a_new(1) <= NOT a_new(1);
\ALT_INV_position[3]~reg0_q\ <= NOT \position[3]~reg0_q\;
\ALT_INV_position[2]~reg0_q\ <= NOT \position[2]~reg0_q\;
\ALT_INV_position[1]~reg0_q\ <= NOT \position[1]~reg0_q\;
\ALT_INV_position[0]~reg0_q\ <= NOT \position[0]~reg0_q\;
\ALT_INV_direction~reg0_q\ <= NOT \direction~reg0_q\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\ALT_INV_rst~inputclkctrl_outclk\ <= NOT \rst~inputclkctrl_outclk\;
\ALT_INV_b~input_o\ <= NOT \b~input_o\;

-- Location: IOOBUF_X31_Y56_N2
\direction~output\ : arriaii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \direction~reg0_q\,
	devoe => ww_devoe,
	o => \direction~output_o\);

-- Location: IOOBUF_X31_Y56_N98
\position[0]~output\ : arriaii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \position[0]~reg0_q\,
	devoe => ww_devoe,
	o => \position[0]~output_o\);

-- Location: IOOBUF_X31_Y56_N67
\position[1]~output\ : arriaii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \position[1]~reg0_q\,
	devoe => ww_devoe,
	o => \position[1]~output_o\);

-- Location: IOOBUF_X30_Y56_N36
\position[2]~output\ : arriaii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \position[2]~reg0_q\,
	devoe => ww_devoe,
	o => \position[2]~output_o\);

-- Location: IOOBUF_X30_Y56_N98
\position[3]~output\ : arriaii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \position[3]~reg0_q\,
	devoe => ww_devoe,
	o => \position[3]~output_o\);

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

-- Location: IOIBUF_X30_Y56_N63
\a~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a,
	o => \a~input_o\);

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

-- Location: FF_X30_Y52_N37
\a_new[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \a~input_o\,
	sload => VCC,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => a_new(0));

-- Location: FF_X30_Y52_N35
\a_new[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => a_new(0),
	sload => VCC,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => a_new(1));

-- Location: FF_X30_Y52_N21
a_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => a_new(1),
	sload => VCC,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \a_prev~q\);

-- Location: IOIBUF_X30_Y56_N1
\b~input\ : arriaii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b,
	o => \b~input_o\);

-- Location: LABCELL_X30_Y52_N24
\b_new[0]~feeder\ : arriaii_lcell_comb
-- Equation(s):
-- \b_new[0]~feeder_combout\ = ( \b~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_b~input_o\,
	combout => \b_new[0]~feeder_combout\);

-- Location: FF_X30_Y52_N25
\b_new[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \b_new[0]~feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => b_new(0));

-- Location: FF_X30_Y52_N9
\b_new[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => b_new(0),
	sload => VCC,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => b_new(1));

-- Location: FF_X30_Y52_N29
b_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => b_new(1),
	sload => VCC,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b_prev~q\);

-- Location: LABCELL_X30_Y52_N16
\direction~0\ : arriaii_lcell_comb
-- Equation(s):
-- \direction~0_combout\ = ( \direction~reg0_q\ & ( a_new(1) & ( ((!\b_prev~q\) # ((\a_prev~q\ & b_new(1)))) # (\rst~input_o\) ) ) ) # ( !\direction~reg0_q\ & ( a_new(1) & ( (!\rst~input_o\ & (!\b_prev~q\ & ((!\a_prev~q\) # (b_new(1))))) ) ) ) # ( 
-- \direction~reg0_q\ & ( !a_new(1) & ( (((!\a_prev~q\ & !b_new(1))) # (\b_prev~q\)) # (\rst~input_o\) ) ) ) # ( !\direction~reg0_q\ & ( !a_new(1) & ( (!\rst~input_o\ & (\b_prev~q\ & ((!b_new(1)) # (\a_prev~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100101100111111111110001100000000001111111100110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a_prev~q\,
	datab => \ALT_INV_rst~input_o\,
	datac => ALT_INV_b_new(1),
	datad => \ALT_INV_b_prev~q\,
	datae => \ALT_INV_direction~reg0_q\,
	dataf => ALT_INV_a_new(1),
	combout => \direction~0_combout\);

-- Location: FF_X30_Y52_N17
\direction~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \direction~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \direction~reg0_q\);

-- Location: LABCELL_X30_Y52_N22
\position[0]~3\ : arriaii_lcell_comb
-- Equation(s):
-- \position[0]~3_combout\ = ( !\position[0]~reg0_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_position[0]~reg0_q\,
	combout => \position[0]~3_combout\);

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

-- Location: LABCELL_X30_Y52_N38
\process_0~0\ : arriaii_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = ( b_new(1) & ( \b_prev~q\ & ( !a_new(1) $ (!\a_prev~q\) ) ) ) # ( !b_new(1) & ( \b_prev~q\ ) ) # ( b_new(1) & ( !\b_prev~q\ ) ) # ( !b_new(1) & ( !\b_prev~q\ & ( !a_new(1) $ (!\a_prev~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000111111111111111111111111111111110000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_a_new(1),
	datad => \ALT_INV_a_prev~q\,
	datae => ALT_INV_b_new(1),
	dataf => \ALT_INV_b_prev~q\,
	combout => \process_0~0_combout\);

-- Location: FF_X30_Y52_N23
\position[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \position[0]~3_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	ena => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \position[0]~reg0_q\);

-- Location: LABCELL_X30_Y52_N32
\position~0\ : arriaii_lcell_comb
-- Equation(s):
-- \position~0_combout\ = ( \position[1]~reg0_q\ & ( \b_prev~q\ & ( !\position[0]~reg0_q\ $ (a_new(1)) ) ) ) # ( !\position[1]~reg0_q\ & ( \b_prev~q\ & ( !\position[0]~reg0_q\ $ (!a_new(1)) ) ) ) # ( \position[1]~reg0_q\ & ( !\b_prev~q\ & ( 
-- !\position[0]~reg0_q\ $ (!a_new(1)) ) ) ) # ( !\position[1]~reg0_q\ & ( !\b_prev~q\ & ( !\position[0]~reg0_q\ $ (a_new(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100001111000011001111000011110000111100001111001100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_position[0]~reg0_q\,
	datac => ALT_INV_a_new(1),
	datae => \ALT_INV_position[1]~reg0_q\,
	dataf => \ALT_INV_b_prev~q\,
	combout => \position~0_combout\);

-- Location: FF_X30_Y52_N33
\position[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \position~0_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	ena => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \position[1]~reg0_q\);

-- Location: LABCELL_X30_Y52_N30
\position~1\ : arriaii_lcell_comb
-- Equation(s):
-- \position~1_combout\ = ( \position[2]~reg0_q\ & ( \position[1]~reg0_q\ & ( (!\position[0]~reg0_q\) # (!a_new(1) $ (\b_prev~q\)) ) ) ) # ( !\position[2]~reg0_q\ & ( \position[1]~reg0_q\ & ( (\position[0]~reg0_q\ & (!a_new(1) $ (!\b_prev~q\))) ) ) ) # ( 
-- \position[2]~reg0_q\ & ( !\position[1]~reg0_q\ & ( (!a_new(1) $ (!\b_prev~q\)) # (\position[0]~reg0_q\) ) ) ) # ( !\position[2]~reg0_q\ & ( !\position[1]~reg0_q\ & ( (!\position[0]~reg0_q\ & (!a_new(1) $ (\b_prev~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001000010010000011011110110111100000110000001101111100111111001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_a_new(1),
	datab => \ALT_INV_b_prev~q\,
	datac => \ALT_INV_position[0]~reg0_q\,
	datae => \ALT_INV_position[2]~reg0_q\,
	dataf => \ALT_INV_position[1]~reg0_q\,
	combout => \position~1_combout\);

-- Location: FF_X30_Y52_N31
\position[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \position~1_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	ena => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \position[2]~reg0_q\);

-- Location: LABCELL_X30_Y52_N10
\position~2\ : arriaii_lcell_comb
-- Equation(s):
-- \position~2_combout\ = ( \position[3]~reg0_q\ & ( \position[1]~reg0_q\ & ( (!\position[2]~reg0_q\) # ((!\position[0]~reg0_q\) # (!a_new(1) $ (\b_prev~q\))) ) ) ) # ( !\position[3]~reg0_q\ & ( \position[1]~reg0_q\ & ( (\position[2]~reg0_q\ & 
-- (\position[0]~reg0_q\ & (!a_new(1) $ (!\b_prev~q\)))) ) ) ) # ( \position[3]~reg0_q\ & ( !\position[1]~reg0_q\ & ( ((!a_new(1) $ (!\b_prev~q\)) # (\position[0]~reg0_q\)) # (\position[2]~reg0_q\) ) ) ) # ( !\position[3]~reg0_q\ & ( !\position[1]~reg0_q\ & 
-- ( (!\position[2]~reg0_q\ & (!\position[0]~reg0_q\ & (!a_new(1) $ (\b_prev~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000001000000011111111011111100000001000000101111111011111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_a_new(1),
	datab => \ALT_INV_position[2]~reg0_q\,
	datac => \ALT_INV_position[0]~reg0_q\,
	datad => \ALT_INV_b_prev~q\,
	datae => \ALT_INV_position[3]~reg0_q\,
	dataf => \ALT_INV_position[1]~reg0_q\,
	combout => \position~2_combout\);

-- Location: FF_X30_Y52_N11
\position[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \position~2_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	ena => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \position[3]~reg0_q\);

ww_direction <= \direction~output_o\;

ww_position(0) <= \position[0]~output_o\;

ww_position(1) <= \position[1]~output_o\;

ww_position(2) <= \position[2]~output_o\;

ww_position(3) <= \position[3]~output_o\;
END structure;


