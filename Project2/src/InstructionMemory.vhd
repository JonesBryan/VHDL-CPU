library ieee;				  
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Behavioral using arrays (no delays)
entity InstructionMemory is
	port(
		address: in std_logic_vector(7 downto 0);
		instruction: out std_logic_vector(15 downto 0)
		);
end entity;

architecture behavioral of InstructionMemory is
	type memory_array is array(0 to 255) of std_logic_vector(15 downto 0);
	
	signal memory: memory_array := (
		0 => X"500A",
		1 => X"5105",
		2 => X"5200",
		3 => X"5300",
		4 => X"5400",
		5 => X"5500",
		6 => X"5600",
		7 => X"5700",
		8 => X"0201",
		9 => X"1301",
		10 => X"4401",
		11 => X"630B",
		12 => X"640A",
		13 => X"760A",
		14 => X"770B",
		others => X"0000"
	);
	
begin
	instruction <= memory(to_integer(unsigned(address)));
end architecture;