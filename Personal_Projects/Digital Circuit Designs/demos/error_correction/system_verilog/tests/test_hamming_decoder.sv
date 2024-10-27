module test_hamming_decoder();

   reg  [3:0] u;    // User data
   wire [6:0] c;    // Encoded block
   reg  [6:0] e;    // Error pattern
   wire [6:0] v;    // Received block
   wire [2:0] s;   // Error position
   wire [6:0] d;   // Decoded block
   wire [3:0] w;   // Recovered data
   
   integer    i,j;   // Loop index variables
   
   // Encoder and Decoder submodules:
   hamming_decoder D1(.v(v),.d(d),.w(w),.s(s));
   hamming_encoder E1(.u(u),.c(c));

   assign v = c ^ e;
   
   // Test patterns:
   initial begin
      $dumpfile("codec.vcd");
      $dumpvars;
      
      u = 4'b0000;  // Start with all-zero data
      e = 7'd0;     // Start with no errors

    for (j=0; j<16; j=j+1) begin
         
      // Display column headers:
       $display("data\tcodeword\terror   \treceived  \tdetected err \tdecoded \trecovered");
         
      $display("====\t========\t========\t========  \t============ \t======= \t=========");
         
      $strobe("%b\t%b \t%b \t%b  \t   %b      \t%b \t  %b",u,c,e,v,s,d,w);
      
      // Loop through error cases:
      for (i=0; i<7; i=i+1) begin
         #10;          // Time delay before changing signals
	 e    = 0;
         e[i] = 1;     // Inject a single error
	 
         $strobe("%b\t%b \t%b \t%b  \t   %b      \t%b \t  %b",u,c,e,v,s,d,w);
       end   // for (i=0; i<7; i=i+1)

       #10;  // Time delay before changing signals
       
       u = u + 1; // Change the data vector
       e = 0;     // Start with no errors
    end  // for (j=0; j<16; j=j+1)
    $finish;
 end
endmodule // test_hamming_decoder
