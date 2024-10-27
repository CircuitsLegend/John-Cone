`timescale 1ns/1ps
module top (
                      input clk,
                      input en,
                      input d,
                      output reg q
                      );

		      wire _q;

		      initial q=0;
   always @(posedge clk) begin
        q <= _q;
   end
   simple_module SM1(.clk(clk),.en(en),.d(d),.q(_q));

endmodule

