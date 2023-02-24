vlib work

vcom -93 ./entities/EXTNT32.vhd
vsim -gui work.extnt32 -default_radix decimal

add wave -radix decimal -position end sim:/extnt32/E
add wave -radix decimal -position end sim:/extnt32/S
change sim:/extnt32/N 16

force -freeze sim:/extnt32/E {35} 0
run 100 ns
force -freeze sim:/extnt32/E {-35} 0
run 100 ns
force -freeze sim:/extnt32/E {32766} 0
run 100 ns
force -freeze sim:/extnt32/E {-32766} 0
run 100 ns
force -freeze sim:/extnt32/E {32767} 0
run 100 ns
force -freeze sim:/extnt32/E {-32767} 0
run 100 ns
force -freeze sim:/extnt32/E {32768} 0
run 100 ns
