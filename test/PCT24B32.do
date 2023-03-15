vlib work

vcom -93 ./entities/PCT24B32.vhd
vsim -gui work.pct24b32 -default_radix decimal

add wave -radix binary -position end sim:/pct24b32/clk
add wave -radix decimal -position end sim:/pct24b32/offset
add wave -radix decimal -position end sim:/pct24b32/counter
add wave -radix binary -position end sim:/pct24b32/npcsel

force -freeze sim:/pct24b32/CLK 1 0, 0 {50 ps} -r 100
run {1000 ps}

force -freeze sim:/pct24b32/OFFSET 5 0
force -freeze sim:/pct24b32/nPCsel 1 0
run {100 ps}

force -freeze sim:/pct24b32/nPCsel 0 0
run {500 ps}


