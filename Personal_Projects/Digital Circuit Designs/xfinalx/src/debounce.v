`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2023 07:41:04 AM
// Design Name: 
// Module Name: debounce
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debounce(
input clk,
input b,
output reg d
    );
    reg [1:0] state = 2'b00;
   
    always @ ( posedge clk ) begin
case ( state )
2'b00 : begin
state <= b==0?2'b00:2'b01;// Next state logic here
d <= 1'b0;// Output logic here
end
2'b01 : begin
state <= b==0?2'b00:2'b11;// Next state logic here
d <= 1'b0;// Output logic here
end
2'b11 : begin
state <= b==0?2'b10:2'b11;// Next state logic here
d <= 1'b0;// Output logic here
end
2'b10 : begin
state <= b==0?2'b00:2'b11;// Next state logic here
d <= 1'b1;// Output logic here
end
endcase
end
    
endmodule
