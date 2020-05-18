-- Encoder stimuli

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity decoder_stimuli is
  generic(clockScaling: integer);
  port(rst,clk : out std_logic;
        pulseNum : out integer);
end decoder_stimuli;

architecture behav of decoder_stimuli is
    signal clkInt: std_logic := '0';
begin
    clkInt <= not clkInt after 10 ns;
    clk <= clkInt;
    stimProc : process(clkInt)
        variable counter,init: integer := 0;
    begin
        if rising_edge(clkInt) then
            if init=0 then
                rst <= '1';
                init := 1;
                pulseNum <= 3; -- 3 pulses in one direction
            else
                -- demo of 0 pulses
                if counter=(4*2*clockScaling) then
                    rst <= '1';
                    pulseNum <= 0;
                -- 3 pulses in the opposite direction
                elsif counter=5*2*clockScaling then
                    rst <= '1';
                    pulseNum <= -3;
                -- stop simulation
                elsif counter=10*2*clockScaling then
                    assert false report "Finished simulation." severity failure;
                else
                    rst <= '0';
                end if;
            end if;
            counter := counter + 1;
            report "Counter " & integer'image(counter);
        end if;
    end process ; -- stimProc
end behav;