vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xil_defaultlib -93 \
"../../../../debounce_0/src/debounce.vhd" \
"../../../../debounce_0/sim/debounce_0.vhd" \


