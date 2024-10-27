module hamming_encoder(u,c);
   
   localparam K=4;  // original data bits
   localparam N=7;  // encoded bits are what will be sent


   input [K-1:0] u;       
   output reg [N-1:0] c;  

   wire [N-1:0]       G[K-1:0];  // Generator matrix


   // Use `assign` statements to define elements of G:
   assign  G[0] = 7'b0000111;
   assign  G[1] = 7'b0011001;
   assign  G[2] = 7'b0101010;
   assign  G[3] = 7'b1001011;


   reg [2:0] 	      i, j;


   always @(u) begin
      for (i=0; i<N; i=i+1) begin
	 c[i] = 0;	 
	 for (j=0; j<K; j=j+1) begin
	    c[i] = c[i] ^ G[j][i] & u[j];	    
	 end
      end      
   end

endmodule
