`timescale 1ns/1ps


module testbench (

	 );

   // Clock signal:
   reg clk;

   initial begin
      clk = 0;
      forever #10 clk = ~clk;
   end

   // Reset signal:
   reg rst_n;
   
   reg  signed [7:0] x;
   wire signed [7:0] y;
   

   // Instatiate device under test:
   iir DUT (
	    .rst_n(rst_n),
	    .clk(clk),
	    .x(x),
	    .y(y)
	    );

   // Clock counter and stopping condition:
   integer 	     clk_count;
   initial clk_count = 0;
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 10000) begin
	 // Things to do at finish
	 $finish;
      end
   end

   // Initialization:
   integer fid;
   
   
   initial begin
      rst_n = 0;
      x = 0;
      fid = $fopen("iir_sim.txt","w");
   end


   // Stimulus:
   always @(posedge clk) begin
      rst_n <= 1;
      x <= (64*$sin(2*3.14159*0.0001*clk_count) + 16*$sin(2*3.14159*0.01*clk_count));
      $fwrite(fid,"%d\t%d\t%d\n",clk_count,x,y);
      
   end
   

endmodule
