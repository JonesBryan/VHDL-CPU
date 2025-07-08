library ieee;				  
use ieee.std_logic_1164.all;

-- critical path: 500ns
entity subtractor_16bit is
	port(a, b: in std_logic_vector(15 downto 0); f: out std_logic_vector(15 downto 0); overflow: out std_logic);
end entity;

architecture structural of subtractor_16bit is
	component adder_16bit is
		port(a, b: in std_logic_vector(15 downto 0); carry_in: in std_logic; f: out std_logic_vector(15 downto 0); overflow: out std_logic);
	end component;	
	
	component xor2 is
		port(a, b: in std_logic; f: out std_logic);
	end component;
	
	signal carries: std_logic_vector(14 downto 0);
	signal BxorC: std_logic_vector(15 downto 0);
begin
	
	xors: for i in 0 to 15 generate
		xor2i: xor2 port map(b(i), '1', BxorC(i));
	end generate;
	
	adder: adder_16bit port map(a, BxorC, '1', f, overflow);
end architecture;

