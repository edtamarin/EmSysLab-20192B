-- Motor model in VHDL

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity motor is
    -- motor parameters
    generic(J: real := 0.01;
        b: real := 0.1;
        K: real := 0.1;
        R: real := 2.0;
        L: real := 0.5;
        dT: integer := 10);
    -- I/O
    port(vIn: in real;
        speed: out real);
end motor;

architecture behav of motor is
    -- estimate the current draw of the motor
    function eulerI(prev_I,cur,ik_C,volt: in real) return real is
        variable integral: real;
    begin
        integral := prev_I + (real(dT)/1000.0) * ((volt - (R*cur) - ik_C)/L);
        return integral;
    end eulerI;
    -- estimate the angular speed of the motor
    function eulerS(prev_S,ikt,sp: in real) return real is
        variable integral: real;
    begin
        integral := prev_S + (real(dT)/1000.0) * ((ikt-sp*b)/J);
        return integral;
    end eulerS;
    -- internal "clock"
    signal clkI: std_logic := '0';
begin
    clkI <= not clkI after dT*ms;
    process(clkI)
        variable V,I,S,SK,IK,prevI,prevS : real := 0.0;
        variable init: std_logic := '0';
    begin
        -- calculate current
        I := eulerI(prevI,I,IK,vIn);
        -- K gain
        IK := I*K;
        -- calculate speed
        S := eulerS(prevS,IK,S);
        -- K gain
        SK := S*K;
        -- update variables
        prevI := I;
        prevS := S;
        speed <= S;
    end process;
end behav;
