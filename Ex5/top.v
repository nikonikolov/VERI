module top(CLOCK_50, HEX0_D, HEX1_D, HEX2_D);

input CLOCK_50;

output [6:0] HEX0_D;
output [6:0] HEX1_D;
output [6:0] HEX2_D;

wire CLOCK_10;
wire [9:0] pattern;

clk_div div10(CLOCK_50, 22'd2499999, CLOCK_10);

shift_pattern shift(pattern, CLOCK_10);

hex_to_7seg seg2(HEX2_D, {2'b0, pattern[9:8]});
hex_to_7seg seg1(HEX1_D, pattern[7:4]);
hex_to_7seg seg0(HEX0_D, pattern[3:0]);

endmodule 	// toplevel