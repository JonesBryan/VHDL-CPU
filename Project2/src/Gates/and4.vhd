library ieee;
use ieee.std_logic_1164.all;

-- critical path: 20ns
entity and4 is
	port(a, b, c, d: in std_logic; f: out std_logic);
end entity;

architecture structural of and4 is
	component and2 is
		port(a, b: in std_logic; f: out std_logic);
	end component;
	
	signal ab, cd: std_logic;
begin
	and_1: and2 port map(a, b, ab);
	and_2: and2 port map(c, d, cd);
	and_3: and2 port map(ab, cd, f);
end architecture;

