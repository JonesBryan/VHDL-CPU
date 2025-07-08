library ieee;				  
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Behavioral using arrays (no delays)
entity RAM is
	port(
		clk, memWrite: in std_logic;
		address: in std_logic_vector(7 downto 0);
		wr_data: in std_logic_vector(15 downto 0);
		rd_data: out std_logic_vector(15 downto 0)
		);
end entity;

architecture behavioral of RAM is
	type register_array is array (0 to 255) of std_logic_vector(15 downto 0);
	signal registers: register_array := (others => "0000000000000000");
begin	
	
	process(clk)
	begin
		if rising_edge(clk) and memWrite = '1' then
			registers(to_integer(unsigned(address))) <= wr_data;
		end if;
	end process;
	
	rd_data <= registers(to_integer(unsigned(address)));
end architecture;