`timescale 1ns / 1ps

module mux_8x1_test;

	reg a;
	reg b;
	reg c;
	reg d;
	reg e;
	reg f;
	reg g;
	reg h;
	reg s;
	reg s1;
	reg s2;

	wire out;

	mux_8x1 uut (
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e),
		.f(f),
		.g(g),
		.h(h),
		.s(s),
		.s1(s1),
		.s2(s2),
		.out(out)
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
		s = 0;
		s1 = 0;
		s2 = 0;
		#0.4;
      repeat(2047)
		begin
		s2 = s2^(a&b&c&d&e&f&g&h&s&s1);
		s1 = s1^(a&b&c&d&e&f&g&h&s);
		s = s^(a&b&c&d&e&f&g&h);
		h = h^(a&b&c&d&e&f&g);
		g = g^(a&b&c&d&e&f);
		f = f^(a&b&c&d&e);
		e = e^(a&b&c&d)
		d = d^(a&b&c);
		c = c^(a&b);
		b = b^a;
		a = a^1;
		#0.4;
		end
	end

endmodule
