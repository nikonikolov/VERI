module processor(	input wire CLOCK_50, input data_valid, 
						input wire [9:0] data_in, input wire [8:0] SW, 
						output reg [9:0] data_out, output [6:0] HEX0_D,
						output [6:0] HEX1_D, output [6:0] HEX2_D,
						output [6:0] HEX3_D);
			
	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;
	
	wire [9:0]		x, y, ATTENUATED;
	wire 				data_valid_out;
	
	wire [8:0] 	q;
	wire [12:0] count, count_sum;
	
	wire [19:0] 	delay;
	wire [15:0] 	pattern;
	
	
	// Instantiate pulse_gen block
	pulse_gen pulse_gen_echo(	.pulse(data_valid_out), 
										.in(data_valid), 
										.clk(CLOCK_50)
									);
									
	// Instantiate negedge clocked counter								
	counter count13(data_valid, count[12:0]);
	
	// x is input in 2's complement
	assign x = data_in[9:0] - ADC_OFFSET;		
	
	// Find Write address signal
	assign count_sum = {SW[8:0], 4'b0} + count;
	
	// RAM block
	RAM ram_echo(
		.clock(CLOCK_50),
		.data(y[9:1]),
		.rdaddress(count[12:0]),
		.rden(data_valid_out),
		.wraddress(count_sum[12:0]),
		.wren(data_valid_out),
		.q(q[8:0]));
	
	// Attenuate Signal - NOTE ARITHMETIC SHIFT
	assign ATTENUATED = 	{q[8], q[8:0]};
	
	// Add Echo and Original Signal Together
	assign y = x - ATTENUATED;
	
	// Convert signal to DAC range
	always@(posedge CLOCK_50) data_out =  y + DAC_OFFSET;

	
	MULT mult_in(SW[8:0], delay[19:0]);
	bin2bcd bcd_result({4'b0, delay[19:10]}, pattern[3:0], pattern[7:4], pattern[11:8], pattern[15:12]);
	
	hex_to_7seg seg3(HEX3_D, pattern[15:12]);
	hex_to_7seg seg2(HEX2_D, pattern[11:8]);
	hex_to_7seg seg1(HEX1_D, pattern[7:4]);
	hex_to_7seg seg0(HEX0_D, pattern[3:0]);

endmodule
