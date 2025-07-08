library ieee;				  
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Replaced with a type of multiplexer below
-- Critical path: 60ns
--entity InstructionDecoder is
--	port(
--		opcode: in std_logic_vector(2 downto 0);
--		aluOp: out std_logic_vector(2 downto 0);
--		regDst, regMem, regWrite, memWrite, memToReg: out std_logic
--		);
--end entity;
--
--architecture structural of InstructionDecoder is
--	component and3 is
--		port(a, b, c: in std_logic; f: out std_logic);
--	end component;
--	
--	component or3 is
--		port(a, b, c: in std_logic; f: out std_logic);
--	end component;
--	
--	component or2 is
--		port(a, b: in std_logic; f: out std_logic);
--	end component;
--	
--	component not1 is
--		port(a: in std_logic; f: out std_logic);
--	end component;
--	
--	signal not_opcode: std_logic_vector(2 downto 0);
--	
--	signal rmem1: std_logic;
--	signal rmem2: std_logic;
--	
--begin
--	aluOp <= opcode;
--	
--	not_op0: not1 port map(opcode(0), not_opcode(0));
--	not_op1: not1 port map(opcode(1), not_opcode(1));
--	not_op2: not1 port map(opcode(2), not_opcode(2));
--	
--	rDst: or3 port map(opcode(1), not_opcode(0), not_opcode(2), regDst); -- 30ns
--	
--	rMem: and3 port map(opcode(0), opcode(1), not_opcode(2), rmem1);
--	rMem_2: and3 port map(opcode(0), opcode(1), opcode(2), rmem2);
--	rMem_3: or2 port map(rmem1, rmem2, regMem);
--	
--	rWrite: or3 port map(not_opcode(0), not_opcode(1), opcode(2), regWrite);
--	
--	mWrite: and3 port map(opcode(0), opcode(1), not_opcode(2), memWrite);
--	
--	memReg: and3 port map(opcode(0), opcode(1), opcode(2), memToReg);
--		
--end architecture;

entity InstructionDecoder is
	port(
		opcode: in std_logic_vector(2 downto 0);
		aluOp: out std_logic_vector(2 downto 0);
		regDst, regMem, regWrite, memWrite, memToReg: out std_logic
		);
end entity;

architecture behavioral of InstructionDecoder is
begin	
	process(opcode)
	begin
		case opcode is
			when "000" | "001" | "010" | "011" | "100" => -- All R-type instructions
				aluOp <= opcode;
				regDst <= '1';	
				regMem <= '0';
				regWrite <= '1';
				memWrite <= '0';
				memToReg <= '0';
			
			when "101" => -- Load immediate
				aluOp <= "011";
				regDst <= '0';
				regMem <= '0';
				regWrite <= '1';
				memWrite <= '0';
				memToReg <= '0';
			
			when "110" => -- store halfword
				aluOp <= "011";
				regDst <= '0';
				regMem <= '1';
				regWrite <= '0';
				memWrite <= '1';
				memToReg <= '0';
			
			when "111" => -- load halfword
				aluOp <= "011";
				regDst <= '1';
				regMem <= '1';
				regWrite <= '1';
				memWrite <= '0';
				memToReg <= '1';
			
			when others => -- this should never happen
				aluOp <= "XXX";
				regDst <= 'X';
				regMem <= 'X';
				regWrite <= 'X';
				memWrite <= 'X';
				memToReg <= 'X';
		end case;
	end process;
end architecture;