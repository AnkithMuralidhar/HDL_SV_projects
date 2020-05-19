module Adder32bit(
		input logic [31:0] A, B,
		input logic Cin,
		output logic [31:0] Ya,
		output logic OFa, OFs);
	
	logic [7:0] C;
	logic Cout , co, x, y, z;
	
	

	add4bit add1 (A [3:0], B [3:0], Cin, Ya [3:0],  C[0]);
	add4bit add2 (A [7:4], B [7:4], C[0], Ya [7:4], C[1]);
	add4bit add3 (A [11:8], B [11:8], C [1], Ya [11:8], C[2]);
	add4bit add4 (A [15:12], B [15:12], C [2], Ya [15:12], C[4]);
	add4bit add5 (A [19:16], B [19:16], C [4], Ya [19:16], C[5]);
	add4bit add6 (A [23:20], B [23:20], C [5], Ya [23:20], C[6]);
	add4bit add7 (A [27:24], B [27:24], C [6], Ya [27:24], C[7]);
	add4bit1 add8 (A [31:28], B [31:28], C [7], Ya [31:28], Cout, co);
	assign OFa = Cout ^ co;
	assign x = A[31] ^ B[31];
	assign z = B[31] ~^ Ya[31];
	assign y = 1'b0;
	assign OFs = x ? z : y;
	

endmodule


module add4bit(
		input logic [3:0] A, B,
		input logic Cin,
		output logic [3:0] S,
		output logic Cout);

	logic C1, C2, C3;

	FA fa1(A[0], B[0], Cin, S[0], C1);
	FA fa2(A[1], B[1], C1, S[1], C2);
	FA fa3(A[2], B[2], C2, S[2], C3);
	FA fa4(A[3], B[3], C3, S[3], Cout);

endmodule

module add4bit1(
		input logic [3:0] A, B,
		input logic Cin,
		output logic [3:0] S,
		output logic Cout, C3);

	logic C1, C2, x, y, z;

	FA fa1(A[0], B[0], Cin, S[0], C1);
	FA fa2(A[1], B[1], C1, S[1], C2);
	FA fa3(A[2], B[2], C2, S[2], C3);
	FA fa4(A[3], B[3], C3, S[3], Cout);



endmodule


module FA(
		input logic A, B, Cin,
		output logic S, Cout);

	logic axorb, ab, c;
	
	HA ha1(A, B, axorb, ab);
	HA ha2(axorb, Cin, S, c);
	assign Cout = c|ab;

endmodule  


module HA(
		input logic A, B,
		output logic S, Cout);

	assign S = A ^ B;
	assign Cout = A & B;

endmodule


