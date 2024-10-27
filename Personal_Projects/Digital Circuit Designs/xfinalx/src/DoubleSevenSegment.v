`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2023 10:19:09 AM
// Design Name: 
// Module Name: DoubleSevenSegment
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DoubleSevenSegment #( parameter PRESCALER = 50000)(
input clk ,
input [7:0] SW,
output [3:0] anode,
output [6:0] light
);
wire sel;
wire [3:0] d;
wire [6:0] LD;
assign light = ~LD;

ClockDivider #(.PRESCALER(PRESCALER)) CKD(
.clkin(clk),
.clkout(sel)
);

assign anode[0] = ~sel;
assign anode[1] = sel;
assign anode[3:2] = 2'b11;

MUXarray ma(.sel(sel), .a(SW[3:0]), .b(SW[7:4]), .o(d));
NewSevenSegment s(.wxyz(d), .seg(LD));

// add other signals and modules here
endmodule
