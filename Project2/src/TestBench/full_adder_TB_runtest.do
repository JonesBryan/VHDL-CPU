SetActiveLib -work
comp -include "$dsn\src\ALU\full_adder.vhd" 
comp -include "$dsn\src\TestBench\full_adder_TB.vhd" 
asim +access +r TESTBENCH_FOR_full_adder 
wave 
wave -noreg a
wave -noreg b
wave -noreg carry_in
wave -noreg carry
wave -noreg sum
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\full_adder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_full_adder 
