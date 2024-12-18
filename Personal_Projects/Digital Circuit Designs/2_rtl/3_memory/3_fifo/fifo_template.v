`timescale 1ns/1ps

module fifo #(
	      parameter WIDTH     = 8,
	      parameter DEPTH     = 5,
	      parameter ADR_WIDTH = 3
	      )
   (
    input 		   clk, 
    
    // Transmit Interface
    input 		   tx_rdy,
    output reg 		   tx_done,
    input [WIDTH-1:0] 	   in_data,
    
    // Receive Interface
    output reg 		   rx_rdy,
    input 		   rx_done,
    output reg [WIDTH-1:0] out_data,
    
    // Indicators
    output reg 		   empty,
    output reg 		   full
    );
   
   reg 			   tx_state;
   reg [1:0] 		   rx_state;
   reg [ADR_WIDTH-1:0] 	   count;
   reg [ADR_WIDTH-1:0] 	   front;
   reg [ADR_WIDTH-1:0] 	   back;

   reg [WIDTH-1:0] 	   buffer [DEPTH-1:0];

reg [ADR_WIDTH-1:0] 	   index            ;
// ... later in the code ...
/*
out_data <= buffer[index];
*/

   reg 			   decr;
   reg 			   incr;
   
   initial begin
incr     = 0;
  decr     = 0;
  front    = 0;
  back     = 0;
  count    = 0;
  empty    = 1;
  full     = 0;
  out_data = 0;
      // TX initialization
tx_state=0;
tx_done=0;
      // RX initialization
rx_state=0;
rx_rdy=0;

      // Buffer initialization
   end


   always @(posedge clk) begin
out_data      <= buffer[back];
      
      //-----------------
      // TX handshaking
      //-----------------
      case (tx_state)
	0: begin
	   if (tx_rdy&&!full)
      begin
      incr<=1;
      tx_done<=1;
      tx_state<=1;
      end
      else
      if (full||!tx_rdy)
      begin
      incr<=0;
      tx_done<=0;
      end
	end
	
	1: begin
	   if (!tx_rdy)
      begin
      tx_done<=0;
      incr<=0;
      tx_state<=0;
      end
      else incr<=0;
	end
      endcase // case (tx_state)
      
      //-----------------
      // RX handshaking
      //-----------------
      case (rx_state)
	0: begin
	   if (!empty)
      begin
rx_rdy<=1;
//out_data<=buffer[back];
rx_state<=1;
      end
      else 
      begin 
         rx_rdy<=0; 
         decr<=0; 
      end
	end
	
	1: begin
	   if (rx_done)
      begin
decr<=1;
rx_state<=2;
rx_rdy <= 0;		
      end
      else rx_rdy<=1;
	end
	
	2: begin
	   if (!rx_done)
      begin
decr<=0;
rx_rdy<=0;
rx_state<=0;
      end
      else decr<=0;
	end
      endcase // case (rx_state)

      //-----------------
      // Buffer manager
      //-----------------

  // Add data
  if (incr && !decr && !full) begin
    buffer[front] <= in_data;
    // Update count, detect full/empty
    count         <= count + 1;
    empty         <= 0;
    if (count == DEPTH-1)
      full <= 1;
    if (front < DEPTH-1) 
      front <= front + 1;
    else
      front <= 0;
  end   
  
  // Remove data
  else if (!incr && decr && !empty) begin
   //out_data <= buffer[back];
    // Update count, detect full/empty
    count    <= count - 1;
    full     <= 0;
    if (count == 1)
      empty <= 1;
    
    if (back < DEPTH-1) 
      back <= back + 1;
    else
      back <= 0;    
  end

// Add and Remove data
  else if (incr && decr) begin
   //out_data      <= buffer[back];
    buffer[front] <=     in_data;
    // No need change count, empty or full status.
    
    if (front < DEPTH-1) 
      front <= front + 1    ;
    else    
      front <= 0;    
    if (back < DEPTH-1) 
      back  <= back + 1;
    else    
      back   <= 0; 
  end   
   end
endmodule // fifo
