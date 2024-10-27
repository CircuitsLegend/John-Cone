// Simple Dual-Port Random Access Memory:
module ram(clk,wadr,radr,dout,din,wr);
   parameter BW=8;
   parameter AW=2;
   parameter DEPTH=4;

   input               clk;   
   input      [AW-1:0] wadr;           // Address input
   input      [AW-1:0] radr;           // Address input
   input               wr;             // Write enable
   input [BW-1:0]      din;            // Input word (for writes)
   output reg [BW-1:0] dout;           // Output word (for reads)

   reg [BW-1:0]        mem[DEPTH-1:0]; // Memory array
   
   always @(posedge clk) begin
      if (wr) begin  
         mem[wadr] <= din;
      end
   end

   always @(radr,wr) begin
      //if (clk)
	dout = mem[radr];      
   end

endmodule
