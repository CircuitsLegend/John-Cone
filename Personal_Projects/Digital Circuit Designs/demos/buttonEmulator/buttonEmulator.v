`timescale 1ns/1ps

module buttonEmulator
  #(
    parameter pressPeriod  = 200,
    parameter bouncePeriod = 3
    )
   (
    input      clk,
    output reg btn
    );
   
   integer    randomValue;
   integer    dynamicState;
   reg 	      mechanicalState;
   
   localparam STABLE   = 0;
   localparam BOUNCING = 1;

   initial begin
      dynamicState    = STABLE;
      mechanicalState = 0;
      btn             = 0;
      
      randomValue     = 0;
   end
   
   always @(posedge clk) begin
      randomValue = $random;
      case (dynamicState)
	STABLE: begin
	   if ((randomValue % pressPeriod) == 0) begin
	      mechanicalState <= ~mechanicalState;
	      btn             <= ~mechanicalState;
	      dynamicState    <= BOUNCING;
	      $display("\n\n  --%m: changing button state from %b to %b",
		       mechanicalState,~mechanicalState);
	   end
	   else
	     btn <= mechanicalState;
	end
	BOUNCING: begin
	   if ((randomValue % bouncePeriod) == 0) begin
	      btn          <= mechanicalState;
	      dynamicState <= STABLE;
	   end
	   else if ((randomValue % 2) == 0) begin
	      btn          <= ~mechanicalState;
	      dynamicState <= BOUNCING;	      
	      $display("  --%m: bounce occured");
	   end
	   else 
	      btn <= mechanicalState;
	end
      endcase // case (buttonState)	  
   end
endmodule // buttonEmulator
