module top(SW, CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, SCK);

	input [9:0] SW;
	input CLOCK_50;
	output DAC_CS;
	output DAC_LD;
	output SCK;
	output DAC_SDI;

	wire CLOCK_10;
	wire load;
	parameter TC = 22'd2499;
	
	clk_div top_clk_div(CLOCK_50, TC, CLOCK_10);
	pulse_gen top_pulse_gen(CLOCK_10, CLOCK_50, load);
	spi2dac top_spi2dac(CLOCK_50, SW[9:0], load, DAC_SDI, DAC_CS, SCK, DAC_LD);

endmodule
