#/**************************************************/
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



#/* 
set file_version dc_v1
#/* set folder name
set RPT_DIR REP
set OUT_DIR OUT

set RPT_OUT  [format "%s" $RPT_DIR/]
set DATA_OUT [format "%s" $OUT_DIR/]

#/**************************************************/
#/* No modifications needed below                  */
#/**************************************************/
set PDK "/home/IC/SPI/Process/lib"
set search_path [concat  $search_path $PDK]
set alib_library_analysis_path $PDK

set link_library [set target_library [concat  [list scc018v3ebcd_uhd50_rvt_tt_v5p0_25c_basic.db] [list dw_foundation.sldb]]]
set target_library "scc018v3ebcd_uhd50_rvt_tt_v5p0_25c_basic.db"
set library_name scc018v3ebcd_uhd50_rvt_tt_v5p0_25c_basic

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

set_clock_latency -source  -max 0.5 [get_clocks clk] 
set_clock_uncertainty -setup 0.6 [get_clocks clk]
set_clock_uncertainty -hold 0.5 [get_clocks clk]
set_clock_transition -max 0.4 [get_clocks clk]
set_dont_touch_network clk
set_ideal_network clk

set driving_cell CLKBUFV2_7TV50 
set loading_cell CLKBUFV8_7TV50 

set_drive [drive_of ${library_name}/${driving_cell}/Z] [all_inputs]
set_load [load_of ${library_name}/${loading_cell}/I] [all_outputs]

# set_driving_cell  -lib_cell CLKBUFV2_7TV50  [all_inputs]
# set_loading_cell  -lib_cell CLKBUFV8_7TV50  [all_outputs]

set_input_delay $my_input_delay_ns -clock $clk_name [remove_from_collection [all_inputs] $my_clock_pin]
set_output_delay $my_output_delay_ns -clock $clk_name [all_outputs]

compile -ungroup_all -map_effort medium

compile -incremental_mapping -map_effort medium

check_design
report_constraint -all_violators

#/************** check and report *******************/
check_design  > $RPT_OUT/check_design.rpt
check_timing  > $RPT_OUT/check_timing.rpt

report_qor > $RPT_OUT/qor.rpt

report_area > $RPT_OUT/area.rpt
report_area -hierarchy > $RPT_OUT/area_hier.rpt
report_timing -loops > $RPT_OUT/timing_loop.rpt
report_timing -path full -net -cap -input -tran -delay min -nworst 1 > $RPT_OUT/timing.min.rpt
report_timing -path full -net -cap -input -tran -delay max -nworst 1 > $RPT_OUT/timing.max.rpt
# report_timing -path full -net -cap -input -tran -delay min -max_paths 200 -nworst 200 > $RPT_OUT/timing.min.rpt
# report_timing -path full -net -cap -input -tran -delay max -max_paths 200 -nworst 200 > $RPT_OUT/timing.max.rpt
report_constraints -all_violators -verbose > $RPT_OUT/constraints.rpt
report_power > $RPT_OUT/power.rpt


set filename [format "%s%s"  $my_toplevel ".vh"]
write -f verilog -output $DATA_OUT/$filename

set filename [format "%s%s"  $my_toplevel ".sdc"]
write_sdc $DATA_OUT/$filename

set filename [format "%s%s"  $my_toplevel ".db"]
write -f db -hier -output $DATA_OUT/$filename -xg_force_db

set filename [format "%s%s"  $my_toplevel ".sdf"]
write_sdf $DATA_OUT/$filename

redirect timing.rep { report_timing -max_path 10}
redirect cell.rep { report_cell }
redirect power.rep { report_power }
