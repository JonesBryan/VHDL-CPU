SetActiveLib -work
comp -include "$dsn\src\mux_4bit.vhd" 
comp -include "$dsn\src\TestBench\mux_4bit_TB.vhd" 
asim +access +r TESTBENCH_FOR_mux_4bit 
wave 
wave -noreg a
wave -noreg b
wave -noreg s
wave -noreg f
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\mux_4bit_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_mux_4bit 
