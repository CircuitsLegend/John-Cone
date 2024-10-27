`timescale 1ns/1ps


module test_lfsr (

	 );

   reg clk;

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

   reg        rst_n;
   wire [2:0] shiftreg;

   
   lfsr           
     #(
       .DEPTH(3)
       )
   DUT
     (
      .clk(clk),
      .rst_n(rst_n),
      .shiftreg(shiftreg)
      );
   
   
   initial begin
      rst_n = 0;
   end
   
   always @(posedge clk) begin
      rst_n = 1;

      $display("%3d: %b%b%b",clk_count,shiftreg[0],shiftreg[1],shiftreg[2]);
      
      
   end
   

endmodule
