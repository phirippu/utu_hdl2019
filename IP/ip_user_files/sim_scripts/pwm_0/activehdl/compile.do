vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xil_defaultlib -93 \
"../../../../pwm_0/src/pwm.vhd" \
"../../../../pwm_0/sim/pwm_0.vhd" \


