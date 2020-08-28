`timescale 1ns / 1ps

module priorityEnc_testBench;

	// Inputs
	reg enable;
	reg a;
	reg b;
	reg c;
	reg d;
	reg e;
	reg f;
	reg g;
	reg h;

	// Outputs
	wire o0;
	wire o1;
	wire o2;
	wire valid;

	// Instantiate the Unit Under Test (UUT)
	priorityEnc uut (
		.enable(enable),
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e),
		.f(f),
		.g(g),
		.h(h),
		.o0(o0),
		.o1(o1),
		.o2(o2),
		.valid(valid)
	);

	initial begin
		// Initialize Inputs
		enable = 0;
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		e = 0;
		f = 0;
		g = 0;
		h = 0;

		// Wait 1.9 ns for global reset to finish
		#1.953125;
		repeat(511)
		begin
		enable = enable^(a&b&c&d&e&f&g&h);
		a = a^(b&c&d&e&f&g&h);
		b = b^(c&d&e&f&g&h);
		c = c^(d&e&f&g&h);
		d = d^(e&f&g&h);
		e = e^(f&g&h);
		f = f^(g&h);
		g = g^(h);
		h = h^1;
		#1.953125;
		end

		// Add stimulus here

	end

endmodule
