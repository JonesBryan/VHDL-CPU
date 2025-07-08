library ieee;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity full_adder_tb is
end full_adder_tb;

architecture TB_ARCHITECTURE of full_adder_tb is
	-- Component declaration of the tested unit
	component full_adder
		port(
			a : in STD_LOGIC;
			b : in STD_LOGIC;
			carry_in : in STD_LOGIC;
			carry : out STD_LOGIC;
			sum : out STD_LOGIC );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC;
	signal b : STD_LOGIC;
	signal carry_in : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal carry : STD_LOGIC;
	signal sum : STD_LOGIC;
	
	-- Add your code here ...
	
begin
	
	-- Unit Under Test port map
	UUT : full_adder
	port map (
		a => a,
		b => b,
		carry_in => carry_in,
		carry => carry,
		sum => sum
		);
	
	-- Add your stimulus here ...  
	process
	begin
		a <= '0';
		b <= '0';
		carry_in <= '0';
		wait for 30ns;
		
		a <= '1';
		wait for 30ns;
		
		b <= '1';
		wait for 30ns;
		
		carry_in <= '1';
		wait for 30ns;
		
		wait;		
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_full_adder of full_adder_tb is
	for TB_ARCHITECTURE
		for UUT : full_adder
			use entity work.full_adder(structural);
		end for;
	end for;
end TESTBENCH_FOR_full_adder;

