`timescale 1ns / 1ps

module half_adder(a,b,sum,carry);

	input a,b;
	output sum,carry;
	wire w1,w2;
	and (carry,a,b);
	and (w1, ~a,b);
	and (w2, ~b,a);
	or (sum,w1,w2);

endmodule

module full_adder(a,b,c_in,sum,carry);

	input a,b,c_in;
	output sum, carry;
	wire w0,w1,w2,w3,w4,w5,w6;
	and (w0,a,~b);
	and (w1,b,~a);
	or (w2, w0,w1);
	and (w3, ~w2, c_in);
	and (w4, w2, ~c_in);
	or (sum, w3, w4);
	and (w5, a, b);
	and (w6, w2, c_in);
	or (carry, w5, w6);

endmodule
module wallacefourbit(a,b,p);

	input [3:0] a,b;
	output [7:0] p;

	and (p[0], a[0], b[0]);

	wire w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,s2,s3,s4,s6,s7,s8,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11;
	and (w0, a[1], b[0]);
	and (w1, a[0], b[1]);
	and (w2, a[2], b[0]);
	and (w3, a[1], b[1]);
	and (w4, a[3], b[0]);
	and (w5, a[2], b[1]);
	and (w6, a[3], b[1]);
	and (w7, a[0], b[2]);
	and (w8, a[1], b[2]);
	and (w9, a[2], b[2]);
	and (w10, a[3], b[2]);
	and (w11, a[0], b[3]);
	and (w12, a[1], b[3]);
	and (w13, a[2], b[3]);
	and (w14, a[3], b[3]);

	half_adder h1(w0, w1, p[1], c1);
	full_adder fa1(w2,w3,w7,s2,c2);
	full_adder fa2(w4,w5,w8,s3,c3);
	half_adder ha2(w6, w9, s4, c4);

	half_adder ha3(c1,s2, p[2], c5);
	full_adder fa3(c2,s3,w11,s6,c6);
	full_adder fa4(c3,s4,w12,s7,c7);
	full_adder fa5(c4,w10,w13,s8,c8);

	half_adder ha4(c5, s6, p[3], c9);
	full_adder fa6(c6,c9,s7,p[4],c10);
	full_adder fa7(c7,c10,s8,p[5],c11);
	full_adder fa8(c8,c11,w14,p[6],p[7]);

endmodule
