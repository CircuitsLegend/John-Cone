module hamming_decoder(v,d,w,s);
   localparam N = 7;  // Number of encoded bits
   localparam K = 4;  // Number of data bits
   localparam R = 3;  // Bits for the error position
   
   input      [N-1:0] v;  // Received bits input
   output reg [N-1:0] d;  // Corrected bits output
   output reg [K-1:0] w;  // Recovered data output
   output     [R-1:0] s;  // Error position

   // Use the matrix multiplier we defined previously:
   multiplier_mod2 MULT1(.v(v),.s(s));

   always @(v,s) begin
       d = v;
    
      // If an error is detected, flip the bad bit:
      if (s != 3'b000)
        d[s-1] = ~d[s-1];
      else
        d[s-1] = d[s-1];
        
      // Extract the data bits:
      w = {d[6:4],d[2]};
   end
endmodule // hamming_decoder
