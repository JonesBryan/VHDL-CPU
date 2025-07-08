library ieee;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity subtractor_16bit_tb is
end subtractor_16bit_tb;

architecture TB_ARCHITECTURE of subtractor_16bit_tb is
	-- Component declaration of the tested unit
	component subtractor_16bit
		port(
			a : in STD_LOGIC_VECTOR(15 downto 0);
			b : in STD_LOGIC_VECTOR(15 downto 0);
			f : out STD_LOGIC_VECTOR(15 downto 0);
			overflow : out STD_LOGIC );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC_VECTOR(15 downto 0);
	signal b : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal f : STD_LOGIC_VECTOR(15 downto 0);
	signal overflow : STD_LOGIC;
	
	-- Add your code here ...
	
begin
	
	-- Unit Under Test port map
	UUT : subtractor_16bit
	port map (
		a => a,
		b => b,
		f => f,
		overflow => overflow
		);
	
	-- Add your stimulus here ... 
	
	process
	begin
		-- 100 - 100
		a <= "0000000001100100";
		b <= "0000000001100100";
		wait for 500ns;
		
		-- 100 - -100
		b <= "1111111110011100";
		wait for 500ns;
		
		-- -32768 - 1
		a <= "1000000000000000";
		b <= "0000000000000001";
		wait for 500ns;
		wait;
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_subtractor_16bit of subtractor_16bit_tb is
	for TB_ARCHITECTURE
		for UUT : subtractor_16bit
			use entity work.subtractor_16bit(structural);
		end for;
	end for;
end TESTBENCH_FOR_subtractor_16bit;

