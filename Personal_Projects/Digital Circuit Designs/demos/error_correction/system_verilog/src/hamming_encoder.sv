module hamming_encoder(u,c);
   
   localparam K=4;
   localparam N=7;

   parameter [K-1:0] G [N-1:0] = '{4'b1000, 
				   4'b0100, 
				   4'b0010, 
				   4'b1110, 
				   4'b0001, 
				   4'b1101, 
				   4'b1011 
				   };
   

   input   [K-1:0] u;
   output  [N-1:0] c;

   multiplier_mod2 #(.COLS(K),.ROWS(N),.H(G)) M1(.v(u),.s(c));
   
endmodule
