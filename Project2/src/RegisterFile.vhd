library ieee;				  
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Behavioral using arrays (no delays)
entity RegisterFile is
	port(
		clk, regWrite: in std_logic;
		rd_addr1, rd_addr2, wr_addr: in std_logic_vector(3 downto 0);
		wr_data: in std_logic_vector(15 downto 0);
		rd_data1, rd_data2: out std_logic_vector(15 downto 0)
		);
end entity;

architecture behavioral of RegisterFile is
	type register_array is array (0 to 7) of std_logic_vector(15 downto 0);
	signal registers: register_array := (others => "0000000000000000");
	
begin	
	process(clk)
	begin
		if rising_edge(clk) and regWrite = '1' then
			registers(to_integer(unsigned(wr_addr(2 downto 0)))) <= wr_data;
		end if;
	end process;
	
	rd_data1 <= registers(to_integer(unsigned(rd_addr1(2 downto 0))));
	rd_data2 <= registers(to_integer(unsigned(rd_addr2(2 downto 0))));	
end architecture;