module top(CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, SCK);

	input CLOCK_50;
	output DAC_CS;
	output DAC_LD;
	output SCK;
	output DAC_SDI;

	wire CLOCK_2;
	wire load;
	wire [9:0] data;
	
	parameter TC = 22'd12499;
	
	
	clk_div top_clk_div(CLOCK_50, TC, CLOCK_2);
	FF(CLOCK_2, data[9:0]);
	pulse_gen top_pulse_gen(CLOCK_2, CLOCK_50, load);
	spi2dac top_spi2dac(CLOCK_50, data[9:0], load, DAC_SDI, DAC_CS, SCK, DAC_LD);

endmodule
