// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Sun Feb  2 23:05:48 2020
// Host        : philyra running 64-bit Ubuntu 19.10
// Command     : write_verilog -force -mode funcsim /home/phil/git/utu_hdl2019/IP/pwm_0/pwm_0_sim_netlist.v
// Design      : pwm_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pwm_0,pwm,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "pwm,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module pwm_0
   (pwclk,
    pwduty,
    pwout);
  input pwclk;
  input [7:0]pwduty;
  output pwout;

  wire pwclk;
  wire [7:0]pwduty;
  wire pwout;

  pwm_0_pwm U0
       (.pwclk(pwclk),
        .pwduty(pwduty),
        .pwout(pwout));
endmodule

(* ORIG_REF_NAME = "pwm" *) 
module pwm_0_pwm
   (pwout,
    pwclk,
    pwduty);
  output pwout;
  input pwclk;
  input [7:0]pwduty;

  wire eqOp;
  wire eqOp_0;
  wire [7:0]plusOp;
  wire pwclk;
  wire [7:0]pwduty;
  wire \pwm_cnt[7]_i_2_n_0 ;
  wire [7:0]pwm_cnt_reg;
  wire pwout;
  wire pwout_i_10_n_0;
  wire pwout_i_11_n_0;
  wire pwout_i_1_n_0;
  wire pwout_i_2_n_0;
  wire pwout_i_3_n_0;
  wire pwout_i_4_n_0;
  wire pwout_i_7_n_0;
  wire pwout_i_8_n_0;
  wire pwout_i_9_n_0;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \pwm_cnt[0]_i_1 
       (.I0(pwm_cnt_reg[0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \pwm_cnt[1]_i_1 
       (.I0(pwm_cnt_reg[0]),
        .I1(pwm_cnt_reg[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \pwm_cnt[2]_i_1 
       (.I0(pwm_cnt_reg[0]),
        .I1(pwm_cnt_reg[1]),
        .I2(pwm_cnt_reg[2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \pwm_cnt[3]_i_1 
       (.I0(pwm_cnt_reg[1]),
        .I1(pwm_cnt_reg[0]),
        .I2(pwm_cnt_reg[2]),
        .I3(pwm_cnt_reg[3]),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \pwm_cnt[4]_i_1 
       (.I0(pwm_cnt_reg[2]),
        .I1(pwm_cnt_reg[0]),
        .I2(pwm_cnt_reg[1]),
        .I3(pwm_cnt_reg[3]),
        .I4(pwm_cnt_reg[4]),
        .O(plusOp[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \pwm_cnt[5]_i_1 
       (.I0(pwm_cnt_reg[3]),
        .I1(pwm_cnt_reg[1]),
        .I2(pwm_cnt_reg[0]),
        .I3(pwm_cnt_reg[2]),
        .I4(pwm_cnt_reg[4]),
        .I5(pwm_cnt_reg[5]),
        .O(plusOp[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \pwm_cnt[6]_i_1 
       (.I0(\pwm_cnt[7]_i_2_n_0 ),
        .I1(pwm_cnt_reg[6]),
        .O(plusOp[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \pwm_cnt[7]_i_1 
       (.I0(\pwm_cnt[7]_i_2_n_0 ),
        .I1(pwm_cnt_reg[6]),
        .I2(pwm_cnt_reg[7]),
        .O(plusOp[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \pwm_cnt[7]_i_2 
       (.I0(pwm_cnt_reg[5]),
        .I1(pwm_cnt_reg[3]),
        .I2(pwm_cnt_reg[1]),
        .I3(pwm_cnt_reg[0]),
        .I4(pwm_cnt_reg[2]),
        .I5(pwm_cnt_reg[4]),
        .O(\pwm_cnt[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[0] 
       (.C(pwclk),
        .CE(1'b1),
        .D(plusOp[0]),
        .Q(pwm_cnt_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[1] 
       (.C(pwclk),
        .CE(1'b1),
        .D(plusOp[1]),
        .Q(pwm_cnt_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[2] 
       (.C(pwclk),
        .CE(1'b1),
        .D(plusOp[2]),
        .Q(pwm_cnt_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[3] 
       (.C(pwclk),
        .CE(1'b1),
        .D(plusOp[3]),
        .Q(pwm_cnt_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[4] 
       (.C(pwclk),
        .CE(1'b1),
        .D(plusOp[4]),
        .Q(pwm_cnt_reg[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[5] 
       (.C(pwclk),
        .CE(1'b1),
        .D(plusOp[5]),
        .Q(pwm_cnt_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[6] 
       (.C(pwclk),
        .CE(1'b1),
        .D(plusOp[6]),
        .Q(pwm_cnt_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_cnt_reg[7] 
       (.C(pwclk),
        .CE(1'b1),
        .D(plusOp[7]),
        .Q(pwm_cnt_reg[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000FFFF8AAA)) 
    pwout_i_1
       (.I0(pwout),
        .I1(pwout_i_2_n_0),
        .I2(pwout_i_3_n_0),
        .I3(pwout_i_4_n_0),
        .I4(eqOp_0),
        .I5(eqOp),
        .O(pwout_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    pwout_i_10
       (.I0(pwm_cnt_reg[1]),
        .I1(pwm_cnt_reg[0]),
        .I2(pwm_cnt_reg[3]),
        .I3(pwm_cnt_reg[2]),
        .O(pwout_i_10_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    pwout_i_11
       (.I0(pwduty[1]),
        .I1(pwduty[0]),
        .I2(pwduty[3]),
        .I3(pwduty[2]),
        .O(pwout_i_11_n_0));
  LUT5 #(
    .INIT(32'hE77BBDDE)) 
    pwout_i_2
       (.I0(pwm_cnt_reg[6]),
        .I1(pwm_cnt_reg[7]),
        .I2(pwout_i_7_n_0),
        .I3(pwduty[6]),
        .I4(pwduty[7]),
        .O(pwout_i_2_n_0));
  LUT6 #(
    .INIT(64'h0880022020088002)) 
    pwout_i_3
       (.I0(pwout_i_8_n_0),
        .I1(pwduty[5]),
        .I2(pwduty[4]),
        .I3(pwout_i_9_n_0),
        .I4(pwm_cnt_reg[5]),
        .I5(pwm_cnt_reg[4]),
        .O(pwout_i_3_n_0));
  LUT6 #(
    .INIT(64'h0480012010084002)) 
    pwout_i_4
       (.I0(pwm_cnt_reg[0]),
        .I1(pwduty[2]),
        .I2(pwduty[1]),
        .I3(pwduty[0]),
        .I4(pwm_cnt_reg[2]),
        .I5(pwm_cnt_reg[1]),
        .O(pwout_i_4_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    pwout_i_5
       (.I0(pwm_cnt_reg[4]),
        .I1(pwm_cnt_reg[5]),
        .I2(pwm_cnt_reg[7]),
        .I3(pwm_cnt_reg[6]),
        .I4(pwout_i_10_n_0),
        .O(eqOp_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    pwout_i_6
       (.I0(pwduty[4]),
        .I1(pwduty[5]),
        .I2(pwduty[7]),
        .I3(pwduty[6]),
        .I4(pwout_i_11_n_0),
        .O(eqOp));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    pwout_i_7
       (.I0(pwduty[5]),
        .I1(pwduty[3]),
        .I2(pwduty[1]),
        .I3(pwduty[0]),
        .I4(pwduty[2]),
        .I5(pwduty[4]),
        .O(pwout_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6AAA9555)) 
    pwout_i_8
       (.I0(pwduty[3]),
        .I1(pwduty[2]),
        .I2(pwduty[0]),
        .I3(pwduty[1]),
        .I4(pwm_cnt_reg[3]),
        .O(pwout_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    pwout_i_9
       (.I0(pwduty[3]),
        .I1(pwduty[1]),
        .I2(pwduty[0]),
        .I3(pwduty[2]),
        .O(pwout_i_9_n_0));
  FDRE pwout_reg
       (.C(pwclk),
        .CE(1'b1),
        .D(pwout_i_1_n_0),
        .Q(pwout),
        .R(1'b0));
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
