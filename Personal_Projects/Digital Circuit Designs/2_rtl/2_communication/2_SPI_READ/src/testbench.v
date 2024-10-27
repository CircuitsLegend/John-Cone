`timescale 1ns/1ps

module testbench ();
   
   // DECLARE SIGNALS
   reg  clk;
   reg 	rst;
   
   wire SDO;
   wire SCLK;
   wire CS;

   wire [15:0] led;
   
   
   integer clk_count = 0;   
   integer fid;
   initial fid = $fopen("test_result.txt", "w");

   top #(.refresh_period(2)) DUT
     (
      .clk(clk),
      .rst(rst),
      .SDO(SDO),
      .SCLK(SCLK),
      .CS(CS),
      .led(led)
      );
   
   sim_spi_peripheral ALSmodel 
     (
      .fid(fid),
      .SCLK(SCLK),
      .CS(CS),
      .SDO(SDO)
      );
   
   
   // INITIAL SIGNAL CONFIGURATION:
   initial begin
      clk   = 0;
      rst   = 1;  // start up in reset condition

      $dumpfile("spi.vcd");
      // Dump signals in DUT with two levels of hierarchy:
      $dumpvars(2,DUT);
      
   end

   // GENERATE CLOCK:
   initial forever #10 clk = ~clk;
   

   // CREATE STIMULI:
   always @(posedge clk) begin
      // Control the reset behavior:
      if (rst) begin
	 rst <= 0;
      end
   end

   

   

   // WRITE OUTPUT TO CONSOLE:
   reg 	   SCLK_d;
   
   always @(posedge clk) begin
      SCLK_d <= SCLK;
      if (!CS || DUT.rd)
	$dumpon;
      else
	$dumpoff;
      
      if (!CS && (SCLK ^ SCLK_d)) begin
	 $write("clk: %3d", clk_count);      
	 $write(" CS:  %b", CS);
	 $write(" SCLK:  %b", SCLK);
	 $write(" SDO:    %b", SDO);
	 $write(" led: %4x (%b)", led,led);
	 $write("\n");
	 
	 $fwrite(fid,"clk: %3d", clk_count);      
	 $fwrite(fid," CS:  %b", CS);
	 $fwrite(fid," SCLK:  %b", SCLK);
	 $fwrite(fid," SDO:    %b", SDO);
	 $fwrite(fid," led: %4x (%b)", led,led);
	 $fwrite(fid,"\n");
      end
   end

   // DEFINE WHEN TO TERMINATE SIMULATION:
   integer CS_count;
   initial CS_count = 0;
   reg 	   CS_d;
   
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      CS_d <= CS;
      
      if (!CS_d && CS) 
	CS_count <= CS_count + 1;
      
      if (CS_count == 10 || clk_count == 600_000) begin
	 $fclose(fid);
	 $finish;
      end
   end

   
endmodule // testbench
