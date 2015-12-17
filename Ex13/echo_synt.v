module processor(input wire CLOCK_50, input data_valid, 
						input wire [9:0] data_in, output reg [9:0] data_out);
			
	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;
	parameter		beta = 2;
	
	wire [9:0]		x, y, FIFO_OUT, ATTENUATED;
	wire 				rdreq_sum, data_valid_out, D_FF;
	reg 				Q_FF;
	
	// Instantiate pulse_gen block
	pulse_gen pulse_gen_echo(	.pulse(data_valid_out), 
										.in(data_valid), 
										.clk(CLOCK_50)
									);
	
	assign x = data_in[9:0] - ADC_OFFSET;		// x is input in 2's complement
	
	// Implement Flip-Flop
	always@(posedge CLOCK_50) Q_FF <= D_FF;
	
	// Find Read request signal
	assign rdreq_sum = data_valid_out && Q_FF;
	
	// FIFO block
	FIFO fifo_top(
	.clock(CLOCK_50),
	.data(x[9:0]),
	.rdreq(rdreq_sum),
	.wrreq(data_valid_out),
	.full(D_FF),
	.q(FIFO_OUT));
	
	// Attenuate Signal - NOTE ARITHMETIC SHIFT
	assign ATTENUATED = 	(10'b1000000000 & FIFO_OUT) 					? 
								(10'b1100000000 | (FIFO_OUT >> beta)) 		: 
								(10'b0011111111 & (FIFO_OUT >> beta))		;
	
	// Add Echo and Original Signal Together
	assign y = ATTENUATED + x;
	
	// Convert signal to DAC range
	always@(posedge CLOCK_50) data_out =  y + DAC_OFFSET;

endmodule