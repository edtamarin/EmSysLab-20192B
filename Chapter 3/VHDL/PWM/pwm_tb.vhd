-- PWM test bench

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity pwm_tb is
	generic( topPos: integer := 8);
	port( pwm_tb_out: out std_logic);
end pwm_tb;

architecture struct of pwm_tb is
	component pwm is
		generic (res,freq,sys_clk : integer); 
		port( set,rst,clk: in std_logic;
		      duty: in std_logic_vector(res-1 downto 0);
		      pwm_out: out std_logic);
	end component;
	component pwm_stimuli is
  		generic( pwm_res: integer);
  		port(set,rst,clk : out std_logic;
       		     duty: out std_logic_vector(pwm_res-1 downto 0));
	end component;
	signal setI,rstI,clkI,outI: std_logic;
	signal dutyI: std_logic_vector(topPos-1 downto 0);
begin
	Stim: pwm_stimuli
		generic map(pwm_res=>topPos)
		port map(setI,rstI,clkI,dutyI);
	gen: pwm
		generic map(res=>topPos,freq=>100000,sys_clk=>50000000)
		port map(setI,rstI,clkI,dutyI,outI);
	pwm_tb_out <= outI;
end struct;