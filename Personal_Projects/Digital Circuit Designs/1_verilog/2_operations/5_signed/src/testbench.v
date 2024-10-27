`timescale 1ns/1ps

module testbench ();
   
  reg clk;     // "reg" type signals are  controlled
   reg signed [7:0] a;  // by the testbench
   reg signed [7:0] b;  // by the testbench
   reg up;
   reg dn;
   reg rst;
   wire signed [7:0] q;


   integer clk_count = 0;   
   
   // INITIAL SIGNAL CONFIGURATION:
   initial begin
      clk = 0;      
      a   = 0;
      b   = 0;
      up = 0;
      dn = 1;
      rst = 1;
   end

   // GENERATE CLOCK:
   initial forever #10 clk = ~clk;


sup_down_counter DUT(.clk(clk), .a(a), .b(b), .up(up), .dn(dn), .rst(rst), .q(q));


   // CREATE STIMULI:
   always @(posedge clk) begin
      
      b<=1;
      rst<=0;
   end

   // WRITE OUTPUT TO CONSOLE:
   integer fid;
   initial fid = $fopen("test_result.txt", "w");
   
   always @(posedge clk) begin
      $write("clk:%d", clk_count);      
      $write("\ta:%b(%d)", a,a);
      $write("\tb:%b%d)", b,b);
      $write("\tq:%b(%d)", q,q);
      $write("\n");
      
      $fwrite(fid,"clk:%d", clk_count);      
      $fwrite(fid,"\ta:%b(%d)", a,a);
      $fwrite(fid,"\tb:%b(%d)", b,b);
      $fwrite(fid,"\tq:%b(%d)", q,q);
      $fwrite(fid,"\n");
   end

   // DEFINE WHEN TO TERMINATE SIMULATION:
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 12) begin
	 $fclose(fid);
	 $finish;
      end
   end

   
endmodule // testbench
