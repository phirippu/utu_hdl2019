onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+pwm_0 -L xil_defaultlib -L secureip -O5 xil_defaultlib.pwm_0

do {wave.do}

view wave
view structure

do {pwm_0.udo}

run -all

endsim

quit -force
