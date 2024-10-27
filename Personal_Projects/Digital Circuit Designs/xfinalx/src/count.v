`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2023 08:32:23 AM
// Design Name: 
// Module Name: count
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


module count(
input clk ,
input incr ,
input rst ,
output reg [7:0] q
);
always @ ( posedge clk ) begin
if ( rst )
q <= 0;
else if ( incr )
q <= q + 1;
end
endmodule
