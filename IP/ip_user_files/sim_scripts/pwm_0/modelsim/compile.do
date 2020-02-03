vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../../pwm_0/src/pwm.vhd" \
"../../../../pwm_0/sim/pwm_0.vhd" \


