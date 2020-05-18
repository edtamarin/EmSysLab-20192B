-- Decoder test bench

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity decoder_tb is
    generic( clkScaler: integer := 4;
                sigShift: integer := 1);
	port( aOut,bOut: out std_logic);
end decoder_tb;

architecture struct of decoder_tb is
    component decoder is
        -- options
        generic (clockScaling: positive; -- scale the pulse output
                lagBy: positive); -- how long should a pulse be lagByging
        -- I/O declarations
        port (numPulses: in integer; -- number of pulses to produce
            clk,rst: in std_logic; -- clock and reset
            a,b: out std_logic); -- A/B pulses
    end component;
    component decoder_stimuli is
        generic(clockScaling: integer);
        port(rst,clk : out std_logic;
              pulseNum : out integer);
    end component;
	signal rstI,clkI,aI,bI: std_logic;
	signal posI: integer;
begin
    Stim: decoder_stimuli
        generic map(clockScaling => clkScaler)
		port map(rstI,clkI,posI);
	Dec: decoder
		generic map(clockScaling => clkScaler, lagBy => sigShift)
		port map(posI,clkI,rstI,aI,bI);
    aOut <= aI;
    bOut <= bI;
end struct;
