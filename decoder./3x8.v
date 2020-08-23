`timescale 1ns / 1ps

module decoder_1x2(i,enable,a,b);

	 input i, enable;
   output a, b;
   and(a,i,enable);
	 and(b,~i,enable);

endmodule

module decoder_2x4(i,i1,enable,a,b,c,d);

	 input i, i1, enable;
   output a, b, c, d;
	 wire w, w1;
	 decoder_1x2 decoder1(i,enable,w,w1);
	 decoder_1x2 decoder2(i1,w,a,b);
	 decoder_1x2 decoder3(i1,w1,c,d);

endmodule

//The individual modules work as 1x2, 2x4 decoders. 

module decoder_3x8(i,i1,i2,enable,a,b,c,d,e,f,g,h);

	 input i, i1, i2, enable;
	 output a, b, c, d, e, f, g, h;
   wire w,w1;
	 decoder_1x2 decoder1(i,enable,w,w1);
	 decoder_2x4 decoder2(i1,i2,w,a,b,c,d);
	 decoder_2x4 decoder3(i1,i2,w1,e,f,g,h);

endmodule
