// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Sun Feb  2 23:03:36 2020
// Host        : philyra running 64-bit Ubuntu 19.10
// Command     : write_verilog -force -mode synth_stub /home/phil/git/utu_hdl2019/IP/debounce_0/debounce_0_stub.v
// Design      : debounce_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "debounce,Vivado 2019.2.1" *)
module debounce_0(SCLK, INPUT, OUTPUT)
/* synthesis syn_black_box black_box_pad_pin="SCLK,INPUT,OUTPUT" */;
  input SCLK;
  input INPUT;
  output OUTPUT;
endmodule
