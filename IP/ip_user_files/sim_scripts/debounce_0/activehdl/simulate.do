onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+debounce_0 -L xil_defaultlib -L secureip -O5 xil_defaultlib.debounce_0

do {wave.do}

view wave
view structure

do {debounce_0.udo}

run -all

endsim

quit -force
