# ####################################################################

#  Created by Genus(TM) Synthesis Solution 16.13-s036_1 on Tue Sep 29 04:15:44 +0600 2026

# ####################################################################

set sdc_version 1.7

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design eight_bit_shift_reg

create_clock -name "clk" -add -period 10.0 -waveform {0.0 5.0} [get_ports CLK]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports rst]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {Y[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {Y[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {Y[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {Y[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {Y[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {Y[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {Y[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {Y[0]}]
set_wire_load_mode "enclosed"
set_dont_use [get_lib_cells tsmc18/RF1R1WX2]
set_dont_use [get_lib_cells tsmc18/RF2R1WX2]
set_dont_use [get_lib_cells tsmc18/RFRDX1]
set_dont_use [get_lib_cells tsmc18/RFRDX2]
set_dont_use [get_lib_cells tsmc18/RFRDX4]
set_dont_use [get_lib_cells tsmc18/TIEHI]
set_dont_use [get_lib_cells tsmc18/TIELO]
set_clock_uncertainty -setup 0.1 [get_clocks clk]
set_clock_uncertainty -hold 0.1 [get_clocks clk]
