`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2023 09:07:55 AM
// Design Name: 
// Module Name: NewSevenSegment
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


module NewSevenSegment(
input [3:0] wxyz,
output [6:0] seg
);
wire [15:0] d;
// NOTE: your port names may be different
// depending on what you named them in the 4-16 decoder
decoder4_16 D(.d(wxyz), .en(1), .o(d));
assign seg [0] = |(16'hB7EB & d);// ENTER YOUR SOLUTION for a
assign seg [1] = |(16'hF9E4 & d);// ENTER YOUR SOLUTION for b
assign seg [2] = |(16'hDFF4 & d);// ENTER YOUR SOLUTION for c
assign seg [3] = |(16'hB6DE & d);// ENTER YOUR SOLUTION for d
assign seg [4] = |(16'hA2BF & d);// ENTER YOUR SOLUTION for e
assign seg [5] = |(16'h8EFB & d);// ENTER YOUR SOLUTION for f
assign seg [6] = |(16'h3EF7 & d);// ENTER YOUR SOLUTION for g
endmodule