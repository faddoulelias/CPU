vlib work

vcom -93 ./entities/INSTRUCTOR.vhd
vsim -gui work.instructor -default_radix unsigned

add wave -radix binary -position end sim:/instructor/CLK
add wave -radix binary -position end sim:/instructor/RST
add wave -radix binary -position end sim:/instructor/nPCsel
add wave -radix decimal -position end sim:/instructor/OFFSET
add wave -radix hex -position end sim:/instructor/INSTRUCTION

force -freeze sim:/instructor/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/instructor/reset 0 0

