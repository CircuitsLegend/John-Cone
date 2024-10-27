`timescale 1ns/1ps

module randomExample ();

   reg clk;
   integer clk_count;
   integer randomSeed;
   
   reg [7:0] randomNumber;
   
   
   initial begin
      clk       = 0;
      clk_count = 0;

      // Random seed needs to be an integer variable:
      randomSeed = 1234;      
      randomNumber = 12;
      
      forever #10 clk = ~clk;
   end

   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count >= 20)
	$finish;
      
      randomNumber <= $random(randomSeed);  // use seed as argument for each call
      $display("%d",randomNumber);      
   end
   
   
endmodule
