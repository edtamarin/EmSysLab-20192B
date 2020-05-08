-- PWM stimuli

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity pwm_stimuli is
  generic( pwm_res: integer);
  port(set,rst,clk : out std_logic;
       duty: out std_logic_vector(pwm_res-1 downto 0));
end pwm_stimuli;

architecture behav of pwm_stimuli is
  signal clkInt: std_logic := '0';
begin
  clkInt <= not clkInt after 10 ns;
  clk <= not clkInt;
  process(clkInt)
    variable count: integer:=0;
    variable init: std_logic := '0';
  begin
    if rising_edge(clkInt) then
      if init='0' then
	rst <= '1';
	duty <= "00000000";
	set <= '0';
	init := '1';
      else
	if count=0 then
		duty <= "01000000";
		set <= '1';
	elsif count=50000 then
		duty <= "00001000";
		set <= '1';
	elsif count=100000 then
		duty <= "10000001";
		set <= '1';
	elsif count=150000 then
		duty <= "00100000";
		set <= '1';
	else
		set <= '0';
	end if;
	count := count + 1;
	rst <= '0';
	if count>300000 then 
	  assert false report "300000 cycles passed." severity failure;
	end if;
      end if;
    end if; 
  end process;
end behav;