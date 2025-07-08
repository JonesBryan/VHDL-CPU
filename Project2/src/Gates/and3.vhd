library ieee;
use ieee.std_logic_1164.all;

entity and3 is
	port(a, b, c: in std_logic; f: out std_logic);
end entity;

architecture structural of and3 is
	component and2 is
		port(a, b: in std_logic; f: out std_logic);
	end component;
	
	signal and1: std_logic;
begin
	
	a1: and2 port map(a, b, and1);
	a2: and2 port map(c, and1, f);
	
end architecture;

