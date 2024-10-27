/*
Since our PWM will modulate an 8-bit digital input named din, 
it must support 256 distinct pulse widths, ranging from 0 to 255. 

This means the PWM signal must have a pulse period of 256 clock cycles.

For each period of the PWM signal, 
the output sout should be HIGH during the first din clock cycles, 
and should fall LOW during the remainder of the 255 cycles that comprise the pulse period.

See if you can produce a module, in Verilog, 
with the indicated behavior. Create a testbench to verify your design.
*/
`timescale 1ns/1ps

module pwm(
    input clk,
    input [7:0] din,
    output reg sout
);

reg [7:0] clk_count;

initial 
begin 
    clk_count=0;
    sout<=1;
end

always @(posedge clk)
begin 
    if(din==0)
    sout<=0;
    else if(clk_count<din)
    sout<=1;
    else 
    begin
    sout<=0;
    end

if (clk_count==255)
    clk_count<=0;
    else
    clk_count<=clk_count+1;
    
end
endmodule