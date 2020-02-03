vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../../debounce_0/src/debounce.vhd" \
"../../../../debounce_0/sim/debounce_0.vhd" \


