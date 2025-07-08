library ieee;				  
use ieee.std_logic_1164.all;

entity mux_4bit is
	port(
		a, b: in std_logic_vector(3 downto 0); s: in std_logic;
		f: out std_logic_vector(3 downto 0)
		);
end entity;

architecture behavioral of mux_4bit is
begin
	process(a, b, s)
	begin
		if (s = '0') then
			f <= a;
		elsif (s = '1') then
			f <= b;
		else f <= "XXXX";
		end if;
	end process;
	
end architecture;

