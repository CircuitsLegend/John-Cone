`timescale 1ns/1ps

module test_top (
		 
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
      if (clk_count == 30000) begin
	 // Things to do at finish
	 $finish;
      end
   end

   
   reg 	      rst;
   wire       start_btn;
   wire       ack_btn;
   reg  [7:0] sw;
   wire [7:0] led ;
   

   initial begin
      rst = 1;
      sw = $random();
   end

   top #(.N(10)) DUT (
	    .clk(clk),
	    .rst(rst),
	    .start_btn(start_btn),
	    .ack_btn(ack_btn),
	    .sw(sw),
	    .led(led)
	 );

   wire [1:0] btn;
   
   button_pusher #(.Nbtn(2)) BTNPUSH
     (.clk(clk), .btn(btn));

   assign start_btn = btn[0];
   assign ack_btn   = btn[1];

   reg [7:0]	      led_D;
   reg [7:0]	      sw_D;


   always @(posedge clk) begin
      rst <= 0;

      // Detect changes in input/output signals
      led_D <= led;
      sw_D  <= sw;
      
      if (led_D != led) begin
	 sw <= $random(); 
	 $display("========= LED Change ===========\n  %b\n====================",led);
      end
      if (sw_D != sw) begin
	 $display("========= Switch Change ========\n %b\n===================",sw);
	 
      end
   end
   
endmodule
