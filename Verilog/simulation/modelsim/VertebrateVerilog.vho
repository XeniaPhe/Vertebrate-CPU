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
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "01/10/2024 21:20:56"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
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

ENTITY 	seven_segment_adapter_4 IS
    PORT (
	clk : IN std_logic;
	en : IN std_logic;
	addr : IN std_logic;
	lddr : IN std_logic_vector(15 DOWNTO 0);
	rd : OUT std_logic_vector(15 DOWNTO 0);
	gnds : OUT std_logic_vector(3 DOWNTO 0);
	display : OUT std_logic_vector(6 DOWNTO 0)
	);
END seven_segment_adapter_4;

-- Design Ports Information
-- lddr[4]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[5]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[6]	=>  Location: PIN_T6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[7]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[8]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[9]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[10]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[11]	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[12]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[13]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[14]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[15]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[0]	=>  Location: PIN_N14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[1]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[2]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[3]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[4]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[5]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[6]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[7]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[8]	=>  Location: PIN_L14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[9]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[10]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[11]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[12]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[13]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[14]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[15]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gnds[0]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gnds[1]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gnds[2]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gnds[3]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display[0]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display[1]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display[2]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display[3]	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display[4]	=>  Location: PIN_L16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display[5]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display[6]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[2]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[1]	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[0]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lddr[3]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF seven_segment_adapter_4 IS
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
SIGNAL ww_en : std_logic;
SIGNAL ww_addr : std_logic;
SIGNAL ww_lddr : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_rd : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_gnds : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_display : std_logic_vector(6 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \lddr[4]~input_o\ : std_logic;
SIGNAL \lddr[5]~input_o\ : std_logic;
SIGNAL \lddr[6]~input_o\ : std_logic;
SIGNAL \lddr[7]~input_o\ : std_logic;
SIGNAL \lddr[8]~input_o\ : std_logic;
SIGNAL \lddr[9]~input_o\ : std_logic;
SIGNAL \lddr[10]~input_o\ : std_logic;
SIGNAL \lddr[11]~input_o\ : std_logic;
SIGNAL \lddr[12]~input_o\ : std_logic;
SIGNAL \lddr[13]~input_o\ : std_logic;
SIGNAL \lddr[14]~input_o\ : std_logic;
SIGNAL \lddr[15]~input_o\ : std_logic;
SIGNAL \rd[0]~output_o\ : std_logic;
SIGNAL \rd[1]~output_o\ : std_logic;
SIGNAL \rd[2]~output_o\ : std_logic;
SIGNAL \rd[3]~output_o\ : std_logic;
SIGNAL \rd[4]~output_o\ : std_logic;
SIGNAL \rd[5]~output_o\ : std_logic;
SIGNAL \rd[6]~output_o\ : std_logic;
SIGNAL \rd[7]~output_o\ : std_logic;
SIGNAL \rd[8]~output_o\ : std_logic;
SIGNAL \rd[9]~output_o\ : std_logic;
SIGNAL \rd[10]~output_o\ : std_logic;
SIGNAL \rd[11]~output_o\ : std_logic;
SIGNAL \rd[12]~output_o\ : std_logic;
SIGNAL \rd[13]~output_o\ : std_logic;
SIGNAL \rd[14]~output_o\ : std_logic;
SIGNAL \rd[15]~output_o\ : std_logic;
SIGNAL \gnds[0]~output_o\ : std_logic;
SIGNAL \gnds[1]~output_o\ : std_logic;
SIGNAL \gnds[2]~output_o\ : std_logic;
SIGNAL \gnds[3]~output_o\ : std_logic;
SIGNAL \display[0]~output_o\ : std_logic;
SIGNAL \display[1]~output_o\ : std_logic;
SIGNAL \display[2]~output_o\ : std_logic;
SIGNAL \display[3]~output_o\ : std_logic;
SIGNAL \display[4]~output_o\ : std_logic;
SIGNAL \display[5]~output_o\ : std_logic;
SIGNAL \display[6]~output_o\ : std_logic;
SIGNAL \addr~input_o\ : std_logic;
SIGNAL \en~input_o\ : std_logic;
SIGNAL \rd~0_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \gnds[1]~1_combout\ : std_logic;
SIGNAL \gnds[1]~reg0_q\ : std_logic;
SIGNAL \gnds[2]~reg0feeder_combout\ : std_logic;
SIGNAL \gnds[2]~reg0_q\ : std_logic;
SIGNAL \gnds[3]~reg0feeder_combout\ : std_logic;
SIGNAL \gnds[3]~reg0_q\ : std_logic;
SIGNAL \gnds[0]~0_combout\ : std_logic;
SIGNAL \gnds[0]~reg0_q\ : std_logic;
SIGNAL \current_segment[0]~1_combout\ : std_logic;
SIGNAL \lddr[1]~input_o\ : std_logic;
SIGNAL \dr[1]~feeder_combout\ : std_logic;
SIGNAL \always1~0_combout\ : std_logic;
SIGNAL \lddr[0]~input_o\ : std_logic;
SIGNAL \current_segment[1]~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \lddr[2]~input_o\ : std_logic;
SIGNAL \dr[2]~feeder_combout\ : std_logic;
SIGNAL \lddr[3]~input_o\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL dr : std_logic_vector(15 DOWNTO 0);
SIGNAL current_segment : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_Mux0~1_combout\ : std_logic;
SIGNAL \ALT_INV_gnds[3]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_gnds[2]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_gnds[1]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_rd~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_en <= en;
ww_addr <= addr;
ww_lddr <= lddr;
rd <= ww_rd;
gnds <= ww_gnds;
display <= ww_display;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_Mux0~1_combout\ <= NOT \Mux0~1_combout\;
\ALT_INV_gnds[3]~reg0_q\ <= NOT \gnds[3]~reg0_q\;
\ALT_INV_gnds[2]~reg0_q\ <= NOT \gnds[2]~reg0_q\;
\ALT_INV_gnds[1]~reg0_q\ <= NOT \gnds[1]~reg0_q\;
\ALT_INV_rd~0_combout\ <= NOT \rd~0_combout\;

-- Location: IOOBUF_X53_Y6_N23
\rd[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \rd[0]~output_o\);

-- Location: IOOBUF_X45_Y34_N9
\rd[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[1]~output_o\);

-- Location: IOOBUF_X53_Y9_N16
\rd[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[2]~output_o\);

-- Location: IOOBUF_X51_Y34_N16
\rd[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[3]~output_o\);

-- Location: IOOBUF_X51_Y34_N23
\rd[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[4]~output_o\);

-- Location: IOOBUF_X49_Y34_N9
\rd[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[5]~output_o\);

-- Location: IOOBUF_X49_Y0_N2
\rd[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[6]~output_o\);

-- Location: IOOBUF_X45_Y34_N2
\rd[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[7]~output_o\);

-- Location: IOOBUF_X53_Y9_N9
\rd[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[8]~output_o\);

-- Location: IOOBUF_X53_Y8_N23
\rd[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[9]~output_o\);

-- Location: IOOBUF_X49_Y0_N9
\rd[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[10]~output_o\);

-- Location: IOOBUF_X53_Y9_N23
\rd[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[11]~output_o\);

-- Location: IOOBUF_X51_Y34_N9
\rd[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[12]~output_o\);

-- Location: IOOBUF_X49_Y34_N2
\rd[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[13]~output_o\);

-- Location: IOOBUF_X53_Y13_N9
\rd[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[14]~output_o\);

-- Location: IOOBUF_X51_Y34_N2
\rd[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rd~0_combout\,
	devoe => ww_devoe,
	o => \rd[15]~output_o\);

-- Location: IOOBUF_X29_Y34_N16
\gnds[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gnds[0]~reg0_q\,
	devoe => ww_devoe,
	o => \gnds[0]~output_o\);

-- Location: IOOBUF_X23_Y34_N16
\gnds[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_gnds[1]~reg0_q\,
	devoe => ww_devoe,
	o => \gnds[1]~output_o\);

-- Location: IOOBUF_X31_Y34_N2
\gnds[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_gnds[2]~reg0_q\,
	devoe => ww_devoe,
	o => \gnds[2]~output_o\);

-- Location: IOOBUF_X31_Y34_N9
\gnds[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_gnds[3]~reg0_q\,
	devoe => ww_devoe,
	o => \gnds[3]~output_o\);

-- Location: IOOBUF_X5_Y0_N2
\display[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \display[0]~output_o\);

-- Location: IOOBUF_X38_Y0_N9
\display[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux0~1_combout\,
	devoe => ww_devoe,
	o => \display[1]~output_o\);

-- Location: IOOBUF_X36_Y0_N16
\display[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux0~1_combout\,
	devoe => ww_devoe,
	o => \display[2]~output_o\);

-- Location: IOOBUF_X38_Y0_N2
\display[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux0~1_combout\,
	devoe => ww_devoe,
	o => \display[3]~output_o\);

-- Location: IOOBUF_X53_Y11_N9
\display[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \display[4]~output_o\);

-- Location: IOOBUF_X0_Y24_N16
\display[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \display[5]~output_o\);

-- Location: IOOBUF_X36_Y0_N23
\display[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux0~1_combout\,
	devoe => ww_devoe,
	o => \display[6]~output_o\);

-- Location: IOIBUF_X45_Y0_N15
\addr~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr,
	o => \addr~input_o\);

-- Location: IOIBUF_X45_Y0_N22
\en~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_en,
	o => \en~input_o\);

-- Location: LCCOMB_X45_Y1_N4
\rd~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rd~0_combout\ = (\addr~input_o\ & \en~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \addr~input_o\,
	datad => \en~input_o\,
	combout => \rd~0_combout\);

-- Location: IOIBUF_X27_Y0_N22
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G18
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X31_Y33_N10
\gnds[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gnds[1]~1_combout\ = !\gnds[0]~reg0_q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gnds[0]~reg0_q\,
	combout => \gnds[1]~1_combout\);

-- Location: FF_X31_Y33_N11
\gnds[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gnds[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gnds[1]~reg0_q\);

-- Location: LCCOMB_X31_Y33_N24
\gnds[2]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gnds[2]~reg0feeder_combout\ = \gnds[1]~reg0_q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gnds[1]~reg0_q\,
	combout => \gnds[2]~reg0feeder_combout\);

-- Location: FF_X31_Y33_N25
\gnds[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gnds[2]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gnds[2]~reg0_q\);

-- Location: LCCOMB_X31_Y33_N2
\gnds[3]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gnds[3]~reg0feeder_combout\ = \gnds[2]~reg0_q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gnds[2]~reg0_q\,
	combout => \gnds[3]~reg0feeder_combout\);

-- Location: FF_X31_Y33_N3
\gnds[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gnds[3]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gnds[3]~reg0_q\);

-- Location: LCCOMB_X31_Y33_N0
\gnds[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gnds[0]~0_combout\ = !\gnds[3]~reg0_q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gnds[3]~reg0_q\,
	combout => \gnds[0]~0_combout\);

-- Location: FF_X31_Y33_N1
\gnds[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gnds[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gnds[0]~reg0_q\);

-- Location: LCCOMB_X41_Y1_N6
\current_segment[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_segment[0]~1_combout\ = !current_segment(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => current_segment(0),
	combout => \current_segment[0]~1_combout\);

-- Location: FF_X41_Y1_N7
\current_segment[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \current_segment[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_segment(0));

-- Location: IOIBUF_X43_Y0_N22
\lddr[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(1),
	o => \lddr[1]~input_o\);

-- Location: LCCOMB_X40_Y1_N2
\dr[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dr[1]~feeder_combout\ = \lddr[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \lddr[1]~input_o\,
	combout => \dr[1]~feeder_combout\);

-- Location: LCCOMB_X45_Y1_N26
\always1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \always1~0_combout\ = (!\addr~input_o\ & \en~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \addr~input_o\,
	datad => \en~input_o\,
	combout => \always1~0_combout\);

-- Location: FF_X40_Y1_N3
\dr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \dr[1]~feeder_combout\,
	ena => \always1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => dr(1));

-- Location: IOIBUF_X40_Y0_N15
\lddr[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(0),
	o => \lddr[0]~input_o\);

-- Location: FF_X40_Y1_N13
\dr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \lddr[0]~input_o\,
	sload => VCC,
	ena => \always1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => dr(0));

-- Location: LCCOMB_X41_Y1_N4
\current_segment[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_segment[1]~0_combout\ = current_segment(1) $ (current_segment(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => current_segment(1),
	datad => current_segment(0),
	combout => \current_segment[1]~0_combout\);

-- Location: FF_X41_Y1_N5
\current_segment[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \current_segment[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_segment(1));

-- Location: LCCOMB_X40_Y1_N12
\Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (current_segment(0) & ((dr(1)) # ((current_segment(1))))) # (!current_segment(0) & (((dr(0) & !current_segment(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_segment(0),
	datab => dr(1),
	datac => dr(0),
	datad => current_segment(1),
	combout => \Mux0~0_combout\);

-- Location: IOIBUF_X43_Y0_N15
\lddr[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(2),
	o => \lddr[2]~input_o\);

-- Location: LCCOMB_X40_Y1_N0
\dr[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dr[2]~feeder_combout\ = \lddr[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \lddr[2]~input_o\,
	combout => \dr[2]~feeder_combout\);

-- Location: FF_X40_Y1_N1
\dr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \dr[2]~feeder_combout\,
	ena => \always1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => dr(2));

-- Location: IOIBUF_X40_Y0_N22
\lddr[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(3),
	o => \lddr[3]~input_o\);

-- Location: FF_X40_Y1_N23
\dr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \lddr[3]~input_o\,
	sload => VCC,
	ena => \always1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => dr(3));

-- Location: LCCOMB_X40_Y1_N22
\Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Mux0~0_combout\ & (((dr(3)) # (!current_segment(1))))) # (!\Mux0~0_combout\ & (dr(2) & ((current_segment(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datab => dr(2),
	datac => dr(3),
	datad => current_segment(1),
	combout => \Mux0~1_combout\);

-- Location: IOIBUF_X27_Y0_N8
\lddr[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(4),
	o => \lddr[4]~input_o\);

-- Location: IOIBUF_X27_Y0_N1
\lddr[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(5),
	o => \lddr[5]~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\lddr[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(6),
	o => \lddr[6]~input_o\);

-- Location: IOIBUF_X5_Y34_N15
\lddr[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(7),
	o => \lddr[7]~input_o\);

-- Location: IOIBUF_X9_Y34_N22
\lddr[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(8),
	o => \lddr[8]~input_o\);

-- Location: IOIBUF_X20_Y34_N8
\lddr[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(9),
	o => \lddr[9]~input_o\);

-- Location: IOIBUF_X47_Y34_N22
\lddr[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(10),
	o => \lddr[10]~input_o\);

-- Location: IOIBUF_X5_Y0_N8
\lddr[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(11),
	o => \lddr[11]~input_o\);

-- Location: IOIBUF_X53_Y22_N8
\lddr[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(12),
	o => \lddr[12]~input_o\);

-- Location: IOIBUF_X23_Y34_N22
\lddr[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(13),
	o => \lddr[13]~input_o\);

-- Location: IOIBUF_X7_Y0_N8
\lddr[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(14),
	o => \lddr[14]~input_o\);

-- Location: IOIBUF_X14_Y0_N22
\lddr[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lddr(15),
	o => \lddr[15]~input_o\);

ww_rd(0) <= \rd[0]~output_o\;

ww_rd(1) <= \rd[1]~output_o\;

ww_rd(2) <= \rd[2]~output_o\;

ww_rd(3) <= \rd[3]~output_o\;

ww_rd(4) <= \rd[4]~output_o\;

ww_rd(5) <= \rd[5]~output_o\;

ww_rd(6) <= \rd[6]~output_o\;

ww_rd(7) <= \rd[7]~output_o\;

ww_rd(8) <= \rd[8]~output_o\;

ww_rd(9) <= \rd[9]~output_o\;

ww_rd(10) <= \rd[10]~output_o\;

ww_rd(11) <= \rd[11]~output_o\;

ww_rd(12) <= \rd[12]~output_o\;

ww_rd(13) <= \rd[13]~output_o\;

ww_rd(14) <= \rd[14]~output_o\;

ww_rd(15) <= \rd[15]~output_o\;

ww_gnds(0) <= \gnds[0]~output_o\;

ww_gnds(1) <= \gnds[1]~output_o\;

ww_gnds(2) <= \gnds[2]~output_o\;

ww_gnds(3) <= \gnds[3]~output_o\;

ww_display(0) <= \display[0]~output_o\;

ww_display(1) <= \display[1]~output_o\;

ww_display(2) <= \display[2]~output_o\;

ww_display(3) <= \display[3]~output_o\;

ww_display(4) <= \display[4]~output_o\;

ww_display(5) <= \display[5]~output_o\;

ww_display(6) <= \display[6]~output_o\;
END structure;


