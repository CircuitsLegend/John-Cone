module multiplier_mod2 (v,s);
    localparam BITS = 7;
    localparam ROWS = 3;
   
    input      [BITS-1:0] v;
    output reg [ROWS-1:0] s;
   
    wire [BITS-1:0] H[ROWS-1:0];
    
    // Loop index variables:
    reg  [2:0] i;
    reg  [1:0] j;
    
    // Matrix definition:
   assign   H[0] = 7'b1010101;
   assign   H[1] = 7'b1100110;
   assign   H[2] = 7'b1111000;
    
    always @(v) begin
        for (j=0; j<ROWS; j=j+1) begin
          s[j] = 0;
          for (i=0; i<BITS; i=i+1) begin
            s[j] = s[j] ^ (H[j][i] & v[i]);
          end
        end
    end
endmodule
