 module enc16to4(
  //-----------Output Ports--------------- 
  output [3:0] binary_out  ,
  //-----------Input Ports--------------- 
  input  enable ,
  input [15:0] encoder_in 
 );
  //------------Internal Variables-------- 
  reg [3:0] binary_out ;   
  
  always @ (enable or encoder_in)  
  begin     
    binary_out = 0;     
    if (enable) begin   
        case(encoder_in)  
        16'h0002: begin       
            binary_out = 1;      
            end  
        16'h0004: begin        
            binary_out = 2;       
            end  
        16'h0008: begin        
            binary_out = 3;       
            end  
        16'h0010: begin        
            binary_out = 4;       
            end  
        16'h0020: begin        
            binary_out = 5;       
            end  
        16'h0040: begin        
            binary_out = 6;       
            end  
        16'h0080: begin        
            binary_out = 7;       
            end  
        16'h0100: begin        
            binary_out = 8;       
            end  
        16'h0200: begin        
            binary_out = 9;       
            end 
        16'h0400: begin        
            binary_out = 10;       
            end  
        16'h0800: begin        
            binary_out = 11;       
            end  
        16'h1000: begin     
            binary_out = 12;
            end  
        16'h2000: begin
            binary_out = 13;
            end
        16'h4000: begin
            binary_out = 14;
            end  
        16'h8000: begin
            binary_out = 15;
            end
        default: binary_out = 0;
        endcase
end
  
end
endmodule