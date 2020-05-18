-- Combined test bench to test decoder/encoder assembly

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity dec_enc_tb is
    generic( clkScaler: integer := 4;
                sigShift: integer := 1;
                rotNum: positive := 10;
                posNum: integer := 16);
	port( posIndex: out integer);
end dec_enc_tb;

architecture struct of dec_enc_tb is
    -- decoder
    component decoder is
        -- options
        generic (clockScaling: positive; -- scale the pulse output
                lagBy: positive); -- how long should a pulse be lagByging
        -- I/O declarations
        port (numPulses: in integer; -- number of pulses to produce
            clk,rst: in std_logic; -- clock and reset
            a,b: out std_logic); -- A/B pulses
    end component;
    --decoder stimuli
    component decoder_stimuli is
        generic(clockScaling: integer);
        port(rst,clk : out std_logic;
              pulseNum : out integer);
    end component;
    --encoder
    component encoder IS
	-- generic will be used to get index pulse
	GENERIC(rotations : positive;
		positions: integer);
	PORT (a,b,rst,clk: IN  std_logic;
	      currentPos : OUT integer range 0 to positions-1);
    END component;
	signal rstI,clkI,aI,bI: std_logic;
	signal posI,outI: integer;
begin
    Stim: decoder_stimuli
        generic map(clockScaling => clkScaler)
		port map(rstI,clkI,posI);
	Dec: decoder
		generic map(clockScaling => clkScaler, lagBy => sigShift)
        port map(posI,clkI,rstI,aI,bI);
    Enc: encoder
        generic map(rotations => rotNum, positions => posNum)
        port map(aI,bI,rstI,clkI,outI);
    posIndex <= outI;
end struct;
