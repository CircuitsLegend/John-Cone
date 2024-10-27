`timescale 1ns/1ps

module flat_multiplier #(
			 parameter N=4
			 ) 
   (
    input [N-1:0]    a,
    input [N-1:0]    b,
    output [2*N-1:0] p
    );


   wire [N+0-1:0]    in_sum0;
   wire [N-1:0]      partial_product0;
   wire [N+0-1:0]    shifted_term0;
   wire [N+0:0]      out_sum0;

   assign in_sum0 = 0;
   
	 
   bit_multiplier #(.N(N))          bm0   (.a(a),.b(b[0]),.p(partial_product0));
   shifter        #(.N(N),.S(0))  shf0  (.a(partial_product0),.s(shifted_term0));
   adder          #(.N(N+0))        add0  (.a(in_sum0), .b(shifted_term0), .s(out_sum0));

   wire [N+1-1:0]    in_sum1;
   wire [N-1:0]      partial_product1;
   wire [N+1-1:0]    shifted_term1;
   wire [N+1:0]      out_sum1;
   
   assign in_sum1 = out_sum0;
   
   bit_multiplier #(.N(N))          bm1   (.a(a),.b(b[1]),.p(partial_product1));
   shifter        #(.N(N),.S(1))  shf1  (.a(partial_product1),.s(shifted_term1));
   adder          #(.N(N+1))        add1  (.a(in_sum1), .b(shifted_term1), .s(out_sum1));

   
   wire [N+2-1:0]    in_sum2;
   wire [N-1:0]      partial_product2;
   wire [N+2-1:0]    shifted_term2;
   wire [N+2:0]      out_sum2;
   
   assign in_sum2 = out_sum1;
   
   bit_multiplier #(.N(N))          bm2   (.a(a),.b(b[2]),.p(partial_product2));
   shifter        #(.N(N),.S(2))  shf2  (.a(partial_product2),.s(shifted_term2));
   adder          #(.N(N+2))        add2  (.a(in_sum2), .b(shifted_term2), .s(out_sum2));


   wire [N+3-1:0]    in_sum3;
   wire [N-1:0]      partial_product3;
   wire [N+3-1:0]    shifted_term3;
   wire [N+3:0]      out_sum3;
   
   assign in_sum3 = out_sum2;
   
   bit_multiplier #(.N(N))          bm3   (.a(a),.b(b[3]),.p(partial_product3));
   shifter        #(.N(N),.S(3))  shf3  (.a(partial_product3),.s(shifted_term3));
   adder          #(.N(N+3))        add3  (.a(in_sum3), .b(shifted_term3), .s(out_sum3));

   assign p = out_sum3;
   
endmodule // flat_multiplier
