`timescale 1ns/1ps

module  testbench (

);

   localparam N = 4;
   
   // Signal declaration for module interface:
   
    reg [N-1:0]    a;
    reg [N-1:0]    b;
    wire [2*N-1:0] p;
    


   reg clk;
   initial begin
   clk = 0;forever #10 clk = ~clk;end

   // Initialize test signals:
   initial begin
      a = $random();
      b = $random();

   end 

   // Stopping condition:
   integer clk_count;
   initial clk_count = 0;
   always @(posedge clk) begin
      clk_count <= clk_count + 1; 
      if (clk_count == 10) begin
            // Things to do at finish
            $finish;
      end
   end

   // Stimulus and Console Output:
   always @(posedge clk) begin
      // Create signals
      a = $random();
      b = $random();
      
      // Report information:
      $strobe("====================================================");
      
      $strobe("clk: %3d  %3d   x   %3d = %6d", clk_count, a, b, p);
      $strobe("      %4b", a);
      $strobe("      %4b", b);
      $strobe("---------");
/*
      $strobe("      %4b", DUT.in_sum0);
      $strobe("      %4b", DUT.shifted_term0);
      $strobe("--------- = %5b",DUT.out_sum0);
      $strobe("     %5b", DUT.in_sum1);
      $strobe("     %5b", DUT.shifted_term1);
      $strobe("--------- = %6b",DUT.out_sum1);//");
      $strobe("    %6b", DUT.in_sum2);
      $strobe("    %6b", DUT.shifted_term2);
      $strobe("--------- = %7b",DUT.out_sum2);//");
      $strobe("   %7b", DUT.in_sum3);
      $strobe("   %7b", DUT.shifted_term3);
      $strobe("--------- = %8b",DUT.out_sum3);//");

/*/      
      $strobe("      %4b", DUT.mult[0].in_sum);
      $strobe("      %4b", DUT.mult[0].partial_product);
      $strobe("--------- = %5b",DUT.mult[0].out_sum);
      $strobe("     %5b", DUT.mult[1].in_sum);
      $strobe("     %5b", DUT.mult[1].shifted_term);
      $strobe("--------- = %6b",DUT.mult[0].out_sum);//");
      $strobe("    %6b", DUT.mult[2].in_sum);
      $strobe("    %6b", DUT.mult[2].shifted_term);
      $strobe("--------- = %7b",DUT.mult[0].out_sum);//");
      $strobe("   %7b", DUT.mult[3].in_sum);
      $strobe("   %7b", DUT.mult[3].shifted_term);
      $strobe("--------- = %8b",DUT.mult[0].out_sum);//");
      
      $strobe("      %8b", p);

   end	  

   // Test module declaration:
   multiplier DUT    (
    .a(a),
    .b(b),
    .p(p)
    );

endmodule	
