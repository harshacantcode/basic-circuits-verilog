`timescale 1ns / 1ps

module mux_2x1(a,b,s,out);

    input a,b,s;
    output out;
	 wire w,w1;
    and a1(w,a,s);
	 and a2(w1,b,~s);
	 or o1(out,w,w1);

endmodule

module mux_4x1(a,b,c,d,s,s1,out);

    input a, b, c, d, s, s1;
    output out;
	 wire w,w1;
	 mux_2x1 mux(a,b,s,w);
	 mux_2x1 mux1(c,d,~s,w1);
	 mux_2x1 mux2(w,w1,s1,out);

endmodule

module mux_8x1(a,b,c,d,e,f,g,h,s,s1,s2,out);

	input a, b, c, d, e, f, g, h, s, s1, s2;
	output out;
	wire(w,w1);
	mux_4x1 m(a,b,c,d,s,s1,w);
	mux_4x1 m1(e,f,g,h,s,s1,w1);
	mux_2x1 m2(w,w1,s2,out);

endmodule
