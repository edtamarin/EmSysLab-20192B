library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity motorpid_tb is
end motorpid_tb;

architecture testbench of motorpid_tb is
    component motor is
        -- motor parameters
        generic(
            J: real := 0.01;
            b: real := 0.1;
            K: real := 0.1;
            R: real := 2.0;
            L: real := 0.5;
            dT: integer := 10
        );
        -- I/O
        port(
            vIn: in real;
            speed: out real
        );
    end component;

    component pid is
        port (
            kp      :   IN  std_logic;
            ki      :   IN  std_logic;
            kd      :   IN  std_logic;
            val     :   IN  std_logic_vector(11 downto 0);
            adc     :   IN  std_logic_vector(11 downto 0);
            rst     :   IN  std_logic;
            clk     :   IN  std_logic;
            output  :   OUT std_logic_vector(11 downto 0)
        );
    end component;

    signal kp: std_logic := '1';
    signal ki: std_logic := '0';
    signal kd: std_logic := '0';
    signal val: std_logic_vector(11 downto 0) := "100111000100";
    signal adc: std_logic_vector(11 downto 0) := (others => '0');
    signal rst: std_logic := '1';
    signal clk: std_logic := '0';
    signal output: std_logic;

    signal pidmotor: std_logic;

    u0: pid port map(
        kp => kp,
        ki => ki,
        kd => kd,
        val => val,
        adc => adc,
        rst => rst,
        clk => clk
    )

    u1: motor port map(
        output => 
    )
    
begin
    
    
    
end architecture testbench;