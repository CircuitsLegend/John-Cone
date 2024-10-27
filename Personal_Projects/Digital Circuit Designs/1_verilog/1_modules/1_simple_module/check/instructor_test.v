`timescale 1ns/1ps

module instructor_test(
		      );

   reg clk;

   reg [11:0] dvals;
   reg [11:0] qvals;
   reg 	     success;
   
   reg en;
   reg d;
   wire q;

   integer clk_count;
   integer idx;
   
   initial begin
      clk = 0;
      en  = 1;
      
      clk_count = 0;
      success   = 1;
      dvals     = $random();      
      d         = dvals[0];
      qvals[0]  = 0;
      
      for (idx=0;idx<11;idx=idx+1) begin
	 qvals[idx+1]=qvals[idx]^dvals[idx];	 
      end
      
      forever #10 clk = ~clk;
   end
   
	 
   simple_module DUT (
		      .clk(clk),
		      .en(en),
		      .d(d),
		      .q(q)
		      );

   always @(posedge clk) begin
      d <= dvals[clk_count+1];
      
      if (q !== qvals[clk_count]) begin
	 $display("TEST> %b!=%b",q,qvals[clk_count]);	 
	 success <= 0;
      end
      else begin
	 $display("TEST> %b==%b",q,qvals[clk_count]);
      end
   end
   
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count==11) begin
	 // Things to do at finish
	 if (success) begin
	    $display("\033[32mTEST> SUCCESS\033[m");
	 end
	 else begin
	    $display("\033[31mTEST> FAILED\033[m");	    
	 end
	 
	 
	 $finish;
      end
   end

   
endmodule // instructor_test
