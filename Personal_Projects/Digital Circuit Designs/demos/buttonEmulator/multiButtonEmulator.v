// More button emulator!!!
`timescale 1ns/1ps

// Ideas:
// 1: Have a "reset" or "lockout" -- if one button is pressed, prevent
//    another from being pressed.
// 2: Instead of looping through all the buttons, generate one random
//    value for the button we want to activate.

module multiButtonEmulator
  #(
    parameter pressPeriod  = 200,
    parameter bouncePeriod = 3,
    parameter numButtons = 2
    )
   (
    input 			clk,
    output reg [numButtons-1:0] btn
    );

   // Array syntax:
   integer 			randomValue;  
   reg [2:0] 			randomButton;  
   integer 			dynamicState;
 

   // Vector syntax:
   reg [numButtons-1:0] mechanicalState;
   
   localparam STABLE   = 0;
   localparam BOUNCING = 1;

   integer 		loopVar;

   
   initial begin
      for (loopVar=0; loopVar<numButtons; loopVar = loopVar+1) begin
	 btn[loopVar]             = 0;

	 mechanicalState[loopVar] = 0;
      

      end
      dynamicState    = STABLE;
      randomValue     = 0;
      randomButton    = 0;
      
   end


   reg [2:0] rval;
   initial rval = 0;
   
   always @(posedge clk) begin
//      for (loopVar=0; loopVar<numButtons; loopVar = loopVar+1) begin
	 randomValue <= $random;
         rval        <= $random;
      
	 randomButton <= rval % numButtons;
//      $strobe("  --%m checking the $random and modulo: random=%d and randomButton=%d",rval,randomButton);
      
	 case (dynamicState)
	   STABLE: begin
	      if ((randomValue % pressPeriod) == 0) begin
		 if (btn > 0) begin
		    // return btn to zero
		    mechanicalState = 0;		    
		 end
		 else begin
		    mechanicalState[randomButton] <= 1;
		 end
		 dynamicState    <= BOUNCING;
		 $display("\n\n  --%m: btn %0d changing button state from %b to %b",
			  randomButton, mechanicalState[randomButton],~mechanicalState[randomButton]);
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
		 btn          <= 0; // btn is a vector!
		 dynamicState <= BOUNCING;	      
		 $display("  --%m: bounce occured");
	      end
	      else 
		btn <= mechanicalState;
	   end
	 endcase // case (buttonState)	  
//      end // for (loopVar=0; loopVar<numButtons; loopVar = loopVar+1)
   end // always @ (posedge clk)
   
endmodule // buttonEmulator
