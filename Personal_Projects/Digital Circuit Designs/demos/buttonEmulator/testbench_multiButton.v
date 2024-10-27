`timescale 1ns/1ps

module testbench_multiButton ( );

   parameter numButtons = 5;
   
   reg clk;
   wire [numButtons-1:0] btn;
   reg  [numButtons-1:0] btn_d;
   
   multiButtonEmulator #(.numButtons(numButtons)) buttonPusher
     (
      .clk(clk),
      .btn(btn)
      );

   integer clk_count;
   integer press_count  [numButtons-1:0];
   integer release_count[numButtons-1:0];

   integer loopVar;
   
   initial begin
      clk        = 0;
      clk_count  = 0;
  
      for (loopVar=0; loopVar<numButtons; loopVar=loopVar+1) begin
	 press_count[loopVar]   = 0;
	 release_count[loopVar] = 0;
      end
      
      forever #5 clk = ~clk;   
   end

   integer activeButtonCount;
   
   always @(*) begin
      activeButtonCount = 0;      
      for (loopVar=0; loopVar<numButtons; loopVar=loopVar+1) begin
	 activeButtonCount = activeButtonCount + btn[loopVar];
      end
   end
   
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      btn_d <= btn;

      /*
      for (loopVar=0; loopVar<numButtons; loopVar=loopVar+1) begin
	 if (btn[loopVar] && !btn_d[loopVar])  begin
	    press_count[loopVar] <= press_count[loopVar] + 1;	 
	    $write("clk count %0d:\tbutton press %0d detected (total %0d) btn=%b\n",clk_count,loopVar,press_count[loopVar],btn);
	 end
	 if (!btn[loopVar] && btn_d[loopVar]) begin
	    release_count[loopVar] <= release_count[loopVar] + 1;	 
	    $write("clk count %0d:\tbutton release %0d detected (total %0d) btn=%b\n",clk_count,loopVar,release_count[loopVar],btn);
	 end
      end
       */
      
      if (activeButtonCount > 1)
	$display("More than one button pressed");
      
      if (clk_count >= 10000)
	$finish;
      
   end
   
endmodule
