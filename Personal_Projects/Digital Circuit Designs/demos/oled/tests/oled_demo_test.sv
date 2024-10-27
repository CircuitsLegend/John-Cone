`timescale 1ns/1ps

module oled_demo_test (

	 );

   reg clk;
   reg rst_n;
   wire rst;
   assign rst=~rst_n;
   
   initial begin
      clk = 0;
      forever #10 clk = ~clk;
   end

   wire vbat;
   wire vdd;
   wire res;
   wire sclk;
   wire sdo;
   wire cs_n;
   wire dc;
   wire ready;

   reg showchar;
   reg showbmp;
   reg clear;
   reg btnd;
   
   reg [1:0] bmp_selection;
   reg [1:0] char_row;
   reg [3:0] char_col;
   reg [7:0] charval;

   reg [15:0] sw;
   always @(*) begin
      sw = {bmp_selection, char_row, char_col, charval};      
   end
   
   oled_demo DUT 
  (
   .clk(clk),
   .rst(rst),
   .showchar(showchar),
   .showbmp(showbmp),
   .clear(clear),
   .sw(sw),
   .ready(ready),
   .vbat(vbat),
   .vdd(vdd),
   .res(res),
   .sclk(sclk),
   .sdo(sdo),
   .cs_n(cs_n),
   .dc(dc)
   );

   spi_listener listener
  (
   .sclk(sclk),
   .sdo(sdo),
   .cs_n(cs_n),
   .dc(dc)
   );


`include "ip/oled/inc/command_codes.sv"
   
   initial begin
      rst_n    = 0;
      showchar = 0;
      showbmp  = 0;
      clear    = 0;
      btnd     = 0;

      bmp_selection = 0;
      char_row      = 1;
      char_col      = 13;
      charval       = 37;
      
      $monitor("%t: p_adr=%d p_data=%2h",$time,DUT.oled.p_adr,DUT.oled.p_data);
      
      $monitor("%t: dptr=%d",$time,DUT.oled.cmdInterp.dptr);
      $monitor("%t: vdd=%b",$time,vdd);
      $monitor("%t: vbat=%b",$time,vbat);
      $monitor("%t: res=%b",$time,res);
      $monitor("%t: state=%d",$time,DUT.oled.cmdInterp.state);

      $monitor("%t: timer=%b",$time,DUT.oled.cmdInterp.t);
      $monitor("%t: ready=%b",$time,ready);
      $monitor("%t: dc=%b",$time,dc);
      $monitor("%t: SPIrdy=%b",$time,DUT.oled.cmdInterp.SC1.rdy);
      $monitor("%t: charval=%d",$time,DUT.oled.cmdInterp.charval);
      $monitor("%t: fontrow=%d",$time,DUT.oled.cmdInterp.fontrow);
      $monitor("%t: fontcol=%d",$time,DUT.oled.cmdInterp.fontcol);

   end

   wire      t;
   reg 	     tclr;
   reg [31:0] N;

   delayTimer Timer 
  (
   .clk(clk),
   .rst_n(rst_n),
   .clr(tclr),
   .N(N),
   .t(t)
   );

   initial begin
      tclr = 1;
      N    = 100;
   end
   
   always @(posedge clk) begin
      rst_n <= 1;

        if (ready) begin
         
         tclr <= 0;
         if (t) begin
            showchar <= 1;
         end	 
          end          
          else
        showchar <= 0;
          
   end


   integer clk_count;
   initial clk_count = 0;
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (DUT.oled.p_adr == 60) begin  // reach NULL_CMD after placing character
	 // Things to do at finish
	 $finish;
      end
   end

   
endmodule
