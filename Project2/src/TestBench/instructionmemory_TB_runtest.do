SetActiveLib -work
comp -include "$dsn\src\InstructionMemory.vhd" 
comp -include "$dsn\src\TestBench\instructionmemory_TB.vhd" 
asim +access +r TESTBENCH_FOR_instructionmemory 
wave 
wave -noreg address
wave -noreg instruction
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\instructionmemory_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_instructionmemory 
