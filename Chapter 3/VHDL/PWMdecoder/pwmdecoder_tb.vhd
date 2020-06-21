library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pwmdecoder_tb is
end pwmdecoder_tb;

architecture testbench of pwmdecoder_tb is
  component pwm
    generic (
      clkspeed:  integer :=  50_000_000;
      pwmfrequency:  integer :=  100_000;
      resolution: integer :=  8
    );
    port (
      clk:  in  std_logic;
      rst:  in  std_logic;
      D:    in  std_logic_vector(resolution-1 downto 0);
      adjust: in  std_logic;
      direction_in: in std_logic; --'0' = clockwise and '1' = counter-clockwise. Can be turned off by setting the duty cycle 'b00000000
      pwmout:  out std_logic;
      direction_out:  out std_logic
    );
  end component;

  component pwmdecoder
    generic( 
      dec_clkspeed:					integer	:=	50_000_000;
      dec_pwmfrequency:			integer := 	100_000;
      dec_resolution:				integer	:=	8
    );
    port (
      dec_clk:				in 	std_logic;
      dec_rst:				in	std_logic;
      dec_pwm:				in	std_logic;
      dec_direction:	in	std_logic;
      dec_pulsewidth:	out	std_logic_vector(dec_resolution downto 0)
      );
  end component;

  signal clk:             std_logic                     := '0';
  signal rst:             std_logic                     := '1';
  signal adjust:          std_logic                     := '1';
  signal D:               std_logic_vector(7 downto 0)  := "10000000";
  signal direction:       std_logic                     := '0';
  signal pwmconnect:      std_logic;
  signal dec_resolution:  integer                       := 8;
  signal dec_pulsewidth:  std_logic_vector(dec_resolution downto 0);

begin
  u0 : pwm port map(clk => clk, rst => rst, D => D, adjust => adjust, direction_in => direction, pwmout => pwmconnect);
  u1 : pwmdecoder port map(dec_clk => clk, dec_rst => rst, dec_pwm => pwmconnect, dec_direction => direction, dec_pulsewidth => dec_pulsewidth);

  process begin
    wait for 10 ns;
		rst <= '0';
    wait for 10 ns;
    
    for I in 0 to 10000 loop
      clk <= '0';
      wait for 10 ns;
      clk <= '1';
      wait for 10 ns;
    end loop;

    D <= "11111100";

    for I in 0 to 10000 loop
      clk <= '0';
      wait for 10 ns;
      clk <= '1';
      wait for 10 ns;
    end loop;

    D <= "11100000";

    for I in 0 to 10000 loop
      clk <= '0';
      wait for 10 ns;
      clk <= '1';
      wait for 10 ns;
    end loop;

    D <= "11111111";

    for I in 0 to 10000 loop
      clk <= '0';
      wait for 10 ns;
      clk <= '1';
      wait for 10 ns;
    end loop;

    assert false report "End of test";
    wait;
  end process;
end architecture testbench;