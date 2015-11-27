`timescale 1ns / 100ps
// Design Name : counter2
// File Name : counter2.v
// Function : This is a 4 bit up-counter with
// synchronous active high reset, select and enable
//-----------------------------------------------------

module counter2 (
clock,		// Clock input to the design
select,		// Select 10 or 16 up counter
reset,		// active high, synchronous reset input
enable,		// Active high enable signal for counter
count			// 4 bit vector output of the counter
);				// End of port list

//-------------Input Ports-----------------------------
input clock;
input select;
input reset;
input enable;

//-------------Output Ports----------------------------
output [3:0] count;

//-------------Input Ports Data Type-------------------
// All the input ports should be wires
wire clock;
wire select;
wire reset;
wire enable;

//-------------Output Ports Data Type------------------
// Output port can be a storage element (reg) or a wire
reg [3:0] count;

//-------------Main Body of the Module-----------------

		always @ (posedge clock) begin
		// At every rising edge of clock we check if reset is active
		// If active, we load the counter output with "0000"
				if (reset == 1'b1) begin
					count <= 4'b0;
				end
				
				// Up to 15 count
				else if(select == 1'b0) begin
					if (enable == 1'b1) begin
						count <= count + 1'b1;
					end
				end // End of up to 15 count
				
				// Up to 9 count
				else begin
					if (enable == 1'b1) begin
						count <= count + 1'b1;
						if(count == 9) begin 
							count <= 4'b0;
						end
					end
				end // End of up to 9 count
		end 

endmodule // End of Module counter