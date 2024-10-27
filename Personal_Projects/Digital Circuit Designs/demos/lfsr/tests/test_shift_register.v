`timescale 1ns/1ps


module test_shift_register (

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
   reg        D;
   wire [3:0] shiftreg;

   
   shift_register 
     #(
       .DEPTH(4)
       )
   DUT
     (
      .clk(clk),
      .rst_n(rst_n),
      .D(D),
      .shiftreg(shiftreg)
      );
   
   
   initial begin
      D     = $random();
      rst_n = 0;
   end
   
   always @(posedge clk) begin
      rst_n = 1;
      D     = $random();

      $display("%3d: D=%b, Shift Register=%b%b%b%b",clk_count,D,shiftreg[0],shiftreg[1],shiftreg[2],shiftreg[3]);
      
   end
   

endmodule
