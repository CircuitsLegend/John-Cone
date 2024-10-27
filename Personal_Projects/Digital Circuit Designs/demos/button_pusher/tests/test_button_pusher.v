`timescale 1ns/1ps

module test_button_pusher (

	 );

   reg clk;

   initial begin
      clk = 0;
      forever #10 clk = ~clk;
   end


   wire [4:0] btn;
   
   button_pusher #(.Nbtn(5)) DUT
   (
    .clk(clk),
    .btn(btn)
    );

   wire       btnU, btnD, btnL, btnR, btnC;

   assign btnU = btn[0];
   assign btnD = btn[1];
   assign btnL = btn[2];
   assign btnR = btn[3];
   assign btnC = btn[4];


   integer    clk_count;
   initial clk_count = 0;
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 100000) begin
	 // Things to do at finish
	 $finish;
      end
   end


   reg [4:0] btn_D;
   
   always @(posedge clk) begin
      btn_D <= btn;
      if (btn_D != btn) begin
	 
	 $display("%d: btn = %b", clk_count, btn);
	 
      end
   end
   
endmodule
