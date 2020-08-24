`timescale 1ns / 1ps

module demux_1x2(i,s,a,b);

    input i, s;
    output a, b;
	 and(a,i,s);
	 and(b,i,~s);

endmodule

module demux_1x4(i,s,s1,a,b,c,d);

	 input i, s, s1;
    output a, b, c, d;
	 wire w,w1;
    demux_1x2 demux1(i,s1,w,w1);
	 demux_1x2 demux2(w,s,a,b);
	 demux_1x2 demux3(w1,~s,c,d);

endmodule

module demux_1x8(i,s,s1,s2,a,b,c,d,e,f,g,h);

	 input i, s, s1, s2;
    output a, b, c, d ,e ,f, g, h;
    wire w,w1;
	 demux_1x2 demux1(i,s,w,w1);
	 demux_1x4 demux2(w,s1,s2,a,b,c,d);
 	 demux_1x4 demux3(w1,~s1,~s2,e,f,g,h);


endmodule
