`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2023 09:03:50 AM
// Design Name: 
// Module Name: MUXarray
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
module MUXarray #( parameter SIZE =4) (
input sel ,
input [SIZE-1:0] a,
input [SIZE-1:0] b,
output [SIZE-1:0] o
);
genvar i;
generate
for (i=0; i<SIZE; i=i+1) begin: MUXarray
mux m(
.i({a[i],b[i]}),
.sel(sel),
.o(o[i])
);
end
endgenerate
endmodule