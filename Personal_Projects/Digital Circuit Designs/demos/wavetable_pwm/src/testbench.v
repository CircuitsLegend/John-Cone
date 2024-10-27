`timescale 1ns/1ps

module testbench (

	 );

   reg clk;

   initial begin
      clk = 0;
      forever #10 clk = ~clk;
   end


   integer clk_count;
   initial clk_count = 0;
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count > 1_000_000) begin
	 // Things to do at finish
	 $finish;
      end
   end

   reg rst;
   reg play;
   reg [7:0] note;
   wire      AIN, GAIN, SHUTDOWN_L;
   
   initial begin
      rst = 1;
      play = 1;
      note =0 ;
      
   end
   


   top DUT (
	    .clk(clk),
	    .rst(rst),
	    .play(play),
	    .note(note),
	    .AIN(AIN),
	    .GAIN(GAIN),
	    .SHUTDOWN_L(SHUTDOWN_L)
	    );


   always @(posedge clk) begin
      rst  <= 0;
      play <= 1;
      if (clk_count % 1000 == 0) begin
	 $display("%d: sample is %h", clk_count,DUT.volume);
	 
      end
   end

endmodule
