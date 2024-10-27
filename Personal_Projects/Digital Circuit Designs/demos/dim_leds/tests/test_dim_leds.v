`timescale 1ns/1ps

module testbench (

	 );

   reg         clk;
   wire [15:0] led;
   
	       
   dim_leds #(.N(1000)) DUT(
    .sys_clk(clk),
    .LED(led)
    );



   initial begin
      clk = 0;
      forever #10 clk = ~clk;
   end


   integer clk_count;
   initial clk_count = 0;
   always @(posedge DUT.div_clk) begin
      $write("clk %d: ", clk_count);
      
      clk_count <= clk_count + 1;
      if (clk_count == 512) begin
	 // Things to do at finish
	 $finish;
      end
   end


   reg div_clk_d;
   reg [1:0] state;
   initial state = 0;
   
   always @(posedge clk) begin
      div_clk_d <= DUT.div_clk;
      if (DUT.div_clk && !div_clk_d) begin
	 state <= 1;
	 $display("din = %d",DUT.din);
      end
      if (state == 1) begin
	 if (DUT.PWM1.clk_count  == 0)
	   state <= 2;
      end
      else if (state == 2) begin
	 if (DUT.PWM1.clk_count == 255) begin
	    state <= 0;
	    $write("\n");
	 end
	 else
	   $write("%b",DUT.PWM1.sout);
      end
   end
   
endmodule
