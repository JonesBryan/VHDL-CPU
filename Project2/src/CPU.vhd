library ieee;				  
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CPU is
	port(clk: in std_logic; r6, r7: out std_logic_vector(15 downto 0));
end entity;

architecture structural of CPU is
	
	-- Instruction memory signals
	signal pc: unsigned(7 downto 0) := "00000000";
	signal instruction: std_logic_vector(15 downto 0);
	
	component InstructionMemory is
		port(
			address: in std_logic_vector(7 downto 0);
			instruction: out std_logic_vector(15 downto 0)
			);
	end component;
	
	-- Instruction decoder signals
	signal aluOp: std_logic_vector(2 downto 0);
	signal regDst, regMem, regWrite, memWrite, memToReg: std_logic;
	
	component InstructionDecoder is
		port(
			opcode: in std_logic_vector(2 downto 0);
			aluOp: out std_logic_vector(2 downto 0);
			regDst, regMem, regWrite, memWrite, memToReg: out std_logic
			);
	end component;
	
	-- Register file signals
	signal reg_data1, reg_data2: std_logic_vector(15 downto 0);
	
	component RegisterFile is
		port(
			clk, regWrite: in std_logic;
			rd_addr1, rd_addr2, wr_addr: in std_logic_vector(3 downto 0);
			wr_data: in std_logic_vector(15 downto 0);
			rd_data1, rd_data2: out std_logic_vector(15 downto 0)
			);
	end component;
	
	-- ALU signals
	signal alu_value: std_logic_vector(15 downto 0);
	signal alu_status: std_logic_vector(2 downto 0);
	
	component ALU is
		port(
			a, b: in std_logic_vector(15 downto 0); s: in std_logic_vector(2 downto 0);
			f: out std_logic_vector(15 downto 0); status: out std_logic_vector(2 downto 0)
			);
	end component;
	
	-- RAM signals
	signal ram_data: std_logic_vector(15 downto 0);
	
	component RAM is
		port(
			clk, memWrite: in std_logic;
			address: in std_logic_vector(7 downto 0);
			wr_data: in std_logic_vector(15 downto 0);
			rd_data: out std_logic_vector(15 downto 0)
			);
	end component;
	
	-- Sign Extender signals
	signal immediate_extended: std_logic_vector(15 downto 0);
	
	
	component SignExtender is
		port(
			a: in std_logic_vector(7 downto 0);
			f: out std_logic_vector(15 downto 0)
			);
	end component;
	
	component mux_4bit is
		port(
			a, b: in std_logic_vector(3 downto 0); s: in std_logic;
			f: out std_logic_vector(3 downto 0)
			);
	end component;
	
	
	component mux_1_16bit is
		port(
			a, b: in std_logic_vector(15 downto 0); s: in std_logic;
			f: out std_logic_vector(15 downto 0)
			);
	end component;
	
	
	-- Debugging signals and intermediates
	signal opcode: std_logic_vector(2 downto 0);
	
	signal regRead1: std_logic_vector(3 downto 0);
	signal regWriteData: std_logic_vector(15 downto 0);
	
	signal regWriteBackData: std_logic_vector(15 downto 0);
	
begin
	process(clk)
	begin
		if rising_edge(clk) then
		pc <= pc + 1;
		end if;
	end process;
	
	InstFetch: InstructionMemory port map(std_logic_vector(pc), instruction);
	
	opcode <= instruction(14 downto 12);
	
	InstDecode: InstructionDecoder port map(opcode, aluOp, regDst, regMem, regWrite, memWrite, memToReg);
	
	-- Selection mux for register file read1 address
	reg_read1_mux: mux_4bit port map(instruction(7 downto 4), instruction(11 downto 8), regMem, regRead1);
	
	-- Sign extender for load immediate instructions
	SE: SignExtender port map(instruction(7 downto 0), immediate_extended);
	
	-- Selection mux for register file write data
	reg_wr_data_mux: mux_1_16bit port map(immediate_extended, regWriteBackData, regDst, regWriteData);
	
	RegFile: RegisterFile port map(clk, regWrite, regRead1, instruction(3 downto 0), instruction(11 downto 8), regWriteData, reg_data1, reg_data2);
	
	ALU1: ALU port map(reg_data1, reg_data2, aluOp, alu_value, alu_status);
	
	RAM1: RAM port map(clk, memWrite, instruction(7 downto 0), reg_data1, ram_data);
	
	-- Selection mux for register write-back
	reg_wb_mux: mux_1_16bit port map(alu_value, ram_data, memToReg, regWriteBackData);
	
end architecture;