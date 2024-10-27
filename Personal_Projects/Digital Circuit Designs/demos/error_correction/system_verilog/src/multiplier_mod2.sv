module multiplier_mod2 
  #(
    parameter COLS = 7,
    parameter ROWS = 3,
    parameter [COLS-1:0] H [ROWS-1:0] =  '{7'b1111000, 7'b1100110,7'b1010101}
    )
   ( 
    input      [COLS-1:0] v,
    output reg [ROWS-1:0] s
     );
   
  
    // Loop index variables:
    reg  [7:0] i;
    reg  [7:0] j;
    
    
    always @(v) begin
        for (j=0; j<ROWS; j=j+1) begin
          s[j] = 0;
          for (i=0; i<COLS; i=i+1) begin
            s[j] = s[j] ^ (H[j][i] & v[i]);
          end
        end
    end
endmodule
