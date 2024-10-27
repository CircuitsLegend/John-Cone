`timescale 1ns/1ps

// ANSI terminal color codes:
`define black  "\033[30m"
`define red    "\033[31m"
`define blue   "\033[34m"
`define green  "\033[32m"
`define white  "\033[37m"

// ANSI terminal background color codes:
`define bgblack  "\033[40m"
`define bgred    "\033[41m"
`define bgblue   "\033[44m"
`define bggreen  "\033[42m"
`define bgwhite  "\033[47m"
`define bgcyan   "\033[46m"
`define bgyellow "\033[46m"


module testbench (

	 );

   reg clk;

   initial begin
      clk = 0;
      forever #10 clk = ~clk;
   end

   integer clk_count;
   initial clk_count = 0;
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count > 200) begin
	 // Things to do at finish
	 $display("%sDone.",`black);
	 
	 $finish;
      end
   end

   wire [2:0] count;
   
   
  
   reg rst;
   reg up;

   up_counter DUT(.clk(clk),.rst(rst),.up(up),.count(count));

   initial rst = 1;
   initial up = 0;

   initial $display("%s%sclk\trst\tup\tup_db\tovf\tcount\tnext_count",`black,`bgcyan);
   
   always @(posedge clk) begin
      if (DUT.up_db == 1)
	$display("%s%s%2d\t%b\t%b\t%b\t%b\t%2d\t%2d",`red,`bgwhite,clk_count,rst,up,DUT.up_db,DUT.overflow,count,DUT.next_count);
      else if (DUT.overflow == 1)
	$display("%s%s%2d\t%b\t%b\t%b\t%b\t%2d\t%2d",`green,`bgwhite,clk_count,rst,up,DUT.up_db,DUT.overflow,count,DUT.next_count);
      else if (up == 1)
	$display("%s%s%2d\t%b\t%b\t%b\t%b\t%2d\t%2d",`blue,`bgwhite,clk_count,rst,up,DUT.up_db,DUT.overflow,count,DUT.next_count);
      else
	$display("%s%s%2d\t%b\t%b\t%b\t%b\t%2d\t%2d",`black,`bgwhite,clk_count,rst,up,DUT.up_db,DUT.overflow,count,DUT.next_count);
      if (clk_count > 0)
	rst <= 0;
      //if ($random() % 5 == 0)
      if ((clk_count % 23 == 0) | (clk_count % 31 == 0))
	up <= ~up;
      
   end
endmodule
