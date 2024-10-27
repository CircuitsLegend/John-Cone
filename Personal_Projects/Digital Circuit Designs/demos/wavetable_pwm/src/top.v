`timescale 1ns/1ps

module top (
	    input 	clk,
	    input 	rst,
	    input 	play,

	    input [7:0] note,
	    output  	AIN,
	    output  	GAIN,
	    output  	SHUTDOWN_L
	 );

   wire 		rst_n;
   assign rst_n = ~rst;


   wire 		sout;
   wire 		fast_clk;
   wire [7:0] 		volume;
   
   clock_synth clk1 (
		    .clk(clk),
		    .rst_n(rst_n),
		    .fast_clk(fast_clk)
		    );

   wavetable wave1 (
	      .clk(fast_clk),
	      .rst_n(rst_n),
	      .play(play), // start(1) or stop(0) signal
	      .note(note), // note index (0 is low C, increasing up the chromatic scale)
	      .sout(volume),
	      .sync(sync)
	      );
   
   pwm_audio PWM1 (
		   .clk(fast_clk),
		   .rst_n(rst_n),
		   .volume(volume),   // <= the sin level is the isntantaneous "volume"
		   //.N(N),
		   .sout(sout),
		   .sync(sync)
		   );



   assign AIN = sout;
   assign SHUTDOWN_L = 1;
   assign GAIN = 1;
   
   
   
endmodule
