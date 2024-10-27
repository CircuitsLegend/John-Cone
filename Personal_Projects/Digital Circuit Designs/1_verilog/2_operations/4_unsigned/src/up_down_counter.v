`timescale 1ns/1ps

module up_down_counter(clk,a,b,up,dn,rst,q);
input clk;
input [7:0] a;
input [7:0] b;
input up;
input dn;
input rst;
output reg [7:0] q;


initial q=0;
always @(posedge clk) 
begin
   if (rst)
     q <= a;
       else 
  begin         
      if (up) 
       begin 
          if((q+b)>255) 
	  q<=q;
         else
	  q <= q + b;
       end
     else if (dn)
     begin
       if((q-b)<0)
        q<=q;
       else
         q <= q - b;
     end 
     else q<=q;
  end 
end

endmodule
