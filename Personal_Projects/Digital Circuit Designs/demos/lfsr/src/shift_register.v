`timescale 1ns/1ps

module shift_register 
  #(
    parameter DEPTH=4
    )
   (
    input 		   clk,
    input 		   rst_n,
    input 		   D,
    output reg [DEPTH-1:0] shiftreg
    );

   integer            idx;


   initial begin
      	 for (idx=0; idx<(DEPTH-1); idx=idx+1) begin
	    shiftreg[idx] = 0;
	 end
      shiftreg[DEPTH - 1] = 1;
      
   end


   always @(posedge clk, negedge rst_n) begin
      if (!rst_n) begin
	 // Reset behavior:
	 for (idx=0; idx<(DEPTH-1); idx=idx+1) begin
	    shiftreg[idx] <= 0;
	 end
	 shiftreg[DEPTH-1] <= 1;
	 
      end
      else begin
	 // Normal behavior:
	 shiftreg[0] <= D;
      
	 for (idx=1; idx<DEPTH; idx=idx+1) begin
	    shiftreg[idx] <= shiftreg[idx-1];
	 end
      end
   end
endmodule


