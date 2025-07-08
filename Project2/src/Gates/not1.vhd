library ieee;
use ieee.std_logic_1164.all;

entity not1 is
	port(a: in std_logic; f: out std_logic);
end entity;

architecture behavioral of not1 is
begin
	process(a)
	begin
		if a = '1' then
			f <= '0' after 10ns;
			
		elsif a = '0' then
			f <= '1' after 10ns;
			
		elsif a = 'U' then
			f <= 'U' after 10ns;
			
		else
			f <= 'X' after 10ns;
		end if;
	end process;
end architecture;

