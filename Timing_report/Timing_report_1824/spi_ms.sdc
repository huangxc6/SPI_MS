###################################################################

# Created by write_sdc on Wed Dec 20 07:42:04 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
create_clock [get_ports clk]  -period 41  -waveform {0 20.5}
set_input_delay -clock clk  5  [get_ports rst_n]
set_input_delay -clock clk  5  [get_ports {sfraddr_w[1]}]
set_input_delay -clock clk  5  [get_ports {sfraddr_w[0]}]
set_input_delay -clock clk  5  [get_ports sfrwe]
set_input_delay -clock clk  5  [get_ports {spidata_i[7]}]
set_input_delay -clock clk  5  [get_ports {spidata_i[6]}]
set_input_delay -clock clk  5  [get_ports {spidata_i[5]}]
set_input_delay -clock clk  5  [get_ports {spidata_i[4]}]
set_input_delay -clock clk  5  [get_ports {spidata_i[3]}]
set_input_delay -clock clk  5  [get_ports {spidata_i[2]}]
set_input_delay -clock clk  5  [get_ports {spidata_i[1]}]
set_input_delay -clock clk  5  [get_ports {spidata_i[0]}]
set_input_delay -clock clk  5  [get_ports {sfraddr_r[2]}]
set_input_delay -clock clk  5  [get_ports {sfraddr_r[1]}]
set_input_delay -clock clk  5  [get_ports {sfraddr_r[0]}]
set_input_delay -clock clk  5  [get_ports {spssn_i[7]}]
set_input_delay -clock clk  5  [get_ports {spssn_i[6]}]
set_input_delay -clock clk  5  [get_ports {spssn_i[5]}]
set_input_delay -clock clk  5  [get_ports {spssn_i[4]}]
set_input_delay -clock clk  5  [get_ports {spssn_i[3]}]
set_input_delay -clock clk  5  [get_ports {spssn_i[2]}]
set_input_delay -clock clk  5  [get_ports {spssn_i[1]}]
set_input_delay -clock clk  5  [get_ports {spssn_i[0]}]
set_input_delay -clock clk  5  [get_ports mosi]
set_input_delay -clock clk  5  [get_ports miso]
set_input_delay -clock clk  5  [get_ports sck]
set_input_delay -clock clk  5  [get_ports ssn]
set_output_delay -clock clk  5  [get_ports mosi]
set_output_delay -clock clk  5  [get_ports miso]
set_output_delay -clock clk  5  [get_ports sck]
set_output_delay -clock clk  5  [get_ports {sfr_data_o[7]}]
set_output_delay -clock clk  5  [get_ports {sfr_data_o[6]}]
set_output_delay -clock clk  5  [get_ports {sfr_data_o[5]}]
set_output_delay -clock clk  5  [get_ports {sfr_data_o[4]}]
set_output_delay -clock clk  5  [get_ports {sfr_data_o[3]}]
set_output_delay -clock clk  5  [get_ports {sfr_data_o[2]}]
set_output_delay -clock clk  5  [get_ports {sfr_data_o[1]}]
set_output_delay -clock clk  5  [get_ports {sfr_data_o[0]}]
set_output_delay -clock clk  5  [get_ports {spssn_o[7]}]
set_output_delay -clock clk  5  [get_ports {spssn_o[6]}]
set_output_delay -clock clk  5  [get_ports {spssn_o[5]}]
set_output_delay -clock clk  5  [get_ports {spssn_o[4]}]
set_output_delay -clock clk  5  [get_ports {spssn_o[3]}]
set_output_delay -clock clk  5  [get_ports {spssn_o[2]}]
set_output_delay -clock clk  5  [get_ports {spssn_o[1]}]
set_output_delay -clock clk  5  [get_ports {spssn_o[0]}]