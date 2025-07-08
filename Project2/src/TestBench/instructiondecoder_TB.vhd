library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity instructiondecoder_tb is
end instructiondecoder_tb;

architecture TB_ARCHITECTURE of instructiondecoder_tb is
	-- Component declaration of the tested unit
	component instructiondecoder
		port(
			opcode : in STD_LOGIC_VECTOR(2 downto 0);
			aluOp : out STD_LOGIC_VECTOR(2 downto 0);
			regDst : out STD_LOGIC;
			regMem : out STD_LOGIC;
			regWrite : out STD_LOGIC;
			memWrite : out STD_LOGIC;
			memToReg : out STD_LOGIC );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal opcode : STD_LOGIC_VECTOR(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal aluOp : STD_LOGIC_VECTOR(2 downto 0);
	signal regDst : STD_LOGIC;
	signal regMem : STD_LOGIC;
	signal regWrite : STD_LOGIC;
	signal memWrite : STD_LOGIC;
	signal memToReg : STD_LOGIC;
	
	-- Add your code here ...
	
begin
	
	-- Unit Under Test port map
	UUT : instructiondecoder
	port map (
		opcode => opcode,
		aluOp => aluOp,
		regDst => regDst,
		regMem => regMem,
		regWrite => regWrite,
		memWrite => memWrite,
		memToReg => memToReg
		);
	
	-- Add your stimulus here ...
	process
	begin	
		opcode <= "000";
		wait for 100ns;
		
		opcode <= "100";
		wait for 100ns;
		
		opcode <= "101";
		wait for 100ns;
		
		opcode <= "110";
		wait for 100ns;
		
		opcode <= "111";
		wait for 100ns;
		
		wait;
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_instructiondecoder of instructiondecoder_tb is
	for TB_ARCHITECTURE
		for UUT : instructiondecoder
			use entity work.instructiondecoder(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_instructiondecoder;

