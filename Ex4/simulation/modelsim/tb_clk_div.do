add wave -position end /clk_div/clkin
add wave -position end /clk_div/clkout
add wave -position end /clk_div/tc
add wave -position end -hexadecimal /clk_div/count
force /clk_div/clkin  0 0ns, 1 10ns -repeat 20ns
force /clk_div/tc  11 0ns
run 380ns