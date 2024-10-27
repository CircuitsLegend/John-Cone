`timescale 1ns/1ps

module testbench ();
   
   // DECLARE SIGNALS
   reg  clk;
   reg 	rst;

   // UART TX wire:
   wire tx;

   // Send button:
   reg 	      send;
   
   integer clk_count = 0;   
   integer fid;
   initial fid = $fopen("test_result.txt", "w");


	 
   //----------------------------------------------
   // DUT instance
   //----------------------------------------------   
   top DUT
     (
      .clk(clk),
      .rst(rst),
      .send(send), 
      .tx(tx)
      );
   //----------------------------------------------
   
   
   
   //----------------------------------------------
   // INITIAL SIGNAL CONFIGURATION:
   //----------------------------------------------
   initial begin
      clk   = 0;
      
      $dumpfile("spi_write.vcd");
      // Dump signals in testbench with three levels of hierarchy:
      $dumpvars(3,testbench);
   end

   // GENERATE CLOCK: with 10ns period (100MHz)
   initial forever #5 clk = ~clk;
   //----------------------------------------------
   


   // -----------------------------------------------------
   // CREATE STIMULI AND REPORT RESULTS
   // -----------------------------------------------------
   integer i;
   integer tx_count;   
   reg [7:0] d_in;
   
   initial begin
      rst      = 1;  // start up in reset condition
      tx_count = 0;
      
      // After 100ns, stop resetting
      #100 rst = 0;

      // Delay 1000ns, then "send"
      #1000 send = 1;

      while (1) begin

	 // Wait for a signal:
	 while (tx) begin
	    // Delay 10us between checks
	    #10000;	 
	 end
	 
	 $write("Start bit. TX=");
	 $fwrite(fid,"Start bit. TX="); 
	 
	 // Get eight bits:
	 for (i=0; i<8; i=i+1) begin
	    #104170;
	    d_in[i] = tx;
	    $write("%b",tx);
	    $fwrite(fid,"%b",tx);	    
	 end

	 // Wait for stop bit:
	 #104170;
	 
	 if (tx) begin
	    $write(". Stop bit. ");
	    $fwrite(fid,". Stop bit. ");
	 end
	 else begin
	    $write(". BAD STOP BIT. ");
	    $fwrite(fid,". BAD STOP BIT. ");
	 end

	 $write("Got %xh('%c')\n",d_in,d_in);
	 $fwrite(fid,"Got %xh ('%c')\n",d_in,d_in);
	 tx_count = tx_count + 1;	 
      end
   end
   // -------------------------------------------------------



   // ----------------------------------------
   // DEFINE WHEN TO TERMINATE SIMULATION:
   // ----------------------------------------
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      
      if (tx_count == 5 || clk_count == 600_000) begin
	 $fclose(fid);
	 $finish;
      end
   end
   // ----------------------------------------

   
endmodule // testbench
