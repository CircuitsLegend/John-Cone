`timescale 1ns/1ps

module testbench (

	 );

   reg clk;

   initial begin
      clk = 0;
      forever #10 clk = ~clk;
   end

   reg rst_n;

   reg up;
   reg dn;
   reg signed [2:0] b;
   
   wire signed [2:0] count; 
   
   up_down_counter DUT (
			.clk(clk),
			.rst_n(rst_n),
			.up(up),
			.dn(dn),
			.b(b),
			.count(count)
	 );


   integer 	     clk_count;
   initial clk_count = 0;
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 100) begin
	 // Things to do at finish
	 $finish;
      end
   end


   // Generate Stimulus:
   initial begin
      rst_n = 0;
      up    = 0;
      dn    = 0;
      b     = 1;      
   end

   always @(posedge clk) begin
      rst_n <= 1;

      if (clk_count % 40 < 9) begin
	 up <= 1;
	 dn <= 0;
      end
      else if (clk_count % 40 < 20) begin
	 up <= 0;
	 dn <= 1;
	 
      end
      else if (clk_count % 40 < 30) begin
	 up <= 1;
	 dn <= 0;
      end

      if (clk_count % 40 == 0)
	b <= $random();
      

      $write("%3d: ", clk_count);
      if (up)
	$write(" up  ");
      else if (dn)
	$write(" dn  " );
      else if (!rst_n)
	$write(" rst ");
      $write("\t%b(%d)", b, b);
      $write("\t%b(%d)", count, count);
      if (DUT.overflow_up)
	$write(" ovf (up) ");
      if (DUT.overflow_dn)
	$write(" ovf (dn) ");
      $write(" incr: %d  decr: %d\n", DUT.next_increment, DUT.next_decrement);
      
   end
   
   
endmodule
