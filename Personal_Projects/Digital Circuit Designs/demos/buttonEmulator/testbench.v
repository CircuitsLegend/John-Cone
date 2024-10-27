`timescale 1ns/1ps

module testbench ( );

   reg clk;
   wire btn;
   reg  btn_d;
   
   buttonEmulator buttonPusher
     (
      .clk(clk),
      .btn(btn)
      );

   integer clk_count;
   integer press_count;
   integer release_count;
   
   initial begin
      clk        = 0;
      clk_count  = 0;
      
      press_count   = 0;
      release_count = 0;
      
      forever #5 clk = ~clk;   
   end

   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      btn_d <= btn;

      if (btn && !btn_d)  begin
	 press_count <= press_count + 1;	 
	 $strobe("clk count %0d:\tbutton press detected (total %0d)",clk_count,press_count);
      end
      if (!btn && btn_d) begin
	 release_count <= release_count + 1;	 
	 $strobe("clk count %0d:\tbutton release detected (total %0d)",clk_count,release_count);
      end

      if (clk_count >= 1000)
	$finish;
      
   end
   
endmodule
