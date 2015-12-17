module addr_reg(SW, Q, CLK);

	input CLK;
	input [9:0] SW;
	output [9:0] Q;
	reg [9:0] Q;
	reg [9:0] D;
	
	initial Q = 10'b0;
	always@(posedge CLK)begin
		D[9:0] <= SW[9:0] + Q[9:0];
		Q[9:0] <= D[9:0];
	end
endmodule
	