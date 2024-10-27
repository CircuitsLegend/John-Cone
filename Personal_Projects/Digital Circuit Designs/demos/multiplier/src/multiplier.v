`timescale 1ns/1ps

module multiplier #(
		    parameter N=4
		    ) 
   (
    input [N-1:0]    a,
    input [N-1:0]    b,
    output [2*N-1:0] p
    );

   genvar 	     i;
   

   generate
      for (i=0; i<N; i=i+1) begin : mult
	 
	 wire [N+i-1:0]         in_sum;
	 wire [N-1:0]     	partial_product;
	 wire [N+i-1:0] 	shifted_term;
	 wire [N+i:0] 		out_sum;

	 
	 bit_multiplier #(.N(N))          bm   (.a(a),.b(b[i]),.p(partial_product));
	 shifter        #(.N(N),.S(i))    shf  (.a(partial_product),.s(shifted_term));
	 adder          #(.N(N+i))        add  (.a(in_sum), .b(shifted_term), .s(out_sum));

	 if (i==0)
	   assign in_sum = 0;
	 else
	   assign in_sum = mult[i-1].out_sum;
	 
      end
   endgenerate

   assign p = mult[N-1].out_sum;
   

endmodule
