module FA5bit(
		input logic [4:0] A, B,
		output logic [4:0] S, 
		output logic Cout);
	logic C1, C2, C3, C4, Cin;
	assign Cin = 1'b0;
	FA fa1(A[0], B[0], Cin, S[0], C1);
	FA fa2(A[1], B[1], C1, S[1], C2);
	FA fa3(A[2], B[2], C2, S[2], C3);
	FA fa4(A[3], B[3], C3, S[3], C4);
	FA fa5(A[4], B[4], C4, S[4], Cout);

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
