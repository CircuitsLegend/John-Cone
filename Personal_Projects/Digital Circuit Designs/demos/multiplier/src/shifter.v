`timescale 1ns/1ps

// Bit shifter

module shifter
  #(
    parameter N=4,
    parameter S=1
    )
   (
    input [N-1:0]  a,
    output [N+S-1:0]   s
    );

   
   assign     s = a << S;
   
   
endmodule // shifter

