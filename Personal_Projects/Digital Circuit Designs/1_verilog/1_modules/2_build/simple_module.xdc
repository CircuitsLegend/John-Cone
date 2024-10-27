## This file is edited from the Basys3_Master.xdc file
##
## Signal Mappings:
##
##  clk (clock)  -- Basys3 100MHz system clock
##   en (enable) -- sliding switch 0
##    d (data)   -- sliding switch 1
##    q (output) -- LED 0

## Clock signal

set_property PACKAGE_PIN W5 [get_ports clk]							
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
## Switches

set_property PACKAGE_PIN V17 [get_ports en]					
	set_property IOSTANDARD LVCMOS33 [get_ports en]
set_property PACKAGE_PIN V16 [get_ports d]					
	set_property IOSTANDARD LVCMOS33 [get_ports d]


## LEDs

set_property PACKAGE_PIN U16 [get_ports q]					
set_property IOSTANDARD LVCMOS33 [get_ports q]

