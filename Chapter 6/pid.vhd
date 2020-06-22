library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pid is
    port (
        kp      :   IN  std_logic;
        ki      :   IN  std_logic;
        kd      :   IN  std_logic;
        input   :   IN  std_logic_vector(7 downto 0);
        feedback:   IN  std_logic_vector(7 downto 0);
        rst     :   IN  std_logic;
        clk     :   IN  std_logic;
        output  :   OUT std_logic_vector(7 downto 0)
    );
end pid;

architecture rtl of pid is
    
constant con_Kp :   integer := 1;
constant con_kp_den : integer := 2;
constant con_Kd : integer := 1;
constant con_kd_den : integer := 100;
constant con_Ki : integer := 1;
constant con_ki_den : integer := 10;
signal error, error_difference, error_sum, previous_error : integer := 0;
signal p, i, d : integer := 0;
signal output_loaded, output_saturation_buffer : integer := 0;
signal previous_feedback : std_logic_vector(7 downto 0);
constant timedivisor : integer := 1;

begin
    process(kp, kd, ki, clk, rst, feedback, error, input, p, i, d)
    begin
        if rising_edge(clk) then
            if rst = '0' then
                error_sum <= 0;
                error_difference <= 0;
                error <= 0;
                p <= 0;
                i <= 0;
                d <= 0;
                output_loaded <= 0;
                output <= (others => '0');
            else
                for k in 0 to 8 loop
                    case k is
                        when 0 => 
                            error <= (to_integer(unsigned(input)) - to_integer(unsigned(feedback)));
                        when 1 => 
                            if feedback /= previous_feedback then
                                error_sum <= error_sum + error;
                                error_difference <= error - previous_error;
                            end if;
                        when 2 =>
                            if kp = '1' then
                                p <= (con_Kp * error) / con_kp_den;
                            else
                                p <= 0;
                            end if;
                        when 3 =>
                            if ki = '1' then
                                i <= (con_Ki * error_sum)/(timedivisor * con_ki_den);
                            else
                                i <= 0;
                            end if;
                        when 4 =>
                            if kd = '1' then
                                d <= ((con_Kd * error_difference) * timedivisor)/con_kd_den;
                            else
                                d <= 0;
                            end if;
                        when 5 =>
                            output_saturation_buffer <= (p + i + d);
                        when 6 =>
                            if output_saturation_buffer < 0 then
                                output_loaded <= 0;
                            elsif output_saturation_buffer > 255 then
                                output_loaded <= 255;
                            else
                                output_loaded <= output_saturation_buffer;
                            end if;
                        when 7 =>
                            output <= std_logic_vector(to_unsigned(output_loaded, 12));
                        when 8 =>
                            previous_feedback <= feedback;
                            previous_error <= error;
                        when others => null;
                    end case;
                end loop;
            end if;
        end if;
    end process;
end architecture rtl;