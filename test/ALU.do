vlib work

vcom -93 ./entities/ALU.vhd

vsim -gui work.alu -default_radix decimal
add wave -position end  sim:/alu/OP
add wave -position end  sim:/alu/Bus_A
add wave -position end  sim:/alu/Bus_B
add wave -position end  sim:/alu/ALU_out
add wave -position end  sim:/alu/N

force sim:/alu/OP 00 0
force sim:/alu/Bus_A {50} 0
force sim:/alu/Bus_B {50} 0
run
force sim:/alu/OP 00 0
force sim:/alu/Bus_A {2147483648} 0
force sim:/alu/Bus_B {1147483648} 0
run
force sim:/alu/OP 00 0
force sim:/alu/Bus_A {780} 0
force sim:/alu/Bus_B {56} 0
run
force sim:/alu/OP 01 0
force sim:/alu/Bus_A {780} 0
force sim:/alu/Bus_B {56} 0
run
force sim:/alu/OP 11 0
force sim:/alu/Bus_A {780} 0
force sim:/alu/Bus_B {56} 0
run
force sim:/alu/OP 10 0
force sim:/alu/Bus_A {780} 0
force sim:/alu/Bus_B {56} 0
run
force sim:/alu/OP 10 0
force sim:/alu/Bus_A {2147483648} 0
force sim:/alu/Bus_B {1147483648} 0
run
force sim:/alu/OP 10 0
force sim:/alu/Bus_A {2147483648} 0
force sim:/alu/Bus_B {2147483648} 0
run
force sim:/alu/OP 10 0
force sim:/alu/Bus_A {-50} 0
force sim:/alu/Bus_B {-50} 0


