module clk_div (clkin, tc, clkout);
	input clkin;
	input [21:0] tc;
	output clkout;
	
	reg [21:0] count;
	reg clkout;
	
	initial clkout = 0;
	initial count = 22'b0;
	
	always @ (posedge clkin) begin
		if(count<tc)begin
			count <= count+1;
		end		
		else begin
			clkout = ~clkout;
			count <= 0;
		end
	end

endmodule



