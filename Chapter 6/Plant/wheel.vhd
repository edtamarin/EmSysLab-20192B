-- A "wheel" for the motor
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wheel is
    generic (turnScale: real := 4.0);
    port (speed: in real;
        clk: in std_logic;
        pulse: out integer;
        decRst: out std_logic);
end wheel;

architecture behav of wheel is
begin
    process(clk)
        variable turns: real := 0.0;
        variable init: integer := 0;
    begin
        if init=0 then
            pulse <= 0;
            decRst <= '1';
            init:=1;
        else
            if turns/turnScale > 1.0 then
                pulse <= 1;
                decRst <= '1';
                turns := 0.0;
            else
                pulse <= 0;
                decRst <= '0';
            end if;
            turns := turns + speed;
        end if;
    end process;
end behav;