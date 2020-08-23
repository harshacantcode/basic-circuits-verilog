`timescale 1ns / 1ps

module decoder_3x8_test;

	reg i;
	reg i1;
	reg i2;
	reg enable;

	wire a;
	wire b;
	wire c;
	wire d;
	wire e;
	wire f;
	wire g;
	wire h;

	decoder_3x8 uut (
		.i(i),
		.i1(i1),
		.i2(i2),
		.enable(enable),
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
	
		i = 0;
		i1 = 0;
		i2 = 0;
		enable = 0;
		#50;
      repeat(15)
		begin
		enable = enable^(i&i1&i2);
		i2 = i2^(i&i1);
		i1 = i1^(i);
		i = i^1;
		#50;
		end
	end

endmodule
