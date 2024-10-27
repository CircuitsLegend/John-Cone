`timescale 1ns/1ps

module testbench ();
   
   // DECLARE SIGNALS
   reg clk;     // "reg" type signals are  controlled
   reg [7:0] a;  // by the testbench
   reg [7:0] b;  // by the testbench
   reg up;
   reg dn;
   reg rst;
   wire [7:0] q;


   integer clk_count = 0;   
   
   // INITIAL SIGNAL CONFIGURATION:
   initial begin
      clk = 0;      
      a   = 0;
      b   = 0;
      up = 1;
      dn = 0;
      rst = 1;
   end

   // GENERATE CLOCK:
   initial forever #10 clk = ~clk;
//MODULE   
up_down_counter DUT(.clk(clk), .a(a), .b(b), .up(up), .dn(dn), .rst(rst), .q(q));

   // CREATE STIMULI: AND SET UP TESTS
   always @(posedge clk) begin
      a <= $random();
      b <= $random();
    rst <=0; 
   end
 
   // WRITE OUTPUT TO CONSOLE:
   integer fid;
   initial fid = $fopen("test_result.txt", "w");
   
   always @(posedge clk) begin
      $write("clk:  %d", clk_count);      
      $write("\ta:  %b", a);
      $write("\tb:  %b", b);
      $write("\trst: %b",rst);
      $write("\tq:  %b", q);
      $write("\n");
      
      $fwrite(fid,"clk:  %d", clk_count);      
      $fwrite(fid,"\ta:  %b", a);
      $fwrite(fid,"\tb:  %b", b);
      $fwrite(fid,"\trst: %b",rst);
      $fwrite(fid,"\tq:  %b", q);
      $fwrite(fid,"\n");
   end

   // DEFINE WHEN TO TERMINATE SIMULATION:
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 8) begin
	 $fclose(fid);
	 $finish;
      end
   end

   
endmodule // testbench
