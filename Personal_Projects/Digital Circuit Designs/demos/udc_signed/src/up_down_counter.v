`timescale 1ns/1ps

module up_down_counter (
			input 			clk,
			input 			rst_n,

			input 			up,
			input 			dn,
			input signed [2:0] 	b,
			output reg signed [2:0] count
	 );

   reg signed [3:0] 				next_increment;
   reg signed [3:0] 				next_decrement;

   reg 						overflow_up;
   reg 						overflow_dn;

   // Combinational always scope for arithmetic and overflow detection:
 always @(*) begin
    next_increment = count + b;
    next_decrement = count - b;

    if ((next_increment > 3) || (next_increment < -3))
      overflow_up = 1;
    else
      overflow_up = 0;

    if ((next_decrement > 3) || (next_decrement < -3))
      overflow_dn = 1;
    else
      overflow_dn = 0;
 end // always @ (*)


   // Clocked register assignments:
   always @(posedge clk, negedge rst_n) begin
      if (!rst_n) begin
	 // Reset behavior:
	 count <= 0;
	 
      end
      else begin
	 // Normal behavior:
	 if (up && !overflow_up)
	   count <= next_increment;
	 else if (dn && !overflow_dn)
	   count <= next_decrement;
	 
      end
   end
   

endmodule
