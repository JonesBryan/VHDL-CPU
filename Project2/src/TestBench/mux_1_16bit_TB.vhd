library ieee;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity mux_1_16bit_tb is
end mux_1_16bit_tb;

architecture TB_ARCHITECTURE of mux_1_16bit_tb is
	-- Component declaration of the tested unit
	component mux_1_16bit
		port(
			a : in STD_LOGIC_VECTOR(15 downto 0);
			b : in STD_LOGIC_VECTOR(15 downto 0);
			s : in STD_LOGIC;
			f : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC_VECTOR(15 downto 0);
	signal b : STD_LOGIC_VECTOR(15 downto 0);
	signal s : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal f : STD_LOGIC_VECTOR(15 downto 0);
	
	-- Add your code here ...
	
begin
	
	-- Unit Under Test port map
	UUT : mux_1_16bit
	port map (
		a => a,
		b => b,
		s => s,
		f => f
		);
	
	-- Add your stimulus here ...
	process
	begin
		a <= "0000000000000000";
		b <= "1111111111111111";
		
		s <= '0';
		
		wait for 1ns;
		
		s <= '1';
		
		wait for 1ns;
		wait;
		
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mux_1_16bit of mux_1_16bit_tb is
	for TB_ARCHITECTURE
		for UUT : mux_1_16bit
			use entity work.mux_1_16bit(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_mux_1_16bit;

