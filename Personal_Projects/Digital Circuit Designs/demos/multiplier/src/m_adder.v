`timescale 1ns/1ps

// Multiplying Adder:
// s = a + m*b
module m_adder
  #(
    parameter N=4
    )
   (
    input [N-1:0]  a,
    input [N-1:0]  b,
    input 	   m,
    output [N-1:0] s
    );


   // Create a vector for the carry signals:
   wire [N:0] 	   c;
   wire [N-1:0]    p;
   
   assign     c[0]  = 0;
   assign     p     = b & {N{m}};
   

   genvar 	   i;

   generate
      for (i=0; i<N; i=i+1) begin
	 full_adder fa (.a(a[i]),.b(p[i]),.c_in(c[i]),.s(s[i]),.c_out(c[i+1]));
      end
   endgenerate
endmodule // adder

