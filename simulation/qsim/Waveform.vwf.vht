-- Copyright (C) 2020  Intel Corporation. All rights reserved.
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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "08/27/2023 18:37:26"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          projeto
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY projeto_vhd_vec_tst IS
END projeto_vhd_vec_tst;
ARCHITECTURE projeto_arch OF projeto_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL ds1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL ds2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
COMPONENT projeto
	PORT (
	clk : IN STD_LOGIC;
	ds1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	ds2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	rst : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : projeto
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	ds1 => ds1,
	ds2 => ds2,
	rst => rst
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 1000 ps;
	clk <= '1';
	WAIT FOR 1000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- rst
t_prcs_rst: PROCESS
BEGIN
	rst <= '1';
WAIT;
END PROCESS t_prcs_rst;
END projeto_arch;
