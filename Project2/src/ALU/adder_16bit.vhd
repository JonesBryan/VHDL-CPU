library ieee;				  
use ieee.std_logic_1164.all;

-- critical path: 490ns
entity adder_16bit is
	port(a, b: in std_logic_vector(15 downto 0); carry_in: in std_logic; f: out std_logic_vector(15 downto 0); overflow: out std_logic);
end entity;

architecture structural of adder_16bit is
	component full_adder is
		port(a, b, carry_in: in std_logic; carry, sum: out std_logic);
	end component;

    component xor2 is
        port(a, b: in std_logic; f: out std_logic);
    end component;
	
	signal carries: std_logic_vector(15 downto 0);
	
	signal result: std_logic_vector(15 downto 0);
	
begin
	fa0: full_adder port map(a(0), b(0), carry_in, carries(0), result(0)); 
	
	fa: for i in 1 to 15 generate
		fa_i: full_adder port map(a(i), b(i), carries(i - 1), carries(i), result(i));
	end generate;
	
	overflw: xor2 port map(carries(15), carries(14), overflow);
	
	f <= result;
	
end architecture;

