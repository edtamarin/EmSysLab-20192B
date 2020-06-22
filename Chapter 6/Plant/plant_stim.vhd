-- Plant stimuli
library ieee;
use ieee.std_logic_1164.all;

entity plant_stim is
    generic (
        resolution: integer :=  8
      );
    port(clk,rst,adjust,direction_in: out std_logic;
        D: out std_logic_vector);
end plant_stim;

architecture behav of plant_stim is
    signal clkI: std_logic := '0';
begin
    process begin
        wait for 10 ns;
            rst <= '0';
            adjust <= '1';
            direction_in <= '0';
        wait for 10 ns;

        D <= "00000000";
        
        for I in 0 to 10000 loop
          clk <= '0';
          wait for 10 ns;
          clk <= '1';
          wait for 10 ns;
        end loop;
    
        D <= "11111111";
    
        for I in 0 to 50000000 loop
          clk <= '0';
          wait for 10 ns;
          clk <= '1';
          wait for 10 ns;
        end loop;
    
        D <= "10000000";
    
        for I in 0 to 50000000 loop
          clk <= '0';
          wait for 10 ns;
          clk <= '1';
          wait for 10 ns;
        end loop;
    
        assert false report "End of test" severity failure;
        wait;
      end process;
end behav;