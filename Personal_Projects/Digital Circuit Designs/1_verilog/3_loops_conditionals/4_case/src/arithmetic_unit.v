`timescale 1ns/1ps

module arithmetic_unit 
(
   input signed  [3:0] A,
   input signed  [3:0] B,
   input      [1:0] sel, 
   output reg signed [3:0] Q,  
   output reg       overflow
);
wire signed [3:0] check_add;
wire signed [3:0] check_sub;
//signed check inputs have same sign, output has opposite sign  ((A[3]&B[3]&~Q[3])||(~A[3]&~B[3]&Q[3]))
 assign check_add=(A+B);
 assign check_sub=(A-B);
   always @(*) begin
      case (sel)
         2'b00:
           begin
            overflow=0;
            if((A[3] != B[3] || A[3] == check_add[3]) && check_sub != 4'b1000)
            Q <= check_add;
            else begin overflow=1; end 
         /* if ((A[3]&&B[3]&&(~check_add[3]))||((~A[3])&&(~B[3])&&check_add[3]))
          overflow=1;
          else begin overflow=0; Q=check_add; end*/
           end
         2'b01:
           begin
           overflow=0;
            if((A[3] == B[3] || A[3] == check_sub[3] && check_sub != 4'b1000))
            Q<= check_sub;
            else begin overflow=1; end
          /*if ((A[3]&&B[3]&&(~check_sub[3]))||((~A[3])&&(~B[3])&&check_sub[3]))
          overflow=1;
          else begin overflow=0; Q=check_sub; end*/
           end
         2'b10:
           begin
            overflow=0;
            Q=A|B;
           end
         2'b11:
           begin
             overflow=0;
            Q=A&B;
           end
        default: overflow=0;
      endcase
   end
endmodule