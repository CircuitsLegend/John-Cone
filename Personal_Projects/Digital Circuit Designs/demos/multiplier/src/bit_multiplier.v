`timescale 1ns/1ps


module bit_multiplier #(parameter N = 4) 
   (
    input [N-1:0]  a,
    input 	   b,
    output reg [N-1:0] p
    );

   reg [N-1:0] 	       c;
   
   always @(*) begin
      c = {N{b}};
      
      p = a & c;
   end
   
endmodule
