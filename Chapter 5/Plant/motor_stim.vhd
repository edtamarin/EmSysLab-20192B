-- Motor stimuli

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity motor_stim is
  port(voltage : out real := 0.0);
end motor_stim;

architecture behav of motor_stim is
    signal clkInt: std_logic := '0';
begin
    clkInt <= not clkInt after 100 ms;
    stimProc : process(clkInt)
        variable counter: integer := 0;
        variable V: real := 0.0;
    begin
        if rising_edge(clkInt) then
            if counter=0 then
                V := 0.0;
            -- 5 volts on motor
            elsif counter=1 then
                V := 5.0;
            -- stop the motor
            elsif counter=30 then
                V := 0.0;
            -- end the simulation
            elsif counter=40 then  
                assert false severity failure;
            end if;
            counter := counter + 1;
            report "Counter " & integer'image(counter);
        end if;
        -- update voltage
        voltage <= V;
    end process ; -- stimProc
end behav;
