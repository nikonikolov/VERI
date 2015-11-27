add wave -position end /counter2/clock
add wave -position end /counter2/select
add wave -position end /counter2/reset
add wave -position end /counter2/enable
add wave -position end -hexadecimal /counter2/count
force /counter2/clock  0 0ns, 1 10ns -repeat 20ns
force /counter2/select  0 0ns, 0 30ns
force /counter2/reset  0 0ns, 1 10ns, 0 20ns
force /counter2/enable  0 0ns, 1 30ns
run 380ns