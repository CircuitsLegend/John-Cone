`timescale 1ns/1ps

/* IIR Filter Demonstration

   A simple low-pass filter based on the equation

       y[m] = y[m-1] + a(x[m] - y[m-1])
 
   with parameter a = 1/128
*/


module iir (
	    input rst_n,
	    input clk,
	    input      signed [7:0] x,
	    output reg signed [7:0] y
	    );

   // Temporary 11-bit signal:
   reg signed [10:0] 		    q;
   
   // Rounded filtered signal with two extra bits:
   reg signed [9:0] 		    z;
   
   // Temporary 9-bit signal for rounding off z:
   reg signed [8:0] 		    w;

   // ------------------------------------
   // Filter equations (combinational):
   always @(*) begin
      q = 2*z + ((8*x - 2*z) >> 7);      
      q = q + 1; 
      
      // Truncate z to 9 bits and add 1:
      w = z[9:1];
      w = w + 1;
   end
   // -------------------------------------


   // ==== Clocked Register Assignments ==== //
   always @(posedge clk, negedge rst_n) begin
      if (!rst_n) begin
	 // Reset behavior:
	 y  <= 0;
	 z  <= 0;
      end
      else begin
	 // Normal behavior:
	 z <= q[10:1];       // Update z, 10 rounded bits
	 y <= w[8:1];        // Update y, 8 rounded bits
      end
      
   end
   // ======================================= //

endmodule
