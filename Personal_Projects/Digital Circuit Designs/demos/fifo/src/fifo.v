

module fifo(clk,wr_en,data_in,full, rd_en,data_out,empty);

   input clk;
   input wr_en;
   input rd_en;

   input  [7:0] data_in;
   output [7:0] data_out;
 
   output 	    full;
   output 	    empty;
   
   reg [2:0]   word_count;
   reg [1:0]   wr_pointer;
   reg [1:0]   rd_pointer;

   
   wire        wr = ((word_count < 4) & wr_en);

   assign full  = ( ((word_count == 4) & ~rd_en) | ( (word_count == 3) & wr & !rd_en)    );
   assign empty = ( ((word_count == 0) & ~wr_en) | ( (word_count == 1) & rd_en & !wr) );

  
   ram mem1(.clk(clk),.wadr(wr_pointer),.radr(rd_pointer),.din(data_in),
	    .dout(data_out),.wr(wr));

   initial begin
      word_count = 0;
      wr_pointer = 0;
      rd_pointer = 0;      
   end
   
   always @(posedge clk) begin
      if (wr_en && !rd_en) begin
	 if (word_count < 4) begin
	    word_count <= word_count + 1;
	    wr_pointer <= wr_pointer + 1;	    
	 end
      end
      
      else if (rd_en && !wr_en) begin
	 if (word_count > 0) begin
	    word_count <= word_count - 1;
	    rd_pointer <= rd_pointer + 1;	    
	 end
      end

      else if (wr_en && rd_en) begin
	 rd_pointer <= rd_pointer + 1;
	 wr_pointer <= wr_pointer + 1;	 
      end
   end
   
endmodule
