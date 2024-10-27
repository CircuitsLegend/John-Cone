`timescale 1ns / 1ps

module dim_leds #(
		  parameter N=500_000
		  )
   (
    input [15:0] brightness,
    input 	  sys_clk,
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
    
     
    // Instantiate the PWM IP:
    pwm PWM1(
        .clk(sys_clk),
	    .rst_n(1'b1),
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
    always @(posedge sys_clk) begin
        if (count >= N) begin
            count <= 0;
            div_clk <= ~div_clk;
        end
        else 
            count <= count + 1;
    end
    
    // Main brighten/dim process:
    always @(posedge div_clk) begin
        // Adjust the PWM brightness level     this is where assigning din to be brightness
       din <= brightness/2;

       /* if (count_up)
           din <= din + 1;
        else
           din <= din - 1;       
           */
           
       // If we've reach maximum brightness, 
       // start dimming. If we've reached minimum
       // brightness, start brightening

       //change for extra motion detection aka if max do something and if min do something
       if (/*(count_up)&&*/(din == 254)) 
         // count_up <= 0;       
         //BEHAVIOR-HERE     
         din<=din;
          din<=din;
           din<=din;
            din<=din;
             din<=din;
       else if (/*(~count_up)&&*/(din==1))
         // count_up <= 1;
            //BEHAVIOR-HERE   
        din<=din;
          din<=din;
           din<=din;
            din<=din;
             din<=din;
    end
endmodule
