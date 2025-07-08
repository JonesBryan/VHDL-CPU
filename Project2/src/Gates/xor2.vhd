library ieee;
use ieee.std_logic_1164.all;

entity xor2 is
	port(a, b: in std_logic; f: out std_logic);
end entity;

architecture behavioral of xor2 is
begin
	process(a,b)
	begin
		if a = '1' and b = '0' then
			f <= '1' after 10ns;
			
		elsif a = '1' and b = '1' then
			f <= '0' after 10ns;
			
		elsif a = '0' and b = '1' then
			f <= '1' after 10ns;
			
		elsif a = '0' and b = '0' then
			f <= '0' after 10ns;
			
		elsif a = 'U' or b = 'U' then
			f <= 'U' after 10ns;
			
		else
			f <= 'X' after 10ns;
		end if;
	end process;
end architecture;

