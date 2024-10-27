`timescale 1ns/1ps

module top (
	//PWM
	    input 	clk, 
	    input 	rst,
	    input [7:0] volume,
		output reg 	AIN,
	    output reg 	GAIN,
	    output reg 	SHUTDOWN_L,

		//KEYPAD
		input  [3:0]  row,
   		output [3:0]  col,
   		
		//DIM LEDS
		output [15:0] LED
	 );
	 wire [15:0] LEDwire;
	 assign LED=({
	 LEDwire[0]&rst_l,
	 LEDwire[1]&rst_l,
	 LEDwire[2]&rst_l,
	 LEDwire[3]&rst_l,
	 LEDwire[4]&rst_l,
	 LEDwire[5]&rst_l,
	 LEDwire[6]&rst_l,
	 LEDwire[7]&rst_l,
	 LEDwire[8]&rst_l,
	 LEDwire[9]&rst_l,
	 LEDwire[10]&rst_l,
	 LEDwire[11]&rst_l,
	 LEDwire[12]&rst_l,
	 LEDwire[13]&rst_l,
	 LEDwire[14]&rst_l,
	 LEDwire[15]&rst_l
	 });

//DEBOUNCER
   wire db_rst;
    reg onled;

//DEBOUNCE MODULE 
   debouncer db1
     (
      .clk(clk),
      .btn(rst),
	  .rst_l(1'b1),
      .btn_db(db_rst)
      ); 

//KEYPAD
	wire [15:0] keys;
    wire       rst_l;
  	assign rst_l = ~onled;



//PMW
   reg [9:0] N;
   wire sout;

     initial begin
	 GAIN       <= 1;
	 SHUTDOWN_L <= 1;
	 AIN        <= 0;	
	 N <=0;
	 onled<=0; 
   end

//KEYPAD MODULE
keypad #(.N(300_000)) kypd
     (
      .clk(clk),
      .rst_l(rst_l),
      .row(row),
      .col(col),
      .keys(keys)
      );

//PMW MODULE   
   pwm_audio PWM 
   		   (
		   .clk(clk), 
		   .rst_n(rst_l),
		   .volume(volume),
		   .N(N),
		   .sout(sout)
		   );

 //DIM LEDS
 dim_leds #(.N(500_000)) dimmcool
 	(
	.clk(clk), 
	.rst_l(rst_l), 
	.LED(LEDwire)
	);

always @(*)begin
	if (db_rst)
	begin
	  onled<=~onled;
	end

if (!rst_l) begin
GAIN<=1;
SHUTDOWN_L<=1;
end

if (onled) 
AIN<=0; 
else 
AIN<=sout;

case (keys)
16'b0000000000000000: N<=0;
16'b0000000000000001: N<=747;
16'b0000000000000010: N<=665;
16'b0000000000000100: N<=592;
16'b0000000000001000: N<=528;
16'b0000000000010000: N<=498;
16'b0000000000100000: N<=446;
16'b0000000001000000: N<=396;
16'b0000000010000000: N<=354;
16'b0000000100000000: N<=334;
16'b0000001000000000: N<=298;
16'b0000010000000000: N<=266;
16'b0000100000000000: N<=250;
16'b0001000000000000: N<=225;
16'b0010000000000000: N<=196;
16'b0100000000000000: N<=176;
16'b1000000000000000: N<=166;
default: N<=0;
endcase
end

endmodule