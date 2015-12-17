module FF(CLOCK_2, data);

	input CLOCK_2;
	output [9:0] data;

	wire [9:0] data;
	reg out;
	
	initial out=0;
	always@(posedge CLOCK_2)begin
		out <=~out;
	end

	assign data = {out, out, out, out, out, out, out, out, out, out};
endmodule