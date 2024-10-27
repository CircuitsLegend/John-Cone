`timescale 1ns/1ps

module instructor_test(
		      );

   reg clk;

   reg 	     success;

   reg [2:0] vals [16:0];

initial begin
   vals[0]=3'b000;
   vals[1]=3'b000;
   vals[2]=3'b000;
   vals[3]=3'b100;
   vals[4]=3'b100;
   vals[5]=3'b100;
   vals[6]=3'b010;
   vals[7]=3'b010;
   vals[8]=3'b010;
   vals[9]=3'b110;
   vals[10]=3'b110;
   vals[11]=3'b111;
   vals[12]=3'b111;
   vals[13]=3'b111;
   vals[14]=3'b111;
   vals[15]=3'b111;
   vals[16]=3'b111;
end

   reg en;
   reg d;
   wire q;

   integer clk_count;
   integer idx;
   
   initial begin
      clk = 0;
      //en  = 1;
      idx = 0;
      
      d   = vals[idx][2];
      en  = vals[idx][1];

      idx = 1;
      
      clk_count = 0;
      success   = 1;
            
      forever #10 clk = ~clk;
   end
   
	 
   top DUT (
		      .clk(clk),
		      .en(en),
		      .d(d),
		      .q(q)
		      );

   always @(posedge clk) begin
      d   <= vals[idx][2];
      en  <= vals[idx][1];

      idx <= idx+1;
      
      /*
      case (clk_count)
	0: begin d <= 0; en <= 0; end
	3: begin if (q !== 0) success <= 0; end
	4: begin d <= 1; en <= 0; end
	7: begin if (q !== 0) success <= 0; end
	8: begin d <= 0; en <= 1; end
	11: begin if (q !== 0) success <= 0; end
	12: begin d <= 1; en <= 1; end
	15: begin if (q !== 1) success <= 0; end	   
      endcase // case (clk_count)
      */

      if (q !== vals[clk_count][0]) begin   
	 $display("\033[31mTEST> ERROR clk_count %3d: en=%b,d=%b,q=%b\033[m",clk_count,en,d,q);
	 success <= 0;
	 $display("\033[31mTEST> FAILED\033[m");
	 //$finish;	 
      end
      else
	 $display("TEST> clk_count %3d: en=%b,d=%b,q=%b",clk_count,en,d,q);	 
   end
   
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count==16) begin
	 // Things to do at finish
	 if (success) begin
	    $display("\033[32mTEST> SUCCESS\033[m");
	 end
	 else begin
	    $display("\033[31mTEST> FAILED\033[m");	    
	 end
	 
	 
	 $finish;
      end
   end

   
endmodule // instructor_test
