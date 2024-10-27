`timescale 1ns/1ps

module mac #(
	     parameter N = 4
	     )
   (
    input 		 clk,
    input 		 rst_n,
    input [N-1:0] 	 A, 
    input [N-1:0] 	 B,
    output reg [2*N-1:0] P,
    output reg 		 done
    );

   localparam K = $clog2(N);  // <== this is synthesizable since the function is 
                              //     only evaluated at design time for constant parameters.

                              // It would NOT be synthesizable as a function of signals.
   
   reg [2*N-1:0] 	     shifted_term;
   reg [2*N-1:0] 	     partial_product;
   reg [2*N-1:0] 	     next_sum;
   reg [N-1:0]   	     i;
   
   
   
   // Initializations
   initial begin
      P    = 0;
      i    = 0;
      done = 0;
   end

   // Combinational Behavior:
   always @(*) begin
      shifted_term = A << i;
      if (B[i] && (i<N))
	partial_product = shifted_term;
      else
	partial_product = 0;

      if (i > 0)
	next_sum = P + partial_product;
      else
	next_sum = partial_product;
      
      
   end

   
   // Behavior
   always @(posedge clk, negedge rst_n) begin
      if (!rst_n) begin
	 // Reset behavior:
	 P    <= 0;
	 i    <= 0;
	 done <= 0;	 

      end
      else begin
	 // Normal behavior:
	 P    <= next_sum;
	 
	 if (i == N-1) begin
	    i    <= 0;	  
	    done <= 1;
	 end
	 else begin
	    i    <= i + 1;
	    done <= 0;	    
	 end
	   
      end
   end
   
endmodule
