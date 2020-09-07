`timescale 1ns / 1ps

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

module fourbitadder(i1,i2,c_in,sum,carry);

input [3:0] i1,i2;
input c_in;
output [3:0]sum;
output carry;

full_adder a1(i1[0], i2[0], c_in, sum[0], w0);
full_adder a2(i1[1], i2[1], w0, sum[1], w1);
full_adder a3(i1[2], i2[2], w1, sum[2], w2);
full_adder a4(i1[3], i2[3], w2, sum[3], carry);

endmodule

module multifourbit(a,b,p);

input [3:0] a,b;
output [7:0] p;

wire c1,c2;

and (p[0], a[0], b[0]);

wire [3:0] t0,t1,t2;
and (t0[0], a[1], b[0]);
and (t0[1], a[2], b[0]);
and (t0[2], a[3], b[0]);
assign t0[3] = 0;
and (t1[0], a[0], b[1]);
and (t1[1], a[1], b[1]);
and (t1[2], a[2], b[1]);
and (t1[3], a[3], b[1]);
fourbitadder fa1(t0, t1, 0, t2, c1);
assign p[1] = t2[0];

wire [3:0] q0,q1,q2;
assign q0[0] = t2[1];
assign q0[1] = t2[2];
assign q0[2] = t2[3];
assign q0[3] = c1;
and (q1[0], a[0], b[2]);
and (q1[1], a[1], b[2]);
and (q1[2], a[2], b[2]);
and (q1[3], a[3], b[2]);
fourbitadder fa2(q0,q1,0,q2,c2);
assign p[2] = q2[0];

wire [3:0] w0,w1;
assign w0[0] = q2[1];
assign w0[1] = q2[2];
assign w0[2] = q2[3];
assign w0[3] = c2;
and (w1[0], a[0], b[3]);
and (w1[1], a[1], b[3]);
and (w1[2], a[2], b[3]);
and (w1[3], a[3], b[3]);
fourbitadder fa3(w0,w1,0,p[6:3], p[7]);

endmodule
