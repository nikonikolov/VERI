module Ex2a(SW, HEX0_D, HEX1_D, HEX2_D);
	input [9:0] SW;
	//input [3:0] SW1;
	//input [3:0] SW2;
	
	output [6:0] HEX0_D;
	output [6:0] HEX1_D;
	output [6:0] HEX2_D;
	

	hex_to_7seg SEG0(HEX0_D, SW[3:0]);
	hex_to_7seg SEG1(HEX1_D, SW[7:4]);
	hex_to_7seg SEG2(HEX2_D, {1'b0,1'b0, SW[9:8]});
	
endmodule