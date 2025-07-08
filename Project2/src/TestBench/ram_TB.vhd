library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity ram_tb is
end ram_tb;

architecture TB_ARCHITECTURE of ram_tb is
	-- Component declaration of the tested unit
	component ram
	port(
		clk : in STD_LOGIC;
		memWrite : in STD_LOGIC;
		address : in STD_LOGIC_VECTOR(7 downto 0);
		wr_data : in STD_LOGIC_VECTOR(15 downto 0);
		rd_data : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal memWrite : STD_LOGIC;
	signal address : STD_LOGIC_VECTOR(7 downto 0);
	signal wr_data : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal rd_data : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : ram
		port map (
			clk => clk,
			memWrite => memWrite,
			address => address,
			wr_data => wr_data,
			rd_data => rd_data
		);

	-- Add your stimulus here ...
	process
	begin	
		address <= "00000000";
		wr_data <= "1111111111111111";
		wait for 1ns;
		
		clk <= '1';
		wait for 0.5ns;
		clk <= '0';
		wait for 0.5ns;
		
		memWrite <= '1';
		
		clk <= '1';
		wait for 0.5ns;
		clk <= '0';
		wait for 0.5ns;
		
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_ram of ram_tb is
	for TB_ARCHITECTURE
		for UUT : ram
			use entity work.ram(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_ram;

