`timescale 1ns/1ps

module single_port_ram
  #(
    parameter DATA_WIDTH=8,
    parameter ADDR_WIDTH=8
    )
   (
    input 			clk,
    
    input 			rd,
    input 			wr,
    
    input [ADDR_WIDTH-1:0] 	addr,
    input [DATA_WIDTH-1:0] 	d_in,
    output reg [DATA_WIDTH-1:0] d_out
    );
   
   
   // The Memory array:
   reg [DATA_WIDTH-1:0] 	ram[2**ADDR_WIDTH-1:0];
   
   initial $readmemh("sin_samples.dat", ram);
   
   always @(posedge clk) begin
      if (rd)
	d_out <= ram[addr];
      
      if (wr)
	ram[addr] <= d_in;
      
   end
endmodule
