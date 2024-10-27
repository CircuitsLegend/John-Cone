`timescale 1ns/1ps

module  testbench (

);
   // Signal declaration for module interface:

   localparam N = 4;
   
   reg 	          rst_n;
   reg [N-1:0]    A;
   reg [N-1:0]    B;
   wire [2*N-1:0] P;
   wire           done;
   


   reg clk;
   initial begin
   clk = 0;forever #10 clk = ~clk;end

   initial begin
      rst_n = 0;
   end 

   // Stopping condition:
   integer clk_count;
   initial clk_count = 0;
   always @(posedge clk) begin
      clk_count <= clk_count + 1; 
      if (clk_count == 32) begin
            // Things to do at finish
            $finish;
      end
   end

   // Stimulus and Console Output:
   initial begin
      A = $random();
      B = $random();
      $display("(clk )    inputs                        i              (partial product)  +  Accumulated Sum");
      $display("------   ------------------------     -------    ----------------------------------------------------------");
      
   end

   
   always @(posedge clk) begin
      rst_n <= 1;
      
      // Create signals
      if (DUT.i == N-1) begin
	 A <= $random();
	 B <= $random();
      end
      
      // Report information:
      if (!done) 
	$display("(%3d:) %b  *  %b  (%3d  *  %3d)   step %d: (%b * %b = %b) + %b  (%d * %d = %d) + %d  |", clk_count, A, B, A, B, DUT.i, DUT.shifted_term, B[DUT.i], DUT.partial_product,P,DUT.shifted_term, B[DUT.i], DUT.partial_product,P);
      else begin
	$display("(%3d:) %b  *  %b  (%3d  *  %3d)   step %d: (%b * %b = %b) + 00000000  (%d * %d = %d) +   0  | P = %d   done", clk_count, A, B, A, B, DUT.i, DUT.shifted_term, B[DUT.i], DUT.partial_product,DUT.shifted_term, B[DUT.i], DUT.partial_product,P);
      $display("------   ------------------------     -------    ----------------------------------------------------------");
      end
      
   end	  

   // Test module declaration:
   mac #(.N(4)) DUT    (
	       .clk(clk),
	       .rst_n(rst_n),
	       .A(A), 	       
	       .B(B),
	       .P(P),
	       .done(done)
	       );
   
endmodule	
