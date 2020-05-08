-- Encoder stimuli

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity encoder_stimuli is
  port(a,b,rst,clk : out std_logic);
end encoder_stimuli;

architecture behav of encoder_stimuli is
  signal clkInt: std_logic := '0';
begin
  clkInt <= not clkInt after 10 ns;
  clk <= not clkInt;
  process(clkInt)
    constant dataA: std_logic_vector(15 downto 0) := "0110011000110011";
    constant dataB: std_logic_vector(15 downto 0) := "0011001101100110";
    variable index: integer:=15;
    variable init: std_logic := '0';
  begin
    if rising_edge(clkInt) then
      if init='0' then
	rst <= '1';
	init := '1';
      else
	if index=8 then
		rst <= '1';
	else
		rst <= '0';
	end if;
	a <= dataA(index);
	b <= dataB(index);
	index := index -1;
	if index<0 then 
	  assert false report "16 ticks sent." severity failure;
	end if;
      end if;
    end if; 
  end process;
end behav;