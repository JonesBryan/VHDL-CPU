library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity signextender_tb is
end signextender_tb;

architecture TB_ARCHITECTURE of signextender_tb is
	-- Component declaration of the tested unit
	component signextender
	port(
		a : in STD_LOGIC_VECTOR(7 downto 0);
		f : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC_VECTOR(7 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal f : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : signextender
		port map (
			a => a,
			f => f
		);

	-- Add your stimulus here ...
	process
	begin
		
		a <= "01111111";
		
		wait for 1ns;
		
		a <= "10000000";
		
		wait for 1ns;
		
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_signextender of signextender_tb is
	for TB_ARCHITECTURE
		for UUT : signextender
			use entity work.signextender(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_signextender;

