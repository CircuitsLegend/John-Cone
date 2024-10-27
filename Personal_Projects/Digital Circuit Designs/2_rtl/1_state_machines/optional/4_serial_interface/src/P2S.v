`timescale 1ns/1ps

module P2S
  #(
    parameter N=8
  )
  (
    input clk,    // master system clock
    input rst_l,  // master reset (active low)

    // Parallel data interface:
    input [N-1:0] pdata,
    input         send,
    output reg    busy,

    // Serial data interface:
    output reg cs,     // channel select
    output reg sdata   // serial data
  );

  reg       state;
  integer   bit_index;

  localparam IDLE     = 0;
  localparam WRITE    = 1;

  always @(posedge clk, negedge rst_l) begin
     if (!rst_l) begin
        state <= IDLE;
	busy  <= 0;
	sdata <= 0;
	cs    <= 0;
     end
     else begin
       case (state)
         ///////////////////////////////////////
         IDLE: 
	   begin
	      bit_index <= 0;
	      
	      if (send) begin
	        busy  <= 1;
		cs    <= 1;
		state <= WRITE;
	      end
	      else
		busy <= 0;
	      
	   end
	 //////////////////////////////////////
	 WRITE:
	   begin
	     // Write the next bit onto the serial channel:
	     sdata     <= pdata[bit_index];

	     // See if we've written all the bits:
	     if (bit_index == N-1) begin
	       cs    <= 0;
	       state <= IDLE;
	     end
	     // Else increment the bit index and keep writing:
	     else begin
   	       bit_index <= bit_index + 1;
	     end
	   end
	 /////////////////////////////////////
       endcase
     end
  end
endmodule
