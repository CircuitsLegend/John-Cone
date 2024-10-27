`timescale 1ns/1ps

module producer
  #(
    parameter N=8
    )
   (
    input clk,
    input rst_l,

    input busy,
    output reg send,
    output reg [N-1:0] pdata
    );

   reg [1:0] 	       r;
   reg                 one_clock_delay;
   
   always @(posedge clk, negedge rst_l) begin
      if (!rst_l) begin
	 one_clock_delay <= 0;
	 
	 send  <= 0;
	 pdata <= 0;
	 r     <= $random();	 
      end
      else begin
	 r <= $random();
	 if ((r == 0) && !busy && !send && !one_clock_delay) begin
	    pdata <= $random();
	    send  <= 1;
	    $strobe("Sending %x(%b)",pdata,pdata);
	 end
	 else if (send && busy) begin
	    one_clock_delay <= 1;	    
	    send <= 0;
	 end
	 else
	   one_clock_delay <= 0;	    
      end
   end
endmodule // producer
