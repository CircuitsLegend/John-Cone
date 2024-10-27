`timescale 1ns/1ps

module lfsr
  #(
    parameter DEPTH=3
    )
   (
    input 		   clk,
    input 		   rst_n,
    output     [DEPTH-1:0] shiftreg
    );

   reg 			   D;
   
   shift_register 
  #(
    .DEPTH(3)
    )
   SR
   (
    .clk(clk),
    .rst_n(rst_n),
    .D(D),
    .shiftreg(shiftreg)
    );

   always @(*) begin
      D = ^{shiftreg[0],shiftreg[2]};
      
   end
   
endmodule


