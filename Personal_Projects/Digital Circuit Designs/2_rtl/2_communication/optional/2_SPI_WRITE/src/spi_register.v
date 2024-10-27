`timescale 1ns/1ps

module    spi_register 
     (
      input 	 SCLK,
      input 	 CS_n,
      output reg SDO,
      input 	 SDI
      );

   reg [15:0] 	 d;        // stored data
   reg [7:0] 	 cmd_code; // received command
   reg [4:0] 	 bit_index;
   
   reg [3:0] 	 state;

   localparam CMD_STATE  = 0;
   localparam PUT_STATE  = 1;
   localparam GET_STATE  = 2;
   localparam DONE_STATE = 3;

   localparam GET_CODE = 8'h50;
   localparam PUT_CODE = 8'h46;
   
      
   initial begin
      d = 16'hABCD;
      state = 0;      
   end

   always @(negedge SCLK, posedge CS_n) begin
      // CS_n acts like a reset:
      if (CS_n) begin
	 state     <= CMD_STATE;  
	 SDO       <= 1;         // SDO is HIGH when unused
	 bit_index <= 7;         // Get ready to read MSB of command code
	 cmd_code  <= 0;         // Initialize to NULL command
      end
      // When CS_n goes LOW, the process starts:
      else begin
	 case (state)
	   CMD_STATE:
	     begin
		cmd_code[bit_index] <= SDI;
		if (bit_index == 0) begin // check command code
		   $display("Peripheral detected command code %h",{cmd_code[7:1],SDI});
		   
		   if ({cmd_code[7:1],SDI}==GET_CODE) begin
		      // start writing bits immediately:
		      SDO       <= d[15];  
		      bit_index <= 14;
		      state     <= GET_STATE;
		   end
		   else if ({cmd_code[7:1],SDI}==PUT_CODE) begin
		      bit_index <= 15;
		      state <= PUT_STATE;
		   end
		   else // invalid command code
		     state <= DONE_STATE;
		   
		end
		else begin
		   bit_index <= bit_index - 1;		   
		end
	     end // case: CMD_STATE
	   GET_STATE:
	     begin
		// Write register bits serially onto SDO:
		SDO <= d[bit_index];
		// Decrement bit_index until done:
		if (bit_index == 0)
		  state <= DONE_STATE;
		else
		  bit_index <= bit_index-1;		
	     end
	   PUT_STATE:
	     begin
		// Load register bits serially from SDI:
		d[bit_index] <= SDI;
		// Decrement bit_index until done:
		if (bit_index == 0)
		  state <= DONE_STATE;
		else
		  bit_index <= bit_index-1;
	     end
	   DONE_STATE:
	     begin
		// Once done, just wait until CS_n goes high again
		// to reset the interface.
		bit_index <= 7;
		SDO       <= 1;		
	     end
	 endcase 
      end
   end
   

endmodule //
