## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
## Switches
set_property PACKAGE_PIN V17 [get_ports {a[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a[0]}]
set_property PACKAGE_PIN V16 [get_ports {a[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a[1]}]
set_property PACKAGE_PIN W16 [get_ports {a[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a[2]}]
set_property PACKAGE_PIN W17 [get_ports {a[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a[3]}]
set_property PACKAGE_PIN W15 [get_ports {b[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {b[0]}]
set_property PACKAGE_PIN V15 [get_ports {b[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {b[1]}]
set_property PACKAGE_PIN W14 [get_ports {b[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {b[2]}]
set_property PACKAGE_PIN W13 [get_ports {b[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {b[3]}]
set_property PACKAGE_PIN V2 [get_ports {c[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {c[0]}]
set_property PACKAGE_PIN T3 [get_ports {c[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {c[1]}]
set_property PACKAGE_PIN T2 [get_ports {c[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {c[2]}]
set_property PACKAGE_PIN R3 [get_ports {c[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {c[3]}]
set_property PACKAGE_PIN W2 [get_ports {d[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {d[0]}]
set_property PACKAGE_PIN U1 [get_ports {d[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {d[1]}]
set_property PACKAGE_PIN T1 [get_ports {d[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {d[2]}]
set_property PACKAGE_PIN R2 [get_ports {d[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {d[3]}]
 

## LEDs
set_property PACKAGE_PIN U16 [get_ports {sum[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sum[0]}]
set_property PACKAGE_PIN E19 [get_ports {sum[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sum[1]}]
set_property PACKAGE_PIN U19 [get_ports {sum[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sum[2]}]
set_property PACKAGE_PIN V19 [get_ports {sum[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sum[3]}]
set_property PACKAGE_PIN W18 [get_ports {sum[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sum[4]}]
set_property PACKAGE_PIN U15 [get_ports {sum[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sum[5]}]
