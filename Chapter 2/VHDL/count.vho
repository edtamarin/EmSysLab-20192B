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

-- DATE "04/28/2020 15:26:59"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY 	count IS
    PORT (
	a : IN std_logic_vector(7 DOWNTO 0);
	q : OUT STD.STANDARD.integer range 0 TO 8
	);
END count;

-- Design Ports Information
-- q[0]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[1]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[2]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[3]	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_AA30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[4]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[5]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[6]	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[7]	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF count IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_q : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \a[5]~input_o\ : std_logic;
SIGNAL \a[4]~input_o\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \a[7]~input_o\ : std_logic;
SIGNAL \a[6]~input_o\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \nmb~0_combout\ : std_logic;
SIGNAL \Add3~1_combout\ : std_logic;
SIGNAL \nmb~1_combout\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \nmb~2_combout\ : std_logic;
SIGNAL \nmb~3_combout\ : std_logic;
SIGNAL \ALT_INV_a[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Add3~2_combout\ : std_logic;
SIGNAL \ALT_INV_Add3~1_combout\ : std_logic;
SIGNAL \ALT_INV_Add3~0_combout\ : std_logic;

BEGIN

ww_a <= a;
q <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_q));
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_a[7]~input_o\ <= NOT \a[7]~input_o\;
\ALT_INV_a[6]~input_o\ <= NOT \a[6]~input_o\;
\ALT_INV_a[5]~input_o\ <= NOT \a[5]~input_o\;
\ALT_INV_a[4]~input_o\ <= NOT \a[4]~input_o\;
\ALT_INV_a[3]~input_o\ <= NOT \a[3]~input_o\;
\ALT_INV_a[2]~input_o\ <= NOT \a[2]~input_o\;
\ALT_INV_a[1]~input_o\ <= NOT \a[1]~input_o\;
\ALT_INV_a[0]~input_o\ <= NOT \a[0]~input_o\;
\ALT_INV_Add3~2_combout\ <= NOT \Add3~2_combout\;
\ALT_INV_Add3~1_combout\ <= NOT \Add3~1_combout\;
\ALT_INV_Add3~0_combout\ <= NOT \Add3~0_combout\;

-- Location: IOOBUF_X89_Y20_N79
\q[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \nmb~0_combout\,
	devoe => ww_devoe,
	o => ww_q(0));

-- Location: IOOBUF_X89_Y21_N39
\q[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \nmb~1_combout\,
	devoe => ww_devoe,
	o => ww_q(1));

-- Location: IOOBUF_X89_Y25_N5
\q[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \nmb~2_combout\,
	devoe => ww_devoe,
	o => ww_q(2));

-- Location: IOOBUF_X89_Y21_N56
\q[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \nmb~3_combout\,
	devoe => ww_devoe,
	o => ww_q(3));

-- Location: IOIBUF_X89_Y25_N21
\a[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: IOIBUF_X89_Y23_N21
\a[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(5),
	o => \a[5]~input_o\);

-- Location: IOIBUF_X89_Y23_N4
\a[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(4),
	o => \a[4]~input_o\);

-- Location: IOIBUF_X89_Y21_N21
\a[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: IOIBUF_X89_Y23_N55
\a[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(7),
	o => \a[7]~input_o\);

-- Location: IOIBUF_X89_Y23_N38
\a[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(6),
	o => \a[6]~input_o\);

-- Location: LABCELL_X88_Y23_N30
\Add3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = ( \a[7]~input_o\ & ( \a[6]~input_o\ & ( !\a[5]~input_o\ $ (!\a[4]~input_o\ $ (\a[3]~input_o\)) ) ) ) # ( !\a[7]~input_o\ & ( \a[6]~input_o\ & ( !\a[5]~input_o\ $ (!\a[4]~input_o\ $ (!\a[3]~input_o\)) ) ) ) # ( \a[7]~input_o\ & ( 
-- !\a[6]~input_o\ & ( !\a[5]~input_o\ $ (!\a[4]~input_o\ $ (!\a[3]~input_o\)) ) ) ) # ( !\a[7]~input_o\ & ( !\a[6]~input_o\ & ( !\a[5]~input_o\ $ (!\a[4]~input_o\ $ (\a[3]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110011000011110000110011110011000011001111000011110011000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_a[5]~input_o\,
	datac => \ALT_INV_a[4]~input_o\,
	datad => \ALT_INV_a[3]~input_o\,
	datae => \ALT_INV_a[7]~input_o\,
	dataf => \ALT_INV_a[6]~input_o\,
	combout => \Add3~0_combout\);

-- Location: IOIBUF_X89_Y21_N4
\a[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: IOIBUF_X89_Y25_N38
\a[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: LABCELL_X88_Y23_N9
\nmb~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \nmb~0_combout\ = ( \a[1]~input_o\ & ( \a[2]~input_o\ & ( !\a[0]~input_o\ $ (!\Add3~0_combout\) ) ) ) # ( !\a[1]~input_o\ & ( \a[2]~input_o\ & ( !\a[0]~input_o\ $ (\Add3~0_combout\) ) ) ) # ( \a[1]~input_o\ & ( !\a[2]~input_o\ & ( !\a[0]~input_o\ $ 
-- (\Add3~0_combout\) ) ) ) # ( !\a[1]~input_o\ & ( !\a[2]~input_o\ & ( !\a[0]~input_o\ $ (!\Add3~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000111100110000111100001111000011110000110011110000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_a[0]~input_o\,
	datac => \ALT_INV_Add3~0_combout\,
	datae => \ALT_INV_a[1]~input_o\,
	dataf => \ALT_INV_a[2]~input_o\,
	combout => \nmb~0_combout\);

-- Location: LABCELL_X88_Y23_N15
\Add3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~1_combout\ = ( \a[7]~input_o\ & ( \a[6]~input_o\ & ( (!\a[4]~input_o\ & (\a[3]~input_o\ & \a[5]~input_o\)) # (\a[4]~input_o\ & ((\a[5]~input_o\) # (\a[3]~input_o\))) ) ) ) # ( !\a[7]~input_o\ & ( \a[6]~input_o\ & ( (!\a[4]~input_o\ & 
-- (!\a[3]~input_o\ & !\a[5]~input_o\)) # (\a[4]~input_o\ & (\a[3]~input_o\ & \a[5]~input_o\)) ) ) ) # ( \a[7]~input_o\ & ( !\a[6]~input_o\ & ( (!\a[4]~input_o\ & (!\a[3]~input_o\ & !\a[5]~input_o\)) # (\a[4]~input_o\ & (\a[3]~input_o\ & \a[5]~input_o\)) ) ) 
-- ) # ( !\a[7]~input_o\ & ( !\a[6]~input_o\ & ( (!\a[4]~input_o\ & ((!\a[3]~input_o\) # (!\a[5]~input_o\))) # (\a[4]~input_o\ & (!\a[3]~input_o\ & !\a[5]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110100011101000100000011000000110000001100000010001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a[4]~input_o\,
	datab => \ALT_INV_a[3]~input_o\,
	datac => \ALT_INV_a[5]~input_o\,
	datae => \ALT_INV_a[7]~input_o\,
	dataf => \ALT_INV_a[6]~input_o\,
	combout => \Add3~1_combout\);

-- Location: LABCELL_X88_Y23_N48
\nmb~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \nmb~1_combout\ = ( \a[1]~input_o\ & ( \a[2]~input_o\ & ( !\Add3~1_combout\ $ (((!\a[0]~input_o\) # (!\Add3~0_combout\))) ) ) ) # ( !\a[1]~input_o\ & ( \a[2]~input_o\ & ( !\Add3~1_combout\ $ (((\Add3~0_combout\) # (\a[0]~input_o\))) ) ) ) # ( 
-- \a[1]~input_o\ & ( !\a[2]~input_o\ & ( !\Add3~1_combout\ $ (((\Add3~0_combout\) # (\a[0]~input_o\))) ) ) ) # ( !\a[1]~input_o\ & ( !\a[2]~input_o\ & ( !\Add3~1_combout\ $ (((\a[0]~input_o\ & \Add3~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011000011110000110011001111000011001100110011001100111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Add3~1_combout\,
	datac => \ALT_INV_a[0]~input_o\,
	datad => \ALT_INV_Add3~0_combout\,
	datae => \ALT_INV_a[1]~input_o\,
	dataf => \ALT_INV_a[2]~input_o\,
	combout => \nmb~1_combout\);

-- Location: LABCELL_X88_Y23_N24
\Add3~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = ( \a[3]~input_o\ & ( \a[6]~input_o\ & ( (!\a[7]~input_o\ & (\a[5]~input_o\ & \a[4]~input_o\)) # (\a[7]~input_o\ & ((\a[4]~input_o\) # (\a[5]~input_o\))) ) ) ) # ( !\a[3]~input_o\ & ( \a[6]~input_o\ & ( (\a[7]~input_o\ & (\a[5]~input_o\ 
-- & \a[4]~input_o\)) ) ) ) # ( \a[3]~input_o\ & ( !\a[6]~input_o\ & ( (\a[7]~input_o\ & (\a[5]~input_o\ & \a[4]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000010000000100000001000000010001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a[7]~input_o\,
	datab => \ALT_INV_a[5]~input_o\,
	datac => \ALT_INV_a[4]~input_o\,
	datae => \ALT_INV_a[3]~input_o\,
	dataf => \ALT_INV_a[6]~input_o\,
	combout => \Add3~2_combout\);

-- Location: LABCELL_X88_Y23_N0
\nmb~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \nmb~2_combout\ = ( \a[1]~input_o\ & ( \a[2]~input_o\ & ( !\Add3~2_combout\ $ (((\Add3~1_combout\ & ((!\a[0]~input_o\) # (!\Add3~0_combout\))))) ) ) ) # ( !\a[1]~input_o\ & ( \a[2]~input_o\ & ( !\Add3~2_combout\ $ ((((!\a[0]~input_o\ & !\Add3~0_combout\)) 
-- # (\Add3~1_combout\))) ) ) ) # ( \a[1]~input_o\ & ( !\a[2]~input_o\ & ( !\Add3~2_combout\ $ ((((!\a[0]~input_o\ & !\Add3~0_combout\)) # (\Add3~1_combout\))) ) ) ) # ( !\a[1]~input_o\ & ( !\a[2]~input_o\ & ( !\Add3~2_combout\ $ (((!\a[0]~input_o\) # 
-- ((!\Add3~0_combout\) # (\Add3~1_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101001011010010111100001101001011110000111100001111010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a[0]~input_o\,
	datab => \ALT_INV_Add3~1_combout\,
	datac => \ALT_INV_Add3~2_combout\,
	datad => \ALT_INV_Add3~0_combout\,
	datae => \ALT_INV_a[1]~input_o\,
	dataf => \ALT_INV_a[2]~input_o\,
	combout => \nmb~2_combout\);

-- Location: LABCELL_X88_Y23_N36
\nmb~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \nmb~3_combout\ = ( \a[1]~input_o\ & ( \a[2]~input_o\ & ( (\Add3~2_combout\ & ((!\Add3~1_combout\ & ((!\Add3~0_combout\))) # (\Add3~1_combout\ & (\a[0]~input_o\ & \Add3~0_combout\)))) ) ) ) # ( !\a[1]~input_o\ & ( \a[2]~input_o\ & ( (\a[0]~input_o\ & 
-- (!\Add3~1_combout\ & (\Add3~2_combout\ & !\Add3~0_combout\))) ) ) ) # ( \a[1]~input_o\ & ( !\a[2]~input_o\ & ( (!\Add3~1_combout\ & (\Add3~2_combout\ & ((\Add3~0_combout\) # (\a[0]~input_o\)))) ) ) ) # ( !\a[1]~input_o\ & ( !\a[2]~input_o\ & ( 
-- (\a[0]~input_o\ & (!\Add3~1_combout\ & (\Add3~2_combout\ & \Add3~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000001000000110000000100000000000000110000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a[0]~input_o\,
	datab => \ALT_INV_Add3~1_combout\,
	datac => \ALT_INV_Add3~2_combout\,
	datad => \ALT_INV_Add3~0_combout\,
	datae => \ALT_INV_a[1]~input_o\,
	dataf => \ALT_INV_a[2]~input_o\,
	combout => \nmb~3_combout\);

-- Location: LABCELL_X31_Y3_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


