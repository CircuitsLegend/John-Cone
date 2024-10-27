`timescale 1ns/1ps


module add_bits_combinational (

	 );

   reg [7:0] a;
   reg [7:0] q[7:0];  // Array of 8 vectors, each with 8 bits.

   reg 	     clk;

   initial begin
      clk = 0;
      forever #10 clk = ~clk;
   end

   
   integer clk_count;
   initial clk_count = 0;
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 8) begin
	 // Things to do at finish
	 $finish;
      end
   end


   // Create stimulus and print test information
   integer idx;
   
   initial begin
      a <= $random();  // <-- a needs to be constant until q is done calculating

      // Initialize partial sums
      for (idx=0; idx<8; idx=idx+1) begin
	 q[idx] = 8'd0;	 
      end
   end
   
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      
      $write("clk %2d\ta %b\tq",clk_count,a);
      for (idx=0; idx<8; idx=idx+1) begin
	 $write("%d  ",q[idx]);
	 
      end
      $write("\n");
      

   end
   

   // Pipeline Assignments
   
   always @(posedge clk) begin
      for (idx=0; idx<8; idx=idx+1) begin
	 if (idx > 0)
	   q[idx] <= q[idx-1] + a[idx];
	 else
	   q[idx] <= a[idx];
	 
      end
   end
   
   
   
endmodule
