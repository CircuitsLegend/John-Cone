`timescale 1ns/1ps

module testbench ();
   
   // DECLARE SIGNALS
   reg clk;     // "reg" type signals are  controlled
   reg [6:0] a;  // by the testbench
   reg [6:0] b;
   reg [1:0] op;  
   wire [6:0] q;

   integer clk_count = 0;   
   
   // INITIAL SIGNAL CONFIGURATION:
   initial begin
      clk = 0;      
      a   = 0;
      b   = 0;
      op=0;
   end

   // GENERATE CLOCK:
   initial forever #10 clk = ~clk;
   
   // CREATE STIMULI:
   always @(posedge clk) begin
      a <= $random();
      b <= $random();

      //cycle through op
      if(op==3)
	op<=0;
      else
      op<=op+1;
   end


	//INSTANTIATE MODULE
	bitwise_operations MUT(.clk(clk), .a(a), .b(b), .op(op), .q(q));


   // WRITE OUTPUT TO CONSOLE:
   integer fid;
   initial fid = $fopen("test_result.txt", "w");
   
   always @(posedge clk) begin
      $write("clk:   %d", clk_count);      
      $write("\ta:   %b", a);
      $write("\tb:   %b", b);
      $write("\top: %b", op);
      $write("\tq: %b", q);
      $write("\n");
      
      $fwrite(fid,"clk:  %d", clk_count);      
      $fwrite(fid,"\ta:  %b", a);
      $fwrite(fid,"\tb:  %b", b);
      $fwrite(fid,"\top: %b", op);
      $fwrite(fid,"\tq: %b", q);
      $fwrite(fid,"\n");
   end

   // DEFINE WHEN TO TERMINATE SIMULATION:
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 19) begin
	 $fclose(fid);
	 $finish;
      end
   end

   
endmodule // testbench
