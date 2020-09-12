`timescale 1ns / 1ps

module wallacefourbit_test;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [7:0] p;

	// Instantiate the Unit Under Test (UUT)
	wallacefourbit uut (
		.a(a),
		.b(b),
		.p(p)
	);

	initial begin
			a = 0;
		b = 0;

		#4;
		repeat(15)
		begin
		a = a + 1;
		#4;
		repeat(15)
		begin
		b = b + 1;
		#4;
		end
		b = 0;
		end

	end
