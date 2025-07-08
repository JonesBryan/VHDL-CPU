library ieee;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity adder_16bit_tb is
end adder_16bit_tb;

architecture TB_ARCHITECTURE of adder_16bit_tb is
	-- Component declaration of the tested unit
	component adder_16bit
		port(
			a : in STD_LOGIC_VECTOR(15 downto 0);
			b : in STD_LOGIC_VECTOR(15 downto 0);
			carry_in : in STD_LOGIC;
			f : out STD_LOGIC_VECTOR(15 downto 0);
			overflow : out STD_LOGIC );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC_VECTOR(15 downto 0);
	signal b : STD_LOGIC_VECTOR(15 downto 0);
	signal carry_in : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal f : STD_LOGIC_VECTOR(15 downto 0);
	signal overflow : STD_LOGIC;
	
	-- Add your code here ...
	
begin
	
	-- Unit Under Test port map
	UUT : adder_16bit
	port map (
		a => a,
		b => b,
		carry_in => carry_in,
		f => f,
		overflow => overflow
		);
	
	-- Add your stimulus here ...	
	
	process
	begin
		carry_in <= '0';
		
		-- 1000 + 2000
		a <= "0000001111101000";
		b <= "0000011111010000";
		carry_in <= '0';
		wait for 490ns;
		
		-- 100 + 100
		a <= "0000000001100100";
		b <= "0000000001100100";
		wait for 490ns;
		
		-- 100 + -100
		b <= "1111111110011100";
		wait for 490ns;
		
		-- 32767 + 1
		a <= "0111111111111111";
		b <= "0000000000000001";
		wait for 490ns;
		
		wait;
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_adder_16bit of adder_16bit_tb is
	for TB_ARCHITECTURE
		for UUT : adder_16bit
			use entity work.adder_16bit(structural);
		end for;
	end for;
end TESTBENCH_FOR_adder_16bit;

