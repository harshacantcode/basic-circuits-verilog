`timescale 1ns / 1ps

module laca_4_bit(n1,n2,c0,sum,carry);

    input [3:0] n1,n2;
    input c0;
    output [3:0]sum;
    output carry;

	 wire [3:0] w, P, G;

	 assign P = n1^n2;
	 assign G = n1&n2;

	 assign w[0] = c0;
	 assign w[1] = G[0] + P[0]&w[0];
	 assign w[2] = G[1] + P[1]&(G[0] + P[0]&w[0]);
	 assign w[3] = G[2] + P[2]&(G[1] + P[1]&(G[0] + P[0]&w[0]));

	 assign sum = P^w;
	 assign carry = G[3] + P[3]&w[3];

endmodule
