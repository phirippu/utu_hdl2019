vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xil_defaultlib -93 \
"../../../../pwm_0/src/pwm.vhd" \
"../../../../pwm_0/sim/pwm_0.vhd" \


