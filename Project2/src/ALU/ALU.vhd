library ieee;				  
use ieee.std_logic_1164.all;

-- 630ns
entity ALU is
	port(
		a, b: in std_logic_vector(15 downto 0); s: in std_logic_vector(2 downto 0);
		f: out std_logic_vector(15 downto 0); status: out std_logic_vector(2 downto 0)
		);
end entity;

architecture structural of ALU is
	component adder_16bit is
		port(a, b: in std_logic_vector(15 downto 0); carry_in: in std_logic; f: out std_logic_vector(15 downto 0); overflow: out std_logic);
	end component;
	
	component subtractor_16bit is
		port(a, b: in std_logic_vector(15 downto 0); f: out std_logic_vector(15 downto 0); overflow: out std_logic);
	end component;
	
	component multiplier_16bit is
		port(a, b: in  std_logic_vector(15 downto 0); f: out std_logic_vector(15 downto 0); overflow: out std_logic);
	end component;
	
	component or16 is
		port(a: std_logic_vector(15 downto 0); f: out std_logic);
	end component;
	
	component nor2 is
		port(a, b: std_logic; f: out std_logic);
	end component;
	
	component and2 is
		port(a, b: std_logic; f: out std_logic);
	end component;
	
	component and4 is
		port(a, b, c, d: std_logic; f: out std_logic);
	end component;
	
	component or4 is
		port(a, b, c, d: std_logic; f: out std_logic);
	end component;
	
	component not1 is
		port(a: std_logic; f: out std_logic);
	end component;
	
	component nor16 is
		port(a: std_logic_vector(15 downto 0); f: out std_logic);
	end component;
	
	component mux_3_16bit is
		port(
			a, b, add, sub, mult: in std_logic_vector(15 downto 0); s: in std_logic_vector(2 downto 0);
			f: out std_logic_vector(15 downto 0)
			);
	end component;
	
	signal add_result: std_logic_vector(15 downto 0);
	signal sub_result: std_logic_vector(15 downto 0);
	signal mult_result: std_logic_vector(15 downto 0);
	
	signal overflow: std_logic_vector(2 downto 0);
	
	signal mux_result: std_logic_vector(15 downto 0);
	signal s_invert: std_logic_vector(2 downto 0);
	
	signal add_overflow: std_logic;
	signal sub_overflow: std_logic;
	signal mult_overflow: std_logic;
	
	signal final_overflow: std_logic;
	
	signal zero: std_logic;
	
begin
	add: adder_16bit port map(a, b, '0', add_result, overflow(2));
	sub: subtractor_16bit port map(a, b, sub_result, overflow(1));
	mult: multiplier_16bit port map(a, b, mult_result, overflow(0));
	
	mux: mux_3_16bit port map(a, b, add_result, sub_result, mult_result, s, mux_result);
	
	s_inverse: for i in 0 to 2 generate
		sinvx: not1 port map(s(i), s_invert(i));
	end generate;
	
	addoverflow: and4 port map(s_invert(2), s_invert(1), s_invert(0), overflow(2), add_overflow);
	suboverflow: and4 port map(s(2), s_invert(1), s_invert(0), overflow(1), sub_overflow);
	multoverflow: and4 port map(s_invert(2), s_invert(1), s(0), overflow(0), mult_overflow);
	
	final_oferflow: or4 port map(add_overflow, sub_overflow, mult_overflow, '0', final_overflow);
	is_zero: nor16 port map(mux_result, zero);
	
	status(2) <= final_overflow;
	status(1) <= zero;
	status(0) <= mux_result(15);
	
	f <= mux_result;
	
end architecture;

