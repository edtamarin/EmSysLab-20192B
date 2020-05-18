-- Produce number of impulses based on input

library ieee;
use ieee.std_logic_1164.all;

entity decoder is
    -- options
    generic (clockScaling: positive; -- scale the pulse output
            lagBy: positive); -- how long should a pulse be lagByging
    -- I/O declarations
    port (numPulses: in integer; -- number of pulses to produce
        clk,rst: in std_logic; -- clock and reset
        a,b: out std_logic); -- A/B pulses
end decoder;

-- Behavioural architecture
architecture behav of decoder is
    signal lagSignal: std_logic_vector(lagBy downto 0);
    signal leadSignal: std_logic;
begin
    process(clk,rst)
        variable pulseCount, clkDiv: integer;
        variable laggedSVal: std_logic;
    begin
        if rst='1' then
            if numPulses>0 then
                pulseCount := -1;
            elsif numPulses<0 then
                pulseCount := 1;
            else
                pulseCount := 0;
            end if;
            clkDiv := 0;
            laggedSVal := '0';
            lagSignal <= (others => '0');
            leadSignal <= '0';
        elsif (clk'event and clk='1') then
            -- force 0 if all pulses have been produced
            if pulseCount=numPulses then
                leadSignal <= '0';
                laggedSVal := '0';
            else
                -- update the pulses every time the clock divisor limit is reached
                if clkDiv=clockScaling then
                    leadSignal <= not leadSignal;
                    laggedSVal := not laggedSVal;
                    clkDiv := 0;
                    if (numPulses>0) and (laggedSVal='1') then
                        pulseCount := pulseCount + 1;
                    elsif (numPulses<0) and (laggedSVal='1') then
                        pulseCount := pulseCount - 1;
                    end if;
                end if;
                -- determine which signal is leading based on the sign of the input
                -- 0 doesn't matter since it won't produce pulses anyway
                lagSignal <= lagSignal(lagBy-1 downto 0) & laggedSVal;
                if numPulses>0 then
                    a <= leadSignal;
                    b <= lagSignal(lagBy);
                else
                    a <= lagSignal(lagBy);
                    b <= leadSignal;
                end if;
                -- advance the clock divisor
                clkDiv := clkDiv + 1;
                report "Pulse " & integer'image(pulseCount);
            end if;
        end if;
    end process;
end behav;