/**************************************************/
#/* Compile Script for Synopsys                    */
#/*                                                */
#/* dc_shell-t -f compile_dc.tcl                   */
#/*                                                */
#/* OSU FreePDK 45nm                               */
#/**************************************************/

#/* All verilog files, separated by spaces         */
set my_verilog_files [list spi_master.v spi_slave.v spi_ms.v]

#/* Top-level Module                               */
set my_toplevel spi_ms

#/* The name of the clock pin. If no clock-pin     */
#/* exists, pick anything                          */
set my_clock_pin clk

#/* Target frequency in MHz for optimization       */
set my_clk_freq_MHz 24

#/* Delay of input signals (Clock-to-Q, Package etc.)  */
set my_input_delay_ns 5

#/* Reserved time for output signals (Holdtime etc.)   */
set my_output_delay_ns 5


set_clock_latency -source  -max 0.5 [get_clocks clk] 
set_clock_uncertainty -setup 0.6 [get_clocks clk]
set_clock_uncertainty -hold 0.5 [get_clocks clk]
set_clock_transition -max 0.4 [get_clocks clk]
set_dont_touch_network clk
set_ideal_network clk

#/**************************************************/
#/* No modifications needed below                  */
#/**************************************************/
set PDK "/home/operator015/spi/DBH_STD_1824HP18BA_HD5P0V_20Q1_V3.1.10/LIBERTY"
set search_path [concat  $search_path $PDK]
set alib_library_analysis_path $PDK

set link_library [set target_library [concat  [list DBH_1824HP18BA_HD5P0V_TT_5P00V_25C.db] [list dw_foundation.sldb]]]
set target_library "DBH_1824HP18BA_HD5P0V_TT_5P00V_25C.db"

define_design_lib WORK -path ./WORK
set verilogout_show_unconnected_pins "true"
set_ultra_optimization true
set_ultra_optimization -force

analyze -f verilog $my_verilog_files

elaborate $my_toplevel

current_design $my_toplevel

link
uniquify

set my_period [expr 1000 / $my_clk_freq_MHz]

set find_clock [ find port [list $my_clock_pin] ]
if {  $find_clock != [list] } {
   set clk_name $my_clock_pin
   create_clock -period $my_period $clk_name
} else {
   set clk_name vclk
   create_clock -period $my_period -name $clk_name
}

set_driving_cell  -lib_cell CKNID2C  [all_inputs]
set_loading_cell  -lib_cell CKNID12C  [all_inputs]

set_input_delay $my_input_delay_ns -clock $clk_name [remove_from_collection [all_inputs] $my_clock_pin]
set_output_delay $my_output_delay_ns -clock $clk_name [all_outputs]

compile -ungroup_all -map_effort medium

compile -incremental_mapping -map_effort medium

check_design
report_constraint -all_violators

set filename [format "%s%s"  $my_toplevel ".vh"]
write -f verilog -output $filename

set filename [format "%s%s"  $my_toplevel ".sdc"]
write_sdc $filename

set filename [format "%s%s"  $my_toplevel ".db"]
write -f db -hier -output $filename -xg_force_db

set filename [format "%s%s"  $my_toplevel ".sdf"]
write_sdf $filename

redirect timing.rep { report_timing -max_path 10}
redirect cell.rep { report_cell }
redirect power.rep { report_power }
