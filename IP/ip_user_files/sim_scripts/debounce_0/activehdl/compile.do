vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xil_defaultlib -93 \
"../../../../debounce_0/src/debounce.vhd" \
"../../../../debounce_0/sim/debounce_0.vhd" \


