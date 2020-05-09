restart -f
force D 'b01000000
force -freeze sim:/pwm/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/pwm/rst 0 0
force -freeze sim:/pwm/adjust 1 0
run 200 ns
force D 'b01000000
run 200 ns
force D 'b00100000
run 200 ns
force D 'b00010000
run 200 ns
force D 'b00001000
run 200 ns
force D 'b00000100
run 200 ns
force D 'b00000010
run 200 ns
force D 'b00000001
run 200 ns
force D 'b10000000
run 200 ns