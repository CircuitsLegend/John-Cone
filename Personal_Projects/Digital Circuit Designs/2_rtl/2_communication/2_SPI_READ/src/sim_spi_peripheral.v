`timescale 1ns/1ps

module sim_spi_peripheral 
  (
   input [31:0] fid,
   input 	SCLK,
   input 	CS,
   output reg 	SDO
	);


   
   integer    state;
   integer    bit_index;
   
   reg [15:0] r;
   integer    word_count;
   
   initial begin
      SDO = 0;
      word_count = 0;
   end

   
   always @(negedge SCLK) begin
      if (CS) begin // reset
	 SDO       <= 0;
	 bit_index <= 15;
	 
	 state    <= 0;
	 r[4:0]   <= 0;
	 r[15:13] <= 0;
	
	 if (word_count > 0)
	   r[12:5] <= $random();
	 else
	   r[12:5]  <= 8'b1111_1111;

	 word_count <= word_count + 1;
	 
      end
      else begin // If CS is low, send data
	 case (state)
	   0:
	     begin
		if (bit_index == 15) begin
		  $display("Sending %4x (%b)",r,r);
		  $fwrite(fid,"Sending %4x (%b)\n",r,r);
		end
		if (bit_index == 0)
		  state <= 1;
		else
		  bit_index <= bit_index - 1;
		SDO <= r[bit_index];
	     end
	   1:
	     begin
		SDO <= 0;		
	     end
	 endcase
      end
   end
   

endmodule //
