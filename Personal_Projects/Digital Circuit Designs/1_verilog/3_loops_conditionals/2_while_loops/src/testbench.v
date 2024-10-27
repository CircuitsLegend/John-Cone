`timescale 1ns/1ps

`define K 3
`define W 2**`K-1

module testbench ();
   
   // DECLARE SIGNALS
   reg  clk;     
   reg  [`W-1:0]  sw; 
   wire [`W-1:0]  led;
   reg  sel;
 initial begin 
   sw<=0;
   sel<=0;
 end
   integer clk_count = 0;   
/*
   thermometer_encoder TE1
    (
      .a(a),
      .q(b)
      );
   defparam TE1.W = `W;
   defparam TE1.K = `K;

   thermometer_decoder TD1
     (
      .a(b),
      .q(c)
      );

   defparam TD1.W = `W;
   defparam TD1.K = `K;
   */ //NO LONGER NEED


//STIMULI
always@(posedge clk)
 begin 
sw<=$random();
sel<=~sel;
 end

   top DUT(.sw(sw), .led(led), .sel(sel));
   defparam DUT.W=`W;
   defparam DUT .K=`K;
   
   // INITIAL SIGNAL CONFIGURATION:
   initial begin
      clk = 0;      
   end

   // GENERATE CLOCK:
   initial forever #10 clk = ~clk;
   

   // WRITE OUTPUT TO CONSOLE:
   integer fid;
   initial fid = $fopen("test_result.txt", "w");
   
   always @(posedge clk) begin
      $write("clk:  %d", clk_count);      
      $write("\tsw:%b", sw);
      $write("\tled:%b", led);
      $write("\tsel:%b", sel);
      $write("\n");
      
      $fwrite(fid,"clk:  %d", clk_count);      
      $fwrite(fid,"\tsw:%b", sw);
      $fwrite(fid,"\tled:%b", led);
      $fwrite(fid,"\tsel:%b", sel);
      $fwrite(fid,"\n");
   end

   // DEFINE WHEN TO TERMINATE SIMULATION:
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 32) begin
	 $fclose(fid);
	 $finish;
      end
   end

   
endmodule // testbench