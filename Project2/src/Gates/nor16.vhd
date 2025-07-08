library ieee;
use ieee.std_logic_1164.all;

-- critical path: 50ns
entity nor16 is
	port(a: in std_logic_vector(15 downto 0); f: out std_logic);
end entity;

architecture structural of nor16 is
	component or16 is
		port(a: in std_logic_vector(15 downto 0); f: out std_logic);
	end component;
	
	component not1 is
		port(a: in std_logic; f: out std_logic);
	end component;
	
	signal or_output: std_logic;
begin
	orgate: or16 port map(a, or_output);
	
	output: not1 port map(or_output, f);	
end architecture;

