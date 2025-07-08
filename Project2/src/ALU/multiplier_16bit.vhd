library ieee;				  
use ieee.std_logic_1164.all;

-- 580ns
entity multiplier_16bit is
	port(a, b: in  std_logic_vector(15 downto 0); f: out std_logic_vector(15 downto 0); overflow: out std_logic);
end multiplier_16bit;

architecture structural of multiplier_16bit is	
	component half_adder is
		port(a, b: in std_logic; carry, sum: out std_logic);
	end component;
	
	component full_adder is
		port(a, b, carry_in: in std_logic; carry, sum: out std_logic);
	end component;
	
	component and2 is
		port(a, b: in std_logic; f: out std_logic);
	end component;
	
	component xor3 is
		port(a, b, c: in std_logic; f: out std_logic);
	end component;
	
	type partials is array(15 downto 0) of std_logic_vector(15 downto 0);
	
	signal ab: partials;
	signal carries: partials;
	signal sums: partials;
begin	
	pp_i: for i in 0 to 15 generate
		pp_j: for j in 0 to 15 generate
			andx: and2 port map(a(i), b(j), ab(i)(j));
		end generate;
	end generate;
	
	f(0) <= ab(0)(0);
	
	ha_0: half_adder port map(ab(0)(1), ab(1)(0), carries(0)(0), sums(0)(0));
	
	row_0: for i in 1 to 14 generate
		fa0_x: full_adder port map(ab(i)(1), ab(i + 1)(0), carries(0)(i - 1), carries(0)(i), sums(0)(i)); 
	end generate;
	
	row_x: for i in 1 to 14 generate
		ha_i: half_adder port map(ab(0)(i + 1), sums(i - 1)(1), carries(i)(0), sums(i)(0));
		
		row_x_fa: for j in 1 to 14 - i generate
			fa_i: full_adder port map(ab(j)(i + 1), sums(i - 1)(j + 1), carries(i)(j - 1), carries(i)(j), sums(i)(j));
		end generate;
	end generate;
	
	res: for i in 0 to 14 generate
		f(i + 1) <= sums(i)(0);
	end generate;
	
	ovrflw: xor3 port map(a(15), b(15), sums(14)(0), overflow);			
	
	
end architecture;
