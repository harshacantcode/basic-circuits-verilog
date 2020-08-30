`timescale 1ns / 1ps

module rca_4_bit_test;


	reg a;
	reg b;
	reg c;
	reg d;
	reg e;
	reg f;
	reg g;
	reg h;
	reg ci;


	wire pc4;
	wire s1;
	wire s2;
	wire s3;
	wire s4;

	rca_4_bit uut (
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e),
		.f(f),
		.g(g),
		.h(h),
		.ci(ci),
		.pc4(pc4),
		.s1(s1),
		.s2(s2),
		.s3(s3),
		.s4(s4)
	);

	initial begin

		a = 0;
		b = 0;
		c = 0;
		d = 0;
		e = 0;
		f = 0;
		g = 0;
		h = 0;
		ci = 0;

		#1.9531;
      repeat(511)
		begin
		a = a^(b&c&d&e&f&g&h&ci);
		b = b^(c&d&e&f&g&h&ci);
		c = c^(d&e&f&g&h&ci);
		d = d^(e&f&g&h&ci);
		e = e^(f&g&h&ci);
		f = f^(g&h&ci);
		g = g^(h&ci);
		h = h^(ci);
		ci = ci^1;
		#1.9531;
		end

	end

endmodule
