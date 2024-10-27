`timescale 1ns/1ps

module testbench();

reg clk;
reg [7:0] state;

reg wr;
reg rd;
reg [7:0] addr; 
reg [7:0] d_in;
wire [7:0] d_out;


  // INITIAL SIGNAL CONFIGURATION:
   initial begin
      wr=0;
      rd=0;
      clk = 0;      
   state=0;
   addr=0;
   end

 // GENERATE CLOCK:
   initial forever #10 clk = ~clk;

//INSTANTEATE RAM
single_port_RAM DUT(.clk(clk), .rd(rd), .wr(wr), .addr(addr), .d_in(d_in), .d_out(d_out));

/*
//for all addresses, state machine
always @(posedge clk)
begin
if (addr+1 == 256) begin
	 $finish;
      end 
      else 
begin 
d_in<=$random();
wr<=1;
rd<=0;
#70;
wr<=0;
rd<=1;
#50;
rd<=0;
$write("Address %h\n",addr);
   $write("\t   1: d_in = %d d_out = %d  <-- write then read\n", d_in, d_out);
   #50;
   d_in<=$random();
rd<=1;
wr<=1;
#50;
$write("\t   1: d_in = %d d_out = %d  <-- write/read simultaneously\n", d_in, d_out);
rd<=0;
wr<=0;
#50;
wr<=0;
rd<=1;
#50;
rd<=0;
$write("\t   1: d_in = %d d_out = %d  <-- read\n", d_in, d_out);
#50;
addr<=addr+1;
state<=state+1;
end
end
*/

always @(posedge clk)
begin 
case(state)//each in a seperate clock cycle:
0: begin
d_in<=$random();//Generate a random value for d_in
state<=1;
end
1: begin
rd<=0;//WRITE to the memory (wr <= 1, rd <= 0)
wr<=1;
#70;
state<=2;
end
2: begin
   #70;
wr<=0;//READ from the memory at the same address (wr <= 0, rd <= 1)
#70;
rd<=1;
state<=3;
end
3: begin
$write("Address %h\n",addr);//Log the values of d_in and d_out (using $write)
   $write("\t   1: d_in = %d d_out = %d  <-- write then read\n", d_in, d_out);
   state<=4;
end
4: begin
d_in<=$random();//Generate another random value for d_in
state<=5;
end
5: begin
wr<=1;
rd<=1;//Simultaneously READ and WRITE (wr <= 1, rd <= 1)
state<=6;
end
6: begin
$write("\t   1: d_in = %d d_out = %d  <-- write/read simultaneously\n", d_in, d_out);
//Log the values of d_in and d_out
state<=7;
end
7: begin
wr<=0;
rd<=1;//Do one more READ operation (wr <= 0, rd <= 1)
state<=8;
end
8: begin
$write("\t   1: d_in = %d d_out = %d  <-- read\n", d_in, d_out);
//Log d_in and d_out again
rd<=0;
if (addr==255)
$finish;
else
addr<=addr+1;
state<=0;
end
default: begin
wr<=0;
rd<=0;
state<=0;
end
endcase
end
endmodule