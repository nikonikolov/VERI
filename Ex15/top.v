//------------------------------
// Module name: top
// Function: top level module to test the ROM
// Creator:  Peter Cheung
// Version:  1.0
// Date:     20 Jan 2014
//------------------------------

module top (CLOCK_50, SW, HEX0_D, HEX1_D, HEX2_D, HEX3_D,
					DAC_SDI, SCK, DAC_CS, DAC_LD,
					ADC_SDI, ADC_CS, ADC_SDO);

	input			CLOCK_50;		// DE0 50MHz system clock
	input [9:0]	SW;				// 10 slide switches to specify address to ROM
	output [6:0] HEX0_D;
	output [6:0] HEX1_D;
	output [6:0] HEX2_D;
	output [6:0] HEX3_D;		
	output 		DAC_SDI;			//Serial data out to SDI of the DAC
	output 		SCK;				//Serial clock signal to both DAC and ADC
	output		DAC_CS;			//Chip select to the DAC, low active
	output 		DAC_LD;			//Load new data to DAC, low active	
	output 		ADC_SDI;			//Serial data out to SDI of the ADC
	output		ADC_CS;			//Chip select to the ADC, low active
	input 		ADC_SDO;			//Converted serial data from ADC	
		
	wire			ld_pulse;
	wire			clk_10k;		// internal clock at 10kHz
	wire [9:0] 	data_in;		// converted data from ADC
	wire [9:0] 	data_out;	// processed data to DAC
	wire			data_valid;
	wire			DAC_SCK, ADC_SCK, SCK;
	
	clk_div  GEN_10K (CLOCK_50, 21'd2499, clk_10k);  	// generate 10KHz sampling clock
	pulse_gen  PULSE (ld_pulse, clk_10k, CLOCK_50);		// generate a convert pulse

	spi2dac SPI_DAC (CLOCK_50, data_out, ld_pulse, 		// send processed sample to DAC
					DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);		// order of signals matter
					
	spi2adc SPI_ADC (												// perform a A-to-D conversion
		.sysclk (CLOCK_50), 										// order of parameters do not matter
		.channel (SW[9]), 
		.start (ld_pulse),
		.data_from_adc (data_in),
		.data_valid (data_valid),
		.sdata_to_adc (ADC_SDI),
		.adc_cs (ADC_CS),
		.adc_sck (ADC_SCK),
		.sdata_from_adc (ADC_SDO));		
					
	processor var_mult_echo(	.CLOCK_50(CLOCK_50), 
										.data_valid(data_valid), 
										.data_in(data_in), 
										.data_out(data_out),
										.SW(SW[8:0]),
										.HEX0_D(HEX0_D),
										.HEX1_D(HEX1_D),
										.HEX2_D(HEX2_D),
										.HEX3_D(HEX3_D)
									);
						
	
	assign SCK = DAC_SCK | ADC_SCK;							// merge the two serial clocks
	
endmodule


