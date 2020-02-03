// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Sun Feb  2 23:03:35 2020
// Host        : philyra running 64-bit Ubuntu 19.10
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ debounce_0_sim_netlist.v
// Design      : debounce_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_debounce
   (OUTPUT,
    INPUT,
    SCLK);
  output OUTPUT;
  input INPUT;
  input SCLK;

  wire INPUT;
  wire OUTPUT;
  wire OUTPUT_i_1_n_0;
  wire OUTPUT_i_2_n_0;
  wire SCLK;
  wire lock;
  wire lock_i_1_n_0;
  wire [6:0]tout;
  wire \tout[1]_i_2_n_0 ;
  wire \tout[3]_i_2_n_0 ;
  wire \tout[6]_i_2_n_0 ;
  wire [6:0]tout_0;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0082)) 
    OUTPUT_i_1
       (.I0(INPUT),
        .I1(tout[0]),
        .I2(lock),
        .I3(OUTPUT_i_2_n_0),
        .O(OUTPUT_i_1_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    OUTPUT_i_2
       (.I0(tout[4]),
        .I1(tout[5]),
        .I2(tout[3]),
        .I3(tout[2]),
        .I4(tout[1]),
        .I5(tout[6]),
        .O(OUTPUT_i_2_n_0));
  FDRE OUTPUT_reg
       (.C(SCLK),
        .CE(1'b1),
        .D(OUTPUT_i_1_n_0),
        .Q(OUTPUT),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hF100)) 
    lock_i_1
       (.I0(OUTPUT_i_2_n_0),
        .I1(tout[0]),
        .I2(lock),
        .I3(INPUT),
        .O(lock_i_1_n_0));
  FDRE lock_reg
       (.C(SCLK),
        .CE(1'b1),
        .D(lock_i_1_n_0),
        .Q(lock),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hDFFF00000000DFFF)) 
    \tout[0]_i_1 
       (.I0(tout[6]),
        .I1(\tout[6]_i_2_n_0 ),
        .I2(tout[5]),
        .I3(tout[4]),
        .I4(lock),
        .I5(tout[0]),
        .O(tout_0[0]));
  LUT6 #(
    .INIT(64'hFFFF22220DDD2222)) 
    \tout[1]_i_1 
       (.I0(tout[0]),
        .I1(lock),
        .I2(tout[2]),
        .I3(tout[3]),
        .I4(tout[1]),
        .I5(\tout[1]_i_2_n_0 ),
        .O(tout_0[1]));
  LUT5 #(
    .INIT(32'h70F7F0FF)) 
    \tout[1]_i_2 
       (.I0(tout[4]),
        .I1(tout[5]),
        .I2(lock),
        .I3(tout[0]),
        .I4(tout[6]),
        .O(\tout[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF080800F30808)) 
    \tout[2]_i_1 
       (.I0(tout[1]),
        .I1(tout[0]),
        .I2(lock),
        .I3(tout[3]),
        .I4(tout[2]),
        .I5(\tout[3]_i_2_n_0 ),
        .O(tout_0[2]));
  LUT6 #(
    .INIT(64'hFFFF008055550080)) 
    \tout[3]_i_1 
       (.I0(tout[2]),
        .I1(tout[1]),
        .I2(tout[0]),
        .I3(lock),
        .I4(tout[3]),
        .I5(\tout[3]_i_2_n_0 ),
        .O(tout_0[3]));
  LUT6 #(
    .INIT(64'h71F3F3F3FFFFFFFF)) 
    \tout[3]_i_2 
       (.I0(tout[6]),
        .I1(tout[0]),
        .I2(lock),
        .I3(tout[5]),
        .I4(tout[4]),
        .I5(tout[1]),
        .O(\tout[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC4C3CCC4CCC3CCCC)) 
    \tout[4]_i_1 
       (.I0(tout[5]),
        .I1(tout[4]),
        .I2(\tout[6]_i_2_n_0 ),
        .I3(lock),
        .I4(tout[0]),
        .I5(tout[6]),
        .O(tout_0[4]));
  LUT6 #(
    .INIT(64'hC4C6CCC4CCC6CCCC)) 
    \tout[5]_i_1 
       (.I0(tout[4]),
        .I1(tout[5]),
        .I2(\tout[6]_i_2_n_0 ),
        .I3(lock),
        .I4(tout[0]),
        .I5(tout[6]),
        .O(tout_0[5]));
  LUT6 #(
    .INIT(64'hF024F0F0F0F0F0F0)) 
    \tout[6]_i_1 
       (.I0(lock),
        .I1(tout[0]),
        .I2(tout[6]),
        .I3(\tout[6]_i_2_n_0 ),
        .I4(tout[5]),
        .I5(tout[4]),
        .O(tout_0[6]));
  LUT3 #(
    .INIT(8'h7F)) 
    \tout[6]_i_2 
       (.I0(tout[3]),
        .I1(tout[2]),
        .I2(tout[1]),
        .O(\tout[6]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tout_reg[0] 
       (.C(SCLK),
        .CE(INPUT),
        .D(tout_0[0]),
        .Q(tout[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tout_reg[1] 
       (.C(SCLK),
        .CE(INPUT),
        .D(tout_0[1]),
        .Q(tout[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tout_reg[2] 
       (.C(SCLK),
        .CE(INPUT),
        .D(tout_0[2]),
        .Q(tout[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tout_reg[3] 
       (.C(SCLK),
        .CE(INPUT),
        .D(tout_0[3]),
        .Q(tout[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tout_reg[4] 
       (.C(SCLK),
        .CE(INPUT),
        .D(tout_0[4]),
        .Q(tout[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tout_reg[5] 
       (.C(SCLK),
        .CE(INPUT),
        .D(tout_0[5]),
        .Q(tout[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tout_reg[6] 
       (.C(SCLK),
        .CE(INPUT),
        .D(tout_0[6]),
        .Q(tout[6]),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "debounce_0,debounce,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "debounce,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (SCLK,
    INPUT,
    OUTPUT);
  input SCLK;
  input INPUT;
  output OUTPUT;

  wire INPUT;
  wire OUTPUT;
  wire SCLK;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_debounce U0
       (.INPUT(INPUT),
        .OUTPUT(OUTPUT),
        .SCLK(SCLK));
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
