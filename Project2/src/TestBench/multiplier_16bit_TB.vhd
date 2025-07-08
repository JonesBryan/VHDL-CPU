library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity multiplier_16bit_tb is
end multiplier_16bit_tb;

architecture TB_ARCHITECTURE of multiplier_16bit_tb is
	-- Component declaration of the tested unit
	component multiplier_16bit
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
	UUT : multiplier_16bit
		port map (
			a => a,
			b => b,
			f => f,
			overflow => overflow
		);

	-- Add your stimulus here ...
	
	process
	begin
		-- 128 * 128
		a <= "0000000010000000";
		b <= "0000000010000000";
		wait for 580ns;
		
		-- 128 * -128
		b <= "1111111110000000";
		wait for 580ns;
		
		a <= "0111111111111111";
		b <= "0111111111111110";
		wait for 580ns;
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_multiplier_16bit of multiplier_16bit_tb is
	for TB_ARCHITECTURE
		for UUT : multiplier_16bit
			use entity work.multiplier_16bit(structural);
		end for;
	end for;
end TESTBENCH_FOR_multiplier_16bit;

