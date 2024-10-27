`timescale 1ns/1ps

module ALU #(parameter  N=8;)
(
//GENERAL
input clr,
input clk,
//KEYPAD
input  [3:0]  row,
output [3:0]  col,
//ALU
output [(2*N)-1:0] Q
);

//KEYPAD
  wire       rst_l;
   assign rst_l = ~clr;
   wire [15:0] keys;

   keypad #(.N(300_000)) kypd
     (
      .clk(clk),
      .rst_l(rst_l),
      .row(row),
      .col(col),
      .keys(keys)
      );

//ENCODER
wire [3:0] binary_out;

      enc16to4 encode
        (
        .binary_out(binary_out), 
        .enable(rst_l), 
        .encoder_in(keys)
        );

//OLED
oled_demo oled
    (
    .clk(clk),
    .rst(0),
    .showchar(),
    .showbmp(),
    .clear(),
    .sw(),   input [15:0] sw,
    .ready(),   output 	ready,	   
		   // OLED header signals:
    .cs_n(),   output 	cs_n,
    .sdo(),   output 	sdo,
    .sclk(),   output 	sclk,
    .dc(),   output 	dc,
    .vbat(),   output 	vbat,
    .vdd(),   output 	vdd,
    .res()   output 	res
   );

//ALU
reg [N-1:0] A;
reg [N-1:0] B;

localparam CLEAR =0;
localparam ADD =1;
localparam SUBTRACT =2;
localparam MULTIPLY =3;
localparam DIVIDE =4;
//localparam SIN =5;
localparam EQUALS =6;

reg [2:0] STATE;

initial begin
STATE<=CLEAR;
A<=0;
B<=0;
end

always @(posedge clk, posedge clr) begin
if (clr) begin
Q<=0;
A<=0;
B<=0;
STATE<=CLEAR;
//DISPLAY Q ON SCREEN OLED

end
else
case(STATE)
CLEAR:begin
case (binary_out)

4'b1010: STATE<=ADD;

4'b1011: STATE<=SUBTRACT;

4'b1100: STATE<=MULTIPLY;

4'b1101: STATE<=DIVIDE;

//4'b1110: STATE<=SIN;

4'b1111: begin
    Q<=A;
STATE<=EQUALS;
end

default: begin
    if (A+binary_out>8'b11111111)
    A<=A;
    else
    A <= A + binary_out; //maybe debounce for clock cycles
    //OUTPUT A TO OLED
     STATE<=CLEAR;
end
endcase
end

ADD:begin
    if (binary_out==4'b1111) begin
        if(A+B>16'b1111111111111111)
           Q<=16'b1111111111111111;
        else
           Q<=A+B;
    STATE<=EQUALS;
    end
    else if (binary_out<10)
    begin
        if (B+binary_out>8'b11111111)
            B<=B;
        else B <= B + binary_out;
        //OUTPUT B TO OLED
            STATE<=ADD;
    end
    else STATE<=ADD;
end

SUBTRACT:begin
  if (binary_out==4'b1111) begin
        if(A<B)
           Q<=16'b1111111111111111;
        else
           Q<=A-B;
    STATE<=EQUALS;
    end
    else if (binary_out<10)
    begin
        if (B+binary_out>8'b11111111)
            B<=B;
        else B <= B + binary_out;
        //OUTPUT B TO OLED
            STATE<=SUBTRACT;
    end
    else STATE<=SUBTRACT;
end

MULTIPLY:begin
  if (binary_out==4'b1111) begin
        if(A*B>16'b1111111111111111)
           Q<=16'b1111111111111111;
        else
           Q<=A*B;
    STATE<=EQUALS;
    end
    else if (binary_out<10)
    begin
        if (B+binary_out>8'b11111111)
            B<=B;
        else B <= B + binary_out;
        //OUTPUT B TO OLED
            STATE<=MULTIPLY;
    end
    else STATE<=MULTIPLY;
end

DIVIDE:begin
  if (binary_out==4'b1111) begin
        if(b==0)
           Q<=16'b1111111111111111;
        else
           Q<=A/B;
    STATE<=EQUALS;
    end
    else if (binary_out<10)
    begin
        if (B+binary_out>8'b11111111)
            B<=B;
        else B <= B + binary_out;
        //OUTPUT B TO OLED
            STATE<=DIVIDE;
    end
    else STATE<=DIVIDE;
end
/*
SIN:begin
  if (binary_out==4'b1111) begin
        if(A*sin(B)???)
           Q<=16'b1111111111111111;
        else
         //  Q<=A*sin(B);?????
    STATE<=EQUALS;
    end
    else if (binary_out<10)
    begin
        if (B+binary_out>8'b11111111)
            B<=B;
        else B <= B + binary_out;
        //OUTPUT B TO OLED
            STATE<=ADD;
    end
    else STATE<=ADD;
end
*/
EQUALS:begin
    //DISPLAY Q ON OLED
end

default:begin
STATE<=CLEAR;
end
endcase
end
endmodule