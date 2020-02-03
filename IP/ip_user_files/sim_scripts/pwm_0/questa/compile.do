vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../../pwm_0/src/pwm.vhd" \
"../../../../pwm_0/sim/pwm_0.vhd" \


