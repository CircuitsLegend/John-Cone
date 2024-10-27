`timescale 1ns/1ps

module bitwise_operations(clk,a,b,op,q);

	input clk;
	input [6:0] a;
	input [6:0] b;
	input [1:0] op;
	output reg [6:0] q;

always @(posedge clk) begin
	case(op)
0: begin 
	q<=a&b;
end
1: begin 
	q<=a|b;
end
2: begin
	q<=a^b;
end
3: begin
       	q<=a|(~b); 
end

endcase
end

endmodule
