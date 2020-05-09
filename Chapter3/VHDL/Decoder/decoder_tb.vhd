library ieee;
use ieee.std_logic_1164.all;

entity decoder_tb is
end decoder_tb;

architecture test of decoder_tb is
	component decoder
	generic (
		positions:	integer := 16 										--size of the position counter (i.e. number of positions counted)
	);
	port (
		clk:		in	std_logic;
		rst:		in 	std_logic;
		a:			in	std_logic;
		b:			in	std_logic;
		direction:	out	std_logic;
		position:	buffer integer range 0 to positions-1 := 0
	);
	end component;

	signal clk:			std_logic := '0';
	signal rst:			std_logic := '1';
	signal a:			std_logic := '0';
	signal b:			std_logic := '0';
	signal direction:	std_logic := '0';
	signal position:	integer;

begin
	u0 : decoder port map(clk => clk, rst => rst, a => a, b => b, position => position, direction => direction);
	
	process begin
		wait for 1 ns;
		rst <= '0';
		wait for 1 ns;
		
		for I in 0 to 5 loop				-- forward direction
			clk <= '0';
			a <= '1';
			wait for 1 ns;
			clk <= '1';
			wait for 1 ns;
			clk <= '0';
			b <= '1';
			wait for 1 ns;
			clk <= '1';
			wait for 1 ns;	
			clk <= '0';
			a <= '0';
			wait for 1 ns;
			clk <= '1';
			wait for 1 ns;			
			clk <= '0';
			b <= '0';
			wait for 1 ns;			
			clk <= '1';
			wait for 1 ns;
		end loop;

		for I in 0 to 5 loop				-- backward direction
		clk <= '0';
		b <= '1';
		wait for 1 ns;
		clk <= '1';
		wait for 1 ns;
		clk <= '0';
		a <= '1';
		wait for 1 ns;
		clk <= '1';
		wait for 1 ns;	
		clk <= '0';
		b <= '0';
		wait for 1 ns;
		clk <= '1';
		wait for 1 ns;			
		clk <= '0';
		a <= '0';
		wait for 1 ns;			
		clk <= '1';
		wait for 1 ns;
	end loop;

        assert false report "End of test";
		wait;
	end process;
end test;