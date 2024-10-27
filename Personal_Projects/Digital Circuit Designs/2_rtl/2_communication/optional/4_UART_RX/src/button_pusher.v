`timescale 1ns/1ps

module button_pusher #(
		       parameter Nbtn=5
		       )
   (
    input      clk,
    output reg [Nbtn-1:0] btn
    );

   integer 		  state;
   localparam  IDLE       = 0;
   localparam  BOUNCE_ON  = 1;
   localparam  ON         = 2;
   localparam  BOUNCE_OFF = 3;

   reg [4:0] 		  selected_btn;
   reg [9:0] 		  rnd;

   initial begin
      state        = IDLE;
      rnd          = $random();
      btn          = 0;
      selected_btn = 0;      
   end

   always @(posedge clk) begin
      rnd <= $random() % 2000;
      case (state)
	IDLE: begin
	   btn <= 0;
	   
	   if (rnd == 0)
	     begin
		state <= BOUNCE_ON;
		selected_btn <= $unsigned($random()) % Nbtn;
	     end
	end
	BOUNCE_ON: begin
	   if (btn==0)
	     $display("btn %d ON", selected_btn);
	   
	   if (rnd < 200) begin
	      state               <= ON;
	      btn[selected_btn]   <= 1;
	   end
	   else if (rnd < 500) begin
	      btn[selected_btn] <= 0;
	      $display("(bounce)");	      
	   end
	   else begin 
	      btn[selected_btn] <= 1;
	   end
	end
	ON: begin

	   if (rnd == 0) begin
	      state <= BOUNCE_OFF;
	      btn[selected_btn] <= 0;
	     $display("btn %d OFF", selected_btn);
	   end
	   else
	     btn[selected_btn] <= 1;
	end
	BOUNCE_OFF: begin
	   if (rnd < 200) begin
	      state               <= IDLE;
	      btn[selected_btn]   <= 0;
	   end
	   else if (rnd < 500) begin
	      btn[selected_btn] <= 1;
	      $display("(bounce)");
	      
	   end
	   else  begin
	      btn[selected_btn] <= 0;
	   end
	end
	default: begin
	   state <= IDLE;
	end
      endcase // case (state)
      
   end
   
endmodule
