`timescale 1ns/1ps

module sup_down_counter(clk,a,b,up,dn,rst,q);
input clk;
input signed [7:0] a;
input signed [7:0] b;
input up;
input dn;
input rst;
output reg signed [7:0] q;


initial q=0;
always @(posedge clk) 
begin
   if (rst)
   if(a>127||a<-127)
   q<=0;
   else
     q <= a;
       else 
  begin         
      if (up) 
       begin 
          if(((q+b)>127)||((q+b)<-127)) 
	  q<=q;
         else
	  q <= q + b;
       end
     else if (dn)
     begin
       if(((q-b)<-127)||((q-b)>127))
        q<=q;
       else
         q <= (q - b);
     end 
     else q<=q;
  end 
end

endmodule
