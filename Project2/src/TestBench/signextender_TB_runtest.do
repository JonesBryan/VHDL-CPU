SetActiveLib -work
comp -include "$dsn\src\SignExtender.vhd" 
comp -include "$dsn\src\TestBench\signextender_TB.vhd" 
asim +access +r TESTBENCH_FOR_signextender 
wave 
wave -noreg a
wave -noreg f
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\signextender_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_signextender 
