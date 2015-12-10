add wave -position end /spi2dac/sysclk
add wave -position end -hexadecimal /spi2dac/data_in
add wave -position end /spi2dac/load
add wave -position end -hexadecimal /spi2dac/shift_reg
force /spi2dac/sysclk  0 0ns, 1 10ns -repeat 20ns
force /spi2dac/data_in  10'h23B 0ns
force /spi2dac/load  1 0ns, 0 30ns
run 380ns