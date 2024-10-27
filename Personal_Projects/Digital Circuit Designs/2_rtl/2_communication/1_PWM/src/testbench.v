`timescale 1ns/1ps

module testbench();
  // DECLARE SIGNALS
   reg clk; 
   reg [7:0] din;  
   wire sout;  
   
   integer clk_count = 0;   
   
   // INITIAL SIGNAL CONFIGURATION:
   initial begin
      clk = 0;      
   din=255;
   end
   // GENERATE CLOCK:
   initial forever #10 clk = ~clk;
   
   // STIMULI:


   // Demonstrate:
   pwm DUT(.clk(clk), .din(din), .sout(sout));

   
   // WRITE OUTPUT TO CONSOLE:
   integer fid;
   initial fid = $fopen("test_result.txt", "w");
   
   always @(posedge clk) begin
      $write("clk:  %d", clk_count);      
      $write("\tdin:  %b", din);
      $write("\tsout:  %b", sout);
      $write("\n");
      
      $fwrite(fid,"clk:  %d", clk_count);      
      $fwrite(fid,"\tdin:  %b", din);
      $fwrite(fid,"\tsout:  %b", sout);
      $fwrite(fid,"\n");
   end

   // DEFINE WHEN TO TERMINATE SIMULATION:
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 256) begin
	 $fclose(fid);
	 $finish;
      end
   end

   
endmodule