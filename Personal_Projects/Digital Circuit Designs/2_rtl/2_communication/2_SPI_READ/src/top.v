`timescale 1ns/1ps

module top #(parameter refresh_period = 40_000)
(
input clk,
input rst,
input SDO,
output SCLK,
output CS,
output reg [15:0] led
);
reg rd;
wire d_ready;
wire [15:0] ledwire;
simpleSPI m1(.clk(clk), .rst_l(~rst), .SDO(SDO), .CS(CS), .SCLK(SCLK), .rd(rd), .d_ready(d_ready), .d(ledwire));
always@(*)
begin
    led<=ledwire;
    if(SCLK)
begin
rd<=1;
if(d_ready)
rd<=0;
else rd<=1;
end
end
/*
Implement the rd handshaking based on a timer process. 
The handshaking and timer process should be sensitive to SCLK.
*/

endmodule