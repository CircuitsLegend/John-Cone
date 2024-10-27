`timescale 1ns/1ps
module top
(
input clk,
input rst,
input SDO,
output SCLK,
output CS,
output [15:0] led
);

wire [15:0] z1;
SPI_top spi(.clk(clk), .rst(rst), .SDO(SDO), .SCLK(SCLK), .CS(CS), .led(z1));

dim_leds leds(.brightness(z1), .sys_clk(clk), .LED(led));

endmodule