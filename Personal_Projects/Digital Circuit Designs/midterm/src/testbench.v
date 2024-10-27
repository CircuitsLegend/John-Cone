`timescale 1ns/1ps

module testbench();

  // DECLARE SIGNALS
   reg clk; 
   reg [7:0] volume;  
   reg rst;
   wire sout;
   wire AIN;
   wire GAIN;
   wire SHUTDOWN_L;

    //DEBOUNCE
    wire onled;
    reg on_btn;
	
		//KEYPAD
		reg  [3:0]  row;
   		wire [3:0]  col;
   	
wire [15:0] LED;


   integer clk_count = 0;   
   
   // INITIAL SIGNAL CONFIGURATION:
   initial begin
      clk = 0;      
   on_btn = 0;
   volume = 7;
   rst = 0;
   row = 5;
   end
   // GENERATE CLOCK:
   initial forever #10 clk = ~clk;
   
   // STIMULI:


   // Demonstrate:
top DUT(.clk(clk), .rst(rst), .volume(volume), .AIN(AIN), .GAIN(GAIN), .SHUTDOWN_L(SHUTDOWN_L), .row(row), .col(col), .LED(LED));

   
   // WRITE OUTPUT TO CONSOLE:
   integer fid;
   initial fid = $fopen("test_result.txt", "w");
   
   always @(posedge clk) begin
      $write("clk:  %d", clk_count);      
      $write("\tkeys:  %b", DUT.keys);
      $write("\n");
      
      $fwrite(fid,"clk:  %d", clk_count);      
      $fwrite(fid,"\tkeys:  %b", DUT.keys);
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
   


/*
   // DECLARE SIGNALS
   reg clk;     
   reg rst;
   reg btn;

   reg btn_d;   // delayed button (to detect changes)
   reg led_d;   // delayed led
   reg state_d; // delayed debouncer state
   reg clear_d; // delayed clear signal
   reg t_d;     // delayed timer alarm
   
   reg value_change;
   
   wire led;
   
   integer clk_count   = 0;   
   integer clk_count_d = 0; // delayed clock count   

   // DEVICE UNDER TEST
   debouncer DUT
  (
   .clk(clk),
   .btn(rst),     
   .btn_db(led)
   );
   
   always @(*) begin
      value_change = btn ^ btn_d;
      value_change = value_change | (led ^ led_d);
      value_change = value_change | (DUT.clear ^ clear_d);
      value_change = value_change | (DUT.state ^ state_d);
      value_change = value_change | (DUT.t ^ t_d);      
   end
   
   // INITIAL SIGNAL CONFIGURATION:
   initial begin
      clk = 0;      
      rst = 0;

      $dumpfile("debounce.vcd");
      $dumpvars(1,DUT);
      
   end

   // GENERATE CLOCK:
   initial forever #10 clk = ~clk;
   
   // CREATE STIMULI:
   always @(posedge clk) begin
      btn_d   <= rst;
      led_d   <= led;
      state_d <= DUT.state;
      clear_d <= DUT.clear;
      t_d     <= DUT.t;
      
      if (0) begin
	 rst <= 0;
      end
      else begin
	 case (clk_count)
	   10: // start button press
	     rst <= 1;
	   20: // bounce
	     rst <= 0;
	   24: //bounce
	     rst <= 1;
	   30: //bounce
	     rst <= 0;
	   31: // now sustain
	     rst <= 1;
	   200: // release
	     rst <= 0;
	   210: // bounce
	     rst <= 1;
	   215: // bounce
	     rst <= 0;
	   230: //bounce
	     rst <= 1;
	   235: //sustain
	     rst <= 0;
	   	   
	 endcase // case (clk_count)
	 
      end
   end

   

   // WRITE OUTPUT TO CONSOLE:
   integer fid;
   initial fid = $fopen("test_result.txt", "w");
   
   always @(posedge clk) begin
      // write data if there is a change:
      if (value_change) begin
	 clk_count_d <= clk_count;
	 
	 $write("clk:  %4d", clk_count);      
	 $write(" clk diff:  %4d", clk_count-clk_count_d);
	 $write(" state: %1d", DUT.state);
	 $write(" clear: %b", DUT.clear);
	 $write(" t: %b", DUT.t);
	
	 $write(" led:  %d", led);
	 $write("\n");
	 
	 $fwrite(fid,"%4d", clk_count);      
	 $fwrite(fid,"\t%4d", clk_count-clk_count_d);
	 $fwrite(fid,"\t%1d", DUT.state);
	 $fwrite(fid,"\t%b", DUT.clear);
	 $fwrite(fid,"\t%b", DUT.t);

	 $fwrite(fid,"\t%d", led);
	 $fwrite(fid,"\n");
      end
   end

   // DEFINE WHEN TO TERMINATE SIMULATION:
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 500) begin
	 $fclose(fid);
	 $finish;
      end
   end
*/
   
endmodule