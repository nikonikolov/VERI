module top(SW, CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, SCK, HEX0_D, HEX1_D, HEX2_D, HEX3_D);

	input CLOCK_50;
	output DAC_CS;
	output DAC_LD;
	output SCK;
	output DAC_SDI;
	input [9:0] SW;
	
	output [6:0] HEX0_D;
	output [6:0] HEX1_D;
	output [6:0] HEX2_D;
	output [6:0] HEX3_D;
	
	wire CLOCK_10;
	wire load;
	wire [9:0] data;
	wire [23:0] freq;
	wire [9:0] A;
	
	parameter TC = 22'd2499;
	
	clk_div top_clk_div(CLOCK_50, TC, CLOCK_10);
	MULT top_mult(SW[9:0], freq[23:0]);
	
	addr_reg top_addr_reg(SW[9:0], A[9:0], CLOCK_10);
	ROM top_rom(A[9:0], CLOCK_10, data[9:0]);
	pulse_gen top_pulse_gen(CLOCK_10, CLOCK_50, load);
	spi2dac top_spi2dac(CLOCK_50, data[9:0], load, DAC_SDI, DAC_CS, SCK, DAC_LD);
	
	hex_to_7seg H0(HEX0_D, freq[13:10]);
	hex_to_7seg H1(HEX1_D, freq[17:14]);
	hex_to_7seg H2(HEX2_D, freq[21:18]);
	hex_to_7seg H3(HEX3_D, {2'b0, freq[23:22]});
endmodule
