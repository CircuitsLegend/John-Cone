`timescale 1ns/1ps

module testbench ();
   
   // DECLARE SIGNALS
   reg  clk;
   reg 	rst_l;

   // UART TX wire:
   reg rx;

   // ack handshake
   reg 	      ack;

   wire [7:0] d_in;
   wire       ready;
   
   integer clk_count = 0;   
   integer fid;
   initial fid = $fopen("test_result.txt", "w");


	 
   //----------------------------------------------
   // DUT instance
   //----------------------------------------------
   
   uart_rx DUT
     (
      .clk(clk),
      .rst_l(rst_l),
      
      .d_in(d_in),

      .rx(rx),
      .ready(ready),
      .ack(ack)
      );
   //----------------------------------------------
   
   
   
   //----------------------------------------------
   // INITIAL SIGNAL CONFIGURATION:
   //----------------------------------------------
   initial begin
      clk   = 0;
      
      $dumpfile("uart_rx.vcd");
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
   
   reg [7:0] d_out;
   
   
   initial begin
      rx       = 1;
      
      rst_l    = 0;  // start up in reset condition
      tx_count = 0;
      
      // After 100ns, stop resetting
      #100 rst_l = 1;

      while (1) begin

         d_out = $random(); // <--- add this line to set data to send
	 
	 $write("Sending %x\n",d_out);        // <-- add this
	 $fwrite(fid,"Sending %x\n",d_out);   // <-- and this

	 $write("Start bit. RX=");
	 $fwrite(fid,"Start bit. RX="); 

	 rx=0;   // <--- add this line to send START BIT
	 
	 // send eight bits:
	 for (i=0; i<8; i=i+1) begin
	    #104170;
	    rx = d_out[i];
	    $write("%b",rx);
	    $fwrite(fid,"%b",rx);	    
	 end

	 // Wait for stop bit:
	 #104170;
	 rx = 1;
	 

	 $write(". Stop bit. ");
	 $fwrite(fid,". Stop bit. ");
	 
	 // Add these lines:
         while (!ready) begin
	    #104170;   // wait for 'ready' signal
	 end
	 ack = 1;
	 

	 $write("Got %xh('%c')\n",d_in,d_in);
	 $fwrite(fid,"Got %xh ('%c')\n",d_in,d_in);

         // Add these lines to test handshake:
         while (ready) begin
	    #104170;  // wait for 'ready' signal to drop
	 end
	 ack = 0;    // clear ack
	 
         #104170;  // wait one more UART clock cycle before sending again

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
