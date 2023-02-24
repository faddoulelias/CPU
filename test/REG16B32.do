vlib work

vcom -93 ./entities/REG16B32.vhd
vsim -gui work.reg16b32 -default_radix decimal

add wave -radix binary -position end sim:/reg16b32/clk
add wave -radix decimal -position end sim:/reg16b32/w
add wave -radix binary -position end sim:/reg16b32/we
add wave -radix unsigned -position end sim:/reg16b32/Rw
add wave -radix unsigned -position end sim:/reg16b32/Ra
add wave -radix unsigned -position end sim:/reg16b32/Rb
add wave -radix decimal -position end sim:/reg16b32/A
add wave -radix decimal -position end sim:/reg16b32/B
add wave -radix decimal -position end sim:/reg16b32/Bench

force -freeze sim:/reg16b32/clk 1 0, 0 {50 ps} -r 100

force sim:/reg16b32/w {0} 0
force sim:/reg16b32/we 0 0
force sim:/reg16b32/Rw {0} 0
force sim:/reg16b32/Ra {1} 0
force sim:/reg16b32/Rb {2} 0
run {100 ps}

force sim:/reg16b32/w {255} 0
force sim:/reg16b32/we 1 0
force sim:/reg16b32/Rw {1} 0
force sim:/reg16b32/Ra {1} 0
force sim:/reg16b32/Rb {2} 0
run {100 ps}

force sim:/reg16b32/w {511} 0
force sim:/reg16b32/we 1 0
force sim:/reg16b32/Rw {2} 0
force sim:/reg16b32/Ra {1} 0
force sim:/reg16b32/Rb {2} 0
run {100 ps}

force sim:/reg16b32/w {1023} 0
force sim:/reg16b32/we 1 0
force sim:/reg16b32/Rw {3} 0
force sim:/reg16b32/Ra {1} 0
force sim:/reg16b32/Rb {2} 0
run {100 ps}

force sim:/reg16b32/w {2047} 0
force sim:/reg16b32/we 1 0
force sim:/reg16b32/Rw {4} 0
force sim:/reg16b32/Ra {1} 0
force sim:/reg16b32/Rb {2} 0
run {100 ps}

force sim:/reg16b32/w {4095} 0
force sim:/reg16b32/we 0 0
force sim:/reg16b32/Rw {4} 0
force sim:/reg16b32/Ra {3} 0
force sim:/reg16b32/Rb {4} 0
run {100 ps}

force sim:/reg16b32/w {8191} 0
force sim:/reg16b32/we 0 0
force sim:/reg16b32/Rw {14} 0
force sim:/reg16b32/Ra {14} 0
force sim:/reg16b32/Rb {15} 0
run {100 ps}