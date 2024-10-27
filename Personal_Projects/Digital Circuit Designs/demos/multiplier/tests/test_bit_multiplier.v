`timescale 1ns/1ps

module  testbench (

);
   // Signal declaration for module interface:
   
   localparam N = 4;

   reg [N-1:0]  a;
   reg 		b;
   wire [N-1:0] p;
    


   

   reg clk;
   initial begin
   clk = 0;forever #10 clk = ~clk;end

   // Initialize test signals:
   initial begin
      a = $random();
      b = $random();
   end 

   // Stopping condition:
   integer clk_count;
   initial clk_count = 0;
   always @(posedge clk) begin
      clk_count <= clk_count + 1; 
      if (clk_count == 10) begin
            // Things to do at finish
            $finish;
      end
   end

   // Stimulus and Console Output:
   always @(posedge clk) begin
      // Create signals
      a = $random();
      b = $random();

      // Report information:
      $strobe("%4b   x   %1b (%4b)   =   %4b", a, b, DUT.c, p);
   end	  

   // Test module declaration:
   bit_multiplier #(.N(4)) DUT    (
    .a(a),
    .b(b),
    .p(p)
    );

endmodule	
