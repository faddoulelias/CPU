vlib work

vcom -93 ./entities/MUX2TN.vhd
vsim -gui work.mux2tn -default_radix decimal

add wave -radix decimal -position end sim:/mux2tn/A
add wave -radix decimal -position end sim:/mux2tn/B
add wave -radix decimal -position end sim:/mux2tn/COM
add wave -radix decimal -position end sim:/mux2tn/S


force -freeze sim:/mux2tn/A   {35}   0
force -freeze sim:/mux2tn/B   {53}   0
force -freeze sim:/mux2tn/COM {0}    0
run 1ns
force -freeze sim:/mux2tn/COM {1}    0
run 1ns
force -freeze sim:/mux2tn/B   {2500} 0
run 1ns
force -freeze sim:/mux2tn/COM {0}    0
run 1ns
force -freeze sim:/mux2tn/COM {1}    0

