library ieee;				  
use ieee.std_logic_1164.all;

-- critical path: 10ns
entity half_adder is
	port(a, b: in std_logic; carry, sum: out std_logic);
end entity;

architecture structural of half_adder is
	component and2 is
		port(a, b: in std_logic; f: out std_logic);
	end component;
	
	component xor2 is
		port(a, b: in std_logic; f: out std_logic);
	end component;

begin	
	and1: and2 port map(a, b, carry);
	xor1: xor2 port map(a, b, sum);
end architecture;

