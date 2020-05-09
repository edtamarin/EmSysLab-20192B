library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pwm is
  generic (
    clkspeed:  integer :=  50_000_000;
    frequency:  integer :=  100_000;
    resolution: integer :=  8
  );
  port (
    clk:  in  std_logic;
    rst:  in  std_logic;
    D:    in  std_logic_vector(resolution-1 downto 0);
    adjust: in  std_logic;
    pwmout:  out std_logic;
    direction:  out std_logic
  );
end pwm;

architecture arch of pwm is
  constant period:  integer :=  clkspeed/frequency;
  signal counter:   integer range 0 to period-1;
  signal halfDnew:  integer range 0 to period/2 := 0;
  signal halfD:     integer range 0 to period/2;
begin
  process(clk, rst) begin
    if(rst = '1') then
      counter <= 0;
      pwmout <= '0';
      direction <= '0';
    elsif rising_edge(clk) then
      if(adjust = '1') then                 --adjust duty cycle
        halfDnew <= conv_integer(D) * period / (2 ** resolution)/2;
      end if;
      if(counter = period - 1) then         --end of period
        counter <= 0;
        halfD <= halfDnew;
      else                                  --not end of period
        counter <= counter + 1;
      end if;
      if(counter = halfD) then              --phase falling edge reached
        pwmout <= '0';
      elsif(counter = period - halfD) then  --phase rising edge reached
        pwmout <= '1';
      end if;
    end if;
  end process;
end arch;
