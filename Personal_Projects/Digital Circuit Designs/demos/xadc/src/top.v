`timescale 1ns/1ps

module top (
	    input 	 clk,
	    input 	 rst,
	    output [3:0] an, 
	    output [6:0] seg,
	    output 	 dp,
	    input 	 vp,
	    input 	 vn,
	    input [1:0]  avg  // switches
	 );

   wire 		 rst_n;
   assign rst_n = ~rst;
   
   wire [15:0] 		 s_out;

   reg 			 bcd;
   reg [1:0] 		 dec;
   reg 			 enable;
   
   wire [3:0] 		 ones;
   wire [3:0] 		 tens;
   wire [3:0] 		 hundreds;
   wire [3:0] 		 thousands;

   always @(*) begin
      bcd = 0;
      dec = 0;
      enable = 1;      
   end

   SevenSegmentDriver ssdrv (
			     .clk(clk),
			     .din(s_out),
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

   reg adc_rst_n;
   
   adc ADC_inst (
	     	 .clk(clk),
	     	 .rst_n(adc_rst_n),
		 .vp(vp),
		 .vn(vn),
		 .s_out(s_out),
		 .avg(avg)
		 );

   always @(posedge clk) begin
      if (!rst_n) begin
	 adc_rst_n <= 0;
      end
      else begin
	 adc_rst_n <= 1;
      end
   end
   
endmodule
