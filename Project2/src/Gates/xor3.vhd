library ieee;
use ieee.std_logic_1164.all;

entity xor3 is
	port(a, b, c: in std_logic; f: out std_logic);
end entity;

architecture structural of xor3 is
	component xor2 is
		port(a, b: in std_logic; f: out std_logic);
	end component;
	
	signal xor1: std_logic;
begin
	x1: xor2 port map(a, b, xor1);
	x2: xor2 port map(xor1, c, f);
end architecture;

