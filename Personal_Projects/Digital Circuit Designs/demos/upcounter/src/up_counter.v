`timescale 1ns/1ps

module up_counter (
		   input 	    clk,
		   input 	    rst,
		   input 	    up,
		   output reg [2:0] count		   
		   );

   // Debounce the `up` button:
   wire 			btn_db;
   // this is a `wire` since it is output from a submodule
   debouncer db1 (.clk(clk),.btn(up),.btn_db(up_db));

   // Invert the rst button:
   reg 				rst_n;
   always @(rst)
     rst_n = ~rst;

   //==================================
   // Combinational Overflow Detection
   reg 		[2:0]		next_count;
   reg 				overflow;

   always @(up_db,count) begin // <= change sensitivity to up_db
      next_count = count + 1;

      // Use a simple conditional, with an
      // explicit signal to indicate overflow
      if (next_count < count)
	overflow = 1;
      else
	overflow = 0;
   end // always @ (up_db,count)
   //==================================

   
   always @(posedge clk, negedge rst_n) begin
      // asynchronous reset (preferred)
      if (!rst_n) begin
	 count <= 0;
      end
      else begin
	 if (up_db && !overflow) // change condition to `up_db`
	   count <= next_count;
      end
   end
endmodule
