`timescale 1ns/1ps

/* This file demonstrates how to use the SevenSegmentDriver module 
   and its associated files. To use the driver, copy the driver design
   into your project (or add to your source search path):
 
      * SevenSegmentDriver.v

 Then in your project, make sure the top-level I/O ports include the 
 7-segment display signals:
 
 		output [3:0] an, 
		output [6:0] seg,
		output dp,

 These signsals are, respectively, the anodes for each digit, the segment
 settings, and the dot point.
 
 Next, declare the SevenSegmentDriver signals:
 
           // Inputs to the driver:
 
		reg [15:0] din;      // Data value to be displayed
		reg        bcd;      // 1: decimal mode, 0: hex mode
		reg  [1:0] dec;      // Decimal point position (0,1,2,3)
		reg        enable;   // 1: display on, 0: display off

            // Outputs from binary-to-BCD conversion:
 
		wire [3:0] ones;
		wire [3:0] tens;
		wire [3:0] hundreds;
		wire [3:0] thousands;

 
 Next, instantiate the SevenSegmentDriver module:
 
  SevenSegmentDriver SEGDRV (
		.clk(clk),
		.din(din),
		.bcd(bcd),
		.dec(dec),
		.enable(enable),
		.an(an), 
		.seg(seg),
		.dp(dp),
		.ones(ones),
		.tens(tens),
		.hundreds(hundreds),
		.thousands(thousands)
    );
*/

module SevenSegmentDemo (
			 input clk,
			 // Input binary value using switches:
			 input [15:0] sw,

			 // Control decimal point:
			 input btnU,
			 input btnD,
			 input btnL,
			 input btnR,

			 // Switch between decimal and hex mode:
			 input btnC,

			 // Display output signals:
			 output [3:0] an, 
			 output [6:0] seg,
			 output dp
			 );

   // Inputs to the driver:
   
   reg [15:0] 			din;      // Data value to be displayed
   reg 				bcd;      // 1: decimal mode, 0: hex mode
   reg [1:0] 			dec;      // Decimal point position (0,1,2,3)
   reg 				enable;   // 1: display on, 0: display off


   always @(*) begin
      din    = sw;
      enable = 1;
      bcd    = ~btnC;     
   end

   always @(posedge clk) begin
      if (btnU)
	dec <= 0;
      else if (btnR)
	dec <= 1;
      else if (btnD)
	dec <= 2;
      else if (btnL)
	dec <= 3;      
   end
   
   // Outputs from binary-to-BCD conversion:
   
   wire [3:0] 			ones;
   wire [3:0] 			tens;
   wire [3:0] 			hundreds;
   wire [3:0] 			thousands;

  SevenSegmentDriver SEGDRV (
		.clk(clk),
		.din(din),
		.bcd(bcd),
		.dec(dec),
		.enable(enable),
		.an(an), 
		.seg(seg),
		.dp(dp),
		.ones(ones),
		.tens(tens),
		.hundreds(hundreds),
		.thousands(thousands)
    );
   

endmodule // SevenSegmentDemo

