`timescale 1ns/1ps


module add_bits_combinational (

	 );

   reg [7:0] a;
   reg [7:0] q;


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
   always @(posedge clk) begin

      a <= $random();

      
      $display("clk %d\ta %b\tq%d",clk_count,a,q);
 
   end
   

   // Combinational Assignments
   integer idx;  // Declare the loop index
   
   always @(a) begin
      q = 0;
      
      for (idx=0; idx<8; idx=idx+1) begin
	 q = q + a[idx];	 
      end
   end
   
   
   
endmodule
