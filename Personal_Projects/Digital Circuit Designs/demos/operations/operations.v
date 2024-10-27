`timescale 1ns/1ps

module operations (

	 );

   reg [7:0] a;
   reg [7:0] b;

   reg [7:0] q;
   reg [7:0] q_next;

   reg 	     en;

   
   // Clock Signal:
   reg 	     clk;
   integer clk_count;

   //assign q_next = (a & {8{en}}) | (b & {8{~en}});
   
   initial begin
      clk = 0;
      forever #10 clk = ~clk;
   end

   
   initial begin
      a = 8'd2;
      b = 8'd3;
      q = 8'd8;

      en = 0;
//      q_next = (a & {8{en}}) | (b & {8{~en}});
      
      $display("Initializations: en=%d, a=%d, b=%d, q=%d, q_next=%d",en,a,b,q,q_next);
      
      //q_next = 0;
      
   end // initial begin

   
   always @(*) begin
      q_next = (a & {8{en}}) | (b & {8{~en}});
      $display("combinational block evaluated");
      
      /*
      if (en == 1'b0) begin
	 q_next = a;
	 $display("if");
      end      
      else if (en == 1'b1)  begin
	 q_next = b;
	 $display("else");
      end
       */
   end


 
   always @(posedge clk) begin
      // Non-blocking:
      q <= q_next;      
      
      $display("%d: en: %b  a: %d  b: %d  q_next: %d q: %d",clk_count, en, a,b, q_next, q);
      if (clk_count == 1)
	en <= 1;
      else
	en <= 0;
      
   end
   
   initial clk_count = 0;
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 5) begin
	 // Things to do at finish
	 $finish;
      end
   end

   
endmodule
