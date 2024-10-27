`timescale 1ns/1ps

module testbench ();
   
   // DECLARE SIGNALS
   reg  clk;
   reg 	rst_l;
   
   wire send;
   wire busy;
   wire ready;
   wire ack;
   wire cs;
   wire sdata;
   
   wire [7:0] producer_pdata;
   wire [7:0] consumer_pdata;
   
   integer clk_count = 0;   

   producer #(.N(8)) producer_instance
   (
    .clk(clk),
    .rst_l(rst_l), 
    .busy(busy),
    .send(send),
    .pdata(producer_pdata)
    );
   
   P2S #(.N(8)) P2S_instance
  (
    .clk(clk), 
    .rst_l(rst_l),
    .pdata(producer_pdata),
    .send(send),
    .busy(busy),
    .cs(cs), 
    .sdata(sdata)
  );

   S2P #(.N(8)) S2P_instance
   (
    .clk(clk), 
    .rst_l(rst_l),
    .pdata(consumer_pdata),
    .ready(ready),
    .ack(ack),
    .cs(cs), 
    .sdata(sdata)
  );
   
   consumer #(.N(8)) consumer_instance
   (
    .clk(clk),
    .rst_l(rst_l), 
    .ready(ready),
    .ack(ack),
    .pdata(consumer_pdata)
    );
   
   
   // INITIAL SIGNAL CONFIGURATION:
   initial begin
      clk   = 0;
      rst_l = 0;  // start up in reset condition
   end

   // GENERATE CLOCK:
   initial forever #10 clk = ~clk;
   

   // CREATE STIMULI:
   always @(posedge clk) begin
      // Control the reset behavior:
      if (!rst_l) begin
	 rst_l <= 1;
      end
   end

   

   

   // WRITE OUTPUT TO CONSOLE:
   integer fid;
   initial fid = $fopen("test_result.txt", "w");
   
   always @(posedge clk) begin
      $write("clk: %3d", clk_count);      
      $write(" send:  %b", send);
      $write(" busy:  %b", busy);
      $write(" cs:    %b", cs);
      $write(" sdata: %b", sdata);
      $write(" ready:  %b", ready);
      $write(" ack:  %b", ack);
      $write(" S2P[state %1d, bit_index %1d]", S2P_instance.state, S2P_instance.bit_index);
      $write("\n");
      
      $fwrite(fid,"clk: %3d", clk_count);      
      $fwrite(fid," send:  %b", send);
      $fwrite(fid," busy:  %b", busy);
      $fwrite(fid," cs:    %b", cs);
      $fwrite(fid," sdata: %b", sdata);
      $fwrite(fid," ready:  %b", ready);
      $fwrite(fid," ack:  %b", ack);
      $fwrite(fid," S2P[state %1d, bit_index %1d]", S2P_instance.state, S2P_instance.bit_index);
      $fwrite(fid,"\n");
   end

   // DEFINE WHEN TO TERMINATE SIMULATION:
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 200) begin
	 $fclose(fid);
	 $finish;
      end
   end

   
endmodule // testbench
