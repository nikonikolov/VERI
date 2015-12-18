module counter (	input wire clock,						// Clock input to the design
						output reg [12:0] count				// 13 bit vector output of the counter
					);	
	initial count = 0;
	always @ (negedge clock) count <= count + 1'b1;
endmodule
