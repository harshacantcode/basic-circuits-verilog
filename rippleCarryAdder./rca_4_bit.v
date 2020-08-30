`timescale 1ns / 1ps

module full_adder_1_bit(a,b,prev_carry,sum,carry);

    input a,b,prev_carry;
    output sum, carry;
	 wire w0,w1,w2,w3;
	 and(w0,a,~b);
	 and(w1,b,~a);
	 and(w3,a, b);
	 and(w2,sum, prev_carry);
	 or(sum,w0,w1);
	 or(carry, w2,w3);

endmodule

module rca_4_bit(n1, n2, ci, sum, pc4); 
    
   input [3:0]n1;
   input [3:0]n2;
   input ci;
   output pc4;
   output [3:0]sum;
  
   wire pc1;
   wire pc2;
   wire pc3;
    
full_adder_1_bit g1(n1[0],n2[0],ci,sum[0],pc1);
full_adder_1_bit g2(n1[1],n2[1],pc1,sum[1],pc2);
full_adder_1_bit g3(n1[2],n2[2],pc2,sum[2],pc3);
full_adder_1_bit g4(n1[3],n2[3],pc3,sum[3],pc4);


endmodule
