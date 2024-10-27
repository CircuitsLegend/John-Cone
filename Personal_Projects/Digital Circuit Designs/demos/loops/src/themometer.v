`timescale 1ns/1ps


module thermometer (

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
      if (clk_count == 10) begin
	 // Things to do at finish
	 $finish;
      end
   end


   // Create stimulus and print test information
   integer idx;   

   initial a = 0;
   
   always @(posedge clk) begin

      a <= a + 1;

 
      $display("clk %2d\ta %1d\tq %b",clk_count,a,q);
   end
   

   // Thermometer Assignments
   
   always @(posedge clk) begin
      for (idx=0; idx<8; idx=idx+1) begin
	 if (idx < a)
	   q[idx] <= 1; // since this a clocked always block, 
	 else           // assignments are non-blocking <=
	   q[idx] <= 0;	 
      end
   end
   
endmodule
