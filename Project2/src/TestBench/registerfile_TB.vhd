library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity registerfile_tb is
end registerfile_tb;

architecture TB_ARCHITECTURE of registerfile_tb is
	-- Component declaration of the tested unit
	component registerfile
	port(
		clk : in STD_LOGIC;
		regWrite : in STD_LOGIC;
		rd_addr1 : in STD_LOGIC_VECTOR(3 downto 0);
		rd_addr2 : in STD_LOGIC_VECTOR(3 downto 0);
		wr_addr : in STD_LOGIC_VECTOR(3 downto 0);
		wr_data : in STD_LOGIC_VECTOR(15 downto 0);
		rd_data1 : out STD_LOGIC_VECTOR(15 downto 0);
		rd_data2 : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal regWrite : STD_LOGIC;
	signal rd_addr1 : STD_LOGIC_VECTOR(3 downto 0);
	signal rd_addr2 : STD_LOGIC_VECTOR(3 downto 0);
	signal wr_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal wr_data : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal rd_data1 : STD_LOGIC_VECTOR(15 downto 0);
	signal rd_data2 : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : registerfile
		port map (
			clk => clk,
			regWrite => regWrite,
			rd_addr1 => rd_addr1,
			rd_addr2 => rd_addr2,
			wr_addr => wr_addr,
			wr_data => wr_data,
			rd_data1 => rd_data1,
			rd_data2 => rd_data2
		);

	-- Add your stimulus here ...
	
	process
	begin
		
		rd_addr1 <= "0000";
		rd_addr2 <= "0001";
		
		wr_addr <= "0000";
		wr_data <= "1111111111111111";
		
		wait for 0.5ns;
		clk <= '1';
		wait for 0.5ns;
		clk <= '0';
		
		regWrite <= '1';
		
		wait for 0.5ns;
		clk <= '1';
		wait for 0.5ns;
		clk <= '0';
		
		wr_addr <= "0001";
		
		wait for 0.5ns;
		clk <= '1';
		wait for 0.5ns;
		clk <= '0';
		
		regWrite <= '0';
		
		wait for 1ns;
		
		rd_addr2 <= "0010";
		
		wait for 1ns;
		
		
		
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_registerfile of registerfile_tb is
	for TB_ARCHITECTURE
		for UUT : registerfile
			use entity work.registerfile(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_registerfile;

