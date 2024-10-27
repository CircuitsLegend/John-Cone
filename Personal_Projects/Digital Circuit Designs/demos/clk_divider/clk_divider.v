// choosing N:
//
// fc = 100MHz
// fd = desired clock frequency
// output clock frequency is 1/(2N)
// so we want fd = fc/(2N)
// i.e. N = fc/(2*fd)


module clk_divider #(parameter N=4) (
				     input clk,
				     output reg div_clk

	 );

   integer 				    clk_count;

   initial begin
      clk_count = 0;
      div_clk = 0;
   end

   always @(posedge clk) begin
      if (clk_count >= N) begin
	 clk_count <= 0;
	 div_clk <= ~div_clk;
	 
	 
      end
      else begin
	 //div_clk <= 0;
	 
	 
	clk_count <= clk_count + 1;
      end
   end
   

endmodule
