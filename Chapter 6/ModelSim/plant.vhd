-- Plant simulation
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity plant is
    generic (
        resolution: integer :=  8
      );
    port(position: out integer);
end plant;

architecture struct of plant is
    component plant_stim is
        generic (
            resolution: integer :=  8
          );
        port(clk,rst,adjust,direction_in: out std_logic;
            D: out std_logic_vector);
    end component;
    component pwm is
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
    component pwmdecoder is
        generic( 
            dec_clkspeed:		integer	:=	50_000_000;
            dec_pwmfrequency:	integer := 	100_000;
            dec_resolution:		integer	:=	8
        );
        port (
            dec_clk:		in 	std_logic;
            dec_rst:		in	std_logic;
            dec_pwm:		in	std_logic;
            dec_direction:	in	std_logic;
            dec_pulsewidth:	out	std_logic_vector(dec_resolution downto 0)
        );
    end component;
    component motor is
        -- motor parameters
        generic(J: real := 0.01;
            b: real := 0.1;
            K: real := 0.1;
            R: real := 2.0;
            L: real := 0.5;
            dT: integer := 10);
        -- I/O
        port(vIn: in unsigned;
            speed: out real);
    end component;
    component wheel is
        generic (turnScale: real := 4.0);
        port (speed: in real;
            clk: in std_logic;
            pulse: out integer;
            decRst: out std_logic);
    end component;
    component decoder is
        -- options
        generic (clockScaling: positive; -- scale the pulse outputz
                lagBy: positive); -- how long should a pulse be lagByging
        -- I/O declarations
        port (numPulses: in integer; -- number of pulses to produce
            clk,rst: in std_logic; -- clock and reset
            a,b: out std_logic); -- A/B pulses
    end component;
    component encoder is
        -- generic will be used to get index pulse
        generic(rotations : positive :=10;
            positions: integer := 2 ** resolution);
        port (a,b,rst,clk: in  std_logic;
            currentPos : out integer range 0 to positions-1;
            dirOut: out std_logic);
    end component;
    component pid is
        port (
            kp      :   IN  std_logic;
            ki      :   IN  std_logic;
            kd      :   IN  std_logic;
            pid_in  :   IN  std_logic_vector(resolution-1 downto 0);
            feedback:   IN  std_logic_vector(resolution-1 downto 0);
            rst     :   IN  std_logic;
            clk     :   IN  std_logic;
            pid_out :   OUT std_logic_vector(resolution-1 downto 0)
        );
    end component;

    signal clkI,decRstI,rstI,adjI,dirI,pwmI,aI,bI,dirOutI: std_logic;
    signal dI: std_logic_vector(resolution-1 downto 0);
    signal pwI: std_logic_vector(resolution downto 0);
    signal spI: real := 0.0;
    signal pulseI,posI: integer := 0;
    signal fb: std_logic_vector(resolution-1 downto 0);

    signal kp:          std_logic := '1';
    signal ki:          std_logic := '0';
    signal kd:          std_logic := '0';
    signal rst:         std_logic := '1';
    signal pid_out:     std_logic_vector(resolution-1 downto 0);
    
begin
    stim: plant_stim
        port map(clkI, rstI, adjI, dirI, dI);
    pidcontr: pid 
        port map(kp, ki, kd, dI, fb, rst, clkI, pid_out);
    pwmGen: pwm
        port map(clkI, rstI, pid_out, adjI, dirI, pwmI, dirI);
    pwmDec: pwmdecoder
        port map(clkI, rstI, pwmI, dirI, pwI);
    mot: motor
        port map(unsigned(pwI), spI);
    whl: wheel
        generic map(turnScale => 50000000.0)
        port map(spI, clkI, pulseI, decRstI);
    dec: decoder
        generic map(clockScaling=>4,lagBy=>1)
        port map(pulseI, clkI, decRstI, aI, bI);
    enc: encoder
        port map(aI, bI, rstI, clkI, posI, dirOutI);
    position <= posI;
    fb <= std_logic_vector(to_unsigned(posI, fb'length));
end struct;