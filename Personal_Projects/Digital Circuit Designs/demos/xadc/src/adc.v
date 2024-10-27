`timescale 1ns/1ps

module adc (
	    input 	      clk,
	    input 	      rst_n,
	    input 	      vp,
	    input 	      vn,
	    input [1:0]       avg,
	    output reg [15:0] s_out // output sample
	    );

   reg [6:0] 		  daddr;
   reg [15:0] 		  di_drp;
   wire [15:0] 		  do_drp;
   wire [15:0] 		  vauxp_active;
   wire [15:0] 		  vauxn_active;
   reg  		  den_reg;
   reg  		  dwe_reg;

   wire 		  RESET;
   assign RESET = ~rst_n;

   assign vauxp_active[6] = vp;
   assign vauxn_active[6] = vn;

   reg [15:0] 		  control_reg_0;   

   reg [3:0] 		  state;

   localparam INIT  = 0;
   localparam WRITE = 1;
   localparam WAIT  = 2;
   localparam READ  = 3;
   localparam DONE  = 4;
   
   initial begin
      state         = INIT;
      control_reg_0 = 16'h0016;
   end

   
   always @(posedge clk, negedge rst_n) begin     
      if (!rst_n) begin
	 state   <= INIT;	 
	 den_reg <= 1;
	 dwe_reg <= 0;
	 di_drp  <= 16'h0000;
	 daddr   <= 7'h16;
	 s_out <= 0;
	 control_reg_0 = 16'h0016;
      end
      else begin
	 control_reg_0[13:12] <= avg;
	 
	 case (state)
	   INIT: begin
	      //daddr <= 7'h16;
	      daddr <= 7'h40;
	      di_drp <= control_reg_0;
	      
	      den_reg <= 1;
	      dwe_reg <= 1;
      
	      state <= WRITE;	      
	   end
	   WRITE: begin
	      if (drdy) begin
		 dwe_reg <= 0;
		 den_reg <= 0;
		 
		 state   <= WAIT;		 
	      end
      	      
	   end
	   WAIT: begin
	      if (!drdy) begin
		 daddr   <= 7'h16;
		 den_reg <= 1;
		 
		 state   <= READ;
	      end
	   end
	   READ: begin
	      if (drdy) begin
		 den_reg <= 0;
		 s_out <= {4'h0,do_drp[15:4]};
		 state <= DONE;
	      end
	   end
	   DONE: begin
	      if (EOC)
		state <= INIT;
	   end
	   default: begin
	      state <= INIT;
	      
	   end
	 endcase
      end // else: !if(RESET)
   end // always @ (posedge clk, negedge rst_n)
   
      
     
   XADC #(// Initializing the XADC Control Registers
	  .INIT_40(16'h0016),// Select AUX channel 6 (Basys3 header input 1)
	  .INIT_41(16'h3000),// Continuous Single-Channel Mode
	  .INIT_42(16'h6400) // Set DCLK divides	 
	  )
   XADC_INST (// Connect up instance IO. See UG580 for port descriptions
	      .CONVST (1'b0),// not used
	      .CONVSTCLK (1'b0), // not used
	      .DADDR (daddr),
	      .DCLK (clk),
	      .DEN (den_reg),
	      .DI (di_drp),
	      .DWE (dwe_reg),
	      .RESET (RESET),
	      .VAUXN (vauxn_active ),
	      .VAUXP (vauxp_active ),
	      .ALM (ALM),
	      .BUSY (busy),
	      .CHANNEL(CHANNEL),
	      .DO (do_drp),
	      .DRDY (drdy),
	      .EOC (EOC),
	      .EOS (EOS),
	      .JTAGBUSY (),// not used
	      .JTAGLOCKED (),// not used
	      .JTAGMODIFIED (),// not used
	      .OT (OT),
	      .MUXADDR (),// not used
	      .VP (VP),
	      .VN (VN)
	      );
   

endmodule
