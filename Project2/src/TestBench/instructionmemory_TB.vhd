library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity instructionmemory_tb is
end instructionmemory_tb;

architecture TB_ARCHITECTURE of instructionmemory_tb is
	-- Component declaration of the tested unit
	component instructionmemory
		port(
			address : in STD_LOGIC_VECTOR(7 downto 0);
			instruction : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal address : STD_LOGIC_VECTOR(7 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal instruction : STD_LOGIC_VECTOR(15 downto 0);
	
	-- Add your code here ...
	
begin
	
	-- Unit Under Test port map
	UUT : instructionmemory
	port map (
		address => address,
		instruction => instruction
		);
	
	process
	begin	
		address <= "00000000";
		wait for 1ns;		  
		
		address <= "00000001";
		wait for 1ns;
		
		address <= "00000010";
		wait for 1ns;
		
		address <= "00000011";
		wait for 1ns;
		
		address <= "00001110";
		wait for 1ns;
		
		address <= "00001111";
		wait for 1ns;
		
		wait;
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_instructionmemory of instructionmemory_tb is
	for TB_ARCHITECTURE
		for UUT : instructionmemory
			use entity work.instructionmemory(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_instructionmemory;

