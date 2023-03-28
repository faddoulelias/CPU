vlib work

vcom -93 ./entities/CPU.vhd
vsim -gui work.cpu -default_radix hexadecimal

add wave -radix hex -position end  sim:/cpu/INSTRUCTION
add wave -radix binary -position end  sim:/cpu/CLK
add wave -radix binary -position end  sim:/cpu/RESET
add wave -radix decimal -position end  sim:/cpu/PROCESSOR/MEM64B32/Bench
add wave -radix decimal -position end  sim:/cpu/PROCESSOR/REG16B32/Bench

force -freeze sim:/cpu/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/cpu/RESET 0 0
run 30ps

# // MOV : REG[f] = REG[e]
force -freeze sim:/cpu/INSTRUCTION {010fe000} 0 
run 100ps

# // ADD : REG[d] = REG[f] + REG[e]
force -freeze sim:/cpu/INSTRUCTION {020fed00} 0
run 100ps

# // SUB : REG[c] = REG[e] - REG[d]
force -freeze sim:/cpu/INSTRUCTION {030edc00} 0
run 100ps

# // ADDi : REG[b] = REG[c] + 120
force -freeze sim:/cpu/INSTRUCTION {040cb078} 0
run 100ps

# // SUBi : REG[b] = REG[c] + 120
force -freeze sim:/cpu/INSTRUCTION {050bb002} 0
run 100ps

# // STR : MEM[2] = REG[b]
force -freeze sim:/cpu/INSTRUCTION {060b0002} 0
run 100ps

# // LDR : REG[a] = MEM[2]
force -freeze sim:/cpu/INSTRUCTION {070a0002} 0
run 100ps

# // SET : REG[9] = 95
force -freeze sim:/cpu/INSTRUCTION {0809005f} 0
run 100ps