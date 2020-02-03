-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Sun Feb  2 23:03:36 2020
-- Host        : philyra running 64-bit Ubuntu 19.10
-- Command     : write_vhdl -force -mode synth_stub /home/phil/git/utu_hdl2019/IP/debounce_0/debounce_0_stub.vhdl
-- Design      : debounce_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debounce_0 is
  Port ( 
    SCLK : in STD_LOGIC;
    INPUT : in STD_LOGIC;
    OUTPUT : out STD_LOGIC
  );

end debounce_0;

architecture stub of debounce_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "SCLK,INPUT,OUTPUT";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "debounce,Vivado 2019.2.1";
begin
end;
