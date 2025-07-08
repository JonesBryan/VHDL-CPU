library ieee;				  
use ieee.std_logic_1164.all;

entity mux_1_16bit is
	port(
		a, b: in std_logic_vector(15 downto 0); s: in std_logic;
		f: out std_logic_vector(15 downto 0)
		);
end entity;

architecture behavioral of mux_1_16bit is
begin
	process(a, b, s)
	begin
		if (s = '0') then
			f <= a;
		elsif (s = '1') then
			f <= b;
		else f <= "XXXXXXXXXXXXXXXX";
		end if;
	end process;
	
end architecture;

