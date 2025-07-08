SetActiveLib -work
comp -include "$dsn\src\RegisterFile.vhd" 
comp -include "$dsn\src\TestBench\registerfile_TB.vhd" 
asim +access +r TESTBENCH_FOR_registerfile 
wave 
wave -noreg clk
wave -noreg regWrite
wave -noreg rd_addr1
wave -noreg rd_addr2
wave -noreg wr_addr
wave -noreg wr_data
wave -noreg rd_data1
wave -noreg rd_data2
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\registerfile_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_registerfile 
