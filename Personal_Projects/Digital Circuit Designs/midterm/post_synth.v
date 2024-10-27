// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Fri Mar 15 12:33:53 2024
// Host        : genesys.bluezone.usu.edu running 64-bit unknown
// Command     : write_verilog -force post_synth.v
// Design      : top
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module clock_divider
   (scan,
    E,
    clk_IBUF_BUFG,
    onled,
    \keys_reg[0] ,
    \keys_reg[2] ,
    \keys_reg[3] ,
    col1);
  output scan;
  output [3:0]E;
  input clk_IBUF_BUFG;
  input onled;
  input \keys_reg[0] ;
  input \keys_reg[2] ;
  input \keys_reg[3] ;
  input col1;

  wire \<const0> ;
  wire \<const1> ;
  wire [3:0]E;
  wire clk_IBUF_BUFG;
  wire [31:0]clk_count;
  wire clk_count0_carry__0_n_0;
  wire clk_count0_carry__0_n_1;
  wire clk_count0_carry__0_n_2;
  wire clk_count0_carry__0_n_3;
  wire clk_count0_carry__1_n_0;
  wire clk_count0_carry__1_n_1;
  wire clk_count0_carry__1_n_2;
  wire clk_count0_carry__1_n_3;
  wire clk_count0_carry__2_n_0;
  wire clk_count0_carry__2_n_1;
  wire clk_count0_carry__2_n_2;
  wire clk_count0_carry__2_n_3;
  wire clk_count0_carry__3_n_0;
  wire clk_count0_carry__3_n_1;
  wire clk_count0_carry__3_n_2;
  wire clk_count0_carry__3_n_3;
  wire clk_count0_carry__4_n_0;
  wire clk_count0_carry__4_n_1;
  wire clk_count0_carry__4_n_2;
  wire clk_count0_carry__4_n_3;
  wire clk_count0_carry__5_n_0;
  wire clk_count0_carry__5_n_1;
  wire clk_count0_carry__5_n_2;
  wire clk_count0_carry__5_n_3;
  wire clk_count0_carry__6_n_2;
  wire clk_count0_carry__6_n_3;
  wire clk_count0_carry_n_0;
  wire clk_count0_carry_n_1;
  wire clk_count0_carry_n_2;
  wire clk_count0_carry_n_3;
  wire \clk_count[31]_i_2_n_0 ;
  wire \clk_count[31]_i_3_n_0 ;
  wire \clk_count[31]_i_4_n_0 ;
  wire \clk_count[31]_i_5_n_0 ;
  wire \clk_count[31]_i_6_n_0 ;
  wire \clk_count[31]_i_7_n_0 ;
  wire \clk_count[31]_i_8_n_0 ;
  wire \clk_count[31]_i_9_n_0 ;
  wire [31:0]clk_count_0;
  wire col1;
  wire [31:1]data0;
  wire div_clk;
  wire \keys_reg[0] ;
  wire \keys_reg[2] ;
  wire \keys_reg[3] ;
  wire onled;
  wire scan;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 clk_count0_carry
       (.CI(\<const0> ),
        .CO({clk_count0_carry_n_0,clk_count0_carry_n_1,clk_count0_carry_n_2,clk_count0_carry_n_3}),
        .CYINIT(clk_count[0]),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[4:1]),
        .S(clk_count[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 clk_count0_carry__0
       (.CI(clk_count0_carry_n_0),
        .CO({clk_count0_carry__0_n_0,clk_count0_carry__0_n_1,clk_count0_carry__0_n_2,clk_count0_carry__0_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[8:5]),
        .S(clk_count[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 clk_count0_carry__1
       (.CI(clk_count0_carry__0_n_0),
        .CO({clk_count0_carry__1_n_0,clk_count0_carry__1_n_1,clk_count0_carry__1_n_2,clk_count0_carry__1_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[12:9]),
        .S(clk_count[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 clk_count0_carry__2
       (.CI(clk_count0_carry__1_n_0),
        .CO({clk_count0_carry__2_n_0,clk_count0_carry__2_n_1,clk_count0_carry__2_n_2,clk_count0_carry__2_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[16:13]),
        .S(clk_count[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 clk_count0_carry__3
       (.CI(clk_count0_carry__2_n_0),
        .CO({clk_count0_carry__3_n_0,clk_count0_carry__3_n_1,clk_count0_carry__3_n_2,clk_count0_carry__3_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[20:17]),
        .S(clk_count[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 clk_count0_carry__4
       (.CI(clk_count0_carry__3_n_0),
        .CO({clk_count0_carry__4_n_0,clk_count0_carry__4_n_1,clk_count0_carry__4_n_2,clk_count0_carry__4_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[24:21]),
        .S(clk_count[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 clk_count0_carry__5
       (.CI(clk_count0_carry__4_n_0),
        .CO({clk_count0_carry__5_n_0,clk_count0_carry__5_n_1,clk_count0_carry__5_n_2,clk_count0_carry__5_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[28:25]),
        .S(clk_count[28:25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 clk_count0_carry__6
       (.CI(clk_count0_carry__5_n_0),
        .CO({clk_count0_carry__6_n_2,clk_count0_carry__6_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[31:29]),
        .S({\<const0> ,clk_count[31:29]}));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h00FE)) 
    \clk_count[0]_i_1__0 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .O(clk_count_0[0]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[10]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[10]),
        .O(clk_count_0[10]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[11]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[11]),
        .O(clk_count_0[11]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[12]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[12]),
        .O(clk_count_0[12]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[13]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[13]),
        .O(clk_count_0[13]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[14]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[14]),
        .O(clk_count_0[14]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[15]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[15]),
        .O(clk_count_0[15]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[16]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[16]),
        .O(clk_count_0[16]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[17]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[17]),
        .O(clk_count_0[17]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[18]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[18]),
        .O(clk_count_0[18]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[19]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[19]),
        .O(clk_count_0[19]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[1]_i_1__0 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[1]),
        .O(clk_count_0[1]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[20]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[20]),
        .O(clk_count_0[20]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[21]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[21]),
        .O(clk_count_0[21]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[22]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[22]),
        .O(clk_count_0[22]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[23]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[23]),
        .O(clk_count_0[23]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[24]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[24]),
        .O(clk_count_0[24]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[25]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[25]),
        .O(clk_count_0[25]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[26]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[26]),
        .O(clk_count_0[26]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[27]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[27]),
        .O(clk_count_0[27]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[28]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[28]),
        .O(clk_count_0[28]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[29]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[29]),
        .O(clk_count_0[29]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[2]_i_1__0 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[2]),
        .O(clk_count_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[30]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[30]),
        .O(clk_count_0[30]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[31]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[31]),
        .O(clk_count_0[31]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \clk_count[31]_i_2 
       (.I0(\clk_count[31]_i_5_n_0 ),
        .I1(\clk_count[31]_i_6_n_0 ),
        .I2(clk_count[31]),
        .I3(clk_count[30]),
        .I4(clk_count[1]),
        .I5(\clk_count[31]_i_7_n_0 ),
        .O(\clk_count[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \clk_count[31]_i_3 
       (.I0(clk_count[4]),
        .I1(clk_count[5]),
        .I2(clk_count[2]),
        .I3(clk_count[3]),
        .I4(\clk_count[31]_i_8_n_0 ),
        .O(\clk_count[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \clk_count[31]_i_4 
       (.I0(clk_count[13]),
        .I1(clk_count[12]),
        .I2(clk_count[10]),
        .I3(clk_count[11]),
        .I4(\clk_count[31]_i_9_n_0 ),
        .O(\clk_count[31]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \clk_count[31]_i_5 
       (.I0(clk_count[23]),
        .I1(clk_count[22]),
        .I2(clk_count[25]),
        .I3(clk_count[24]),
        .O(\clk_count[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \clk_count[31]_i_6 
       (.I0(clk_count[18]),
        .I1(clk_count[19]),
        .I2(clk_count[21]),
        .I3(clk_count[20]),
        .O(\clk_count[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \clk_count[31]_i_7 
       (.I0(clk_count[27]),
        .I1(clk_count[26]),
        .I2(clk_count[29]),
        .I3(clk_count[28]),
        .O(\clk_count[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \clk_count[31]_i_8 
       (.I0(clk_count[7]),
        .I1(clk_count[6]),
        .I2(clk_count[9]),
        .I3(clk_count[8]),
        .O(\clk_count[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \clk_count[31]_i_9 
       (.I0(clk_count[15]),
        .I1(clk_count[14]),
        .I2(clk_count[17]),
        .I3(clk_count[16]),
        .O(\clk_count[31]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[3]_i_1__0 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[3]),
        .O(clk_count_0[3]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[4]_i_1__0 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[4]),
        .O(clk_count_0[4]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[5]_i_1__0 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[5]),
        .O(clk_count_0[5]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[6]_i_1__0 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[6]),
        .O(clk_count_0[6]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[7]_i_1__0 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[7]),
        .O(clk_count_0[7]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[8]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[8]),
        .O(clk_count_0[8]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \clk_count[9]_i_1 
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .I4(data0[9]),
        .O(clk_count_0[9]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[0]),
        .Q(clk_count[0]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[10]),
        .Q(clk_count[10]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[11]),
        .Q(clk_count[11]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[12]),
        .Q(clk_count[12]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[13]),
        .Q(clk_count[13]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[14]),
        .Q(clk_count[14]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[15]),
        .Q(clk_count[15]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[16]),
        .Q(clk_count[16]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[17]),
        .Q(clk_count[17]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[18]),
        .Q(clk_count[18]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[19]),
        .Q(clk_count[19]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[1]),
        .Q(clk_count[1]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[20]),
        .Q(clk_count[20]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[21]),
        .Q(clk_count[21]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[22]),
        .Q(clk_count[22]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[23]),
        .Q(clk_count[23]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[24]),
        .Q(clk_count[24]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[25]),
        .Q(clk_count[25]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[26]),
        .Q(clk_count[26]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[27]),
        .Q(clk_count[27]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[28]),
        .Q(clk_count[28]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[29]),
        .Q(clk_count[29]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[2]),
        .Q(clk_count[2]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[30]),
        .Q(clk_count[30]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[31]),
        .Q(clk_count[31]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[3]),
        .Q(clk_count[3]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[4]),
        .Q(clk_count[4]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[5]),
        .Q(clk_count[5]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[6]),
        .Q(clk_count[6]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[7]),
        .Q(clk_count[7]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[8]),
        .Q(clk_count[8]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(clk_count_0[9]),
        .Q(clk_count[9]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    div_clk_i_1__0
       (.I0(\clk_count[31]_i_2_n_0 ),
        .I1(\clk_count[31]_i_3_n_0 ),
        .I2(\clk_count[31]_i_4_n_0 ),
        .I3(clk_count[0]),
        .O(div_clk));
  FDCE #(
    .INIT(1'b0)) 
    div_clk_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(div_clk),
        .Q(scan));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \keys[13]_i_1 
       (.I0(scan),
        .I1(col1),
        .O(E[1]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \keys[14]_i_1 
       (.I0(scan),
        .I1(\keys_reg[3] ),
        .O(E[2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \keys[15]_i_1 
       (.I0(scan),
        .I1(\keys_reg[2] ),
        .O(E[3]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \keys[7]_i_1 
       (.I0(scan),
        .I1(\keys_reg[0] ),
        .O(E[0]));
endmodule

module debouncer
   (db_rst,
    clk_IBUF_BUFG,
    rst_IBUF);
  output db_rst;
  input clk_IBUF_BUFG;
  input rst_IBUF;

  wire \<const0> ;
  wire \<const1> ;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire T1_n_0;
  wire T1_n_1;
  wire clear_i_1_n_0;
  wire clear_reg_n_0;
  wire clk_IBUF_BUFG;
  wire db_rst;
  wire rst_IBUF;
  wire [1:0]state;

  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(rst_IBUF),
        .I1(state[1]),
        .I2(state[0]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "PRESS:01,WAIT:00,RELEASE:10" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(\<const0> ));
  (* FSM_ENCODED_STATES = "PRESS:01,WAIT:00,RELEASE:10" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(T1_n_1),
        .Q(state[1]),
        .R(\<const0> ));
  GND GND
       (.G(\<const0> ));
  tcounter T1
       (.\FSM_sequential_state_reg[1] (T1_n_0),
        .\FSM_sequential_state_reg[1]_0 (clear_reg_n_0),
        .clear_reg(T1_n_1),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .db_rst(db_rst),
        .rst_IBUF(rst_IBUF),
        .state(state));
  VCC VCC
       (.P(\<const1> ));
  FDRE #(
    .INIT(1'b0)) 
    btn_db_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(T1_n_0),
        .Q(db_rst),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hC055)) 
    clear_i_1
       (.I0(rst_IBUF),
        .I1(clear_reg_n_0),
        .I2(state[0]),
        .I3(state[1]),
        .O(clear_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    clear_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clear_i_1_n_0),
        .Q(clear_reg_n_0),
        .R(\<const0> ));
endmodule

module dim_leds
   (rst_l,
    LED_OBUF,
    clk_IBUF_BUFG,
    onled);
  output rst_l;
  output [0:0]LED_OBUF;
  input clk_IBUF_BUFG;
  input onled;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]LED_OBUF;
  wire clk_IBUF_BUFG;
  wire count1;
  wire count1_carry__0_i_1_n_0;
  wire count1_carry__0_i_2_n_0;
  wire count1_carry__0_i_3_n_0;
  wire count1_carry__0_i_4_n_0;
  wire count1_carry__0_i_5_n_0;
  wire count1_carry__0_i_6_n_0;
  wire count1_carry__0_i_7_n_0;
  wire count1_carry__0_n_0;
  wire count1_carry__0_n_1;
  wire count1_carry__0_n_2;
  wire count1_carry__0_n_3;
  wire count1_carry__1_i_1_n_0;
  wire count1_carry__1_i_2_n_0;
  wire count1_carry__1_i_3_n_0;
  wire count1_carry__1_i_4_n_0;
  wire count1_carry__1_i_5_n_0;
  wire count1_carry__1_i_6_n_0;
  wire count1_carry__1_n_0;
  wire count1_carry__1_n_1;
  wire count1_carry__1_n_2;
  wire count1_carry__1_n_3;
  wire count1_carry__2_i_1_n_0;
  wire count1_carry__2_i_2_n_0;
  wire count1_carry__2_i_3_n_0;
  wire count1_carry__2_i_4_n_0;
  wire count1_carry__2_i_5_n_0;
  wire count1_carry__2_i_6_n_0;
  wire count1_carry__2_i_7_n_0;
  wire count1_carry__2_i_8_n_0;
  wire count1_carry__2_n_1;
  wire count1_carry__2_n_2;
  wire count1_carry__2_n_3;
  wire count1_carry_i_1_n_0;
  wire count1_carry_i_2_n_0;
  wire count1_carry_i_3_n_0;
  wire count1_carry_i_4_n_0;
  wire count1_carry_i_5_n_0;
  wire count1_carry_i_6_n_0;
  wire count1_carry_i_7_n_0;
  wire count1_carry_n_0;
  wire count1_carry_n_1;
  wire count1_carry_n_2;
  wire count1_carry_n_3;
  wire \count[0]_i_2_n_0 ;
  wire \count[0]_i_3_n_0 ;
  wire \count[0]_i_4_n_0 ;
  wire \count[0]_i_5_n_0 ;
  wire \count[0]_i_6_n_0 ;
  wire \count[12]_i_2_n_0 ;
  wire \count[12]_i_3_n_0 ;
  wire \count[12]_i_4_n_0 ;
  wire \count[12]_i_5_n_0 ;
  wire \count[16]_i_2_n_0 ;
  wire \count[16]_i_3_n_0 ;
  wire \count[16]_i_4_n_0 ;
  wire \count[16]_i_5_n_0 ;
  wire \count[20]_i_2_n_0 ;
  wire \count[20]_i_3_n_0 ;
  wire \count[20]_i_4_n_0 ;
  wire \count[20]_i_5_n_0 ;
  wire \count[24]_i_2_n_0 ;
  wire \count[24]_i_3_n_0 ;
  wire \count[24]_i_4_n_0 ;
  wire \count[24]_i_5_n_0 ;
  wire \count[28]_i_2_n_0 ;
  wire \count[28]_i_3_n_0 ;
  wire \count[28]_i_4_n_0 ;
  wire \count[28]_i_5_n_0 ;
  wire \count[4]_i_2_n_0 ;
  wire \count[4]_i_3_n_0 ;
  wire \count[4]_i_4_n_0 ;
  wire \count[4]_i_5_n_0 ;
  wire \count[8]_i_2_n_0 ;
  wire \count[8]_i_3_n_0 ;
  wire \count[8]_i_4_n_0 ;
  wire \count[8]_i_5_n_0 ;
  wire [31:0]count_reg;
  wire \count_reg[0]_i_1_n_0 ;
  wire \count_reg[0]_i_1_n_1 ;
  wire \count_reg[0]_i_1_n_2 ;
  wire \count_reg[0]_i_1_n_3 ;
  wire \count_reg[0]_i_1_n_4 ;
  wire \count_reg[0]_i_1_n_5 ;
  wire \count_reg[0]_i_1_n_6 ;
  wire \count_reg[0]_i_1_n_7 ;
  wire \count_reg[12]_i_1_n_0 ;
  wire \count_reg[12]_i_1_n_1 ;
  wire \count_reg[12]_i_1_n_2 ;
  wire \count_reg[12]_i_1_n_3 ;
  wire \count_reg[12]_i_1_n_4 ;
  wire \count_reg[12]_i_1_n_5 ;
  wire \count_reg[12]_i_1_n_6 ;
  wire \count_reg[12]_i_1_n_7 ;
  wire \count_reg[16]_i_1_n_0 ;
  wire \count_reg[16]_i_1_n_1 ;
  wire \count_reg[16]_i_1_n_2 ;
  wire \count_reg[16]_i_1_n_3 ;
  wire \count_reg[16]_i_1_n_4 ;
  wire \count_reg[16]_i_1_n_5 ;
  wire \count_reg[16]_i_1_n_6 ;
  wire \count_reg[16]_i_1_n_7 ;
  wire \count_reg[20]_i_1_n_0 ;
  wire \count_reg[20]_i_1_n_1 ;
  wire \count_reg[20]_i_1_n_2 ;
  wire \count_reg[20]_i_1_n_3 ;
  wire \count_reg[20]_i_1_n_4 ;
  wire \count_reg[20]_i_1_n_5 ;
  wire \count_reg[20]_i_1_n_6 ;
  wire \count_reg[20]_i_1_n_7 ;
  wire \count_reg[24]_i_1_n_0 ;
  wire \count_reg[24]_i_1_n_1 ;
  wire \count_reg[24]_i_1_n_2 ;
  wire \count_reg[24]_i_1_n_3 ;
  wire \count_reg[24]_i_1_n_4 ;
  wire \count_reg[24]_i_1_n_5 ;
  wire \count_reg[24]_i_1_n_6 ;
  wire \count_reg[24]_i_1_n_7 ;
  wire \count_reg[28]_i_1_n_1 ;
  wire \count_reg[28]_i_1_n_2 ;
  wire \count_reg[28]_i_1_n_3 ;
  wire \count_reg[28]_i_1_n_4 ;
  wire \count_reg[28]_i_1_n_5 ;
  wire \count_reg[28]_i_1_n_6 ;
  wire \count_reg[28]_i_1_n_7 ;
  wire \count_reg[4]_i_1_n_0 ;
  wire \count_reg[4]_i_1_n_1 ;
  wire \count_reg[4]_i_1_n_2 ;
  wire \count_reg[4]_i_1_n_3 ;
  wire \count_reg[4]_i_1_n_4 ;
  wire \count_reg[4]_i_1_n_5 ;
  wire \count_reg[4]_i_1_n_6 ;
  wire \count_reg[4]_i_1_n_7 ;
  wire \count_reg[8]_i_1_n_0 ;
  wire \count_reg[8]_i_1_n_1 ;
  wire \count_reg[8]_i_1_n_2 ;
  wire \count_reg[8]_i_1_n_3 ;
  wire \count_reg[8]_i_1_n_4 ;
  wire \count_reg[8]_i_1_n_5 ;
  wire \count_reg[8]_i_1_n_6 ;
  wire \count_reg[8]_i_1_n_7 ;
  wire count_up;
  wire count_up_i_1_n_0;
  wire count_up_i_3_n_0;
  wire count_up_i_4_n_0;
  wire count_up_i_5_n_0;
  wire count_up_reg_n_0;
  wire \din[0]_i_1_n_0 ;
  wire \din[4]_i_2_n_0 ;
  wire \din[4]_i_3_n_0 ;
  wire \din[4]_i_4_n_0 ;
  wire \din[4]_i_5_n_0 ;
  wire \din[7]_i_2_n_0 ;
  wire \din[7]_i_3_n_0 ;
  wire \din[7]_i_4_n_0 ;
  wire [7:0]din_reg;
  wire \din_reg[4]_i_1_n_0 ;
  wire \din_reg[4]_i_1_n_1 ;
  wire \din_reg[4]_i_1_n_2 ;
  wire \din_reg[4]_i_1_n_3 ;
  wire \din_reg[4]_i_1_n_4 ;
  wire \din_reg[4]_i_1_n_5 ;
  wire \din_reg[4]_i_1_n_6 ;
  wire \din_reg[4]_i_1_n_7 ;
  wire \din_reg[7]_i_1_n_2 ;
  wire \din_reg[7]_i_1_n_3 ;
  wire \din_reg[7]_i_1_n_5 ;
  wire \din_reg[7]_i_1_n_6 ;
  wire \din_reg[7]_i_1_n_7 ;
  wire div_clk_i_1_n_0;
  wire div_clk_reg_n_0;
  wire onled;
  wire rst_l;

  GND GND
       (.G(\<const0> ));
  pwm PWM1
       (.LED_OBUF(LED_OBUF),
        .Q(din_reg),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .onled(onled));
  VCC VCC
       (.P(\<const1> ));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 count1_carry
       (.CI(\<const0> ),
        .CO({count1_carry_n_0,count1_carry_n_1,count1_carry_n_2,count1_carry_n_3}),
        .CYINIT(\<const1> ),
        .DI({count1_carry_i_1_n_0,count1_carry_i_2_n_0,count1_carry_i_3_n_0,\<const1> }),
        .S({count1_carry_i_4_n_0,count1_carry_i_5_n_0,count1_carry_i_6_n_0,count1_carry_i_7_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 count1_carry__0
       (.CI(count1_carry_n_0),
        .CO({count1_carry__0_n_0,count1_carry__0_n_1,count1_carry__0_n_2,count1_carry__0_n_3}),
        .CYINIT(\<const0> ),
        .DI({count1_carry__0_i_1_n_0,count1_carry__0_i_2_n_0,count1_carry__0_i_3_n_0,count_reg[9]}),
        .S({count1_carry__0_i_4_n_0,count1_carry__0_i_5_n_0,count1_carry__0_i_6_n_0,count1_carry__0_i_7_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    count1_carry__0_i_1
       (.I0(count_reg[14]),
        .I1(count_reg[15]),
        .O(count1_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    count1_carry__0_i_2
       (.I0(count_reg[12]),
        .I1(count_reg[13]),
        .O(count1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    count1_carry__0_i_3
       (.I0(count_reg[11]),
        .I1(count_reg[10]),
        .O(count1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    count1_carry__0_i_4
       (.I0(count_reg[15]),
        .I1(count_reg[14]),
        .O(count1_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    count1_carry__0_i_5
       (.I0(count_reg[13]),
        .I1(count_reg[12]),
        .O(count1_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    count1_carry__0_i_6
       (.I0(count_reg[10]),
        .I1(count_reg[11]),
        .O(count1_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    count1_carry__0_i_7
       (.I0(count_reg[8]),
        .I1(count_reg[9]),
        .O(count1_carry__0_i_7_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 count1_carry__1
       (.CI(count1_carry__0_n_0),
        .CO({count1_carry__1_n_0,count1_carry__1_n_1,count1_carry__1_n_2,count1_carry__1_n_3}),
        .CYINIT(\<const0> ),
        .DI({count1_carry__1_i_1_n_0,count1_carry__1_i_2_n_0,count_reg[19],\<const0> }),
        .S({count1_carry__1_i_3_n_0,count1_carry__1_i_4_n_0,count1_carry__1_i_5_n_0,count1_carry__1_i_6_n_0}));
  LUT2 #(
    .INIT(4'hE)) 
    count1_carry__1_i_1
       (.I0(count_reg[23]),
        .I1(count_reg[22]),
        .O(count1_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    count1_carry__1_i_2
       (.I0(count_reg[21]),
        .I1(count_reg[20]),
        .O(count1_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    count1_carry__1_i_3
       (.I0(count_reg[22]),
        .I1(count_reg[23]),
        .O(count1_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    count1_carry__1_i_4
       (.I0(count_reg[20]),
        .I1(count_reg[21]),
        .O(count1_carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    count1_carry__1_i_5
       (.I0(count_reg[18]),
        .I1(count_reg[19]),
        .O(count1_carry__1_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    count1_carry__1_i_6
       (.I0(count_reg[16]),
        .I1(count_reg[17]),
        .O(count1_carry__1_i_6_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 count1_carry__2
       (.CI(count1_carry__1_n_0),
        .CO({count1,count1_carry__2_n_1,count1_carry__2_n_2,count1_carry__2_n_3}),
        .CYINIT(\<const0> ),
        .DI({count1_carry__2_i_1_n_0,count1_carry__2_i_2_n_0,count1_carry__2_i_3_n_0,count1_carry__2_i_4_n_0}),
        .S({count1_carry__2_i_5_n_0,count1_carry__2_i_6_n_0,count1_carry__2_i_7_n_0,count1_carry__2_i_8_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    count1_carry__2_i_1
       (.I0(count_reg[30]),
        .I1(count_reg[31]),
        .O(count1_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    count1_carry__2_i_2
       (.I0(count_reg[29]),
        .I1(count_reg[28]),
        .O(count1_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    count1_carry__2_i_3
       (.I0(count_reg[27]),
        .I1(count_reg[26]),
        .O(count1_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    count1_carry__2_i_4
       (.I0(count_reg[25]),
        .I1(count_reg[24]),
        .O(count1_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    count1_carry__2_i_5
       (.I0(count_reg[30]),
        .I1(count_reg[31]),
        .O(count1_carry__2_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    count1_carry__2_i_6
       (.I0(count_reg[28]),
        .I1(count_reg[29]),
        .O(count1_carry__2_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    count1_carry__2_i_7
       (.I0(count_reg[26]),
        .I1(count_reg[27]),
        .O(count1_carry__2_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    count1_carry__2_i_8
       (.I0(count_reg[24]),
        .I1(count_reg[25]),
        .O(count1_carry__2_i_8_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    count1_carry_i_1
       (.I0(count_reg[7]),
        .I1(count_reg[6]),
        .O(count1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    count1_carry_i_2
       (.I0(count_reg[4]),
        .I1(count_reg[5]),
        .O(count1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    count1_carry_i_3
       (.I0(count_reg[3]),
        .I1(count_reg[2]),
        .O(count1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    count1_carry_i_4
       (.I0(count_reg[6]),
        .I1(count_reg[7]),
        .O(count1_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    count1_carry_i_5
       (.I0(count_reg[5]),
        .I1(count_reg[4]),
        .O(count1_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    count1_carry_i_6
       (.I0(count_reg[2]),
        .I1(count_reg[3]),
        .O(count1_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    count1_carry_i_7
       (.I0(count_reg[0]),
        .I1(count_reg[1]),
        .O(count1_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \count[0]_i_2 
       (.I0(count_reg[0]),
        .I1(count1),
        .O(\count[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[0]_i_3 
       (.I0(count_reg[3]),
        .I1(count1),
        .O(\count[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[0]_i_4 
       (.I0(count_reg[2]),
        .I1(count1),
        .O(\count[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[0]_i_5 
       (.I0(count_reg[1]),
        .I1(count1),
        .O(\count[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \count[0]_i_6 
       (.I0(count_reg[0]),
        .I1(count1),
        .O(\count[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[12]_i_2 
       (.I0(count_reg[15]),
        .I1(count1),
        .O(\count[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[12]_i_3 
       (.I0(count_reg[14]),
        .I1(count1),
        .O(\count[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[12]_i_4 
       (.I0(count_reg[13]),
        .I1(count1),
        .O(\count[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[12]_i_5 
       (.I0(count_reg[12]),
        .I1(count1),
        .O(\count[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[16]_i_2 
       (.I0(count_reg[19]),
        .I1(count1),
        .O(\count[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[16]_i_3 
       (.I0(count_reg[18]),
        .I1(count1),
        .O(\count[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[16]_i_4 
       (.I0(count_reg[17]),
        .I1(count1),
        .O(\count[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[16]_i_5 
       (.I0(count_reg[16]),
        .I1(count1),
        .O(\count[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[20]_i_2 
       (.I0(count_reg[23]),
        .I1(count1),
        .O(\count[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[20]_i_3 
       (.I0(count_reg[22]),
        .I1(count1),
        .O(\count[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[20]_i_4 
       (.I0(count_reg[21]),
        .I1(count1),
        .O(\count[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[20]_i_5 
       (.I0(count_reg[20]),
        .I1(count1),
        .O(\count[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[24]_i_2 
       (.I0(count_reg[27]),
        .I1(count1),
        .O(\count[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[24]_i_3 
       (.I0(count_reg[26]),
        .I1(count1),
        .O(\count[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[24]_i_4 
       (.I0(count_reg[25]),
        .I1(count1),
        .O(\count[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[24]_i_5 
       (.I0(count_reg[24]),
        .I1(count1),
        .O(\count[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[28]_i_2 
       (.I0(count_reg[31]),
        .I1(count1),
        .O(\count[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[28]_i_3 
       (.I0(count_reg[30]),
        .I1(count1),
        .O(\count[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[28]_i_4 
       (.I0(count_reg[29]),
        .I1(count1),
        .O(\count[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[28]_i_5 
       (.I0(count_reg[28]),
        .I1(count1),
        .O(\count[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[4]_i_2 
       (.I0(count_reg[7]),
        .I1(count1),
        .O(\count[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[4]_i_3 
       (.I0(count_reg[6]),
        .I1(count1),
        .O(\count[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[4]_i_4 
       (.I0(count_reg[5]),
        .I1(count1),
        .O(\count[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[4]_i_5 
       (.I0(count_reg[4]),
        .I1(count1),
        .O(\count[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[8]_i_2 
       (.I0(count_reg[11]),
        .I1(count1),
        .O(\count[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[8]_i_3 
       (.I0(count_reg[10]),
        .I1(count1),
        .O(\count[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[8]_i_4 
       (.I0(count_reg[9]),
        .I1(count1),
        .O(\count[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \count[8]_i_5 
       (.I0(count_reg[8]),
        .I1(count1),
        .O(\count[8]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[0]_i_1_n_7 ),
        .Q(count_reg[0]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[0]_i_1 
       (.CI(\<const0> ),
        .CO({\count_reg[0]_i_1_n_0 ,\count_reg[0]_i_1_n_1 ,\count_reg[0]_i_1_n_2 ,\count_reg[0]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\count[0]_i_2_n_0 }),
        .O({\count_reg[0]_i_1_n_4 ,\count_reg[0]_i_1_n_5 ,\count_reg[0]_i_1_n_6 ,\count_reg[0]_i_1_n_7 }),
        .S({\count[0]_i_3_n_0 ,\count[0]_i_4_n_0 ,\count[0]_i_5_n_0 ,\count[0]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[8]_i_1_n_5 ),
        .Q(count_reg[10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[8]_i_1_n_4 ),
        .Q(count_reg[11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[12]_i_1_n_7 ),
        .Q(count_reg[12]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[12]_i_1 
       (.CI(\count_reg[8]_i_1_n_0 ),
        .CO({\count_reg[12]_i_1_n_0 ,\count_reg[12]_i_1_n_1 ,\count_reg[12]_i_1_n_2 ,\count_reg[12]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[12]_i_1_n_4 ,\count_reg[12]_i_1_n_5 ,\count_reg[12]_i_1_n_6 ,\count_reg[12]_i_1_n_7 }),
        .S({\count[12]_i_2_n_0 ,\count[12]_i_3_n_0 ,\count[12]_i_4_n_0 ,\count[12]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[12]_i_1_n_6 ),
        .Q(count_reg[13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[12]_i_1_n_5 ),
        .Q(count_reg[14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[12]_i_1_n_4 ),
        .Q(count_reg[15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[16]_i_1_n_7 ),
        .Q(count_reg[16]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[16]_i_1 
       (.CI(\count_reg[12]_i_1_n_0 ),
        .CO({\count_reg[16]_i_1_n_0 ,\count_reg[16]_i_1_n_1 ,\count_reg[16]_i_1_n_2 ,\count_reg[16]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[16]_i_1_n_4 ,\count_reg[16]_i_1_n_5 ,\count_reg[16]_i_1_n_6 ,\count_reg[16]_i_1_n_7 }),
        .S({\count[16]_i_2_n_0 ,\count[16]_i_3_n_0 ,\count[16]_i_4_n_0 ,\count[16]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[16]_i_1_n_6 ),
        .Q(count_reg[17]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[16]_i_1_n_5 ),
        .Q(count_reg[18]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[16]_i_1_n_4 ),
        .Q(count_reg[19]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[0]_i_1_n_6 ),
        .Q(count_reg[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[20]_i_1_n_7 ),
        .Q(count_reg[20]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[20]_i_1 
       (.CI(\count_reg[16]_i_1_n_0 ),
        .CO({\count_reg[20]_i_1_n_0 ,\count_reg[20]_i_1_n_1 ,\count_reg[20]_i_1_n_2 ,\count_reg[20]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[20]_i_1_n_4 ,\count_reg[20]_i_1_n_5 ,\count_reg[20]_i_1_n_6 ,\count_reg[20]_i_1_n_7 }),
        .S({\count[20]_i_2_n_0 ,\count[20]_i_3_n_0 ,\count[20]_i_4_n_0 ,\count[20]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[20]_i_1_n_6 ),
        .Q(count_reg[21]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[20]_i_1_n_5 ),
        .Q(count_reg[22]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[20]_i_1_n_4 ),
        .Q(count_reg[23]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[24]_i_1_n_7 ),
        .Q(count_reg[24]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[24]_i_1 
       (.CI(\count_reg[20]_i_1_n_0 ),
        .CO({\count_reg[24]_i_1_n_0 ,\count_reg[24]_i_1_n_1 ,\count_reg[24]_i_1_n_2 ,\count_reg[24]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[24]_i_1_n_4 ,\count_reg[24]_i_1_n_5 ,\count_reg[24]_i_1_n_6 ,\count_reg[24]_i_1_n_7 }),
        .S({\count[24]_i_2_n_0 ,\count[24]_i_3_n_0 ,\count[24]_i_4_n_0 ,\count[24]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[24]_i_1_n_6 ),
        .Q(count_reg[25]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[24]_i_1_n_5 ),
        .Q(count_reg[26]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[24]_i_1_n_4 ),
        .Q(count_reg[27]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[28]_i_1_n_7 ),
        .Q(count_reg[28]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[28]_i_1 
       (.CI(\count_reg[24]_i_1_n_0 ),
        .CO({\count_reg[28]_i_1_n_1 ,\count_reg[28]_i_1_n_2 ,\count_reg[28]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[28]_i_1_n_4 ,\count_reg[28]_i_1_n_5 ,\count_reg[28]_i_1_n_6 ,\count_reg[28]_i_1_n_7 }),
        .S({\count[28]_i_2_n_0 ,\count[28]_i_3_n_0 ,\count[28]_i_4_n_0 ,\count[28]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[28]_i_1_n_6 ),
        .Q(count_reg[29]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[0]_i_1_n_5 ),
        .Q(count_reg[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[28]_i_1_n_5 ),
        .Q(count_reg[30]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[28]_i_1_n_4 ),
        .Q(count_reg[31]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[0]_i_1_n_4 ),
        .Q(count_reg[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[4]_i_1_n_7 ),
        .Q(count_reg[4]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[4]_i_1 
       (.CI(\count_reg[0]_i_1_n_0 ),
        .CO({\count_reg[4]_i_1_n_0 ,\count_reg[4]_i_1_n_1 ,\count_reg[4]_i_1_n_2 ,\count_reg[4]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[4]_i_1_n_4 ,\count_reg[4]_i_1_n_5 ,\count_reg[4]_i_1_n_6 ,\count_reg[4]_i_1_n_7 }),
        .S({\count[4]_i_2_n_0 ,\count[4]_i_3_n_0 ,\count[4]_i_4_n_0 ,\count[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[4]_i_1_n_6 ),
        .Q(count_reg[5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[4]_i_1_n_5 ),
        .Q(count_reg[6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[4]_i_1_n_4 ),
        .Q(count_reg[7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[8]_i_1_n_7 ),
        .Q(count_reg[8]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[8]_i_1 
       (.CI(\count_reg[4]_i_1_n_0 ),
        .CO({\count_reg[8]_i_1_n_0 ,\count_reg[8]_i_1_n_1 ,\count_reg[8]_i_1_n_2 ,\count_reg[8]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[8]_i_1_n_4 ,\count_reg[8]_i_1_n_5 ,\count_reg[8]_i_1_n_6 ,\count_reg[8]_i_1_n_7 }),
        .S({\count[8]_i_2_n_0 ,\count[8]_i_3_n_0 ,\count[8]_i_4_n_0 ,\count[8]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_l),
        .D(\count_reg[8]_i_1_n_6 ),
        .Q(count_reg[9]),
        .R(\<const0> ));
  LUT4 #(
    .INIT(16'hFE44)) 
    count_up_i_1
       (.I0(onled),
        .I1(count_up),
        .I2(count_up_i_3_n_0),
        .I3(count_up_reg_n_0),
        .O(count_up_i_1_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    count_up_i_2
       (.I0(din_reg[7]),
        .I1(din_reg[2]),
        .I2(din_reg[6]),
        .I3(count_up_i_4_n_0),
        .O(count_up));
  LUT4 #(
    .INIT(16'hBFFF)) 
    count_up_i_3
       (.I0(count_up_i_5_n_0),
        .I1(din_reg[3]),
        .I2(din_reg[2]),
        .I3(din_reg[6]),
        .O(count_up_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    count_up_i_4
       (.I0(din_reg[3]),
        .I1(count_up_reg_n_0),
        .I2(din_reg[4]),
        .I3(din_reg[0]),
        .I4(din_reg[1]),
        .I5(din_reg[5]),
        .O(count_up_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFF7FFFFFFFFFFF)) 
    count_up_i_5
       (.I0(din_reg[4]),
        .I1(din_reg[7]),
        .I2(din_reg[1]),
        .I3(din_reg[5]),
        .I4(din_reg[0]),
        .I5(count_up_reg_n_0),
        .O(count_up_i_5_n_0));
  FDRE #(
    .INIT(1'b1)) 
    count_up_reg
       (.C(div_clk_reg_n_0),
        .CE(\<const1> ),
        .D(count_up_i_1_n_0),
        .Q(count_up_reg_n_0),
        .R(\<const0> ));
  LUT1 #(
    .INIT(2'h1)) 
    \din[0]_i_1 
       (.I0(din_reg[0]),
        .O(\din[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \din[4]_i_2 
       (.I0(din_reg[3]),
        .I1(din_reg[4]),
        .O(\din[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \din[4]_i_3 
       (.I0(din_reg[2]),
        .I1(din_reg[3]),
        .O(\din[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \din[4]_i_4 
       (.I0(din_reg[1]),
        .I1(din_reg[2]),
        .O(\din[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \din[4]_i_5 
       (.I0(din_reg[1]),
        .I1(count_up_reg_n_0),
        .O(\din[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \din[7]_i_2 
       (.I0(din_reg[6]),
        .I1(din_reg[7]),
        .O(\din[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \din[7]_i_3 
       (.I0(din_reg[5]),
        .I1(din_reg[6]),
        .O(\din[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \din[7]_i_4 
       (.I0(din_reg[4]),
        .I1(din_reg[5]),
        .O(\din[7]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \din_reg[0] 
       (.C(div_clk_reg_n_0),
        .CE(rst_l),
        .D(\din[0]_i_1_n_0 ),
        .Q(din_reg[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \din_reg[1] 
       (.C(div_clk_reg_n_0),
        .CE(rst_l),
        .D(\din_reg[4]_i_1_n_7 ),
        .Q(din_reg[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \din_reg[2] 
       (.C(div_clk_reg_n_0),
        .CE(rst_l),
        .D(\din_reg[4]_i_1_n_6 ),
        .Q(din_reg[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \din_reg[3] 
       (.C(div_clk_reg_n_0),
        .CE(rst_l),
        .D(\din_reg[4]_i_1_n_5 ),
        .Q(din_reg[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \din_reg[4] 
       (.C(div_clk_reg_n_0),
        .CE(rst_l),
        .D(\din_reg[4]_i_1_n_4 ),
        .Q(din_reg[4]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \din_reg[4]_i_1 
       (.CI(\<const0> ),
        .CO({\din_reg[4]_i_1_n_0 ,\din_reg[4]_i_1_n_1 ,\din_reg[4]_i_1_n_2 ,\din_reg[4]_i_1_n_3 }),
        .CYINIT(din_reg[0]),
        .DI({din_reg[3:1],count_up_reg_n_0}),
        .O({\din_reg[4]_i_1_n_4 ,\din_reg[4]_i_1_n_5 ,\din_reg[4]_i_1_n_6 ,\din_reg[4]_i_1_n_7 }),
        .S({\din[4]_i_2_n_0 ,\din[4]_i_3_n_0 ,\din[4]_i_4_n_0 ,\din[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \din_reg[5] 
       (.C(div_clk_reg_n_0),
        .CE(rst_l),
        .D(\din_reg[7]_i_1_n_7 ),
        .Q(din_reg[5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \din_reg[6] 
       (.C(div_clk_reg_n_0),
        .CE(rst_l),
        .D(\din_reg[7]_i_1_n_6 ),
        .Q(din_reg[6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \din_reg[7] 
       (.C(div_clk_reg_n_0),
        .CE(rst_l),
        .D(\din_reg[7]_i_1_n_5 ),
        .Q(din_reg[7]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \din_reg[7]_i_1 
       (.CI(\din_reg[4]_i_1_n_0 ),
        .CO({\din_reg[7]_i_1_n_2 ,\din_reg[7]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,din_reg[5:4]}),
        .O({\din_reg[7]_i_1_n_5 ,\din_reg[7]_i_1_n_6 ,\din_reg[7]_i_1_n_7 }),
        .S({\<const0> ,\din[7]_i_2_n_0 ,\din[7]_i_3_n_0 ,\din[7]_i_4_n_0 }));
  LUT3 #(
    .INIT(8'hB4)) 
    div_clk_i_1
       (.I0(onled),
        .I1(count1),
        .I2(div_clk_reg_n_0),
        .O(div_clk_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    div_clk_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(div_clk_i_1_n_0),
        .Q(div_clk_reg_n_0),
        .R(\<const0> ));
  LUT1 #(
    .INIT(2'h1)) 
    onled_reg_i_1
       (.I0(onled),
        .O(rst_l));
endmodule

module keypad
   (\f_count_reg[8] ,
    \f_count_reg[8]_0 ,
    S,
    DI,
    \keys_reg[1]_0 ,
    \keys_reg[9]_0 ,
    \keys_reg[3]_0 ,
    \keys_reg[12]_0 ,
    \col_TRI[3] ,
    \col_TRI[2] ,
    \col_TRI[1] ,
    \col_TRI[0] ,
    clk_IBUF_BUFG,
    onled,
    Q,
    row_IBUF);
  output [0:0]\f_count_reg[8] ;
  output [0:0]\f_count_reg[8]_0 ;
  output [1:0]S;
  output [3:0]DI;
  output \keys_reg[1]_0 ;
  output \keys_reg[9]_0 ;
  output \keys_reg[3]_0 ;
  output \keys_reg[12]_0 ;
  output \col_TRI[3] ;
  output \col_TRI[2] ;
  output \col_TRI[1] ;
  output \col_TRI[0] ;
  input clk_IBUF_BUFG;
  input onled;
  input [9:0]Q;
  input [3:0]row_IBUF;

  wire [3:0]DI;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_2_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_2_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_2_n_0 ;
  wire [9:0]Q;
  wire [1:0]S;
  wire clk_IBUF_BUFG;
  wire clkdiv_n_1;
  wire clkdiv_n_2;
  wire clkdiv_n_3;
  wire clkdiv_n_4;
  wire col1;
  wire \col_TRI[0] ;
  wire \col_TRI[1] ;
  wire \col_TRI[2] ;
  wire \col_TRI[3] ;
  wire f_count1_carry__0_i_10_n_0;
  wire f_count1_carry__0_i_11_n_0;
  wire f_count1_carry__0_i_12_n_0;
  wire f_count1_carry__0_i_3_n_0;
  wire f_count1_carry__0_i_4_n_0;
  wire f_count1_carry__0_i_5_n_0;
  wire f_count1_carry__0_i_6_n_0;
  wire f_count1_carry__0_i_7_n_0;
  wire f_count1_carry__0_i_8_n_0;
  wire f_count1_carry__0_i_9_n_0;
  wire f_count1_carry_i_13_n_0;
  wire f_count1_carry_i_14_n_0;
  wire f_count1_carry_i_15_n_0;
  wire f_count1_carry_i_16_n_0;
  wire f_count1_carry_i_17_n_0;
  wire f_count1_carry_i_18_n_0;
  wire f_count1_carry_i_19_n_0;
  wire f_count1_carry_i_20_n_0;
  wire f_count1_carry_i_21_n_0;
  wire f_count1_carry_i_22_n_0;
  wire f_count1_carry_i_23_n_0;
  wire f_count1_carry_i_24_n_0;
  wire f_count1_carry_i_25_n_0;
  wire f_count1_carry_i_26_n_0;
  wire f_count1_carry_i_27_n_0;
  wire f_count1_carry_i_28_n_0;
  wire f_count1_carry_i_29_n_0;
  wire f_count1_carry_i_30_n_0;
  wire f_count1_carry_i_31_n_0;
  wire f_count1_carry_i_32_n_0;
  wire f_count1_carry_i_33_n_0;
  wire f_count1_carry_i_34_n_0;
  wire f_count1_carry_i_35_n_0;
  wire f_count1_carry_i_36_n_0;
  wire f_count1_carry_i_37_n_0;
  wire f_count1_carry_i_38_n_0;
  wire f_count1_carry_i_39_n_0;
  wire f_count1_carry_i_40_n_0;
  wire f_count1_carry_i_41_n_0;
  wire f_count1_carry_i_42_n_0;
  wire f_count1_carry_i_43_n_0;
  wire f_count1_carry_i_44_n_0;
  wire f_count1_carry_i_45_n_0;
  wire f_count1_carry_i_46_n_0;
  wire f_count1_carry_i_47_n_0;
  wire f_count1_carry_i_48_n_0;
  wire f_count1_carry_i_49_n_0;
  wire [0:0]\f_count_reg[8] ;
  wire [0:0]\f_count_reg[8]_0 ;
  wire [15:0]keys;
  wire \keys[10]_i_1_n_0 ;
  wire \keys[11]_i_1_n_0 ;
  wire \keys[12]_i_1_n_0 ;
  wire \keys[15]_i_2_n_0 ;
  wire \keys_reg[12]_0 ;
  wire \keys_reg[1]_0 ;
  wire \keys_reg[3]_0 ;
  wire \keys_reg[9]_0 ;
  wire onled;
  wire [3:0]row_IBUF;
  wire scan;

  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(\FSM_onehot_state[1]_i_2_n_0 ),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_state[1]_i_2 
       (.I0(\col_TRI[0] ),
        .O(\FSM_onehot_state[1]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(\FSM_onehot_state[2]_i_2_n_0 ),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(\col_TRI[1] ),
        .O(\FSM_onehot_state[2]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(\FSM_onehot_state[3]_i_2_n_0 ),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_state[3]_i_2 
       (.I0(\col_TRI[2] ),
        .O(\FSM_onehot_state[3]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(scan),
        .CLR(onled),
        .D(\col_TRI[3] ),
        .Q(\col_TRI[0] ));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(scan),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .PRE(onled),
        .Q(\col_TRI[1] ));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(scan),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .PRE(onled),
        .Q(\col_TRI[2] ));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(scan),
        .D(\FSM_onehot_state[3]_i_1_n_0 ),
        .PRE(onled),
        .Q(\col_TRI[3] ));
  clock_divider clkdiv
       (.E({clkdiv_n_1,clkdiv_n_2,clkdiv_n_3,clkdiv_n_4}),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .col1(col1),
        .\keys_reg[0] (\FSM_onehot_state[1]_i_2_n_0 ),
        .\keys_reg[2] (\FSM_onehot_state[2]_i_2_n_0 ),
        .\keys_reg[3] (\FSM_onehot_state[3]_i_2_n_0 ),
        .onled(onled),
        .scan(scan));
  LUT5 #(
    .INIT(32'hFFB0B000)) 
    f_count1_carry__0_i_1
       (.I0(f_count1_carry__0_i_3_n_0),
        .I1(f_count1_carry__0_i_4_n_0),
        .I2(Q[8]),
        .I3(f_count1_carry__0_i_5_n_0),
        .I4(Q[9]),
        .O(\f_count_reg[8] ));
  LUT6 #(
    .INIT(64'h0000000000000014)) 
    f_count1_carry__0_i_10
       (.I0(f_count1_carry__0_i_8_n_0),
        .I1(keys[3]),
        .I2(keys[2]),
        .I3(keys[1]),
        .I4(keys[0]),
        .I5(keys[12]),
        .O(f_count1_carry__0_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    f_count1_carry__0_i_11
       (.I0(f_count1_carry__0_i_8_n_0),
        .I1(f_count1_carry_i_29_n_0),
        .I2(keys[6]),
        .I3(keys[13]),
        .O(f_count1_carry__0_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'hE)) 
    f_count1_carry__0_i_12
       (.I0(keys[3]),
        .I1(keys[14]),
        .O(f_count1_carry__0_i_12_n_0));
  LUT4 #(
    .INIT(16'h6500)) 
    f_count1_carry__0_i_2
       (.I0(Q[8]),
        .I1(f_count1_carry__0_i_3_n_0),
        .I2(f_count1_carry__0_i_4_n_0),
        .I3(f_count1_carry__0_i_6_n_0),
        .O(\f_count_reg[8]_0 ));
  LUT6 #(
    .INIT(64'hFFFEFAEAFFFFFFFF)) 
    f_count1_carry__0_i_3
       (.I0(f_count1_carry__0_i_7_n_0),
        .I1(f_count1_carry__0_i_8_n_0),
        .I2(keys[4]),
        .I3(keys[6]),
        .I4(keys[5]),
        .I5(f_count1_carry_i_36_n_0),
        .O(f_count1_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h000000030003033E)) 
    f_count1_carry__0_i_4
       (.I0(f_count1_carry__0_i_9_n_0),
        .I1(keys[10]),
        .I2(keys[9]),
        .I3(keys[8]),
        .I4(keys[7]),
        .I5(keys[6]),
        .O(f_count1_carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFF0000FFFFFFEB)) 
    f_count1_carry__0_i_5
       (.I0(keys[12]),
        .I1(keys[1]),
        .I2(keys[0]),
        .I3(f_count1_carry_i_19_n_0),
        .I4(f_count1_carry_i_20_n_0),
        .I5(f_count1_carry__0_i_10_n_0),
        .O(f_count1_carry__0_i_5_n_0));
  LUT6 #(
    .INIT(64'h5555555955595995)) 
    f_count1_carry__0_i_6
       (.I0(Q[9]),
        .I1(f_count1_carry__0_i_11_n_0),
        .I2(keys[3]),
        .I3(keys[2]),
        .I4(keys[0]),
        .I5(keys[1]),
        .O(f_count1_carry__0_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    f_count1_carry__0_i_7
       (.I0(keys[11]),
        .I1(keys[13]),
        .I2(keys[15]),
        .I3(keys[12]),
        .I4(keys[2]),
        .I5(f_count1_carry__0_i_12_n_0),
        .O(f_count1_carry__0_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    f_count1_carry__0_i_8
       (.I0(keys[7]),
        .I1(keys[8]),
        .I2(keys[9]),
        .I3(keys[10]),
        .O(f_count1_carry__0_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h6)) 
    f_count1_carry__0_i_9
       (.I0(keys[5]),
        .I1(keys[4]),
        .O(f_count1_carry__0_i_9_n_0));
  LUT4 #(
    .INIT(16'hF880)) 
    f_count1_carry_i_1
       (.I0(\keys_reg[3]_0 ),
        .I1(Q[6]),
        .I2(Q[7]),
        .I3(\keys_reg[12]_0 ),
        .O(DI[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEEEEF0)) 
    f_count1_carry_i_10
       (.I0(keys[12]),
        .I1(f_count1_carry_i_20_n_0),
        .I2(f_count1_carry_i_24_n_0),
        .I3(keys[1]),
        .I4(keys[0]),
        .I5(f_count1_carry_i_19_n_0),
        .O(\keys_reg[12]_0 ));
  LUT6 #(
    .INIT(64'h0F0F0F0F0000000E)) 
    f_count1_carry_i_11
       (.I0(f_count1_carry_i_25_n_0),
        .I1(f_count1_carry_i_26_n_0),
        .I2(f_count1_carry_i_27_n_0),
        .I3(keys[1]),
        .I4(keys[2]),
        .I5(f_count1_carry_i_28_n_0),
        .O(\keys_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hE8E8FFE8FFFFFFFF)) 
    f_count1_carry_i_12
       (.I0(f_count1_carry_i_29_n_0),
        .I1(keys[9]),
        .I2(keys[7]),
        .I3(f_count1_carry_i_30_n_0),
        .I4(f_count1_carry_i_31_n_0),
        .I5(f_count1_carry_i_32_n_0),
        .O(\keys_reg[9]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFEFEEB)) 
    f_count1_carry_i_13
       (.I0(f_count1_carry_i_33_n_0),
        .I1(keys[6]),
        .I2(keys[13]),
        .I3(keys[5]),
        .I4(keys[15]),
        .I5(keys[8]),
        .O(f_count1_carry_i_13_n_0));
  LUT6 #(
    .INIT(64'hBBBBBBBABBBABAAB)) 
    f_count1_carry_i_14
       (.I0(f_count1_carry_i_34_n_0),
        .I1(f_count1_carry_i_35_n_0),
        .I2(keys[10]),
        .I3(keys[9]),
        .I4(keys[0]),
        .I5(keys[1]),
        .O(f_count1_carry_i_14_n_0));
  LUT6 #(
    .INIT(64'hFFFEFFFEFEE8FFFE)) 
    f_count1_carry_i_15
       (.I0(keys[5]),
        .I1(keys[11]),
        .I2(keys[8]),
        .I3(keys[6]),
        .I4(f_count1_carry_i_36_n_0),
        .I5(f_count1_carry_i_21_n_0),
        .O(f_count1_carry_i_15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h00000114)) 
    f_count1_carry_i_16
       (.I0(f_count1_carry_i_19_n_0),
        .I1(keys[12]),
        .I2(keys[0]),
        .I3(keys[1]),
        .I4(f_count1_carry_i_20_n_0),
        .O(f_count1_carry_i_16_n_0));
  LUT6 #(
    .INIT(64'h0002000200020A0A)) 
    f_count1_carry_i_17
       (.I0(f_count1_carry_i_37_n_0),
        .I1(f_count1_carry_i_38_n_0),
        .I2(keys[12]),
        .I3(f_count1_carry_i_39_n_0),
        .I4(f_count1_carry_i_40_n_0),
        .I5(keys[1]),
        .O(f_count1_carry_i_17_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h16)) 
    f_count1_carry_i_18
       (.I0(keys[12]),
        .I1(keys[0]),
        .I2(keys[1]),
        .O(f_count1_carry_i_18_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    f_count1_carry_i_19
       (.I0(keys[10]),
        .I1(keys[9]),
        .I2(keys[8]),
        .I3(keys[7]),
        .I4(keys[2]),
        .I5(keys[3]),
        .O(f_count1_carry_i_19_n_0));
  LUT4 #(
    .INIT(16'hF440)) 
    f_count1_carry_i_2
       (.I0(\keys_reg[1]_0 ),
        .I1(Q[4]),
        .I2(Q[5]),
        .I3(\keys_reg[9]_0 ),
        .O(DI[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    f_count1_carry_i_20
       (.I0(keys[5]),
        .I1(keys[15]),
        .I2(keys[14]),
        .I3(f_count1_carry_i_41_n_0),
        .I4(keys[4]),
        .I5(keys[11]),
        .O(f_count1_carry_i_20_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'hE)) 
    f_count1_carry_i_21
       (.I0(keys[10]),
        .I1(keys[9]),
        .O(f_count1_carry_i_21_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    f_count1_carry_i_22
       (.I0(keys[14]),
        .I1(keys[15]),
        .I2(keys[5]),
        .O(f_count1_carry_i_22_n_0));
  LUT6 #(
    .INIT(64'h000101100001011F)) 
    f_count1_carry_i_23
       (.I0(f_count1_carry_i_42_n_0),
        .I1(f_count1_carry_i_43_n_0),
        .I2(keys[13]),
        .I3(keys[7]),
        .I4(keys[8]),
        .I5(f_count1_carry_i_44_n_0),
        .O(f_count1_carry_i_23_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hFAAC)) 
    f_count1_carry_i_24
       (.I0(f_count1_carry_i_29_n_0),
        .I1(f_count1_carry_i_45_n_0),
        .I2(keys[6]),
        .I3(keys[13]),
        .O(f_count1_carry_i_24_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h00010100)) 
    f_count1_carry_i_25
       (.I0(keys[5]),
        .I1(keys[11]),
        .I2(keys[4]),
        .I3(keys[14]),
        .I4(keys[3]),
        .O(f_count1_carry_i_25_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h00000016)) 
    f_count1_carry_i_26
       (.I0(keys[11]),
        .I1(keys[4]),
        .I2(keys[5]),
        .I3(keys[14]),
        .I4(keys[3]),
        .O(f_count1_carry_i_26_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    f_count1_carry_i_27
       (.I0(f_count1_carry__0_i_8_n_0),
        .I1(keys[0]),
        .I2(keys[15]),
        .I3(keys[12]),
        .I4(keys[6]),
        .I5(keys[13]),
        .O(f_count1_carry_i_27_n_0));
  LUT6 #(
    .INIT(64'h0000000000000110)) 
    f_count1_carry_i_28
       (.I0(keys[14]),
        .I1(keys[3]),
        .I2(keys[1]),
        .I3(keys[2]),
        .I4(keys[5]),
        .I5(f_count1_carry_i_46_n_0),
        .O(f_count1_carry_i_28_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    f_count1_carry_i_29
       (.I0(keys[5]),
        .I1(keys[15]),
        .I2(keys[14]),
        .I3(keys[4]),
        .I4(keys[11]),
        .I5(keys[12]),
        .O(f_count1_carry_i_29_n_0));
  LUT5 #(
    .INIT(32'hFFF88880)) 
    f_count1_carry_i_3
       (.I0(f_count1_carry_i_13_n_0),
        .I1(Q[2]),
        .I2(f_count1_carry_i_14_n_0),
        .I3(f_count1_carry_i_15_n_0),
        .I4(Q[3]),
        .O(DI[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    f_count1_carry_i_30
       (.I0(f_count1_carry_i_22_n_0),
        .I1(f_count1_carry_i_41_n_0),
        .I2(f_count1_carry_i_46_n_0),
        .I3(f_count1_carry_i_19_n_0),
        .I4(keys[12]),
        .I5(keys[1]),
        .O(f_count1_carry_i_30_n_0));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    f_count1_carry_i_31
       (.I0(keys[10]),
        .I1(keys[8]),
        .I2(keys[3]),
        .I3(keys[2]),
        .I4(f_count1_carry_i_36_n_0),
        .I5(f_count1_carry_i_41_n_0),
        .O(f_count1_carry_i_31_n_0));
  LUT6 #(
    .INIT(64'hFFFFFF01FFFFFFFF)) 
    f_count1_carry_i_32
       (.I0(f_count1_carry_i_22_n_0),
        .I1(keys[12]),
        .I2(f_count1_carry_i_47_n_0),
        .I3(keys[9]),
        .I4(keys[7]),
        .I5(f_count1_carry_i_45_n_0),
        .O(f_count1_carry_i_32_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    f_count1_carry_i_33
       (.I0(f_count1_carry_i_39_n_0),
        .I1(keys[7]),
        .I2(f_count1_carry_i_36_n_0),
        .I3(keys[9]),
        .I4(keys[10]),
        .I5(f_count1_carry_i_42_n_0),
        .O(f_count1_carry_i_33_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    f_count1_carry_i_34
       (.I0(f_count1_carry_i_39_n_0),
        .I1(keys[7]),
        .I2(keys[13]),
        .I3(keys[15]),
        .I4(keys[12]),
        .I5(keys[4]),
        .O(f_count1_carry_i_34_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    f_count1_carry_i_35
       (.I0(keys[6]),
        .I1(keys[8]),
        .I2(keys[11]),
        .I3(keys[5]),
        .O(f_count1_carry_i_35_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h1)) 
    f_count1_carry_i_36
       (.I0(keys[0]),
        .I1(keys[1]),
        .O(f_count1_carry_i_36_n_0));
  LUT6 #(
    .INIT(64'h0005000500050FFD)) 
    f_count1_carry_i_37
       (.I0(f_count1_carry_i_48_n_0),
        .I1(keys[0]),
        .I2(keys[11]),
        .I3(keys[4]),
        .I4(f_count1_carry_i_49_n_0),
        .I5(f_count1_carry__0_i_8_n_0),
        .O(f_count1_carry_i_37_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    f_count1_carry_i_38
       (.I0(keys[13]),
        .I1(keys[6]),
        .I2(keys[1]),
        .I3(keys[0]),
        .O(f_count1_carry_i_38_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    f_count1_carry_i_39
       (.I0(keys[2]),
        .I1(keys[14]),
        .I2(keys[3]),
        .O(f_count1_carry_i_39_n_0));
  LUT4 #(
    .INIT(16'h40F4)) 
    f_count1_carry_i_4
       (.I0(f_count1_carry_i_16_n_0),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(f_count1_carry_i_17_n_0),
        .O(DI[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    f_count1_carry_i_40
       (.I0(f_count1_carry_i_19_n_0),
        .I1(keys[11]),
        .I2(keys[4]),
        .I3(keys[13]),
        .I4(keys[6]),
        .I5(f_count1_carry_i_22_n_0),
        .O(f_count1_carry_i_40_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'hE)) 
    f_count1_carry_i_41
       (.I0(keys[6]),
        .I1(keys[13]),
        .O(f_count1_carry_i_41_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    f_count1_carry_i_42
       (.I0(keys[12]),
        .I1(keys[11]),
        .I2(keys[4]),
        .O(f_count1_carry_i_42_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'hE)) 
    f_count1_carry_i_43
       (.I0(keys[2]),
        .I1(keys[0]),
        .O(f_count1_carry_i_43_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hFFFEFEE9)) 
    f_count1_carry_i_44
       (.I0(keys[2]),
        .I1(keys[0]),
        .I2(keys[12]),
        .I3(keys[4]),
        .I4(keys[11]),
        .O(f_count1_carry_i_44_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFEFEE9)) 
    f_count1_carry_i_45
       (.I0(keys[12]),
        .I1(keys[11]),
        .I2(keys[4]),
        .I3(keys[14]),
        .I4(keys[5]),
        .I5(keys[15]),
        .O(f_count1_carry_i_45_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'hE)) 
    f_count1_carry_i_46
       (.I0(keys[4]),
        .I1(keys[11]),
        .O(f_count1_carry_i_46_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'hB)) 
    f_count1_carry_i_47
       (.I0(keys[11]),
        .I1(keys[0]),
        .O(f_count1_carry_i_47_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFEFEE9)) 
    f_count1_carry_i_48
       (.I0(keys[7]),
        .I1(keys[8]),
        .I2(keys[9]),
        .I3(keys[10]),
        .I4(keys[5]),
        .I5(keys[15]),
        .O(f_count1_carry_i_48_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'hE)) 
    f_count1_carry_i_49
       (.I0(keys[5]),
        .I1(keys[15]),
        .O(f_count1_carry_i_49_n_0));
  LUT5 #(
    .INIT(32'h06060660)) 
    f_count1_carry_i_7
       (.I0(Q[2]),
        .I1(f_count1_carry_i_13_n_0),
        .I2(Q[3]),
        .I3(f_count1_carry_i_14_n_0),
        .I4(f_count1_carry_i_15_n_0),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h0909090909099009)) 
    f_count1_carry_i_8
       (.I0(f_count1_carry_i_17_n_0),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(f_count1_carry_i_18_n_0),
        .I4(f_count1_carry_i_19_n_0),
        .I5(f_count1_carry_i_20_n_0),
        .O(S[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    f_count1_carry_i_9
       (.I0(f_count1_carry_i_21_n_0),
        .I1(keys[3]),
        .I2(keys[6]),
        .I3(keys[1]),
        .I4(f_count1_carry_i_22_n_0),
        .I5(f_count1_carry_i_23_n_0),
        .O(\keys_reg[3]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \keys[10]_i_1 
       (.I0(row_IBUF[0]),
        .O(\keys[10]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \keys[11]_i_1 
       (.I0(row_IBUF[1]),
        .O(\keys[11]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \keys[12]_i_1 
       (.I0(row_IBUF[2]),
        .O(\keys[12]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \keys[13]_i_2 
       (.I0(\col_TRI[3] ),
        .O(col1));
  LUT1 #(
    .INIT(2'h1)) 
    \keys[15]_i_2 
       (.I0(row_IBUF[3]),
        .O(\keys[15]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_4),
        .CLR(onled),
        .D(\keys[15]_i_2_n_0 ),
        .Q(keys[0]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_3),
        .CLR(onled),
        .D(\keys[10]_i_1_n_0 ),
        .Q(keys[10]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_3),
        .CLR(onled),
        .D(\keys[11]_i_1_n_0 ),
        .Q(keys[11]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_3),
        .CLR(onled),
        .D(\keys[12]_i_1_n_0 ),
        .Q(keys[12]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_3),
        .CLR(onled),
        .D(\keys[15]_i_2_n_0 ),
        .Q(keys[13]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_2),
        .CLR(onled),
        .D(\keys[15]_i_2_n_0 ),
        .Q(keys[14]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_1),
        .CLR(onled),
        .D(\keys[15]_i_2_n_0 ),
        .Q(keys[15]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_4),
        .CLR(onled),
        .D(\keys[10]_i_1_n_0 ),
        .Q(keys[1]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_1),
        .CLR(onled),
        .D(\keys[10]_i_1_n_0 ),
        .Q(keys[2]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_2),
        .CLR(onled),
        .D(\keys[10]_i_1_n_0 ),
        .Q(keys[3]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_4),
        .CLR(onled),
        .D(\keys[11]_i_1_n_0 ),
        .Q(keys[4]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_1),
        .CLR(onled),
        .D(\keys[11]_i_1_n_0 ),
        .Q(keys[5]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_2),
        .CLR(onled),
        .D(\keys[11]_i_1_n_0 ),
        .Q(keys[6]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_4),
        .CLR(onled),
        .D(\keys[12]_i_1_n_0 ),
        .Q(keys[7]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_1),
        .CLR(onled),
        .D(\keys[12]_i_1_n_0 ),
        .Q(keys[8]));
  FDCE #(
    .INIT(1'b0)) 
    \keys_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(clkdiv_n_2),
        .CLR(onled),
        .D(\keys[12]_i_1_n_0 ),
        .Q(keys[9]));
endmodule

module pwm
   (LED_OBUF,
    onled,
    Q,
    clk_IBUF_BUFG);
  output [0:0]LED_OBUF;
  input onled;
  input [7:0]Q;
  input clk_IBUF_BUFG;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]LED_OBUF;
  wire [0:0]LEDwire;
  wire [7:0]Q;
  wire clk_IBUF_BUFG;
  wire \clk_count[0]_i_1_n_0 ;
  wire \clk_count[7]_i_2_n_0 ;
  wire [7:0]clk_count_reg;
  wire onled;
  wire [7:1]p_0_in__0;
  wire sout0_carry_i_1__0_n_0;
  wire sout0_carry_i_2__0_n_0;
  wire sout0_carry_i_3__0_n_0;
  wire sout0_carry_i_4__0_n_0;
  wire sout0_carry_i_5__0_n_0;
  wire sout0_carry_i_6__0_n_0;
  wire sout0_carry_i_7__0_n_0;
  wire sout0_carry_i_8__0_n_0;
  wire sout0_carry_n_1;
  wire sout0_carry_n_2;
  wire sout0_carry_n_3;

  GND GND
       (.G(\<const0> ));
  LUT2 #(
    .INIT(4'h2)) 
    \LED_OBUF[15]_inst_i_1 
       (.I0(LEDwire),
        .I1(onled),
        .O(LED_OBUF));
  VCC VCC
       (.P(\<const1> ));
  LUT1 #(
    .INIT(2'h1)) 
    \clk_count[0]_i_1 
       (.I0(clk_count_reg[0]),
        .O(\clk_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \clk_count[1]_i_1 
       (.I0(clk_count_reg[0]),
        .I1(clk_count_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \clk_count[2]_i_1 
       (.I0(clk_count_reg[2]),
        .I1(clk_count_reg[1]),
        .I2(clk_count_reg[0]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \clk_count[3]_i_1 
       (.I0(clk_count_reg[3]),
        .I1(clk_count_reg[0]),
        .I2(clk_count_reg[1]),
        .I3(clk_count_reg[2]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \clk_count[4]_i_1 
       (.I0(clk_count_reg[4]),
        .I1(clk_count_reg[2]),
        .I2(clk_count_reg[1]),
        .I3(clk_count_reg[0]),
        .I4(clk_count_reg[3]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \clk_count[5]_i_1 
       (.I0(clk_count_reg[5]),
        .I1(clk_count_reg[3]),
        .I2(clk_count_reg[0]),
        .I3(clk_count_reg[1]),
        .I4(clk_count_reg[2]),
        .I5(clk_count_reg[4]),
        .O(p_0_in__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \clk_count[6]_i_1 
       (.I0(clk_count_reg[6]),
        .I1(\clk_count[7]_i_2_n_0 ),
        .O(p_0_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \clk_count[7]_i_1 
       (.I0(clk_count_reg[7]),
        .I1(\clk_count[7]_i_2_n_0 ),
        .I2(clk_count_reg[6]),
        .O(p_0_in__0[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \clk_count[7]_i_2 
       (.I0(clk_count_reg[5]),
        .I1(clk_count_reg[3]),
        .I2(clk_count_reg[0]),
        .I3(clk_count_reg[1]),
        .I4(clk_count_reg[2]),
        .I5(clk_count_reg[4]),
        .O(\clk_count[7]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(\clk_count[0]_i_1_n_0 ),
        .Q(clk_count_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_0_in__0[1]),
        .Q(clk_count_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_0_in__0[2]),
        .Q(clk_count_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_0_in__0[3]),
        .Q(clk_count_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_0_in__0[4]),
        .Q(clk_count_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_0_in__0[5]),
        .Q(clk_count_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_0_in__0[6]),
        .Q(clk_count_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_0_in__0[7]),
        .Q(clk_count_reg[7]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 sout0_carry
       (.CI(\<const0> ),
        .CO({LEDwire,sout0_carry_n_1,sout0_carry_n_2,sout0_carry_n_3}),
        .CYINIT(\<const0> ),
        .DI({sout0_carry_i_1__0_n_0,sout0_carry_i_2__0_n_0,sout0_carry_i_3__0_n_0,sout0_carry_i_4__0_n_0}),
        .S({sout0_carry_i_5__0_n_0,sout0_carry_i_6__0_n_0,sout0_carry_i_7__0_n_0,sout0_carry_i_8__0_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    sout0_carry_i_1__0
       (.I0(Q[6]),
        .I1(clk_count_reg[6]),
        .I2(clk_count_reg[7]),
        .I3(Q[7]),
        .O(sout0_carry_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    sout0_carry_i_2__0
       (.I0(Q[4]),
        .I1(clk_count_reg[4]),
        .I2(clk_count_reg[5]),
        .I3(Q[5]),
        .O(sout0_carry_i_2__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    sout0_carry_i_3__0
       (.I0(Q[2]),
        .I1(clk_count_reg[2]),
        .I2(clk_count_reg[3]),
        .I3(Q[3]),
        .O(sout0_carry_i_3__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    sout0_carry_i_4__0
       (.I0(Q[0]),
        .I1(clk_count_reg[0]),
        .I2(clk_count_reg[1]),
        .I3(Q[1]),
        .O(sout0_carry_i_4__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sout0_carry_i_5__0
       (.I0(clk_count_reg[6]),
        .I1(Q[6]),
        .I2(clk_count_reg[7]),
        .I3(Q[7]),
        .O(sout0_carry_i_5__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sout0_carry_i_6__0
       (.I0(clk_count_reg[4]),
        .I1(Q[4]),
        .I2(clk_count_reg[5]),
        .I3(Q[5]),
        .O(sout0_carry_i_6__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sout0_carry_i_7__0
       (.I0(clk_count_reg[2]),
        .I1(Q[2]),
        .I2(clk_count_reg[3]),
        .I3(Q[3]),
        .O(sout0_carry_i_7__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sout0_carry_i_8__0
       (.I0(clk_count_reg[0]),
        .I1(Q[0]),
        .I2(clk_count_reg[1]),
        .I3(Q[1]),
        .O(sout0_carry_i_8__0_n_0));
endmodule

module pwm_audio
   (AIN_OBUF,
    Q,
    onled,
    DI,
    S,
    \f_count_reg[0]_0 ,
    \f_count_reg[0]_1 ,
    clk_IBUF_BUFG,
    f_count1_carry_0,
    f_count1_carry_1,
    f_count1_carry_2,
    f_count1_carry_3,
    volume_IBUF);
  output AIN_OBUF;
  output [9:0]Q;
  input onled;
  input [3:0]DI;
  input [1:0]S;
  input [0:0]\f_count_reg[0]_0 ;
  input [0:0]\f_count_reg[0]_1 ;
  input clk_IBUF_BUFG;
  input f_count1_carry_0;
  input f_count1_carry_1;
  input f_count1_carry_2;
  input f_count1_carry_3;
  input [7:0]volume_IBUF;

  wire \<const0> ;
  wire \<const1> ;
  wire AIN_OBUF;
  wire [3:0]DI;
  wire [9:0]Q;
  wire [1:0]S;
  wire clk_IBUF_BUFG;
  wire \dc_count[0]_i_1_n_0 ;
  wire \dc_count[7]_i_2_n_0 ;
  wire [7:0]dc_count_reg;
  wire f_clk_i_1_n_0;
  wire f_clk_reg_n_0;
  wire f_count1_carry_0;
  wire f_count1_carry_1;
  wire f_count1_carry_2;
  wire f_count1_carry_3;
  wire f_count1_carry__0_n_3;
  wire f_count1_carry_i_5_n_0;
  wire f_count1_carry_i_6_n_0;
  wire f_count1_carry_n_0;
  wire f_count1_carry_n_1;
  wire f_count1_carry_n_2;
  wire f_count1_carry_n_3;
  wire \f_count[5]_i_2_n_0 ;
  wire \f_count[9]_i_2_n_0 ;
  wire [0:0]\f_count_reg[0]_0 ;
  wire [0:0]\f_count_reg[0]_1 ;
  wire onled;
  wire [7:1]p_0_in;
  wire [9:0]p_2_in;
  wire sout;
  wire sout0_carry_i_1_n_0;
  wire sout0_carry_i_2_n_0;
  wire sout0_carry_i_3_n_0;
  wire sout0_carry_i_4_n_0;
  wire sout0_carry_i_5_n_0;
  wire sout0_carry_i_6_n_0;
  wire sout0_carry_i_7_n_0;
  wire sout0_carry_i_8_n_0;
  wire sout0_carry_n_0;
  wire sout0_carry_n_1;
  wire sout0_carry_n_2;
  wire sout0_carry_n_3;
  wire [7:0]volume_IBUF;

  LUT2 #(
    .INIT(4'h2)) 
    AIN_OBUF_inst_i_1
       (.I0(sout),
        .I1(onled),
        .O(AIN_OBUF));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT1 #(
    .INIT(2'h1)) 
    \dc_count[0]_i_1 
       (.I0(dc_count_reg[0]),
        .O(\dc_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \dc_count[1]_i_1 
       (.I0(dc_count_reg[0]),
        .I1(dc_count_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \dc_count[2]_i_1 
       (.I0(dc_count_reg[2]),
        .I1(dc_count_reg[1]),
        .I2(dc_count_reg[0]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \dc_count[3]_i_1 
       (.I0(dc_count_reg[3]),
        .I1(dc_count_reg[0]),
        .I2(dc_count_reg[1]),
        .I3(dc_count_reg[2]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \dc_count[4]_i_1 
       (.I0(dc_count_reg[4]),
        .I1(dc_count_reg[2]),
        .I2(dc_count_reg[1]),
        .I3(dc_count_reg[0]),
        .I4(dc_count_reg[3]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \dc_count[5]_i_1 
       (.I0(dc_count_reg[5]),
        .I1(dc_count_reg[3]),
        .I2(dc_count_reg[0]),
        .I3(dc_count_reg[1]),
        .I4(dc_count_reg[2]),
        .I5(dc_count_reg[4]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \dc_count[6]_i_1 
       (.I0(dc_count_reg[6]),
        .I1(\dc_count[7]_i_2_n_0 ),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \dc_count[7]_i_1 
       (.I0(dc_count_reg[7]),
        .I1(\dc_count[7]_i_2_n_0 ),
        .I2(dc_count_reg[6]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \dc_count[7]_i_2 
       (.I0(dc_count_reg[5]),
        .I1(dc_count_reg[3]),
        .I2(dc_count_reg[0]),
        .I3(dc_count_reg[1]),
        .I4(dc_count_reg[2]),
        .I5(dc_count_reg[4]),
        .O(\dc_count[7]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \dc_count_reg[0] 
       (.C(f_clk_reg_n_0),
        .CE(\<const1> ),
        .CLR(onled),
        .D(\dc_count[0]_i_1_n_0 ),
        .Q(dc_count_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \dc_count_reg[1] 
       (.C(f_clk_reg_n_0),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_0_in[1]),
        .Q(dc_count_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \dc_count_reg[2] 
       (.C(f_clk_reg_n_0),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_0_in[2]),
        .Q(dc_count_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \dc_count_reg[3] 
       (.C(f_clk_reg_n_0),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_0_in[3]),
        .Q(dc_count_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \dc_count_reg[4] 
       (.C(f_clk_reg_n_0),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_0_in[4]),
        .Q(dc_count_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \dc_count_reg[5] 
       (.C(f_clk_reg_n_0),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_0_in[5]),
        .Q(dc_count_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \dc_count_reg[6] 
       (.C(f_clk_reg_n_0),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_0_in[6]),
        .Q(dc_count_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \dc_count_reg[7] 
       (.C(f_clk_reg_n_0),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_0_in[7]),
        .Q(dc_count_reg[7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    f_clk_i_1
       (.I0(f_count1_carry__0_n_3),
        .I1(f_clk_reg_n_0),
        .O(f_clk_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    f_clk_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(f_clk_i_1_n_0),
        .Q(f_clk_reg_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 f_count1_carry
       (.CI(\<const0> ),
        .CO({f_count1_carry_n_0,f_count1_carry_n_1,f_count1_carry_n_2,f_count1_carry_n_3}),
        .CYINIT(\<const1> ),
        .DI(DI),
        .S({f_count1_carry_i_5_n_0,f_count1_carry_i_6_n_0,S}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 f_count1_carry__0
       (.CI(f_count1_carry_n_0),
        .CO(f_count1_carry__0_n_3),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\f_count_reg[0]_0 }),
        .S({\<const0> ,\<const0> ,\<const0> ,\f_count_reg[0]_1 }));
  LUT4 #(
    .INIT(16'h0660)) 
    f_count1_carry_i_5
       (.I0(Q[6]),
        .I1(f_count1_carry_2),
        .I2(Q[7]),
        .I3(f_count1_carry_3),
        .O(f_count1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h0990)) 
    f_count1_carry_i_6
       (.I0(Q[4]),
        .I1(f_count1_carry_0),
        .I2(Q[5]),
        .I3(f_count1_carry_1),
        .O(f_count1_carry_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \f_count[0]_i_1 
       (.I0(f_count1_carry__0_n_3),
        .I1(Q[0]),
        .O(p_2_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \f_count[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(f_count1_carry__0_n_3),
        .O(p_2_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0078)) 
    \f_count[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(f_count1_carry__0_n_3),
        .O(p_2_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00007F80)) 
    \f_count[3]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(f_count1_carry__0_n_3),
        .O(p_2_in[3]));
  LUT6 #(
    .INIT(64'h000000007FFF8000)) 
    \f_count[4]_i_1 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(f_count1_carry__0_n_3),
        .O(p_2_in[4]));
  LUT6 #(
    .INIT(64'h00000000F7FF0800)) 
    \f_count[5]_i_1 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(\f_count[5]_i_2_n_0 ),
        .I3(Q[3]),
        .I4(Q[5]),
        .I5(f_count1_carry__0_n_3),
        .O(p_2_in[5]));
  LUT2 #(
    .INIT(4'h7)) 
    \f_count[5]_i_2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\f_count[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h09)) 
    \f_count[6]_i_1 
       (.I0(\f_count[9]_i_2_n_0 ),
        .I1(Q[6]),
        .I2(f_count1_carry__0_n_3),
        .O(p_2_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h4510)) 
    \f_count[7]_i_1 
       (.I0(f_count1_carry__0_n_3),
        .I1(\f_count[9]_i_2_n_0 ),
        .I2(Q[6]),
        .I3(Q[7]),
        .O(p_2_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h44441444)) 
    \f_count[8]_i_1 
       (.I0(f_count1_carry__0_n_3),
        .I1(Q[8]),
        .I2(Q[7]),
        .I3(Q[6]),
        .I4(\f_count[9]_i_2_n_0 ),
        .O(p_2_in[8]));
  LUT6 #(
    .INIT(64'h00000000BFFF4000)) 
    \f_count[9]_i_1 
       (.I0(\f_count[9]_i_2_n_0 ),
        .I1(Q[6]),
        .I2(Q[7]),
        .I3(Q[8]),
        .I4(Q[9]),
        .I5(f_count1_carry__0_n_3),
        .O(p_2_in[9]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \f_count[9]_i_2 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\f_count[9]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \f_count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_2_in[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \f_count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_2_in[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \f_count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_2_in[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \f_count_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_2_in[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \f_count_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_2_in[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \f_count_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_2_in[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \f_count_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_2_in[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \f_count_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_2_in[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \f_count_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_2_in[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \f_count_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(onled),
        .D(p_2_in[9]),
        .Q(Q[9]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 sout0_carry
       (.CI(\<const0> ),
        .CO({sout0_carry_n_0,sout0_carry_n_1,sout0_carry_n_2,sout0_carry_n_3}),
        .CYINIT(\<const0> ),
        .DI({sout0_carry_i_1_n_0,sout0_carry_i_2_n_0,sout0_carry_i_3_n_0,sout0_carry_i_4_n_0}),
        .S({sout0_carry_i_5_n_0,sout0_carry_i_6_n_0,sout0_carry_i_7_n_0,sout0_carry_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    sout0_carry_i_1
       (.I0(volume_IBUF[6]),
        .I1(dc_count_reg[6]),
        .I2(dc_count_reg[7]),
        .I3(volume_IBUF[7]),
        .O(sout0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    sout0_carry_i_2
       (.I0(volume_IBUF[4]),
        .I1(dc_count_reg[4]),
        .I2(dc_count_reg[5]),
        .I3(volume_IBUF[5]),
        .O(sout0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    sout0_carry_i_3
       (.I0(volume_IBUF[2]),
        .I1(dc_count_reg[2]),
        .I2(dc_count_reg[3]),
        .I3(volume_IBUF[3]),
        .O(sout0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    sout0_carry_i_4
       (.I0(volume_IBUF[0]),
        .I1(dc_count_reg[0]),
        .I2(dc_count_reg[1]),
        .I3(volume_IBUF[1]),
        .O(sout0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sout0_carry_i_5
       (.I0(dc_count_reg[6]),
        .I1(volume_IBUF[6]),
        .I2(dc_count_reg[7]),
        .I3(volume_IBUF[7]),
        .O(sout0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sout0_carry_i_6
       (.I0(dc_count_reg[4]),
        .I1(volume_IBUF[4]),
        .I2(dc_count_reg[5]),
        .I3(volume_IBUF[5]),
        .O(sout0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sout0_carry_i_7
       (.I0(dc_count_reg[2]),
        .I1(volume_IBUF[2]),
        .I2(dc_count_reg[3]),
        .I3(volume_IBUF[3]),
        .O(sout0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    sout0_carry_i_8
       (.I0(dc_count_reg[0]),
        .I1(volume_IBUF[0]),
        .I2(dc_count_reg[1]),
        .I3(volume_IBUF[1]),
        .O(sout0_carry_i_8_n_0));
  FDCE #(
    .INIT(1'b0)) 
    sout_reg
       (.C(f_clk_reg_n_0),
        .CE(\<const1> ),
        .CLR(onled),
        .D(sout0_carry_n_0),
        .Q(sout));
endmodule

module tcounter
   (\FSM_sequential_state_reg[1] ,
    clear_reg,
    clk_IBUF_BUFG,
    \FSM_sequential_state_reg[1]_0 ,
    rst_IBUF,
    state,
    db_rst);
  output \FSM_sequential_state_reg[1] ;
  output clear_reg;
  input clk_IBUF_BUFG;
  input \FSM_sequential_state_reg[1]_0 ;
  input rst_IBUF;
  input [1:0]state;
  input db_rst;

  wire \<const0> ;
  wire \<const1> ;
  wire \FSM_sequential_state_reg[1] ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire clear_reg;
  wire clk_IBUF_BUFG;
  wire \clk_count[0]_i_10_n_0 ;
  wire \clk_count[0]_i_11_n_0 ;
  wire \clk_count[0]_i_12_n_0 ;
  wire \clk_count[0]_i_13_n_0 ;
  wire \clk_count[0]_i_14_n_0 ;
  wire \clk_count[0]_i_15_n_0 ;
  wire \clk_count[0]_i_1__1_n_0 ;
  wire \clk_count[0]_i_3_n_0 ;
  wire \clk_count[0]_i_4_n_0 ;
  wire \clk_count[0]_i_5_n_0 ;
  wire \clk_count[0]_i_6_n_0 ;
  wire \clk_count[0]_i_7_n_0 ;
  wire \clk_count[0]_i_8_n_0 ;
  wire \clk_count[0]_i_9_n_0 ;
  wire \clk_count[12]_i_2_n_0 ;
  wire \clk_count[12]_i_3_n_0 ;
  wire \clk_count[12]_i_4_n_0 ;
  wire \clk_count[12]_i_5_n_0 ;
  wire \clk_count[16]_i_2_n_0 ;
  wire \clk_count[16]_i_3_n_0 ;
  wire \clk_count[16]_i_4_n_0 ;
  wire \clk_count[16]_i_5_n_0 ;
  wire \clk_count[20]_i_2_n_0 ;
  wire \clk_count[20]_i_3_n_0 ;
  wire \clk_count[20]_i_4_n_0 ;
  wire \clk_count[20]_i_5_n_0 ;
  wire \clk_count[24]_i_2_n_0 ;
  wire \clk_count[24]_i_3_n_0 ;
  wire \clk_count[24]_i_4_n_0 ;
  wire \clk_count[24]_i_5_n_0 ;
  wire \clk_count[28]_i_2_n_0 ;
  wire \clk_count[28]_i_3_n_0 ;
  wire \clk_count[28]_i_4_n_0 ;
  wire \clk_count[28]_i_5_n_0 ;
  wire \clk_count[4]_i_2_n_0 ;
  wire \clk_count[4]_i_3_n_0 ;
  wire \clk_count[4]_i_4_n_0 ;
  wire \clk_count[4]_i_5_n_0 ;
  wire \clk_count[8]_i_2_n_0 ;
  wire \clk_count[8]_i_3_n_0 ;
  wire \clk_count[8]_i_4_n_0 ;
  wire \clk_count[8]_i_5_n_0 ;
  wire \clk_count_reg[0]_i_2_n_0 ;
  wire \clk_count_reg[0]_i_2_n_1 ;
  wire \clk_count_reg[0]_i_2_n_2 ;
  wire \clk_count_reg[0]_i_2_n_3 ;
  wire \clk_count_reg[0]_i_2_n_4 ;
  wire \clk_count_reg[0]_i_2_n_5 ;
  wire \clk_count_reg[0]_i_2_n_6 ;
  wire \clk_count_reg[0]_i_2_n_7 ;
  wire \clk_count_reg[12]_i_1_n_0 ;
  wire \clk_count_reg[12]_i_1_n_1 ;
  wire \clk_count_reg[12]_i_1_n_2 ;
  wire \clk_count_reg[12]_i_1_n_3 ;
  wire \clk_count_reg[12]_i_1_n_4 ;
  wire \clk_count_reg[12]_i_1_n_5 ;
  wire \clk_count_reg[12]_i_1_n_6 ;
  wire \clk_count_reg[12]_i_1_n_7 ;
  wire \clk_count_reg[16]_i_1_n_0 ;
  wire \clk_count_reg[16]_i_1_n_1 ;
  wire \clk_count_reg[16]_i_1_n_2 ;
  wire \clk_count_reg[16]_i_1_n_3 ;
  wire \clk_count_reg[16]_i_1_n_4 ;
  wire \clk_count_reg[16]_i_1_n_5 ;
  wire \clk_count_reg[16]_i_1_n_6 ;
  wire \clk_count_reg[16]_i_1_n_7 ;
  wire \clk_count_reg[20]_i_1_n_0 ;
  wire \clk_count_reg[20]_i_1_n_1 ;
  wire \clk_count_reg[20]_i_1_n_2 ;
  wire \clk_count_reg[20]_i_1_n_3 ;
  wire \clk_count_reg[20]_i_1_n_4 ;
  wire \clk_count_reg[20]_i_1_n_5 ;
  wire \clk_count_reg[20]_i_1_n_6 ;
  wire \clk_count_reg[20]_i_1_n_7 ;
  wire \clk_count_reg[24]_i_1_n_0 ;
  wire \clk_count_reg[24]_i_1_n_1 ;
  wire \clk_count_reg[24]_i_1_n_2 ;
  wire \clk_count_reg[24]_i_1_n_3 ;
  wire \clk_count_reg[24]_i_1_n_4 ;
  wire \clk_count_reg[24]_i_1_n_5 ;
  wire \clk_count_reg[24]_i_1_n_6 ;
  wire \clk_count_reg[24]_i_1_n_7 ;
  wire \clk_count_reg[28]_i_1_n_1 ;
  wire \clk_count_reg[28]_i_1_n_2 ;
  wire \clk_count_reg[28]_i_1_n_3 ;
  wire \clk_count_reg[28]_i_1_n_4 ;
  wire \clk_count_reg[28]_i_1_n_5 ;
  wire \clk_count_reg[28]_i_1_n_6 ;
  wire \clk_count_reg[28]_i_1_n_7 ;
  wire \clk_count_reg[4]_i_1_n_0 ;
  wire \clk_count_reg[4]_i_1_n_1 ;
  wire \clk_count_reg[4]_i_1_n_2 ;
  wire \clk_count_reg[4]_i_1_n_3 ;
  wire \clk_count_reg[4]_i_1_n_4 ;
  wire \clk_count_reg[4]_i_1_n_5 ;
  wire \clk_count_reg[4]_i_1_n_6 ;
  wire \clk_count_reg[4]_i_1_n_7 ;
  wire \clk_count_reg[8]_i_1_n_0 ;
  wire \clk_count_reg[8]_i_1_n_1 ;
  wire \clk_count_reg[8]_i_1_n_2 ;
  wire \clk_count_reg[8]_i_1_n_3 ;
  wire \clk_count_reg[8]_i_1_n_4 ;
  wire \clk_count_reg[8]_i_1_n_5 ;
  wire \clk_count_reg[8]_i_1_n_6 ;
  wire \clk_count_reg[8]_i_1_n_7 ;
  wire db_rst;
  wire done_i_1_n_0;
  wire rst_IBUF;
  wire [31:0]sel0;
  wire [1:0]state;
  wire t;

  LUT5 #(
    .INIT(32'hFF0CBB00)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state_reg[1]_0 ),
        .I1(t),
        .I2(rst_IBUF),
        .I3(state[1]),
        .I4(state[0]),
        .O(clear_reg));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT5 #(
    .INIT(32'hFF001000)) 
    btn_db_i_1
       (.I0(rst_IBUF),
        .I1(state[1]),
        .I2(t),
        .I3(state[0]),
        .I4(db_rst),
        .O(\FSM_sequential_state_reg[1] ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[0]_i_10 
       (.I0(sel0[1]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \clk_count[0]_i_11 
       (.I0(sel0[0]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \clk_count[0]_i_12 
       (.I0(sel0[13]),
        .I1(sel0[8]),
        .I2(sel0[22]),
        .I3(sel0[12]),
        .O(\clk_count[0]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \clk_count[0]_i_13 
       (.I0(sel0[30]),
        .I1(sel0[18]),
        .I2(sel0[28]),
        .I3(sel0[26]),
        .O(\clk_count[0]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \clk_count[0]_i_14 
       (.I0(sel0[24]),
        .I1(sel0[10]),
        .I2(sel0[6]),
        .I3(sel0[21]),
        .O(\clk_count[0]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \clk_count[0]_i_15 
       (.I0(sel0[7]),
        .I1(sel0[4]),
        .I2(sel0[5]),
        .I3(sel0[31]),
        .O(\clk_count[0]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \clk_count[0]_i_1__1 
       (.I0(\clk_count[0]_i_3_n_0 ),
        .I1(\clk_count[0]_i_4_n_0 ),
        .I2(\clk_count[0]_i_5_n_0 ),
        .I3(\clk_count[0]_i_6_n_0 ),
        .I4(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \clk_count[0]_i_3 
       (.I0(sel0[17]),
        .I1(sel0[20]),
        .I2(sel0[15]),
        .I3(sel0[23]),
        .I4(\clk_count[0]_i_12_n_0 ),
        .O(\clk_count[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \clk_count[0]_i_4 
       (.I0(sel0[3]),
        .I1(sel0[14]),
        .I2(sel0[1]),
        .I3(sel0[29]),
        .I4(\clk_count[0]_i_13_n_0 ),
        .O(\clk_count[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \clk_count[0]_i_5 
       (.I0(sel0[0]),
        .I1(sel0[19]),
        .I2(sel0[11]),
        .I3(sel0[27]),
        .I4(\clk_count[0]_i_14_n_0 ),
        .O(\clk_count[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \clk_count[0]_i_6 
       (.I0(sel0[9]),
        .I1(sel0[16]),
        .I2(sel0[25]),
        .I3(sel0[2]),
        .I4(\clk_count[0]_i_15_n_0 ),
        .O(\clk_count[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[0]_i_7 
       (.I0(sel0[0]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[0]_i_8 
       (.I0(sel0[3]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[0]_i_9 
       (.I0(sel0[2]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[12]_i_2 
       (.I0(sel0[15]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[12]_i_3 
       (.I0(sel0[14]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[12]_i_4 
       (.I0(sel0[13]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[12]_i_5 
       (.I0(sel0[12]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[16]_i_2 
       (.I0(sel0[19]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[16]_i_3 
       (.I0(sel0[18]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[16]_i_4 
       (.I0(sel0[17]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[16]_i_5 
       (.I0(sel0[16]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[20]_i_2 
       (.I0(sel0[23]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[20]_i_3 
       (.I0(sel0[22]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[20]_i_4 
       (.I0(sel0[21]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[20]_i_5 
       (.I0(sel0[20]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[24]_i_2 
       (.I0(sel0[27]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[24]_i_3 
       (.I0(sel0[26]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[24]_i_4 
       (.I0(sel0[25]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[24]_i_5 
       (.I0(sel0[24]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[28]_i_2 
       (.I0(sel0[31]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[28]_i_3 
       (.I0(sel0[30]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[28]_i_4 
       (.I0(sel0[29]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[28]_i_5 
       (.I0(sel0[28]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[4]_i_2 
       (.I0(sel0[7]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[4]_i_3 
       (.I0(sel0[6]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[4]_i_4 
       (.I0(sel0[5]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[4]_i_5 
       (.I0(sel0[4]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[8]_i_2 
       (.I0(sel0[11]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[8]_i_3 
       (.I0(sel0[10]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[8]_i_4 
       (.I0(sel0[9]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[8]_i_5 
       (.I0(sel0[8]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[8]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[0]_i_2_n_7 ),
        .Q(sel0[0]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \clk_count_reg[0]_i_2 
       (.CI(\<const0> ),
        .CO({\clk_count_reg[0]_i_2_n_0 ,\clk_count_reg[0]_i_2_n_1 ,\clk_count_reg[0]_i_2_n_2 ,\clk_count_reg[0]_i_2_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\clk_count[0]_i_7_n_0 }),
        .O({\clk_count_reg[0]_i_2_n_4 ,\clk_count_reg[0]_i_2_n_5 ,\clk_count_reg[0]_i_2_n_6 ,\clk_count_reg[0]_i_2_n_7 }),
        .S({\clk_count[0]_i_8_n_0 ,\clk_count[0]_i_9_n_0 ,\clk_count[0]_i_10_n_0 ,\clk_count[0]_i_11_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[8]_i_1_n_5 ),
        .Q(sel0[10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[8]_i_1_n_4 ),
        .Q(sel0[11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[12]_i_1_n_7 ),
        .Q(sel0[12]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \clk_count_reg[12]_i_1 
       (.CI(\clk_count_reg[8]_i_1_n_0 ),
        .CO({\clk_count_reg[12]_i_1_n_0 ,\clk_count_reg[12]_i_1_n_1 ,\clk_count_reg[12]_i_1_n_2 ,\clk_count_reg[12]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[12]_i_1_n_4 ,\clk_count_reg[12]_i_1_n_5 ,\clk_count_reg[12]_i_1_n_6 ,\clk_count_reg[12]_i_1_n_7 }),
        .S({\clk_count[12]_i_2_n_0 ,\clk_count[12]_i_3_n_0 ,\clk_count[12]_i_4_n_0 ,\clk_count[12]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[12]_i_1_n_6 ),
        .Q(sel0[13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[12]_i_1_n_5 ),
        .Q(sel0[14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[12]_i_1_n_4 ),
        .Q(sel0[15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[16]_i_1_n_7 ),
        .Q(sel0[16]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \clk_count_reg[16]_i_1 
       (.CI(\clk_count_reg[12]_i_1_n_0 ),
        .CO({\clk_count_reg[16]_i_1_n_0 ,\clk_count_reg[16]_i_1_n_1 ,\clk_count_reg[16]_i_1_n_2 ,\clk_count_reg[16]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[16]_i_1_n_4 ,\clk_count_reg[16]_i_1_n_5 ,\clk_count_reg[16]_i_1_n_6 ,\clk_count_reg[16]_i_1_n_7 }),
        .S({\clk_count[16]_i_2_n_0 ,\clk_count[16]_i_3_n_0 ,\clk_count[16]_i_4_n_0 ,\clk_count[16]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[16]_i_1_n_6 ),
        .Q(sel0[17]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[16]_i_1_n_5 ),
        .Q(sel0[18]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[16]_i_1_n_4 ),
        .Q(sel0[19]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[0]_i_2_n_6 ),
        .Q(sel0[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[20]_i_1_n_7 ),
        .Q(sel0[20]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \clk_count_reg[20]_i_1 
       (.CI(\clk_count_reg[16]_i_1_n_0 ),
        .CO({\clk_count_reg[20]_i_1_n_0 ,\clk_count_reg[20]_i_1_n_1 ,\clk_count_reg[20]_i_1_n_2 ,\clk_count_reg[20]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[20]_i_1_n_4 ,\clk_count_reg[20]_i_1_n_5 ,\clk_count_reg[20]_i_1_n_6 ,\clk_count_reg[20]_i_1_n_7 }),
        .S({\clk_count[20]_i_2_n_0 ,\clk_count[20]_i_3_n_0 ,\clk_count[20]_i_4_n_0 ,\clk_count[20]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[20]_i_1_n_6 ),
        .Q(sel0[21]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[20]_i_1_n_5 ),
        .Q(sel0[22]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[20]_i_1_n_4 ),
        .Q(sel0[23]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[24]_i_1_n_7 ),
        .Q(sel0[24]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \clk_count_reg[24]_i_1 
       (.CI(\clk_count_reg[20]_i_1_n_0 ),
        .CO({\clk_count_reg[24]_i_1_n_0 ,\clk_count_reg[24]_i_1_n_1 ,\clk_count_reg[24]_i_1_n_2 ,\clk_count_reg[24]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[24]_i_1_n_4 ,\clk_count_reg[24]_i_1_n_5 ,\clk_count_reg[24]_i_1_n_6 ,\clk_count_reg[24]_i_1_n_7 }),
        .S({\clk_count[24]_i_2_n_0 ,\clk_count[24]_i_3_n_0 ,\clk_count[24]_i_4_n_0 ,\clk_count[24]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[24]_i_1_n_6 ),
        .Q(sel0[25]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[24]_i_1_n_5 ),
        .Q(sel0[26]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[24]_i_1_n_4 ),
        .Q(sel0[27]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[28]_i_1_n_7 ),
        .Q(sel0[28]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \clk_count_reg[28]_i_1 
       (.CI(\clk_count_reg[24]_i_1_n_0 ),
        .CO({\clk_count_reg[28]_i_1_n_1 ,\clk_count_reg[28]_i_1_n_2 ,\clk_count_reg[28]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[28]_i_1_n_4 ,\clk_count_reg[28]_i_1_n_5 ,\clk_count_reg[28]_i_1_n_6 ,\clk_count_reg[28]_i_1_n_7 }),
        .S({\clk_count[28]_i_2_n_0 ,\clk_count[28]_i_3_n_0 ,\clk_count[28]_i_4_n_0 ,\clk_count[28]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[28]_i_1_n_6 ),
        .Q(sel0[29]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[0]_i_2_n_5 ),
        .Q(sel0[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[28]_i_1_n_5 ),
        .Q(sel0[30]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[28]_i_1_n_4 ),
        .Q(sel0[31]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[0]_i_2_n_4 ),
        .Q(sel0[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[4]_i_1_n_7 ),
        .Q(sel0[4]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \clk_count_reg[4]_i_1 
       (.CI(\clk_count_reg[0]_i_2_n_0 ),
        .CO({\clk_count_reg[4]_i_1_n_0 ,\clk_count_reg[4]_i_1_n_1 ,\clk_count_reg[4]_i_1_n_2 ,\clk_count_reg[4]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[4]_i_1_n_4 ,\clk_count_reg[4]_i_1_n_5 ,\clk_count_reg[4]_i_1_n_6 ,\clk_count_reg[4]_i_1_n_7 }),
        .S({\clk_count[4]_i_2_n_0 ,\clk_count[4]_i_3_n_0 ,\clk_count[4]_i_4_n_0 ,\clk_count[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[4]_i_1_n_6 ),
        .Q(sel0[5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[4]_i_1_n_5 ),
        .Q(sel0[6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[4]_i_1_n_4 ),
        .Q(sel0[7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[8]_i_1_n_7 ),
        .Q(sel0[8]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \clk_count_reg[8]_i_1 
       (.CI(\clk_count_reg[4]_i_1_n_0 ),
        .CO({\clk_count_reg[8]_i_1_n_0 ,\clk_count_reg[8]_i_1_n_1 ,\clk_count_reg[8]_i_1_n_2 ,\clk_count_reg[8]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[8]_i_1_n_4 ,\clk_count_reg[8]_i_1_n_5 ,\clk_count_reg[8]_i_1_n_6 ,\clk_count_reg[8]_i_1_n_7 }),
        .S({\clk_count[8]_i_2_n_0 ,\clk_count[8]_i_3_n_0 ,\clk_count[8]_i_4_n_0 ,\clk_count[8]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__1_n_0 ),
        .D(\clk_count_reg[8]_i_1_n_6 ),
        .Q(sel0[9]),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0000FFFF00000004)) 
    done_i_1
       (.I0(\clk_count[0]_i_3_n_0 ),
        .I1(\clk_count[0]_i_4_n_0 ),
        .I2(\clk_count[0]_i_5_n_0 ),
        .I3(\clk_count[0]_i_6_n_0 ),
        .I4(\FSM_sequential_state_reg[1]_0 ),
        .I5(t),
        .O(done_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    done_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(done_i_1_n_0),
        .Q(t),
        .R(\<const0> ));
endmodule

(* STRUCTURAL_NETLIST = "yes" *)
module top
   (clk,
    rst,
    volume,
    AIN,
    GAIN,
    SHUTDOWN_L,
    row,
    col,
    LED);
  input clk;
  input rst;
  input [7:0]volume;
  output AIN;
  output GAIN;
  output SHUTDOWN_L;
  input [3:0]row;
  output [3:0]col;
  output [15:0]LED;

  wire \<const0> ;
  wire \<const1> ;
  wire AIN;
  wire AIN_OBUF;
  wire GAIN;
  wire GND_2;
  wire [15:0]LED;
  wire [0:0]LED_OBUF;
  wire SHUTDOWN_L;
  wire VCC_2;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [3:0]col;
  wire \col_TRI[0] ;
  wire \col_TRI[1] ;
  wire \col_TRI[2] ;
  wire \col_TRI[3] ;
  wire db_rst;
  wire [9:0]f_count;
  wire kypd_n_0;
  wire kypd_n_1;
  wire kypd_n_10;
  wire kypd_n_11;
  wire kypd_n_2;
  wire kypd_n_3;
  wire kypd_n_4;
  wire kypd_n_5;
  wire kypd_n_6;
  wire kypd_n_7;
  wire kypd_n_8;
  wire kypd_n_9;
  wire onled;
  wire [3:0]row;
  wire [3:0]row_IBUF;
  wire rst;
  wire rst_IBUF;
  wire rst_l;
  wire [7:0]volume;
  wire [7:0]volume_IBUF;

  OBUF AIN_OBUF_inst
       (.I(AIN_OBUF),
        .O(AIN));
  OBUF GAIN_OBUF_inst
       (.I(\<const1> ),
        .O(GAIN));
  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  OBUF \LED_OBUF[0]_inst 
       (.I(LED_OBUF),
        .O(LED[0]));
  OBUF \LED_OBUF[10]_inst 
       (.I(LED_OBUF),
        .O(LED[10]));
  OBUF \LED_OBUF[11]_inst 
       (.I(LED_OBUF),
        .O(LED[11]));
  OBUF \LED_OBUF[12]_inst 
       (.I(LED_OBUF),
        .O(LED[12]));
  OBUF \LED_OBUF[13]_inst 
       (.I(LED_OBUF),
        .O(LED[13]));
  OBUF \LED_OBUF[14]_inst 
       (.I(LED_OBUF),
        .O(LED[14]));
  OBUF \LED_OBUF[15]_inst 
       (.I(LED_OBUF),
        .O(LED[15]));
  OBUF \LED_OBUF[1]_inst 
       (.I(LED_OBUF),
        .O(LED[1]));
  OBUF \LED_OBUF[2]_inst 
       (.I(LED_OBUF),
        .O(LED[2]));
  OBUF \LED_OBUF[3]_inst 
       (.I(LED_OBUF),
        .O(LED[3]));
  OBUF \LED_OBUF[4]_inst 
       (.I(LED_OBUF),
        .O(LED[4]));
  OBUF \LED_OBUF[5]_inst 
       (.I(LED_OBUF),
        .O(LED[5]));
  OBUF \LED_OBUF[6]_inst 
       (.I(LED_OBUF),
        .O(LED[6]));
  OBUF \LED_OBUF[7]_inst 
       (.I(LED_OBUF),
        .O(LED[7]));
  OBUF \LED_OBUF[8]_inst 
       (.I(LED_OBUF),
        .O(LED[8]));
  OBUF \LED_OBUF[9]_inst 
       (.I(LED_OBUF),
        .O(LED[9]));
  pwm_audio PWM
       (.AIN_OBUF(AIN_OBUF),
        .DI({kypd_n_4,kypd_n_5,kypd_n_6,kypd_n_7}),
        .Q(f_count),
        .S({kypd_n_2,kypd_n_3}),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .f_count1_carry_0(kypd_n_8),
        .f_count1_carry_1(kypd_n_9),
        .f_count1_carry_2(kypd_n_10),
        .f_count1_carry_3(kypd_n_11),
        .\f_count_reg[0]_0 (kypd_n_0),
        .\f_count_reg[0]_1 (kypd_n_1),
        .onled(onled),
        .volume_IBUF(volume_IBUF));
  OBUF SHUTDOWN_L_OBUF_inst
       (.I(\<const1> ),
        .O(SHUTDOWN_L));
  VCC VCC
       (.P(\<const1> ));
  VCC VCC_1
       (.P(VCC_2));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUFT \col_OBUFT[0]_inst 
       (.I(\<const0> ),
        .O(col[0]),
        .T(\col_TRI[0] ));
  OBUFT \col_OBUFT[1]_inst 
       (.I(\<const0> ),
        .O(col[1]),
        .T(\col_TRI[1] ));
  OBUFT \col_OBUFT[2]_inst 
       (.I(\<const0> ),
        .O(col[2]),
        .T(\col_TRI[2] ));
  OBUFT \col_OBUFT[3]_inst 
       (.I(\<const0> ),
        .O(col[3]),
        .T(\col_TRI[3] ));
  debouncer db1
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .db_rst(db_rst),
        .rst_IBUF(rst_IBUF));
  dim_leds dimmcool
       (.LED_OBUF(LED_OBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .onled(onled),
        .rst_l(rst_l));
  keypad kypd
       (.DI({kypd_n_4,kypd_n_5,kypd_n_6,kypd_n_7}),
        .Q(f_count),
        .S({kypd_n_2,kypd_n_3}),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\col_TRI[0] (\col_TRI[0] ),
        .\col_TRI[1] (\col_TRI[1] ),
        .\col_TRI[2] (\col_TRI[2] ),
        .\col_TRI[3] (\col_TRI[3] ),
        .\f_count_reg[8] (kypd_n_0),
        .\f_count_reg[8]_0 (kypd_n_1),
        .\keys_reg[12]_0 (kypd_n_11),
        .\keys_reg[1]_0 (kypd_n_8),
        .\keys_reg[3]_0 (kypd_n_10),
        .\keys_reg[9]_0 (kypd_n_9),
        .onled(onled),
        .row_IBUF(row_IBUF));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    onled_reg
       (.CLR(GND_2),
        .D(rst_l),
        .G(db_rst),
        .GE(VCC_2),
        .Q(onled));
  IBUF \row_IBUF[0]_inst 
       (.I(row[0]),
        .O(row_IBUF[0]));
  IBUF \row_IBUF[1]_inst 
       (.I(row[1]),
        .O(row_IBUF[1]));
  IBUF \row_IBUF[2]_inst 
       (.I(row[2]),
        .O(row_IBUF[2]));
  IBUF \row_IBUF[3]_inst 
       (.I(row[3]),
        .O(row_IBUF[3]));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  IBUF \volume_IBUF[0]_inst 
       (.I(volume[0]),
        .O(volume_IBUF[0]));
  IBUF \volume_IBUF[1]_inst 
       (.I(volume[1]),
        .O(volume_IBUF[1]));
  IBUF \volume_IBUF[2]_inst 
       (.I(volume[2]),
        .O(volume_IBUF[2]));
  IBUF \volume_IBUF[3]_inst 
       (.I(volume[3]),
        .O(volume_IBUF[3]));
  IBUF \volume_IBUF[4]_inst 
       (.I(volume[4]),
        .O(volume_IBUF[4]));
  IBUF \volume_IBUF[5]_inst 
       (.I(volume[5]),
        .O(volume_IBUF[5]));
  IBUF \volume_IBUF[6]_inst 
       (.I(volume[6]),
        .O(volume_IBUF[6]));
  IBUF \volume_IBUF[7]_inst 
       (.I(volume[7]),
        .O(volume_IBUF[7]));
endmodule
