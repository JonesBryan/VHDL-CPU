library ieee;
use ieee.std_logic_1164.all;

-- critical path: 20ns
entity or4 is
	port(a, b, c, d: in std_logic; f: out std_logic);
end entity;

architecture structural of or4 is
	component or2 is
		port(a, b: in std_logic; f: out std_logic);
	end component;
	
	signal ab, cd: std_logic;
begin
	or_1: or2 port map(a, b, ab);
	or_2: or2 port map(c, d, cd);
	or_3: or2 port map(ab, cd, f);
end architecture;

