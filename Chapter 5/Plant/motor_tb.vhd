-- Motor test bench

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity motor_tb is
	port(speedOut: out real);
end motor_tb;

architecture struct of motor_tb is
    component motor is
        generic(J: real := 0.01;
            b: real := 0.1;
            K: real := 0.1;
            R: real := 2.0;
            L: real := 0.5;
            dT: integer := 10);
        port(vIn: in real;
            speed: out real);
    end component;
    component motor_stim is
        port(voltage : out real);
    end component;
    signal voltIn, speedIn: real;
begin
    -- connect stimuli and motor
    Stim: motor_stim
		port map(voltIn);
    Mot: motor
        -- set this for time resolution
        generic map (dT => 1)
		port map(voltIn,speedIn);
    speedOut <= speedIn;
end struct;

