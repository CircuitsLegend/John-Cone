`timescale 1ns/1ps

module pwm (
	    input 	clk,
	    input 	rst_n,
	    input [7:0] din,
	    output reg 	sout
	    );

   reg [7:0] 	   clk_count;

   initial clk_count = 0;
   
   always @(posedge clk, negedge rst_n) begin
      if (!rst_n) begin
	 clk_count <= 0;	 
      end
      else
	clk_count <= clk_count + 1;      
   end

   always @(*) begin
      if (clk_count < din)
	sout = 1;
      else
	sout = 0;      
   end
   
endmodule // pwm
