-- Encoder test bench

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity encoder_tb is
	generic( topPos: integer := 16);
	port( cPos: out integer range 0 to topPos-1;
			direction: out std_logic);
end encoder_tb;

architecture struct of encoder_tb is
	component encoder is
		GENERIC(rotations : positive;
			positions: integer);
		PORT (a,b,rst,clk: IN  std_logic;
					currentPos : OUT integer range 0 to positions-1;
					dirOut: out std_logic);
	end component;
	component encoder_stimuli is
		port(a,b,rst,clk : out std_logic);
	end component;
	signal aI,bI,rstI,clkI,dirI: std_logic;
	signal posI: integer range 0 to topPos-1;
begin
	Stim: encoder_stimuli
		port map(aI,bI,rstI,clkI);
	Enc: encoder
		generic map(rotations => 10, positions => topPos)
		port map(aI,bI,rstI,clkI,posI,dirI);
	cPos <= posI;
	direction <= dirI;
end struct;
