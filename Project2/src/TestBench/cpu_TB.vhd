library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity cpu_tb is
end cpu_tb;

architecture TB_ARCHITECTURE of cpu_tb is
	-- Component declaration of the tested unit
	component cpu
		port(
			clk : in STD_LOGIC;
			r6 : out STD_LOGIC_VECTOR(15 downto 0);
			r7 : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal r6 : STD_LOGIC_VECTOR(15 downto 0);
	signal r7 : STD_LOGIC_VECTOR(15 downto 0);
	
	-- Add your code here ...
	
	signal simulation_active: std_logic := '1';
	
begin
	
	-- Unit Under Test port map
	UUT : cpu
	port map (
		clk => clk,
		r6 => r6,
		r7 => r7
		);
	
	-- Add your stimulus here ...
	
	process
	begin
		while simulation_active = '1' loop
			if clk = '1' then
				clk <= '0';
			else clk <= '1';
			end if;
			
			wait for 315ns;
		end loop;
		wait;
	end process;
	
	process
	begin
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		simulation_active <= '0';
		wait;
	end process;
	
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_cpu of cpu_tb is
	for TB_ARCHITECTURE
		for UUT : cpu
			use entity work.cpu(structural);
		end for;
	end for;
end TESTBENCH_FOR_cpu;

