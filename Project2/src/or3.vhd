library ieee;
use ieee.std_logic_1164.all;

entity or3 is
	port(a, b, c: in std_logic; f: out std_logic);
end entity;

architecture structural of or3 is
	component or2 is
		port(a, b: in std_logic; f: out std_logic);
	end component;
	
	signal or1: std_logic;
begin
	
	o1: or2 port map(a, b, or1);
	o2: or2 port map(c, or1, f);
	
end architecture;

