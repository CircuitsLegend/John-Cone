`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2023 08:19:47 AM
// Design Name: 
// Module Name: mux
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


module mux( 
    input [1:0] i,
    input sel,
    output o
    );
    assign o = (sel&i[1])|((~sel)&i[0]);
endmodule


//module _4_to_1_mux(
//input [3:0] i,
//input [1:0] sel,
//output o
//);
//wire o1, o2;
//mux a1(.i({i[3],i[2]}), .sel(sel[1]), .o(o1));
//mux a2(.i({i[1],i[0]}), .sel(sel[1]), .o(o2));
//mux a3(.i({o1,o2}), .sel(sel[0]), .o(o)); 
//endmodule

