library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity mux_4bit_tb is
end mux_4bit_tb;

architecture TB_ARCHITECTURE of mux_4bit_tb is
	-- Component declaration of the tested unit
	component mux_4bit
	port(
		a : in STD_LOGIC_VECTOR(3 downto 0);
		b : in STD_LOGIC_VECTOR(3 downto 0);
		s : in STD_LOGIC;
		f : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC_VECTOR(3 downto 0);
	signal b : STD_LOGIC_VECTOR(3 downto 0);
	signal s : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal f : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : mux_4bit
		port map (
			a => a,
			b => b,
			s => s,
			f => f
		);

	-- Add your stimulus here ...
	process
	begin
		a <= "0000";
		b <= "1111";
		
		s <= '0';
		wait for 1ns;
		
		s <= '1';
		wait for 1ns;
		
		wait;
		end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mux_4bit of mux_4bit_tb is
	for TB_ARCHITECTURE
		for UUT : mux_4bit
			use entity work.mux_4bit(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_mux_4bit;

