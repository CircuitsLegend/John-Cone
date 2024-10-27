`timescale 1ns/1ps

module thermometer_decoder #(parameter K=3,W=2**`K-1)
  (
   input      [W-1:0] a,
   output reg [K-1:0] q
   );


   integer 	    idx;
   
   always @(a) begin
      idx = 15;
      while ((a[idx-1] == 0)&&(idx > 0))
	idx = idx - 1;
      q = idx;
   end

endmodule // thermometer_decoder