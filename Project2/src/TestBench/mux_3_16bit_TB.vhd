library ieee;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity mux_3_16bit_tb is
end mux_3_16bit_tb;

architecture TB_ARCHITECTURE of mux_3_16bit_tb is
	-- Component declaration of the tested unit
	component mux_3_16bit
		port(
			a : in STD_LOGIC_VECTOR(15 downto 0);
			b : in STD_LOGIC_VECTOR(15 downto 0);
			add : in STD_LOGIC_VECTOR(15 downto 0);
			sub : in STD_LOGIC_VECTOR(15 downto 0);
			mult : in STD_LOGIC_VECTOR(15 downto 0);
			s : in STD_LOGIC_VECTOR(2 downto 0);
			f : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC_VECTOR(15 downto 0);
	signal b : STD_LOGIC_VECTOR(15 downto 0);
	signal add : STD_LOGIC_VECTOR(15 downto 0);
	signal sub : STD_LOGIC_VECTOR(15 downto 0);
	signal mult : STD_LOGIC_VECTOR(15 downto 0);
	signal s : STD_LOGIC_VECTOR(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal f : STD_LOGIC_VECTOR(15 downto 0);
	
	-- Add your code here ...
	
begin
	
	-- Unit Under Test port map
	UUT : mux_3_16bit
	port map (
		a => a,
		b => b,
		add => add,
		sub => sub,
		mult => mult,
		s => s,
		f => f
		);
	
	-- Add your stimulus here ...
	process
	begin	
		a <= "0000000000000001";
		b <= "0000000000000010";
		add <= "0000000000000011";
		sub <= "1111111111111110";
		mult <= "0000000000000010";
		
		-- a passthrough
		s <= "010";
		wait for 100ns;
		
		-- b passthrough
		s <= "011";
		wait for 100ns;
		
		-- addition
		s <= "000";
		wait for 490ns;
		
		-- multiplication
		s <= "001";
		wait for 1280ns;
		
		-- subtraction
		s <= "100";
		wait for 500ns;
		
		-- invalid
		s <= "110";
		wait for 100ns;
		
		wait;
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mux_3_16bit of mux_3_16bit_tb is
	for TB_ARCHITECTURE
		for UUT : mux_3_16bit
			use entity work.mux_3_16bit(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_mux_3_16bit;

