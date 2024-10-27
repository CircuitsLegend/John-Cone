`timescale 1ns/1ps

module testbench ();
   
   // DECLARE SIGNALS
   reg  clk;
   reg 	rst;

   // UART TX wire:
   reg 	rx;
   wire tx;
   
   
   reg [7:0] d_in;
   reg [7:0] d_out;
   reg 	     send;
   
   
   integer   clk_count = 0;   
   integer   fid;
   initial fid = $fopen("test_result.txt", "w");
   

	 
   //----------------------------------------------
   // DUT instance
   //----------------------------------------------
   
   top DUT
     (
      .clk(clk),
      .rst(rst),
      .tx(tx),
      .rx(rx),
      .send(send)
      );
   //----------------------------------------------
   
   
   
   //----------------------------------------------
   // INITIAL SIGNAL CONFIGURATION:
   //----------------------------------------------
   initial begin
      clk   = 0;
      
      $dumpfile("uart_bidir.vcd");
      // Dump signals in testbench with three levels of hierarchy:
      $dumpvars(2,testbench);
   end

   // GENERATE CLOCK: with 10ns period (100MHz)
   initial forever #5 clk = ~clk;
   //----------------------------------------------
   


   // -----------------------------------------------------
   // CREATE STIMULI AND REPORT RESULTS
   // -----------------------------------------------------
   integer i;
   integer tx_count;
   reg [3:0] send_rnum;
   
   
   initial begin
      rst      = 1;  // start up in reset condition
      tx_count = 0;
      send = 0;
      
      // After 100ns, stop resetting
      #100 rst = 0;

      while (1) begin
	 #200000;
	 send_rnum = $random();

	 if ((send_rnum == 0)&&!DUT.start) begin
	    send = 1;
	    
	    $write("SEND pressed\n");     
	    $fwrite(fid,"SEND pressed\n");
	    tx_count = tx_count + 1;	 
	 end
	 else begin
	    send = 0;	    
	 end


      end
   end
   // -------------------------------------------------------



   // ----------------------------------------
   // DEFINE WHEN TO TERMINATE SIMULATION:
   // ----------------------------------------
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      
      if (tx_count == 5 || clk_count == 6_000_000) begin
	 $fclose(fid);
	 $finish;
      end
   end
   // ----------------------------------------


   // -----------------------------------------------
   // Receive UART byte task
   // -----------------------------------------------
   integer tx_index = 0;
   
   initial begin
      d_out = 0;
      
      while (1) begin
	 #100;
	 
	 if (!tx) begin
	    #1000;   // Add margin for timing skew
	    
	    for (tx_index=0;tx_index<8;tx_index=tx_index+1) begin
	       #104170;
	       $write(">%b ",tx);	       
	       d_out[tx_index] = tx;
	    end
	 
	    #104170;
	    #104170;
	    if (!tx)
	      $display("BAD STOP BIT");
	    $display("Received %xh ('%c') from module",d_out,d_out);
	 end
	     
      end
   end // initial begin

   // -----------------------------------------------
   // Send UART byte task
   // -----------------------------------------------
   integer rx_index = 0;
   reg [2:0] rnum;
   
   initial begin
      rx = 1;
      
      while (1) begin
	 #104170;
	 rnum = $random();
	 
	 if (rnum == 0) begin
	    d_in = $random();
	    
	    $display("Transmitting %xh ('%c') to module",d_in,d_in);
	    
	    rx = 0; // START bit
	    
	    for (rx_index=0;rx_index<8;rx_index=rx_index+1) begin
	       #104170;
	       rx = d_in[rx_index];
	    end
	 end
	 #104170;
	 rx = 1;    // STOP bit
	 #104170;
      end
   end


   
   
endmodule // testbench
