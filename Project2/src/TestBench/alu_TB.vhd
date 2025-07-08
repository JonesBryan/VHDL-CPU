library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
	port(
		a : in STD_LOGIC_VECTOR(15 downto 0);
		b : in STD_LOGIC_VECTOR(15 downto 0);
		s : in STD_LOGIC_VECTOR(2 downto 0);
		f : out STD_LOGIC_VECTOR(15 downto 0);
		status : out STD_LOGIC_VECTOR(2 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC_VECTOR(15 downto 0);
	signal b : STD_LOGIC_VECTOR(15 downto 0);
	signal s : STD_LOGIC_VECTOR(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal f : STD_LOGIC_VECTOR(15 downto 0);
	signal status : STD_LOGIC_VECTOR(2 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alu
		port map (
			a => a,
			b => b,
			s => s,
			f => f,
			status => status
		);

	-- Add your stimulus here ...
	process
	begin
		a <= "0000000000000001";
		b <= "0000000000000000";
		
		-- a passthrough
		s <= "010";
		wait for 630ns;
		
		-- b passthrough
		s <= "011";
		wait for 630ns;
		
		-- addition
		s <= "000";
		
		-- 100 + 100
		a <= "0000000001100100";
		b <= "0000000001100100";
		wait for 630ns;
		
		-- 100 + -100
		b <= "1111111110011100";
		wait for 630ns;
		
		-- 32767 + 1
		a <= "0111111111111111";
		b <= "0000000000000001";
		wait for 630ns;
		
		-- subtraction
		s <= "100";
		
		-- 100 - 100
		a <= "0000000001100100";
		b <= "0000000001100100";
		wait for 630ns;
		
		-- 100 - -100
		b <= "1111111110011100";
		wait for 630ns;
		
		-- -32768 - 1
		a <= "1000000000000000";
		b <= "0000000000000001";
		wait for 630ns;
		
		-- multiplication
		s <= "001";
		
		-- 128 * 128
		a <= "0000000010000000";
		b <= "0000000010000000";
		wait for 630ns;
		
		-- 128 * -128
		b <= "1111111110000000";
		wait for 630ns;
		
		a <= "0111111111111111";
		b <= "0111111111111110";
		wait for 630ns;		
		
	wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(structural);
		end for;
	end for;
end TESTBENCH_FOR_alu;

