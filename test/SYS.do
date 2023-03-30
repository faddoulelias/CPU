vlib work

vcom ./entities/ALU.vhd
vcom ./entities/CONTROLLER.vhd
vcom ./entities/CPU.vhd
vcom ./entities/DECODER.vhd
vcom ./entities/EXTNT32.vhd
vcom ./entities/INM64B32.vhd
vcom ./entities/INSTRUCTOR.vhd
vcom ./entities/MEM64B32.vhd
vcom ./entities/MUX2TN.vhd
vcom ./entities/PCT24B32.vhd
vcom ./entities/PROCESSOR.vhd
vcom ./entities/PSR.vhd
vcom ./entities/REG16B32.vhd
vcom ./entities/SYS.vhd



vsim -gui work.sys -default_radix binary

add wave -radix binary  -position end sim:/sys/CLK
add wave -radix binary  -position end sim:/sys/RESET
add wave -radix decimal -position end sim:/sys/CPU_0/PROCESSOR/REG16B32/Bench
add wave -radix decimal -position end sim:/sys/CPU_0/PROCESSOR/MEM64B32/Bench
add wave -radix decimal -position end  sim:/sys/INSTRUCTOR_0/PCT24B32/COUNTER
add wave -radix hex -position end sim:/sys/INSTRUCTION

force -freeze sim:/sys/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/sys/RESET 0 0
