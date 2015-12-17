module pulse_gen(trigger, clk, pulse_out);

	input trigger;
	input clk;
	output pulse_out;
	
	reg [1:0] state;
	reg pulse_out;
	
	parameter IDLE =1'b0, WAIT_LOW = 1'b1;
	//parameter IDLE =2'b0, IN_HIGH = 2'b01, WAIT_LOW = 2'b11;
	initial state=IDLE;
	
	always@(posedge clk) begin
		// Toggle down pusle_out each posedge clk in order 
		// to make sure pulse_out lasts only 1 clk period
		pulse_out <= 1'b0;
		
		case(state)
		IDLE:
			if(trigger==1'b1) begin
				state <= WAIT_LOW;
				pulse_out <= 1'b1;
			end
			else 
				state<=IDLE;
			
		WAIT_LOW:
			if(trigger==1'b1) 
				state<=WAIT_LOW;
			else 
				state <= IDLE;
		default state <= IDLE;
		endcase
	end

endmodule