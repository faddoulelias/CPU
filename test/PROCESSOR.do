vlib work

vcom -93 ./entities/PROCESSOR.vhd
vsim -gui work.processor -default_radix unsigned


add wave -radix binary -position end sim:/processor/CLK
add wave -radix binary -position end sim:/processor/RESET

add wave -radix binary -position end sim:/processor/REG_WRITE
add wave -radix decimal -position end sim:/processor/RW
add wave -radix decimal -position end sim:/processor/RA
add wave -radix decimal -position end sim:/processor/RB
add wave -radix decimal -position end sim:/processor/IMM
add wave -radix binary -position end sim:/processor/ALU_SRC
add wave -radix binary -position end sim:/processor/ALU_CTR
add wave -radix binary -position end sim:/processor/MEM_WR
add wave -radix binary -position end sim:/processor/WR_SRC
add wave -radix binary -position end sim:/processor/FLAG(0)

add wave -radix decimal -position end sim:/processor/REG16B32/Bench
add wave -radix decimal -position end sim:/processor/MEM64B32/Bench
force -freeze sim:/processor/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/processor/reset 0 0

# // Copy data of 15 to 14
force -freeze sim:/processor/reg_write 1 0
force -freeze sim:/processor/ra 15 0
force -freeze sim:/processor/rb 0 0
force -freeze sim:/processor/rw 14 0
force -freeze sim:/processor/imm 0 0
force -freeze sim:/processor/alu_ctr {3} 0
force -freeze sim:/processor/alu_src 0 0
force -freeze sim:/processor/mem_wr 0 0
force -freeze sim:/processor/wr_src 0 0
run 100 ps;


# // Add data of 15 to 14 and store in 13
force -freeze sim:/processor/reg_write 1 0
force -freeze sim:/processor/ra 15 0
force -freeze sim:/processor/rb 14 0
force -freeze sim:/processor/rw 13 0
force -freeze sim:/processor/imm 0 0
force -freeze sim:/processor/alu_ctr {0} 0
force -freeze sim:/processor/alu_src 0 0
force -freeze sim:/processor/mem_wr 0 0
force -freeze sim:/processor/wr_src 0 0
run 100 ps;

# // Substract data of 13 to data of 14 and store in 12
force -freeze sim:/processor/reg_write 1 0
force -freeze sim:/processor/ra 14 0
force -freeze sim:/processor/rb 13 0
force -freeze sim:/processor/rw 12 0
force -freeze sim:/processor/imm 0 0
force -freeze sim:/processor/alu_ctr {2} 0
force -freeze sim:/processor/alu_src 0 0
force -freeze sim:/processor/mem_wr 0 0
force -freeze sim:/processor/wr_src 0 0
run 100 ps;

# // Substract immediate data of -120 to data of 12 and store in 11
force -freeze sim:/processor/reg_write 1 0
force -freeze sim:/processor/ra 12 0
force -freeze sim:/processor/rb 0 0
force -freeze sim:/processor/rw 11 0
force -freeze sim:/processor/imm {-120} 0
force -freeze sim:/processor/alu_ctr {2} 0
force -freeze sim:/processor/alu_src 1 0
force -freeze sim:/processor/mem_wr 0 0
force -freeze sim:/processor/wr_src 0 0
run 100 ps;

# // Add immediate data of 14 to data of 10 and store in 10
force -freeze sim:/processor/reg_write 1 0
force -freeze sim:/processor/ra 10 0
force -freeze sim:/processor/rb 0 0
force -freeze sim:/processor/rw 10 0
force -freeze sim:/processor/imm {14} 0
force -freeze sim:/processor/alu_ctr {0} 0
force -freeze sim:/processor/alu_src 1 0
force -freeze sim:/processor/mem_wr 0 0
force -freeze sim:/processor/wr_src 0 0
run 100 ps;

# // Substract immediate data of 2 to data in reg 9 and store in reg 9
force -freeze sim:/processor/reg_write 1 0
force -freeze sim:/processor/ra 10 0
force -freeze sim:/processor/rb 0 0
force -freeze sim:/processor/rw 9 0
force -freeze sim:/processor/imm {2} 0
force -freeze sim:/processor/alu_ctr {2} 0
force -freeze sim:/processor/alu_src 1 0
force -freeze sim:/processor/mem_wr 0 0
force -freeze sim:/processor/wr_src 0 0
run 100 ps;

# // Add immediate data of 4 to data of 8 and store in 8
force -freeze sim:/processor/reg_write 1 0
force -freeze sim:/processor/ra 8 0
force -freeze sim:/processor/rb 0 0
force -freeze sim:/processor/rw 8 0
force -freeze sim:/processor/imm {4} 0
force -freeze sim:/processor/alu_ctr {0} 0
force -freeze sim:/processor/alu_src 1 0
force -freeze sim:/processor/mem_wr 0 0
force -freeze sim:/processor/wr_src 0 0
run 100 ps;

# // Write data of reg 12 to address stored in reg 8
force -freeze sim:/processor/reg_write 0 0
force -freeze sim:/processor/ra 8 0
force -freeze sim:/processor/rb 12 0
force -freeze sim:/processor/rw 0 0
force -freeze sim:/processor/imm 0 0
force -freeze sim:/processor/alu_ctr {3} 0
force -freeze sim:/processor/alu_src 0 0
force -freeze sim:/processor/mem_wr 1 0
force -freeze sim:/processor/wr_src 0 0
run 100 ps;

# // Write immediate data of 2 to register 7
force -freeze sim:/processor/reg_write 1 0
force -freeze sim:/processor/ra 0 0
force -freeze sim:/processor/rb 0 0
force -freeze sim:/processor/rw 7 0
force -freeze sim:/processor/imm {2} 0
force -freeze sim:/processor/alu_ctr {1} 0
force -freeze sim:/processor/alu_src 1 0
force -freeze sim:/processor/mem_wr 0 0
force -freeze sim:/processor/wr_src 0 0
run 100 ps;

# // Load data in addr 12 to register 6
force -freeze sim:/processor/reg_write 1 0
force -freeze sim:/processor/ra 0 0
force -freeze sim:/processor/rb 0 0
force -freeze sim:/processor/rw 6 0
force -freeze sim:/processor/imm {4} 0
force -freeze sim:/processor/alu_ctr {1} 0
force -freeze sim:/processor/alu_src 1 0
force -freeze sim:/processor/mem_wr 0 0
force -freeze sim:/processor/wr_src 1 0
run 100 ps;

force -freeze sim:/processor/reg_write 0 0
force -freeze sim:/processor/ra 0 0
force -freeze sim:/processor/rb {11} 0
force -freeze sim:/processor/rw 0 0
force -freeze sim:/processor/imm {17} 0
force -freeze sim:/processor/alu_ctr 1 0
force -freeze sim:/processor/alu_src 1 0
force -freeze sim:/processor/mem_wr 1 0
force -freeze sim:/processor/wr_src 0 0
run 100 ps;
run 50 ps;