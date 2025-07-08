library ieee;				  
use ieee.std_logic_1164.all;

entity mux_3_16bit is
	port(
		a, b, add, sub, mult: in std_logic_vector(15 downto 0); s: in std_logic_vector(2 downto 0);
		f: out std_logic_vector(15 downto 0)
		);
end entity;

architecture behavioral of mux_3_16bit is
begin
	process(a, b, add, sub, mult, s)
	begin
		if (s = "000") then
			f <= add;
		elsif (s = "001") then
			f <= mult;
		elsif (s = "010") then
			f <= a;
		elsif (s = "011") then
			f <= b;
		elsif (s = "100") then
			f <= sub;
		else f <= "XXXXXXXXXXXXXXXX";
		end if;
	end process;
	
end architecture;

