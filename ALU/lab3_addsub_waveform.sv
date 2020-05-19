module lab3_addsub_waveform(
		input logic [31:0] A, B, 
		input logic [2:0] F,
		output logic [31:0] Y,
		output logic OF);

	logic OF1, OF2, x, y, z;
	logic [31:0] ip0, ip1, ip2, ip3, Ya, BB;

	mux4_1 m1 (ip0, ip1, ip2, ip3, F [1:0] , Y);
	Adder32bit_copy addsub(A, BB, F [2], Ya, OF1);

	assign x = A[31] ^ B[31];
	assign z = B[31] ~^ Ya[31];
	assign y = 1'b0;
	assign OF2 = x ? z : y;
	assign OF = F[2] ? OF2 : OF1;
	
	assign BB = F[2] ? ~B : B;

	assign ip0 = Ya;
	assign ip1 = Ya;
	assign ip2 = Ya;
	assign ip3 = Ya;

endmodule


module mux4_1( 
		input  logic [31:0] D0, D1, D2, D3, 
		input logic [1:0] S,
		output logic [31:0] y);

	
	assign y = S[1] ? (S[0] ? D3 : D2) : (S[0] ? D1 : D0);

endmodule
