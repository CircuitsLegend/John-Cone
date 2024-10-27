`timescale 1ns/1ps

module race_observer
(
input clk, 
input rst, 
input start,
output reg done
);
/*
Behavior:
When !rst_l, done goes LOW
When !start, done goes LOW
When start, done goes HIGH after a random delay.
*/
   reg [1:0] state;
   wire t;
   random_timer rt1 (.clk(clk), .t(t));

always @(posedge clk, negedge rst)
begin

   if (!rst) begin
         state <= 2'b00;
         done<=0;
      end
      // NORMAL (NON-RESET) BEHAVIOR:
      else begin
         case (state)
            2'b00: if (start) begin state<=2'b01; end
            2'b01: if (t) begin done<=1; state<=2'b10; end
            2'b10: begin done<=0; state<=2'b00; end
            default: 
            begin
             done<=0;
             state <= 2'b00;
            end
         endcase
      end
end


//FSM

endmodule