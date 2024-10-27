`timescale 1ns/1ps

module add_bits
  (
   input [7:0] a,
   output reg [3:0] q 
   );

   // Declare Loop Index
   integer idx;

   // Combinational Logic
   always @(a) begin

      // Loop with BLOCKING assignments is
      // "unrolled" in *space*, not time
   q=0;
      // Add all the non-zero bits of `a`
      for (idx=0; idx<8; idx=idx+1) begin
	 q = q + a[idx];
      end
   end
endmodule // add_bits