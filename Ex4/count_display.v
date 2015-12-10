module count_display(BUTTON, CLOCK_50, HEX0_D, HEX1_D, HEX2_D, HEX3_D);

input [1:0] BUTTON;
input CLOCK_50;

output [6:0] HEX0_D;
output [6:0] HEX1_D;
output [6:0] HEX2_D;
output [6:0] HEX3_D;

wire [15:0] count;

counter count0(CLOCK_50, BUTTON[0], BUTTON[1], count[15:0]);

hex_to_7seg seg3(HEX3_D, count[15:12]);
hex_to_7seg seg2(HEX2_D, count[11:8]);
hex_to_7seg seg1(HEX1_D, count[7:4]);
hex_to_7seg seg0(HEX0_D, count[3:0]);

endmodule 	// toplevel