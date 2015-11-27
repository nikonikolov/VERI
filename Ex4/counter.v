//`timescale 1ns / 100ps
// Design Name : counter
// File Name : counter.v
// Function : This is a 16 bit up-counter with
// synchronous active high reset and enable
//-----------------------------------------------------

module counter (
clock,		// Clock input to the design
reset,		// active high, synchronous reset input
enable,		// Active high enable signal for counter
count			// 4 bit vector output of the counter
);				// End of port list

//-------------Input Ports-----------------------------
input clock;
input reset;
input enable;

//-------------Output Ports----------------------------
output [15:0] count;

//-------------Input Ports Data Type-------------------
// All the input ports should be wires
wire clock;
wire reset;
wire enable;

//-------------Output Ports Data Type------------------
// Output port can be a storage element (reg) or a wire
reg [15:0] count;

//-------------Main Body of the Module-----------------

		always @ (posedge clock) begin
		// At every rising edge of clock we check if reset is active
		// If active, we load the counter output with "0000"
				if (reset == 1'b0) begin
					count <= 15'b0;
				end
		// If enable is active, then we increment the counter
				else if (enable == 1'b1) begin
					count <= count + 1'b1;
				end
			end // End of Block

endmodule // End of Module counter