`timescale 1ns / 1ps

module dim_leds #(
		  parameter N=500_000
		  )
   (
    input 	  clk,
    input rst_l,
    output [15:0] LED
    );
   
    // PWM signals
    reg [7:0] din;
    wire      sout;

    // Signals for clock divider:
    integer   count;
    reg       div_clk;
 
    // State variable:
    reg       count_up; // brighten (1) or dim (0)
   
    // Assign all LEDs to equal the PWM signal
    assign LED = {16{sout}};
    //assign LED = ({16{sout}}&rst_l); //works but no audio?!?
    //mux mux1(.i({{16{sout}},16'b0000000000000000}), .sel(rst_l), .o(LED)); doesnt work
    
     
    // Instantiate the PWM IP:
    pwm PWM1( 
        .clk(clk),
	   .rst_n(rst_l),
        .din(din),
        .sout(sout)
     );
           
    // Initialize reg signals
    initial begin
        din      = 0;
        count    = 0;
        count_up = 1;
        div_clk  = 0;
    end
    
    // Implement a clock divider:
    always @(posedge clk, negedge rst_l) begin
        if(!rst_l)
        count<=count;
        else 
        begin
        if (count >= N) begin
            count <= 0;
            div_clk <= ~div_clk;
        end
        else 
            count <= count + 1;
    end
    end
    
    // Main brighten/dim process:
    always @(posedge div_clk, negedge rst_l) begin
       if(!rst_l)
       din<=din;
       else begin
        // Adjust the PWM brightness level
        if (count_up)
           din <= din + 1;
        else
           din <= din - 1;       
           
       // If we've reach maximum brightness, 
       // start dimming. If we've reached minimum
       // brightness, start brightening
       if ((count_up)&&(din == 254)) 
          count_up <= 0;            
       else if ((~count_up)&&(din==1))
          count_up <= 1;
            
       end
    end
endmodule
