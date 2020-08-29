`timescale 1ns / 1ps

module laca_4_bit_test;

	// Inputs
	reg [3:0] n1;
	reg [3:0] n2;
	reg c0;

	// Outputs
	wire [3:0] sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	laca_4_bit uut (
		.n1(n1),
		.n2(n2),
		.c0(c0),
		.sum(sum),
		.carry(carry)
	);

	initial begin
		// Initialize Inputs
		n1 = 0;
		n2 = 0;
		c0 = 0;
		#1.9;
		repeat(31)
		begin
		n1 <= n1 + 1;
		#1.9;
		repeat(15)
		begin
		n2 <= n2 + 1;
		#1.9;
		end
		c0 = c0^1;
		#1.9;
		end
	end

endmodule
