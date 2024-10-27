`timescale 1ns/1ps


module add_bits_combinational (

	 );

   reg [7:0] a;
   reg [7:0] q[7:0];  // Array of 8 vectors, each with 8 bits.
   reg [7:0] d[7:0];  // Array of 8 vectors, each with 8 bits.

   reg 	     clk;

   initial begin
      clk = 0;
      forever #10 clk = ~clk;
   end

   
   integer clk_count;
   initial clk_count = 0;
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 16) begin
	 // Things to do at finish
	 $finish;
      end
   end


   // Create stimulus and print test information
   integer idx;
   
   initial begin


      // Initialize partial sums
      for (idx=0; idx<8; idx=idx+1) begin
	 q[idx] = 8'd0;	 
      end
   end
   
   always @(posedge clk) begin
      clk_count <= clk_count + 1;

      a <= $random();  // <-- a can change since it is loaded into a pipeline buffer

      if (clk_count == 9)
	$display("Initial latency period finished.");
 
      $display("clk %2d\td %b\tq",clk_count,d[7],q[7]);
   end
   

   // Pipeline Assignments
   
   always @(posedge clk) begin
      for (idx=0; idx<8; idx=idx+1) begin
	 if (idx > 0) begin
	    d[idx] <= d[idx-1];
	    q[idx] <= q[idx-1] + d[idx-1][idx];
	 end
	 else begin
	    d[idx] <= a;
	    q[idx] <= a[idx];
	 end
      end
   end
   
   
   
endmodule
