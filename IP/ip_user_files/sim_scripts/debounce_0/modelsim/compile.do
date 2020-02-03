vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../../debounce_0/src/debounce.vhd" \
"../../../../debounce_0/sim/debounce_0.vhd" \


