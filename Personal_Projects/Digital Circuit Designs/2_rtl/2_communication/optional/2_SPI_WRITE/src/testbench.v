`timescale 1ns/1ps

module testbench ();
   
   // DECLARE SIGNALS
   reg  clk;
   reg 	rst;
   
   wire SDO;
   wire SCLK;
   wire CS_n;

   wire [15:0] led;
   
   
   integer clk_count = 0;   
   integer fid;
   initial fid = $fopen("test_result.txt", "w");

   reg [15:0] sw;
   reg 	      rd_btn;
   reg 	      wr_btn;

   //----------------------------------------------
   // Suppress simultaneous rd/wr button presses:
   //----------------------------------------------
   wire    rd_unique;
   assign  rd_unique = rd_btn & ~DUT.wr & ~wr_btn;

   wire    wr_unique;
   assign  wr_unique = wr_btn & ~DUT.rd & ~rd_btn;
   //----------------------------------------------
	
	 
   //----------------------------------------------
   // DUT instance
   //----------------------------------------------   
   top DUT
     (
      .clk(clk),
      .rst(rst),
      .sw(sw), 
      .rd_btn(rd_unique),
      .wr_btn(wr_unique),
      .led(led)
      );
   //----------------------------------------------
   
   
   
   //----------------------------------------------
   // INITIAL SIGNAL CONFIGURATION:
   //----------------------------------------------
   initial begin
      clk   = 0;
      rst   = 1;  // start up in reset condition

      // Random input data:
      sw    = $random();
      
      $dumpfile("spi_write.vcd");
      // Dump signals in testbench with three levels of hierarchy:
      $dumpvars(3,testbench);
   end

   // GENERATE CLOCK:
   initial forever #10 clk = ~clk;
   //----------------------------------------------
   




   // -----------------------------------------------------
   // CREATE STIMULI
   // -----------------------------------------------------
   reg 	 [5:0]  r;
   reg 		r_cmd;
 		
   always @(posedge clk) begin
      if (rst) begin
	 rst <= 0;
      end
      
      r     <= $random(); // random number between 0 and 31
      r_cmd <= $random(); // random bit in {1,0}

      // The condition `r==0` is true with probability 1/32,
      // so this code is evaluate at random times:
      if (!wr_btn && !rd_btn && (r == 0) && DUT.CS_n) begin
	 // The next two lines work like an "if" condition
	 // using the r_cmd logic signal:
	 wr_btn <= r_cmd;      // If r_cmd then wr_btn
	 rd_btn <= ~r_cmd;     // Else rd_btn
	 
	 sw     <= $random();  // Random input data
      end
      else if (r==0) begin
	 wr_btn <= 0;
	 rd_btn <= 0;
      end
   end
   // -------------------------------------------------------


   // ----------------------------------------
   // Detect rising edge of 'done' with
   // one-cycle delay
   // ----------------------------------------
   reg    done_d;
   wire   done_posedge;
   reg    done_posedge_d;

   assign done_posedge = DUT.done & ~done_d;
   always @(posedge clk) begin
      done_d <= DUT.done;
      done_posedge_d <= DUT.done & ~done_d;
   end
   // ----------------------------------------


   // ----------------------------------------
   // Detect rising and falling edges of 'SCLK'
   // ----------------------------------------
   reg    SCLK_d;
   wire   SCLK_negedge;
   wire   SCLK_posedge;
   assign SCLK_negedge =  ~DUT.SCLK & SCLK_d;
   assign SCLK_posedge =  DUT.SCLK & ~SCLK_d;

   always @(posedge clk) begin
      SCLK_d <= DUT.SCLK;
   end
   // ----------------------------------------


   // ----------------------------------------
   // Detect falling edge of 'CS_n'
   // ----------------------------------------
   reg    CS_n_d;
   wire   CS_n_negedge;
   
   assign CS_n_negedge =  ~DUT.CS_n & CS_n_d;

   always @(posedge clk) begin
      CS_n_d <= DUT.CS_n;
   end
   // ----------------------------------------
   
   // -------------------------------------------------------
   // WRITE OUTPUT TO CONSOLE:
   // -------------------------------------------------------
   reg          wr_mode;
   reg 		rd_mode;
   always @(posedge clk) begin
      // Write PUT/GET notifications when `done` rises:
      if (CS_n_negedge) begin
	 if (DUT.rd) begin
	    rd_mode <= 1;
	    
	    $write("Starting GET, register contents are %H\n",DUT.memoryModel.d);
	    $fwrite(fid,"Starting GET\n");
	 end
	 if (DUT.wr) begin
	    wr_mode <= 1;
	    
	    $write("Starting PUT with data %H\n", sw);
	    $fwrite(fid,"Starting PUT with data %H\n", sw);
	 end
      end
      if (done_posedge_d) begin
	 if (rd_mode) begin
	    $write("Completed GET with data %H\n", led);
	    $fwrite(fid,"Completed GET with data %H\n", led);
	    rd_mode <= 0;
	    
	 end
	 if (wr_mode) begin
	    $write("Completed PUT with data %H, register contents now %H\n", sw, DUT.memoryModel.d);
	    $fwrite(fid,"Completed PUT with data %H\n", sw);
	    wr_mode <= 0;
	    
	 end
      end
      
      // Write all SPI and handshake signal events during
      // a READ or WRITE operation:
      if (!DUT.CS_n && SCLK_negedge) begin
	 $write("clk: %6d\t posedge [[", clk_count);
	 $write("rd: %b", DUT.rd);
	 $write(" wr: %b", DUT.wr);
	 $write(" done: %b", DUT.done);
	 $write(" sw: %x", sw);
	 
	 $write(" SDI: %b", DUT.SDI);
	 
	 $fwrite(fid,"clk: %6d \t negedge [[", clk_count);      
	 $fwrite(fid," rd: %b", DUT.rd);
	 $fwrite(fid," wr: %b", DUT.wr);
	 $fwrite(fid," done: %b", DUT.done);
	 $fwrite(fid," sw: %x", sw);

	 $fwrite(fid," SDI: %b", DUT.SDI);
      end

      if ((!DUT.CS_n && SCLK_posedge) || done_posedge) begin
      	 $write("]]\t posedge [[ SDO: %b", DUT.SDO);
	 $write(" led: %4x (%b) ]]", led,led);
	 $write("\n");
	 
	 $fwrite(fid,"]] posedge [[ SDO: %b", DUT.SDO);
	 $fwrite(fid," led: %4x (%b) ]]", led,led);
	 $fwrite(fid,"\n");
      end
   end
   // ----------------------------------------


   // ----------------------------------------
   // DEFINE WHEN TO TERMINATE SIMULATION:
   // ----------------------------------------
   integer CS_n_count;
   initial CS_n_count = 0;
   
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      
      if (CS_n_negedge) 
	CS_n_count <= CS_n_count + 1;
      
      if (CS_n_count == 10 || clk_count == 24000) begin
	 $fclose(fid);
	 $finish;
      end
   end
   // ----------------------------------------

   
endmodule // testbench
