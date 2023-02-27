vlib work

vcom -93 ./entities/MEM64B32.vhd
vsim -gui work.mem64b32 -default_radix decimal

add wave -radix binary -position end sim:/mem64b32/CLK
add wave -radix binary -position end sim:/mem64b32/RST
add wave -radix decimal -position end sim:/mem64b32/DATA_OUT
add wave -radix decimal -position end sim:/mem64b32/DATA_IN
add wave -radix decimal -position end sim:/mem64b32/ADDR
add wave -radix binary -position end sim:/mem64b32/WE
add wave -radix decimal -position end sim:/mem64b32/BENCH

force -freeze sim:/mem64b32/clk 1 0, 0 {25 ps} -r 50
force -freeze sim:/mem64b32/rst 0 0

force -freeze sim:/mem64b32/ADDR {0} 0
force -freeze sim:/mem64b32/DATA_IN {10452} 0
force -freeze sim:/mem64b32/WE 1 0
run 100 ps

force -freeze sim:/mem64b32/ADDR {0} 0
force -freeze sim:/mem64b32/WE 0 0
run 100 ps

force -freeze sim:/mem64b32/ADDR {1} 0
force -freeze sim:/mem64b32/DATA_IN {25401} 0
force -freeze sim:/mem64b32/WE 1 0
run 100 ps

force -freeze sim:/mem64b32/ADDR {1} 0
force -freeze sim:/mem64b32/WE 1 0
run 100ps

force -freeze sim:/mem64b32/ADDR {63} 0
force -freeze sim:/mem64b32/DATA_IN {200} 0
force -freeze sim:/mem64b32/WE 1 0
run 100 ps

force -freeze sim:/mem64b32/ADDR {63} 0
force -freeze sim:/mem64b32/WE 0 0
run 100 ps

force -freeze sim:/mem64b32/ADDR {0} 0
force -freeze sim:/mem64b32/DATA_IN {200} 0
force -freeze sim:/mem64b32/WE 1 0
run 100 ps

force -freeze sim:/mem64b32/ADDR {0} 0
force -freeze sim:/mem64b32/WE 0 0
run 100 ps

force -freeze sim:/mem64b32/RST 1 0
run 100 ps