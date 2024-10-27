module top(
input clk,
input load,
input [7:0] a,
output reg [3:0] q
);

//Declare top level inputs clk, load, (1 bit), and a (8-bits)
//Declare top level output q (4 bits)
reg [7:0] _a;
wire [3:0] _q;
//Declare an internal 8-bit reg named _a (the underscore (_) distinguishes it as a separate wire from the port a)
//Declare an internal 4-bit wire named _q

//Always assign q <= _q
//if load is 1, then assign _a <= a
always@(posedge clk)
begin 
q<=_q;
if(load)
_a<=a;
end

//Instantate the add_bits module, and name the instance add_bits_instance
add_bits add_bits_instance(.a(_a), .q(_q));

endmodule