library ieee;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity half_adder_tb is
end half_adder_tb;

architecture TB_ARCHITECTURE of half_adder_tb is
	-- Component declaration of the tested unit
	component half_adder
		port(
			a : in STD_LOGIC;
			b : in STD_LOGIC;
			carry : out STD_LOGIC;
			sum : out STD_LOGIC );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC;
	signal b : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal carry : STD_LOGIC;
	signal sum : STD_LOGIC;
	
	-- Add your code here ...
	
begin
	
	-- Unit Under Test port map
	UUT : half_adder
	port map (
		a => a,
		b => b,
		carry => carry,
		sum => sum
		);
	
	-- Add your stimulus here ...
	process
	begin
		a <= '0';
		b <= '0';
		wait for 10ns;
		
		a <= '1';
		wait for 10ns;
		
		b <= '1';
		wait for 10ns;
		
		wait;		
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_half_adder of half_adder_tb is
	for TB_ARCHITECTURE
		for UUT : half_adder
			use entity work.half_adder(structural);
		end for;
	end for;
end TESTBENCH_FOR_half_adder;

