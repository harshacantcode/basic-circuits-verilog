`timescale 1ns / 1ps

module multifourbit_test;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [7:0] p;

	// Instantiate the Unit Under Test (UUT)
	multifourbit uut (
		.a(a),
		.b(b),
		.p(p)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#0.97;
      repeat(32)
		begin
		a = a + 1;
		#0.97;
		repeat(32)
		begin
		b = b + 1;
		#0.97;
		end
		end
	end

endmodules
