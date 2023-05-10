// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Thu Nov 25 20:59:05 2021
// Host        : LAPTOP-NSV5LM1M running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/Karloz/Desktop/singlecycleCPU/singlecycleCPU.sim/sim_1/synth/func/xsim/SingleCircleCPUTest_func_synth.v
// Design      : CPU
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module CPU
   (clk,
    rstn,
    led_id,
    out_led,
    ZF,
    CF,
    OF,
    SF,
    PF,
    result);
  input clk;
  input rstn;
  output [7:0]led_id;
  output [6:0]out_led;
  output ZF;
  output CF;
  output OF;
  output SF;
  output PF;
  output [7:0]result;

  wire CF;
  wire OF;
  wire PCSrc;
  wire PCSrc_i_2_n_0;
  wire PCSrc_i_3_n_0;
  wire PCSrc_i_4_n_0;
  wire PCSrc_i_5_n_0;
  wire PCSrc_i_6_n_0;
  wire PCSrc_i_7_n_0;
  wire PCSrc_reg_i_10_n_0;
  wire PCSrc_reg_i_10_n_1;
  wire PCSrc_reg_i_10_n_2;
  wire PCSrc_reg_i_10_n_3;
  wire PCSrc_reg_i_10_n_4;
  wire PCSrc_reg_i_10_n_5;
  wire PCSrc_reg_i_10_n_6;
  wire PCSrc_reg_i_10_n_7;
  wire PCSrc_reg_i_11_n_0;
  wire PCSrc_reg_i_11_n_1;
  wire PCSrc_reg_i_11_n_2;
  wire PCSrc_reg_i_11_n_3;
  wire PCSrc_reg_i_11_n_4;
  wire PCSrc_reg_i_11_n_5;
  wire PCSrc_reg_i_11_n_6;
  wire PCSrc_reg_i_11_n_7;
  wire PCSrc_reg_i_12_n_0;
  wire PCSrc_reg_i_12_n_1;
  wire PCSrc_reg_i_12_n_2;
  wire PCSrc_reg_i_12_n_3;
  wire PCSrc_reg_i_12_n_4;
  wire PCSrc_reg_i_12_n_5;
  wire PCSrc_reg_i_12_n_6;
  wire PCSrc_reg_i_12_n_7;
  wire PCSrc_reg_i_13_n_0;
  wire PCSrc_reg_i_13_n_1;
  wire PCSrc_reg_i_13_n_2;
  wire PCSrc_reg_i_13_n_3;
  wire PCSrc_reg_i_13_n_4;
  wire PCSrc_reg_i_13_n_5;
  wire PCSrc_reg_i_13_n_6;
  wire PCSrc_reg_i_13_n_7;
  wire PCSrc_reg_i_14_n_0;
  wire PCSrc_reg_i_14_n_1;
  wire PCSrc_reg_i_14_n_2;
  wire PCSrc_reg_i_14_n_3;
  wire PCSrc_reg_i_14_n_4;
  wire PCSrc_reg_i_14_n_5;
  wire PCSrc_reg_i_14_n_6;
  wire PCSrc_reg_i_14_n_7;
  wire PCSrc_reg_i_15_n_2;
  wire PCSrc_reg_i_15_n_3;
  wire PCSrc_reg_i_15_n_5;
  wire PCSrc_reg_i_15_n_6;
  wire PCSrc_reg_i_15_n_7;
  wire PCSrc_reg_i_8_n_0;
  wire PCSrc_reg_i_8_n_1;
  wire PCSrc_reg_i_8_n_2;
  wire PCSrc_reg_i_8_n_3;
  wire PCSrc_reg_i_8_n_4;
  wire PCSrc_reg_i_8_n_5;
  wire PCSrc_reg_i_8_n_6;
  wire PCSrc_reg_i_8_n_7;
  wire PCSrc_reg_i_9_n_0;
  wire PCSrc_reg_i_9_n_1;
  wire PCSrc_reg_i_9_n_2;
  wire PCSrc_reg_i_9_n_3;
  wire PCSrc_reg_i_9_n_4;
  wire PCSrc_reg_i_9_n_5;
  wire PCSrc_reg_i_9_n_6;
  wire PCSrc_reg_i_9_n_7;
  wire PF;
  wire PF_OBUF;
  wire SF;
  wire ZF;
  wire ZF_OBUF;
  wire clear;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire \delay[0]_i_2_n_0 ;
  wire [31:0]delay_reg;
  wire \delay_reg[0]_i_1_n_0 ;
  wire \delay_reg[0]_i_1_n_1 ;
  wire \delay_reg[0]_i_1_n_2 ;
  wire \delay_reg[0]_i_1_n_3 ;
  wire \delay_reg[0]_i_1_n_4 ;
  wire \delay_reg[0]_i_1_n_5 ;
  wire \delay_reg[0]_i_1_n_6 ;
  wire \delay_reg[0]_i_1_n_7 ;
  wire \delay_reg[12]_i_1_n_0 ;
  wire \delay_reg[12]_i_1_n_1 ;
  wire \delay_reg[12]_i_1_n_2 ;
  wire \delay_reg[12]_i_1_n_3 ;
  wire \delay_reg[12]_i_1_n_4 ;
  wire \delay_reg[12]_i_1_n_5 ;
  wire \delay_reg[12]_i_1_n_6 ;
  wire \delay_reg[12]_i_1_n_7 ;
  wire \delay_reg[16]_i_1_n_0 ;
  wire \delay_reg[16]_i_1_n_1 ;
  wire \delay_reg[16]_i_1_n_2 ;
  wire \delay_reg[16]_i_1_n_3 ;
  wire \delay_reg[16]_i_1_n_4 ;
  wire \delay_reg[16]_i_1_n_5 ;
  wire \delay_reg[16]_i_1_n_6 ;
  wire \delay_reg[16]_i_1_n_7 ;
  wire \delay_reg[20]_i_1_n_0 ;
  wire \delay_reg[20]_i_1_n_1 ;
  wire \delay_reg[20]_i_1_n_2 ;
  wire \delay_reg[20]_i_1_n_3 ;
  wire \delay_reg[20]_i_1_n_4 ;
  wire \delay_reg[20]_i_1_n_5 ;
  wire \delay_reg[20]_i_1_n_6 ;
  wire \delay_reg[20]_i_1_n_7 ;
  wire \delay_reg[24]_i_1_n_0 ;
  wire \delay_reg[24]_i_1_n_1 ;
  wire \delay_reg[24]_i_1_n_2 ;
  wire \delay_reg[24]_i_1_n_3 ;
  wire \delay_reg[24]_i_1_n_4 ;
  wire \delay_reg[24]_i_1_n_5 ;
  wire \delay_reg[24]_i_1_n_6 ;
  wire \delay_reg[24]_i_1_n_7 ;
  wire \delay_reg[28]_i_1_n_1 ;
  wire \delay_reg[28]_i_1_n_2 ;
  wire \delay_reg[28]_i_1_n_3 ;
  wire \delay_reg[28]_i_1_n_4 ;
  wire \delay_reg[28]_i_1_n_5 ;
  wire \delay_reg[28]_i_1_n_6 ;
  wire \delay_reg[28]_i_1_n_7 ;
  wire \delay_reg[4]_i_1_n_0 ;
  wire \delay_reg[4]_i_1_n_1 ;
  wire \delay_reg[4]_i_1_n_2 ;
  wire \delay_reg[4]_i_1_n_3 ;
  wire \delay_reg[4]_i_1_n_4 ;
  wire \delay_reg[4]_i_1_n_5 ;
  wire \delay_reg[4]_i_1_n_6 ;
  wire \delay_reg[4]_i_1_n_7 ;
  wire \delay_reg[8]_i_1_n_0 ;
  wire \delay_reg[8]_i_1_n_1 ;
  wire \delay_reg[8]_i_1_n_2 ;
  wire \delay_reg[8]_i_1_n_3 ;
  wire \delay_reg[8]_i_1_n_4 ;
  wire \delay_reg[8]_i_1_n_5 ;
  wire \delay_reg[8]_i_1_n_6 ;
  wire \delay_reg[8]_i_1_n_7 ;
  wire [7:0]led_id;
  wire lopt;
  wire [6:0]out_led;
  wire [1:1]pc;
  wire pcmux_n_0;
  wire register_n_2;
  wire [7:0]result;
  wire [0:0]result_OBUF;
  wire [3:2]NLW_PCSrc_reg_i_15_CO_UNCONNECTED;
  wire [3:3]NLW_PCSrc_reg_i_15_O_UNCONNECTED;
  wire [3:3]\NLW_delay_reg[28]_i_1_CO_UNCONNECTED ;

  OBUF CF_OBUF_inst
       (.I(1'b0),
        .O(CF));
  OBUF OF_OBUF_inst
       (.I(1'b0),
        .O(OF));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    PCSrc_i_1
       (.I0(PCSrc_i_2_n_0),
        .I1(PCSrc_i_3_n_0),
        .I2(PCSrc_i_4_n_0),
        .I3(PCSrc_i_5_n_0),
        .I4(PCSrc_i_6_n_0),
        .I5(PCSrc_i_7_n_0),
        .O(clear));
  LUT2 #(
    .INIT(4'h2)) 
    PCSrc_i_2
       (.I0(PCSrc_reg_i_8_n_6),
        .I1(PCSrc_reg_i_8_n_7),
        .O(PCSrc_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    PCSrc_i_3
       (.I0(PCSrc_reg_i_9_n_7),
        .I1(PCSrc_reg_i_9_n_6),
        .I2(PCSrc_reg_i_8_n_5),
        .I3(PCSrc_reg_i_8_n_4),
        .I4(PCSrc_reg_i_9_n_4),
        .I5(PCSrc_reg_i_9_n_5),
        .O(PCSrc_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    PCSrc_i_4
       (.I0(PCSrc_reg_i_10_n_5),
        .I1(PCSrc_reg_i_10_n_4),
        .I2(PCSrc_reg_i_10_n_7),
        .I3(PCSrc_reg_i_10_n_6),
        .I4(PCSrc_reg_i_11_n_6),
        .I5(PCSrc_reg_i_11_n_7),
        .O(PCSrc_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    PCSrc_i_5
       (.I0(PCSrc_reg_i_12_n_7),
        .I1(PCSrc_reg_i_12_n_6),
        .I2(PCSrc_reg_i_11_n_5),
        .I3(PCSrc_reg_i_11_n_4),
        .I4(PCSrc_reg_i_12_n_4),
        .I5(PCSrc_reg_i_12_n_5),
        .O(PCSrc_i_5_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    PCSrc_i_6
       (.I0(PCSrc_reg_i_13_n_5),
        .I1(PCSrc_reg_i_13_n_4),
        .I2(PCSrc_reg_i_13_n_7),
        .I3(PCSrc_reg_i_13_n_6),
        .I4(PCSrc_reg_i_14_n_6),
        .I5(PCSrc_reg_i_14_n_7),
        .O(PCSrc_i_6_n_0));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    PCSrc_i_7
       (.I0(PCSrc_reg_i_15_n_7),
        .I1(PCSrc_reg_i_15_n_6),
        .I2(PCSrc_reg_i_14_n_5),
        .I3(PCSrc_reg_i_14_n_4),
        .I4(PCSrc_reg_i_15_n_5),
        .I5(delay_reg[0]),
        .O(PCSrc_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    PCSrc_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(clear),
        .Q(PCSrc),
        .R(1'b0));
  CARRY4 PCSrc_reg_i_10
       (.CI(PCSrc_reg_i_9_n_0),
        .CO({PCSrc_reg_i_10_n_0,PCSrc_reg_i_10_n_1,PCSrc_reg_i_10_n_2,PCSrc_reg_i_10_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({PCSrc_reg_i_10_n_4,PCSrc_reg_i_10_n_5,PCSrc_reg_i_10_n_6,PCSrc_reg_i_10_n_7}),
        .S(delay_reg[12:9]));
  CARRY4 PCSrc_reg_i_11
       (.CI(PCSrc_reg_i_10_n_0),
        .CO({PCSrc_reg_i_11_n_0,PCSrc_reg_i_11_n_1,PCSrc_reg_i_11_n_2,PCSrc_reg_i_11_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({PCSrc_reg_i_11_n_4,PCSrc_reg_i_11_n_5,PCSrc_reg_i_11_n_6,PCSrc_reg_i_11_n_7}),
        .S(delay_reg[16:13]));
  CARRY4 PCSrc_reg_i_12
       (.CI(PCSrc_reg_i_11_n_0),
        .CO({PCSrc_reg_i_12_n_0,PCSrc_reg_i_12_n_1,PCSrc_reg_i_12_n_2,PCSrc_reg_i_12_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({PCSrc_reg_i_12_n_4,PCSrc_reg_i_12_n_5,PCSrc_reg_i_12_n_6,PCSrc_reg_i_12_n_7}),
        .S(delay_reg[20:17]));
  CARRY4 PCSrc_reg_i_13
       (.CI(PCSrc_reg_i_12_n_0),
        .CO({PCSrc_reg_i_13_n_0,PCSrc_reg_i_13_n_1,PCSrc_reg_i_13_n_2,PCSrc_reg_i_13_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({PCSrc_reg_i_13_n_4,PCSrc_reg_i_13_n_5,PCSrc_reg_i_13_n_6,PCSrc_reg_i_13_n_7}),
        .S(delay_reg[24:21]));
  CARRY4 PCSrc_reg_i_14
       (.CI(PCSrc_reg_i_13_n_0),
        .CO({PCSrc_reg_i_14_n_0,PCSrc_reg_i_14_n_1,PCSrc_reg_i_14_n_2,PCSrc_reg_i_14_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({PCSrc_reg_i_14_n_4,PCSrc_reg_i_14_n_5,PCSrc_reg_i_14_n_6,PCSrc_reg_i_14_n_7}),
        .S(delay_reg[28:25]));
  CARRY4 PCSrc_reg_i_15
       (.CI(PCSrc_reg_i_14_n_0),
        .CO({NLW_PCSrc_reg_i_15_CO_UNCONNECTED[3:2],PCSrc_reg_i_15_n_2,PCSrc_reg_i_15_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_PCSrc_reg_i_15_O_UNCONNECTED[3],PCSrc_reg_i_15_n_5,PCSrc_reg_i_15_n_6,PCSrc_reg_i_15_n_7}),
        .S({1'b0,delay_reg[31:29]}));
  CARRY4 PCSrc_reg_i_8
       (.CI(1'b0),
        .CO({PCSrc_reg_i_8_n_0,PCSrc_reg_i_8_n_1,PCSrc_reg_i_8_n_2,PCSrc_reg_i_8_n_3}),
        .CYINIT(delay_reg[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({PCSrc_reg_i_8_n_4,PCSrc_reg_i_8_n_5,PCSrc_reg_i_8_n_6,PCSrc_reg_i_8_n_7}),
        .S(delay_reg[4:1]));
  CARRY4 PCSrc_reg_i_9
       (.CI(PCSrc_reg_i_8_n_0),
        .CO({PCSrc_reg_i_9_n_0,PCSrc_reg_i_9_n_1,PCSrc_reg_i_9_n_2,PCSrc_reg_i_9_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({PCSrc_reg_i_9_n_4,PCSrc_reg_i_9_n_5,PCSrc_reg_i_9_n_6,PCSrc_reg_i_9_n_7}),
        .S(delay_reg[8:5]));
  OBUF PF_OBUF_inst
       (.I(PF_OBUF),
        .O(PF));
  OBUF SF_OBUF_inst
       (.I(1'b0),
        .O(SF));
  (* OPT_MODIFIED = "MLO" *) 
  OBUF ZF_OBUF_inst
       (.I(lopt),
        .O(ZF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \delay[0]_i_2 
       (.I0(delay_reg[0]),
        .O(\delay[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[0]_i_1_n_7 ),
        .Q(delay_reg[0]),
        .R(clear));
  CARRY4 \delay_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\delay_reg[0]_i_1_n_0 ,\delay_reg[0]_i_1_n_1 ,\delay_reg[0]_i_1_n_2 ,\delay_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\delay_reg[0]_i_1_n_4 ,\delay_reg[0]_i_1_n_5 ,\delay_reg[0]_i_1_n_6 ,\delay_reg[0]_i_1_n_7 }),
        .S({delay_reg[3:1],\delay[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[8]_i_1_n_5 ),
        .Q(delay_reg[10]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[8]_i_1_n_4 ),
        .Q(delay_reg[11]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[12]_i_1_n_7 ),
        .Q(delay_reg[12]),
        .R(clear));
  CARRY4 \delay_reg[12]_i_1 
       (.CI(\delay_reg[8]_i_1_n_0 ),
        .CO({\delay_reg[12]_i_1_n_0 ,\delay_reg[12]_i_1_n_1 ,\delay_reg[12]_i_1_n_2 ,\delay_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\delay_reg[12]_i_1_n_4 ,\delay_reg[12]_i_1_n_5 ,\delay_reg[12]_i_1_n_6 ,\delay_reg[12]_i_1_n_7 }),
        .S(delay_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[12]_i_1_n_6 ),
        .Q(delay_reg[13]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[12]_i_1_n_5 ),
        .Q(delay_reg[14]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[12]_i_1_n_4 ),
        .Q(delay_reg[15]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[16]_i_1_n_7 ),
        .Q(delay_reg[16]),
        .R(clear));
  CARRY4 \delay_reg[16]_i_1 
       (.CI(\delay_reg[12]_i_1_n_0 ),
        .CO({\delay_reg[16]_i_1_n_0 ,\delay_reg[16]_i_1_n_1 ,\delay_reg[16]_i_1_n_2 ,\delay_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\delay_reg[16]_i_1_n_4 ,\delay_reg[16]_i_1_n_5 ,\delay_reg[16]_i_1_n_6 ,\delay_reg[16]_i_1_n_7 }),
        .S(delay_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[16]_i_1_n_6 ),
        .Q(delay_reg[17]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[16]_i_1_n_5 ),
        .Q(delay_reg[18]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[16]_i_1_n_4 ),
        .Q(delay_reg[19]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[0]_i_1_n_6 ),
        .Q(delay_reg[1]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[20]_i_1_n_7 ),
        .Q(delay_reg[20]),
        .R(clear));
  CARRY4 \delay_reg[20]_i_1 
       (.CI(\delay_reg[16]_i_1_n_0 ),
        .CO({\delay_reg[20]_i_1_n_0 ,\delay_reg[20]_i_1_n_1 ,\delay_reg[20]_i_1_n_2 ,\delay_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\delay_reg[20]_i_1_n_4 ,\delay_reg[20]_i_1_n_5 ,\delay_reg[20]_i_1_n_6 ,\delay_reg[20]_i_1_n_7 }),
        .S(delay_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[20]_i_1_n_6 ),
        .Q(delay_reg[21]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[20]_i_1_n_5 ),
        .Q(delay_reg[22]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[20]_i_1_n_4 ),
        .Q(delay_reg[23]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[24]_i_1_n_7 ),
        .Q(delay_reg[24]),
        .R(clear));
  CARRY4 \delay_reg[24]_i_1 
       (.CI(\delay_reg[20]_i_1_n_0 ),
        .CO({\delay_reg[24]_i_1_n_0 ,\delay_reg[24]_i_1_n_1 ,\delay_reg[24]_i_1_n_2 ,\delay_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\delay_reg[24]_i_1_n_4 ,\delay_reg[24]_i_1_n_5 ,\delay_reg[24]_i_1_n_6 ,\delay_reg[24]_i_1_n_7 }),
        .S(delay_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[24]_i_1_n_6 ),
        .Q(delay_reg[25]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[24]_i_1_n_5 ),
        .Q(delay_reg[26]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[24]_i_1_n_4 ),
        .Q(delay_reg[27]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[28]_i_1_n_7 ),
        .Q(delay_reg[28]),
        .R(clear));
  CARRY4 \delay_reg[28]_i_1 
       (.CI(\delay_reg[24]_i_1_n_0 ),
        .CO({\NLW_delay_reg[28]_i_1_CO_UNCONNECTED [3],\delay_reg[28]_i_1_n_1 ,\delay_reg[28]_i_1_n_2 ,\delay_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\delay_reg[28]_i_1_n_4 ,\delay_reg[28]_i_1_n_5 ,\delay_reg[28]_i_1_n_6 ,\delay_reg[28]_i_1_n_7 }),
        .S(delay_reg[31:28]));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[28]_i_1_n_6 ),
        .Q(delay_reg[29]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[0]_i_1_n_5 ),
        .Q(delay_reg[2]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[28]_i_1_n_5 ),
        .Q(delay_reg[30]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[28]_i_1_n_4 ),
        .Q(delay_reg[31]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[0]_i_1_n_4 ),
        .Q(delay_reg[3]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[4]_i_1_n_7 ),
        .Q(delay_reg[4]),
        .R(clear));
  CARRY4 \delay_reg[4]_i_1 
       (.CI(\delay_reg[0]_i_1_n_0 ),
        .CO({\delay_reg[4]_i_1_n_0 ,\delay_reg[4]_i_1_n_1 ,\delay_reg[4]_i_1_n_2 ,\delay_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\delay_reg[4]_i_1_n_4 ,\delay_reg[4]_i_1_n_5 ,\delay_reg[4]_i_1_n_6 ,\delay_reg[4]_i_1_n_7 }),
        .S(delay_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[4]_i_1_n_6 ),
        .Q(delay_reg[5]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[4]_i_1_n_5 ),
        .Q(delay_reg[6]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[4]_i_1_n_4 ),
        .Q(delay_reg[7]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[8]_i_1_n_7 ),
        .Q(delay_reg[8]),
        .R(clear));
  CARRY4 \delay_reg[8]_i_1 
       (.CI(\delay_reg[4]_i_1_n_0 ),
        .CO({\delay_reg[8]_i_1_n_0 ,\delay_reg[8]_i_1_n_1 ,\delay_reg[8]_i_1_n_2 ,\delay_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\delay_reg[8]_i_1_n_4 ,\delay_reg[8]_i_1_n_5 ,\delay_reg[8]_i_1_n_6 ,\delay_reg[8]_i_1_n_7 }),
        .S(delay_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay_reg[8]_i_1_n_6 ),
        .Q(delay_reg[9]),
        .R(clear));
  OBUFT \led_id_OBUF[0]_inst 
       (.I(1'b0),
        .O(led_id[0]),
        .T(1'b1));
  OBUFT \led_id_OBUF[1]_inst 
       (.I(1'b0),
        .O(led_id[1]),
        .T(1'b1));
  OBUFT \led_id_OBUF[2]_inst 
       (.I(1'b0),
        .O(led_id[2]),
        .T(1'b1));
  OBUFT \led_id_OBUF[3]_inst 
       (.I(1'b0),
        .O(led_id[3]),
        .T(1'b1));
  OBUFT \led_id_OBUF[4]_inst 
       (.I(1'b0),
        .O(led_id[4]),
        .T(1'b1));
  OBUFT \led_id_OBUF[5]_inst 
       (.I(1'b0),
        .O(led_id[5]),
        .T(1'b1));
  OBUFT \led_id_OBUF[6]_inst 
       (.I(1'b0),
        .O(led_id[6]),
        .T(1'b1));
  OBUFT \led_id_OBUF[7]_inst 
       (.I(1'b0),
        .O(led_id[7]),
        .T(1'b1));
  OBUFT \out_led_OBUF[0]_inst 
       (.I(1'b0),
        .O(out_led[0]),
        .T(1'b1));
  OBUFT \out_led_OBUF[1]_inst 
       (.I(1'b0),
        .O(out_led[1]),
        .T(1'b1));
  OBUFT \out_led_OBUF[2]_inst 
       (.I(1'b0),
        .O(out_led[2]),
        .T(1'b1));
  OBUFT \out_led_OBUF[3]_inst 
       (.I(1'b0),
        .O(out_led[3]),
        .T(1'b1));
  OBUFT \out_led_OBUF[4]_inst 
       (.I(1'b0),
        .O(out_led[4]),
        .T(1'b1));
  OBUFT \out_led_OBUF[5]_inst 
       (.I(1'b0),
        .O(out_led[5]),
        .T(1'b1));
  OBUFT \out_led_OBUF[6]_inst 
       (.I(1'b0),
        .O(out_led[6]),
        .T(1'b1));
  PC pcmux
       (.PCSrc(PCSrc),
        .Q(pc),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\newpc_reg[1]_0 (pcmux_n_0));
  regfile register
       (.PF_OBUF(PF_OBUF),
        .Q(pc),
        .ZF_OBUF(ZF_OBUF),
        .lopt(lopt),
        .\newpc_reg[1] (register_n_2),
        .\res_reg[0] (pcmux_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \res_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(register_n_2),
        .Q(result_OBUF),
        .R(1'b0));
  OBUF \result_OBUF[0]_inst 
       (.I(result_OBUF),
        .O(result[0]));
  OBUF \result_OBUF[1]_inst 
       (.I(1'b0),
        .O(result[1]));
  OBUF \result_OBUF[2]_inst 
       (.I(1'b0),
        .O(result[2]));
  OBUF \result_OBUF[3]_inst 
       (.I(1'b0),
        .O(result[3]));
  OBUF \result_OBUF[4]_inst 
       (.I(1'b0),
        .O(result[4]));
  OBUF \result_OBUF[5]_inst 
       (.I(1'b0),
        .O(result[5]));
  OBUF \result_OBUF[6]_inst 
       (.I(1'b0),
        .O(result[6]));
  OBUF \result_OBUF[7]_inst 
       (.I(1'b0),
        .O(result[7]));
endmodule

module PC
   (\newpc_reg[1]_0 ,
    Q,
    clk_IBUF_BUFG,
    PCSrc);
  output \newpc_reg[1]_0 ;
  output [0:0]Q;
  input clk_IBUF_BUFG;
  input PCSrc;

  wire PCSrc;
  wire [0:0]Q;
  wire clk_IBUF_BUFG;
  wire \newpc_reg[1]_0 ;
  wire [1:0]p_0_in;
  wire [0:0]pc;

  LUT2 #(
    .INIT(4'h6)) 
    \newpc[0]_i_1 
       (.I0(pc),
        .I1(PCSrc),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h6C)) 
    \newpc[1]_i_1 
       (.I0(pc),
        .I1(Q),
        .I2(PCSrc),
        .O(p_0_in[1]));
  FDRE #(
    .INIT(1'b0)) 
    \newpc_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(pc),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newpc_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(Q),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \register_reg[0][0]_i_1 
       (.I0(Q),
        .I1(pc),
        .O(\newpc_reg[1]_0 ));
endmodule

module regfile
   (PF_OBUF,
    ZF_OBUF,
    \newpc_reg[1] ,
    \res_reg[0] ,
    Q,
    lopt);
  output PF_OBUF;
  output ZF_OBUF;
  output \newpc_reg[1] ;
  input \res_reg[0] ;
  input [0:0]Q;
  output lopt;

  wire PF_OBUF;
  wire [0:0]Q;
  wire \^ZF_OBUF ;
  wire \newpc_reg[1] ;
  wire \res_reg[0] ;

  assign ZF_OBUF = PF_OBUF;
  assign lopt = \^ZF_OBUF ;
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT1 #(
    .INIT(2'h1)) 
    ZF_OBUF_inst_i_1
       (.I0(PF_OBUF),
        .O(\^ZF_OBUF ));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0),
    .IS_G_INVERTED(1'b1)) 
    \register_reg[0][0] 
       (.CLR(1'b0),
        .D(\res_reg[0] ),
        .G(PF_OBUF),
        .GE(1'b1),
        .Q(PF_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \res[0]_i_1 
       (.I0(PF_OBUF),
        .I1(Q),
        .O(\newpc_reg[1] ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
