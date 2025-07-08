SetActiveLib -work
comp -include "$dsn\src\InstructionDecoder.vhd" 
comp -include "$dsn\src\TestBench\instructiondecoder_TB.vhd" 
asim +access +r TESTBENCH_FOR_instructiondecoder 
wave 
wave -noreg opcode
wave -noreg aluOp
wave -noreg regDst
wave -noreg regMem
wave -noreg regWrite
wave -noreg memWrite
wave -noreg memToReg
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\instructiondecoder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_instructiondecoder 
