`timescale 1ns/1ps

module spi_test (

	 );

   reg clk;

   initial begin
      clk = 0;
      forever #5 clk = ~clk;
   end

   reg       rst_n;
   reg       en;   
   reg [7:0] data;
   integer   clk_count;
   
   wire      rdy;
   wire      sclk;
   wire      sdo;

   reg [1:0] state;
   
   localparam INIT=0;
   localparam SEND=1;

   initial begin
      data  = $random();
      en    = 0;
      rst_n = 0;
      clk_count = 0;
      state=INIT;
      
      $monitor("%3d: en=%b\trdy=%b,\tsclk=%b\tsdo=%b\tdata=%2h\tstate=%1d\tidx=",clk_count,en,rdy,sclk,sdo,data,DUT.state,DUT.idx);
   end

   spi #(.N(4)) DUT
     (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .data(data),
      .rdy(rdy),
      .sclk(sclk),
      .sdo(sdo)
      );

   wire cs_n = ~en;
   
   spi_listener listener
  (
   .sclk(sclk),
   .sdo(sdo),
   .cs_n(cs_n)
   );

   reg sclk_d;
   
   always @(posedge clk) begin

      rst_n  <= 1;
      sclk_d <= sclk;

      case (state)
	INIT: begin
	   if (!en && rdy) begin
	      en <= 1;
	   end
	   else if (en && !rdy) begin
	      state <= SEND;	      
	      $display("%3d: sending %2hh(%8b)",clk_count,data,data);
	   end
	end
	SEND: begin
	   if (sclk && !sclk_d) begin
	      $display("%3d(%3tns):   sdo %b",clk_count,$time,sdo);	    
	   end
	   if (rdy) begin
	      $display("%3d: Updating data and continuing",clk_count);
	      data <= $random();
	      state <= INIT;
	   end
	end
      endcase // case (state)
            
   end


   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 400) begin
	 // Things to do at finish
	 $finish;
      end
   end

   
   
endmodule
