`timescale 1ns/1ps

module consumer
  #(
    parameter N=8
    )
   (
    input clk,
    input rst_l,

    input              ready,
    output reg         ack,
    input      [N-1:0] pdata
    );
   
   always @(posedge clk, negedge rst_l) begin
      if (!rst_l) begin
	 ack   <= 0;
      end
      else begin
	 if (ready && !ack) begin
	    $strobe("Received %x(%b)", pdata,pdata);
	    ack <= 1;
	 end
	 else begin
	    ack <= 0;
	 end
      end
   end
endmodule // consumer
