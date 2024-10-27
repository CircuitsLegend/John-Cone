`timescale 1ns/1ps

module wavetable (
		  input        clk,
		  input        rst_n,
		  input        play, // start(1) or stop(0) signal
		  input [7:0]  note, // note index (0 is low C, increasing up the chromatic scale),
		  input        sync, // get next sample
		  output [7:0] sout
		  );

   // The clock frequency is divided by D so we can generate fractional frequencies.
   // In the western chromatic scale, each note increases the frequency by 6%. With N 
   // as a numerator and D as a denominator we can obtain f_C*N/D.
   //
   // The denominator is implemented using a clock divider.
   // The numerator is implemented by skipping over N positions in the waveform lookup table.
   

   reg [14:0] 		       N;
   reg [14:0] 		       D;

   // Set N and D for the chosen note:
   always @(*) begin
      case (note)
	0: begin N=1;
	   D=1;
 end
	1: begin N=18;
	   D=17;
 end
	2: begin N=9;
	   D=8;
 end
	3: begin N=6;
	   D=5;
 end
	4: begin N=5;
	   D=4;
 end
	5: begin N=4;
	   D=3;
 end
	6: begin N=10;
	   D=7;
 end
	7: begin N=3;
	   D=2;
 end
	8: begin N=8;
	   D=5;
 end
	9: begin N=5;
	   D=3;
 end
	10: begin N=9;
	   D=5;
 end
	11: begin N=19;
	   D=10;
 end
	12: begin N=2;
	   D=1;
 end
	13: begin N=17;
	   D=8;
 end
	14: begin N=9;
	   D=4;
 end
	15: begin N=12;
	   D=5;
 end
	16: begin N=5;
	   D=2;
 end
	17: begin N=8;
	   D=3;
 end
	18: begin N=20;
	   D=7;
 end
	19: begin N=3;
	   D=1;
 end
	20: begin N=16;
	   D=5;
 end
	21: begin N=17;
	   D=5;
 end
	22: begin N=18;
	   D=5;
 end
	23: begin N=23;
	   D=6;
 end
	24: begin N=4;
	   D=1;
 end
	25: begin N=13;
	   D=3;
 end
	26: begin N=9;
	   D=2;
 end
	27: begin N=29;
	   D=6;
 end
	28: begin N=46;
	   D=9;
 end
	29: begin N=38;
	   D=7;
 end
	30: begin N=23;
	   D=4;
 end
	31: begin N=67;
	   D=11;
 end
	32: begin N=13;
	   D=2;
 end
	33: begin N=41;
	   D=6;
 end
	34: begin N=29;
	   D=4;
 end
	35: begin N=23;
	   D=3;
 end
	36: begin N=57;
	   D=7;
 end
	37: begin N=26;
	   D=3;
 end
	38: begin N=55;
	   D=6;
 end
	39: begin N=29;
	   D=3;
 end
	40: begin N=31;
	   D=3;
 end
	41: begin N=109;
	   D=10;
 end
	42: begin N=104;
	   D=9;
 end
	43: begin N=49;
	   D=4;
 end
	44: begin N=13;
	   D=1;
 end
	45: begin N=55;
	   D=4;
 end
	46: begin N=73;
	   D=5;
 end
	47: begin N=31;
	   D=2;
 end
	48: begin N=82;
	   D=5;
 end
default: begin
	   N=1;
	   D=1;
	end
	  
      endcase // case (note)
      
   end

   reg        div_clk;
   reg [14:0] clk_count;
   
   // Clock Divider:
   always @(posedge clk, negedge rst_n) begin
      if (!rst_n) begin
	 // Reset behavior:
	 div_clk <= 0;
	 clk_count <= 0;	 
      end
      else begin
      if ((clk_count >= (D-1)) && (sync))
      div_clk <= 1;
      else div_clk <= 0;
      
      if (sync) begin
	 // Normal behavior:
	 if (clk_count >= D) begin
	    //div_clk <= 1;
	    clk_count <= 0;
	 end
	 else begin
	    clk_count <= clk_count + 1;
	    //div_clk <= 0;
	 end
	 end
      end
   end


   // Address controller:
   reg playing;
   reg [14:0] addr;
   reg [15:0] next_addr;

   always @(*) begin
      next_addr = addr + N;
   end // always @ begin

   initial begin
      playing = 0;
      addr = 0;
   end
   
   always @(posedge clk, negedge rst_n) begin
      if (!rst_n) begin
	 // Reset behavior:
	 playing <= 0;
	 addr    <= 0;	 
      end
      else begin
	 // Normal behavior:
	 if (div_clk) begin
	 if (!playing && play) begin
	    playing <= 1;	    
	 end
	 else if (playing && !play) begin
	    // end the note close to zero:
	    if (next_addr >= 29862) begin
	       addr <= 0;
	       playing <= 0;	       
	    end
	    else
	      addr <= next_addr;
	 end
	 else if (playing && play) begin
	    // rollover:
	    if (next_addr >= 29862) begin
	       addr <= next_addr - 29862;	       
	    end
	    else
	      addr <= next_addr;
	    
	 end
	 end
      end
   end


   // Sample Memory:

   single_port_ram #(.DATA_WIDTH(8), .ADDR_WIDTH(15)) RAM 
     (
      .clk(clk),
      .rd(1'b1),    // always reading
      .wr(1'b0),    // never writing
      .addr(addr),  // sample address
      .d_in(),      // not used
      .d_out(sout)  // output sample
      );
   
							   
   
endmodule
