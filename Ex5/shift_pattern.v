module shift_pattern(pattern, clk);

	input clk;
	output [9:0] pattern;

	
	parameter LEFT = 1'b0;
	parameter RIGHT = 1'b1;
	reg [9:0] pattern;
	reg state;
	
	initial pattern = 10'b1;
	initial state = LEFT;
	
	always @(posedge clk) begin
		case(state)
		LEFT:
		begin
			if(pattern==10'h100)begin
				state<=RIGHT;
			end
			pattern[9:0] <={pattern[8:0], pattern[9]};
		end
		
		RIGHT:
		begin
			if(pattern==10'h002)begin
				state<=LEFT;
			end
			pattern[9:0] <={pattern[0], pattern[9:1]};
		end
		endcase	
	end

endmodule
