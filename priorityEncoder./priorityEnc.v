`timescale 1ns / 1ps

module priorityEnc(enable, a, b, c , d, e, f, g, h, o0, o1, o2, valid);

    input enable, a, b, c, d, e, f, g, h;
    output o0, o1, o2,valid;
    wire w0,w1,w2,w3,w4,w5;
	 
	 or(w0, a,b);
	 or(w1, w0,c);
	 or(w2, w1,d);
	 or(w3, w2,e);
	 or(w4, w3,f);
	 or(w5, w4,g);
	 or(valid, w5,h);
	 
	 wire W0,W1,W2,W3,W4,W5,W6;
	 and(W0, ~e,~c);
	 and(W1, W0,b);
	 and(W2, ~e,d);
	 or(W3, W2,W1);
	 or(W4, W3, f);
	 and(W5, W4,~g);
	 or(W6, W5, h);
	 and(o0, W6,enable);
	 
	 wire v0,v1,v2,v3,v4;
	 and(v0, ~f,~g);
	 or(v1, c,d);
	 and(v2, v1,v0);
	 or(v3, v2,g);
	 or(v4, v3,h);
	 and(o1, v4,enable);
	 
	 wire V0,V1,V2;
	 or(V0, e,f);
	 or(V1, V0,g);
	 or(V2, V1,h);
	 and(o2, V2,enable);
	 
endmodule

