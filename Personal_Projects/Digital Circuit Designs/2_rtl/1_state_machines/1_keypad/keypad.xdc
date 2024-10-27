## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Center Button as rst
 
set_property PACKAGE_PIN U18 [get_ports rst]	
	set_property IOSTANDARD LVCMOS33 [get_ports rst]


## LEDs mapped to keys
set_property PACKAGE_PIN U16 [get_ports {keys[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[0]}]
set_property PACKAGE_PIN E19 [get_ports {keys[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[1]}]
set_property PACKAGE_PIN U19 [get_ports {keys[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[2]}]
set_property PACKAGE_PIN V19 [get_ports {keys[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[3]}]
set_property PACKAGE_PIN W18 [get_ports {keys[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[4]}]
set_property PACKAGE_PIN U15 [get_ports {keys[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[5]}]
set_property PACKAGE_PIN U14 [get_ports {keys[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[6]}]
set_property PACKAGE_PIN V14 [get_ports {keys[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[7]}]
set_property PACKAGE_PIN V13 [get_ports {keys[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[8]}]
set_property PACKAGE_PIN V3 [get_ports {keys[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[9]}]
set_property PACKAGE_PIN W3 [get_ports {keys[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[10]}]
set_property PACKAGE_PIN U3 [get_ports {keys[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[11]}]
set_property PACKAGE_PIN P3 [get_ports {keys[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[12]}]
set_property PACKAGE_PIN N3 [get_ports {keys[13]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[13]}]
set_property PACKAGE_PIN P1 [get_ports {keys[14]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[14]}]
set_property PACKAGE_PIN L1 [get_ports {keys[15]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {keys[15]}]
	


##Pmod Header JA mapped to row and col
##Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {col[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {col[3]}]
##Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {col[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {col[2]}]
##Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports {col[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {col[1]}]
##Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {col[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {col[0]}]
##Sch name = JA7
set_property PACKAGE_PIN H1 [get_ports {row[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {row[3]}]
##Sch name = JA8
set_property PACKAGE_PIN K2 [get_ports {row[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {row[2]}]
##Sch name = JA9
set_property PACKAGE_PIN H2 [get_ports {row[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {row[1]}]
##Sch name = JA10
set_property PACKAGE_PIN G3 [get_ports {row[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {row[0]}]

