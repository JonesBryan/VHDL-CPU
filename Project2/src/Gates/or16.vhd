library ieee;
use ieee.std_logic_1164.all;

-- critical path: 40ns
entity or16 is
	port(a: in std_logic_vector(15 downto 0); f: out std_logic);
end entity;

architecture structural of or16 is
	signal intermediate1: std_logic_vector(7 downto 0);
	signal intermediate2: std_logic_vector(3 downto 0);
	signal intermediate3: std_logic_vector(1 downto 0);

	component or2 is
		port(a,	b: in std_logic; f: out std_logic);
	end component;
	
begin
	U0: for i in 0 to 7 generate
		or_gate: or2 port map(a(2*i), a(2*i + 1), intermediate1(i));
	end generate;
	
	U1: for i in 0 to 3 generate
		or_gate: or2 port map(intermediate1(2*i), intermediate1(2*i + 1), intermediate2(i));
	end generate;
	
	U2: for i in 0 to 1 generate
		or_gate: or2 port map(intermediate2(2*i), intermediate2(2*i + 1), intermediate3(i));
	end generate;
	
	U3: or2 port map(intermediate3(0), intermediate3(1), f);
	
end structural;