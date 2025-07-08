library ieee;				  
use ieee.std_logic_1164.all;

-- critical path: 30ns
entity full_adder is
	port(a, b, carry_in: in std_logic; carry, sum: out std_logic);
end entity;

architecture structural of full_adder is
	component half_adder is
		port(a, b: in std_logic; carry, sum: out std_logic);
	end component;
	
	component or2 is
		port(a, b: in std_logic; f: out std_logic);
	end component;
	
	signal ha1_carry: std_logic;
	signal ha1_sum: std_logic;
	
	signal ha2_carry: std_logic;
	
begin	
	
	ha1: half_adder port map(a, b, ha1_carry, ha1_sum);
	ha2: half_adder port map(ha1_sum, carry_in, ha2_carry, sum);
	
	or1: or2 port map(ha2_carry, ha1_carry, carry);
	
end architecture;

