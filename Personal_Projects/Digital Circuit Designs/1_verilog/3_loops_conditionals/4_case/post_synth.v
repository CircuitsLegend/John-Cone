// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Fri Feb  9 09:25:55 2024
// Host        : genesys.bluezone.usu.edu running 64-bit unknown
// Command     : write_verilog -force post_synth.v
// Design      : arithmetic_unit
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* STRUCTURAL_NETLIST = "yes" *)
module arithmetic_unit
   (A,
    B,
    sel,
    Q,
    overflow);
  input [3:0]A;
  input [3:0]B;
  input [1:0]sel;
  output [3:0]Q;
  output overflow;

  wire [3:0]A;
  wire [3:0]A_IBUF;
  wire [3:0]B;
  wire [3:0]B_IBUF;
  wire GND_1;
  wire [3:0]Q;
  wire [3:0]Q_OBUF;
  wire \Q_reg[0]_i_1_n_0 ;
  wire \Q_reg[1]_i_1_n_0 ;
  wire \Q_reg[2]_i_1_n_0 ;
  wire \Q_reg[2]_i_2_n_0 ;
  wire \Q_reg[2]_i_3_n_0 ;
  wire \Q_reg[3]_i_1_n_0 ;
  wire \Q_reg[3]_i_2_n_0 ;
  wire \Q_reg[3]_i_3_n_0 ;
  wire VCC_1;
  wire overflow;
  wire overflow_OBUF;
  wire overflow_OBUF_inst_i_2_n_0;
  wire overflow_OBUF_inst_i_3_n_0;
  wire overflow_OBUF_inst_i_4_n_0;
  wire overflow_OBUF_inst_i_5_n_0;
  wire overflow_OBUF_inst_i_6_n_0;
  wire [1:0]sel;
  wire [1:0]sel_IBUF;

  IBUF \A_IBUF[0]_inst 
       (.I(A[0]),
        .O(A_IBUF[0]));
  IBUF \A_IBUF[1]_inst 
       (.I(A[1]),
        .O(A_IBUF[1]));
  IBUF \A_IBUF[2]_inst 
       (.I(A[2]),
        .O(A_IBUF[2]));
  IBUF \A_IBUF[3]_inst 
       (.I(A[3]),
        .O(A_IBUF[3]));
  IBUF \B_IBUF[0]_inst 
       (.I(B[0]),
        .O(B_IBUF[0]));
  IBUF \B_IBUF[1]_inst 
       (.I(B[1]),
        .O(B_IBUF[1]));
  IBUF \B_IBUF[2]_inst 
       (.I(B[2]),
        .O(B_IBUF[2]));
  IBUF \B_IBUF[3]_inst 
       (.I(B[3]),
        .O(B_IBUF[3]));
  GND GND
       (.G(GND_1));
  OBUF \Q_OBUF[0]_inst 
       (.I(Q_OBUF[0]),
        .O(Q[0]));
  OBUF \Q_OBUF[1]_inst 
       (.I(Q_OBUF[1]),
        .O(Q[1]));
  OBUF \Q_OBUF[2]_inst 
       (.I(Q_OBUF[2]),
        .O(Q[2]));
  OBUF \Q_OBUF[3]_inst 
       (.I(Q_OBUF[3]),
        .O(Q[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.CLR(GND_1),
        .D(\Q_reg[0]_i_1_n_0 ),
        .G(\Q_reg[3]_i_2_n_0 ),
        .GE(VCC_1),
        .Q(Q_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hC770)) 
    \Q_reg[0]_i_1 
       (.I0(sel_IBUF[0]),
        .I1(sel_IBUF[1]),
        .I2(B_IBUF[0]),
        .I3(A_IBUF[0]),
        .O(\Q_reg[0]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.CLR(GND_1),
        .D(\Q_reg[1]_i_1_n_0 ),
        .G(\Q_reg[3]_i_2_n_0 ),
        .GE(VCC_1),
        .Q(Q_OBUF[1]));
  LUT6 #(
    .INIT(64'hB661E334A770A770)) 
    \Q_reg[1]_i_1 
       (.I0(sel_IBUF[1]),
        .I1(sel_IBUF[0]),
        .I2(B_IBUF[1]),
        .I3(A_IBUF[1]),
        .I4(A_IBUF[0]),
        .I5(B_IBUF[0]),
        .O(\Q_reg[1]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.CLR(GND_1),
        .D(\Q_reg[2]_i_1_n_0 ),
        .G(\Q_reg[3]_i_2_n_0 ),
        .GE(VCC_1),
        .Q(Q_OBUF[2]));
  LUT6 #(
    .INIT(64'hFCF50CFA0CFA0C05)) 
    \Q_reg[2]_i_1 
       (.I0(\Q_reg[2]_i_2_n_0 ),
        .I1(\Q_reg[2]_i_3_n_0 ),
        .I2(sel_IBUF[1]),
        .I3(sel_IBUF[0]),
        .I4(B_IBUF[2]),
        .I5(A_IBUF[2]),
        .O(\Q_reg[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h077F)) 
    \Q_reg[2]_i_2 
       (.I0(B_IBUF[0]),
        .I1(A_IBUF[0]),
        .I2(B_IBUF[1]),
        .I3(A_IBUF[1]),
        .O(\Q_reg[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h44D4BB2BBB2B44D4)) 
    \Q_reg[2]_i_3 
       (.I0(A_IBUF[1]),
        .I1(B_IBUF[1]),
        .I2(B_IBUF[0]),
        .I3(A_IBUF[0]),
        .I4(B_IBUF[2]),
        .I5(A_IBUF[2]),
        .O(\Q_reg[2]_i_3_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.CLR(GND_1),
        .D(\Q_reg[3]_i_1_n_0 ),
        .G(\Q_reg[3]_i_2_n_0 ),
        .GE(VCC_1),
        .Q(Q_OBUF[3]));
  LUT6 #(
    .INIT(64'hF7383807F43B3B04)) 
    \Q_reg[3]_i_1 
       (.I0(overflow_OBUF_inst_i_3_n_0),
        .I1(sel_IBUF[0]),
        .I2(sel_IBUF[1]),
        .I3(B_IBUF[3]),
        .I4(A_IBUF[3]),
        .I5(\Q_reg[3]_i_3_n_0 ),
        .O(\Q_reg[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA0AA8A0AAAAAAAAA)) 
    \Q_reg[3]_i_2 
       (.I0(overflow_OBUF_inst_i_5_n_0),
        .I1(overflow_OBUF_inst_i_4_n_0),
        .I2(A_IBUF[3]),
        .I3(overflow_OBUF_inst_i_3_n_0),
        .I4(B_IBUF[3]),
        .I5(overflow_OBUF_inst_i_2_n_0),
        .O(\Q_reg[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF880F8800000)) 
    \Q_reg[3]_i_3 
       (.I0(B_IBUF[0]),
        .I1(A_IBUF[0]),
        .I2(B_IBUF[1]),
        .I3(A_IBUF[1]),
        .I4(B_IBUF[2]),
        .I5(A_IBUF[2]),
        .O(\Q_reg[3]_i_3_n_0 ));
  VCC VCC
       (.P(VCC_1));
  OBUF overflow_OBUF_inst
       (.I(overflow_OBUF),
        .O(overflow));
  LUT6 #(
    .INIT(64'h02802280FFFFFFFF)) 
    overflow_OBUF_inst_i_1
       (.I0(overflow_OBUF_inst_i_2_n_0),
        .I1(B_IBUF[3]),
        .I2(overflow_OBUF_inst_i_3_n_0),
        .I3(A_IBUF[3]),
        .I4(overflow_OBUF_inst_i_4_n_0),
        .I5(overflow_OBUF_inst_i_5_n_0),
        .O(overflow_OBUF));
  LUT2 #(
    .INIT(4'h2)) 
    overflow_OBUF_inst_i_2
       (.I0(sel_IBUF[0]),
        .I1(sel_IBUF[1]),
        .O(overflow_OBUF_inst_i_2_n_0));
  LUT6 #(
    .INIT(64'hBF0BFFFF0000BF0B)) 
    overflow_OBUF_inst_i_3
       (.I0(A_IBUF[0]),
        .I1(B_IBUF[0]),
        .I2(B_IBUF[1]),
        .I3(A_IBUF[1]),
        .I4(B_IBUF[2]),
        .I5(A_IBUF[2]),
        .O(overflow_OBUF_inst_i_3_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    overflow_OBUF_inst_i_4
       (.I0(A_IBUF[2]),
        .I1(B_IBUF[2]),
        .I2(B_IBUF[0]),
        .I3(A_IBUF[0]),
        .I4(B_IBUF[1]),
        .I5(A_IBUF[1]),
        .O(overflow_OBUF_inst_i_4_n_0));
  LUT6 #(
    .INIT(64'hFC943F16FFFFFFFF)) 
    overflow_OBUF_inst_i_5
       (.I0(overflow_OBUF_inst_i_3_n_0),
        .I1(B_IBUF[3]),
        .I2(A_IBUF[3]),
        .I3(overflow_OBUF_inst_i_4_n_0),
        .I4(\Q_reg[3]_i_3_n_0 ),
        .I5(overflow_OBUF_inst_i_6_n_0),
        .O(overflow_OBUF_inst_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h1)) 
    overflow_OBUF_inst_i_6
       (.I0(sel_IBUF[0]),
        .I1(sel_IBUF[1]),
        .O(overflow_OBUF_inst_i_6_n_0));
  IBUF \sel_IBUF[0]_inst 
       (.I(sel[0]),
        .O(sel_IBUF[0]));
  IBUF \sel_IBUF[1]_inst 
       (.I(sel[1]),
        .O(sel_IBUF[1]));
endmodule
