library ieee;				  
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SignExtender is
	port(
		a: in std_logic_vector(7 downto 0);
		f: out std_logic_vector(15 downto 0)
		);
end entity;

architecture behavioral of SignExtender is
begin
	f(15 downto 8) <= (others => a(7));
	f(7 downto 0) <= a;
end architecture;