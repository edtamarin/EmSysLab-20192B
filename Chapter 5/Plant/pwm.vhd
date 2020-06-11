library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pwm is
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
end pwm;

architecture arch of pwm is
  constant period:  integer :=  clkspeed/pwmfrequency;
  signal counter:   integer range 0 to period-1;
  signal D_new:  integer range 0 to period/2 := 0;
  signal D_current:     integer range 0 to period/2;
begin
  process(clk, rst) begin
    if(rst = '1') then
      counter <= 0;
      pwmout <= '0';
      direction_out <= '0';
    elsif rising_edge(clk) then
      if(adjust = '1') then                 --adjust duty cycle
        D_new <= conv_integer(D) * period / (2 ** resolution)/2;
      end if;
      if(counter = period - 1) then         --end of period
        counter <= 0;
        D_current <= D_new;
        direction_out <= direction_in;
      else                                  --not end of period
        counter <= counter + 1;
      end if;
      if(counter = D_current) then              --phase falling edge reached
        pwmout <= '0';
      elsif(counter = period - D_current) then  --phase rising edge reached
        pwmout <= '1';
      end if;
    end if;
  end process;
end arch;
