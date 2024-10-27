`timescale 1ns/1ps
module testbench();

reg clk;
reg clk_count;
reg rd;
reg [7:0] d_in;
wire [7:0] d_out;
reg [7:0] addr;
real      sin_x, sin_y;

  // INITIAL SIGNAL CONFIGURATION:
   initial begin
      clk = 0;      
      clk_count=0;
      rd=1;
   end

    integer fid;
   initial fid = $fopen("test_result.txt", "w");

 // GENERATE CLOCK:
   initial forever #10 clk = ~clk;


// Get a new random addr every clk cycle:
always @(posedge clk) begin
   addr = $random();
    if(clk_count==15)
   begin
 $fclose(fid);
	 $finish;
   end
   else clk_count<=clk_count+1;
end

//DUT MODULE
sin_table #(.DATA_WIDTH(8), .ADDR_WIDTH(8)) DUT(.clk(clk), .rd(rd), .d_in(d_in), .d_out(d_out), .addr(addr));

// When dout changes, display it:
always @(d_out) begin
   sin_x = addr/255.0;
   sin_y = d_out/255.0;
   $write("addr %3d  dout %3d: sin(%1.3f)=%1.3f, should be %1.3f",addr,d_out,sin_x, sin_y, $sin(3.14159*sin_x/2));
   $fwrite(fid,"addr %3d  dout %3d: sin(%1.3f)=%1.3f, should be %1.3f",addr,d_out,sin_x, sin_y, $sin(3.14159*sin_x/2));
   if(clk_count==15)
   $finish;
end
endmodule