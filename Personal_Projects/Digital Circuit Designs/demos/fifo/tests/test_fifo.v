module testbench();

   reg clk;
   reg [7:0] data_in;
   reg       wr_en;
   reg       rd_en;
   reg [7:0]      dout_dly;
   reg [7:0]      din_dly;
   reg 		  rd_dly;
   reg            wr_dly;
   reg            full_dly;
   reg            empty_dly;
   
   
   wire [7:0] data_out;
   wire       full;
   wire       empty;

   integer    clk_count;
   integer    seed;

   integer    read_file;
   integer    write_file;
   
   
   fifo DUT(.clk(clk),
	    .data_in(data_in),
	    .data_out(data_out),
	    .full(full),
	    .empty(empty),
	    .wr_en(wr_en),
	    .rd_en(rd_en)
	    );

   initial begin
      clk = 0;
      clk_count = 0;
      seed = 1234;

      $dumpfile("fifo.vcd");
      $dumpvars;
      
      read_file  = $fopen("data_read.txt" ,"w");
      write_file = $fopen("data_write.txt","w");
      
      forever #10 clk = ~clk;
      
   end

   always @(posedge clk) begin
      data_in  <= $random(seed);
      wr_en    <= $random(seed) & ~full;
      rd_en    <= $random(seed) & ~empty;
      
      dout_dly <= data_out;
      din_dly  <= data_in;
      rd_dly   <= rd_en;
      wr_dly   <= wr_en;
      full_dly <= full;
      empty_dly <= empty;
      
      
      if (clk_count == 100) begin
	 $fclose(read_file);
	 $fclose(write_file);
	 $finish;
      end
      else
	clk_count <= clk_count + 1;

   end

   integer idx;
   
   always @(negedge clk) begin
      if (wr_en) begin
	 $display("Clk %3d: Writing %x", clk_count, data_in);
	 $fwrite(write_file,"%x\n",data_in);
      end
      if (rd_en) begin
	$display("Clk %3d: Reading %x", clk_count, data_out);
	 $fwrite(read_file,"%x\n",data_out);
      end
      if (wr_en | rd_en) begin
	 $display("Clk %3d: FIFO has %d words. Full: %b, Empty: %b\twr_ptr:%d, rd_ptr:%d",clk_count,DUT.word_count,full,empty,DUT.wr_pointer,DUT.rd_pointer);
	 $display("FIFO Contents:");
	 for (idx=0; idx<4; idx=idx+1) begin
	    $write("%x",DUT.mem1.mem[idx]);
	    if (DUT.wr_pointer == idx)
	      $write(" <--w");
	    if (DUT.rd_pointer == idx)
	      $write(" <--r");
	    $write("\n");
	    
	 end
	 $display("--------------------");
	 
      end
      
   end
endmodule
