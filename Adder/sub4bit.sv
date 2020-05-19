module sub4bit(
		input logic [3:0] A, B,
		input logic Bin,
		output logic [3:0] D,
		output logic Bout);

	logic b1, b2, b3;

	sub1b sub1 (A[0], B[0], Bin, D[0], b1);
	sub1b sub2 (A[1], B[1], b1, D[1], b2);
	sub1b sub3 (A[2], B[2], b2, D[2], b3);
	sub1b sub4 (A[3], B[3], b3, D[3], Bout);

endmodule
