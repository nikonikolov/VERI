transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+H:/VERI/Ex4 {H:/VERI/Ex4/clk_div.v}
vlog -vlog01compat -work work +incdir+H:/VERI/Ex4 {H:/VERI/Ex4/hex_to_7seg.v}
vlog -vlog01compat -work work +incdir+H:/VERI/Ex5 {H:/VERI/Ex5/shift_pattern.v}
vlog -vlog01compat -work work +incdir+H:/VERI/Ex5 {H:/VERI/Ex5/top.v}

