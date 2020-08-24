`timescale 1ns / 1ps

module demux_1x8_test;

	// Inputs
	reg i;
	reg s;
	reg s1;
	reg s2;

	// Outputs
	wire a;
	wire b;
	wire c;
	wire d;
	wire e;
	wire f;
	wire g;
	wire h;

	// Instantiate the Unit Under Test (UUT)
	demux_1x8 uut (
		.i(i),
		.s(s),
		.s1(s1),
		.s2(s2),
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e),
		.f(f),
		.g(g),
		.h(h)
	);

	initial begin
		// Initialize Inputs
		i = 0;
		s = 0;
		s1 = 0;
		s2 = 0;

		// Wait 100 ns for global reset to finish
		#50;
      repeat(15)
		begin
		s2 = s2 ^ (s1 & s & i);
		s1 = s1 ^ (s & i);
		s = s ^ i;
		i = i ^ 1;
		#50;
		end

	end

endmodule
