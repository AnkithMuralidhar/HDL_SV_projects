module lab_integrated(
		input logic [4:0] A, B,
		output logic [4:0] Sum, Abs_Sum, Diff,
		output logic OF_add, OF_sub, Lessthan);

	logic Cout, Bout, C;
	FA5bit l1 (A, B, Sum, Cout, OF_add);
	subtractor_5b l2 (A, B, Diff, Bout, OF_sub);
	abs_sum l3 (A, B, Abs_Sum, C);
	lessthan_structural l4 (A, B, Lessthan);


endmodule

module FA5bit(
		input logic [4:0] A, B,
		output logic [4:0] Sum, 
		output logic Cout, OF_add);

	logic C1, C2, C3, C4, A0, A1, A2, Cin;
	assign Cin = 0;

	FA fa1(A[0], B[0], Cin, Sum[0], C1);
	FA fa2(A[1], B[1], C1, Sum[1], C2);
	FA fa3(A[2], B[2], C2, Sum[2], C3);
	FA fa4(A[3], B[3], C3, Sum[3], C4);
	FA fa5(A[4], B[4], C4, Sum[4], Cout);
	

	assign OF_add = C4 ^ Cout;

	
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


module subtractor_5b(
			input logic [4:0] A, B,
			output logic [4:0] Y,
			output logic Bo, OF_sub);
	logic [4:0] B_bar;
	logic C, Bin, x, y, z;
	assign Bin = 0;
	a2_cmpl cmpl (B, B_bar, C);
	FA5bit	FA (A, B_bar, Y, Bo);
	assign x = A[4] ^ B[4];
	assign z = B[4] ~^ Y[4];
	assign y = 1'b0;
	assign OF_sub = x ? z : y;
endmodule



module a2_cmpl (
		input logic [4:0] a,
		output logic [4:0] y,
		output logic c);
	logic b, c0, b1, c1, b2, c2, b3, c3, b4, c4;
	logic [4:0] a_bar;
	assign a_bar[0] = ~a[0];
	assign a_bar[1] = ~a[1];
	assign a_bar[2] = ~a[2];
	assign a_bar[3] = ~a[3];
	assign a_bar[4] = ~a[4];
	full_adder fo ( a_bar[0], b, c0, y[0], c1);
	assign b = 1;
	assign c0 = 0;
	full_adder f1 ( a_bar[1], b1, c1, y[1], c2);
	assign b1 = 0;
	full_adder f2 ( a_bar[2], b2, c2, y[2], c3);
	assign b2 = 0;
	full_adder f3 ( a_bar[3], b3, c3, y[3], c4);
	assign b3 = 0;
	full_adder f4 ( a_bar[4], b4, c4, y[4], c);
	assign b4 = 0;
endmodule

module full_adder(
		input A, B, Cin,
		output S, Cout);

	assign S = A ^ B ^ Cin;
	assign Cout = (A & B) | (B & Cin) | (Cin & A);

endmodule
 

module abs_sum (
		input logic [4:0] A, B,
		output logic [4:0] Abs_sum,
		output logic C);

	logic [4:0] Asum, a, b;
	logic Cin;
	assign Cin = 1'b0;
	FA5bit F1 (A, B, Asum, C);
	assign a = ~Asum + 5'b00001;
	assign b = Asum;
	assign Abs_sum = Asum[4] ? a : b;

	
endmodule


module lessthan_structural(
		input logic [4:0] A, B,
		output logic Lessthan);

	logic y1, z1, ip1, ip2, ab1, ab2;
	logic [4:0] y, z, c, s;


	assign ab1 = A[4] ^ B[4];

	assign Lessthan = ab1 ? ip2 : ip1;

	assign ab2 = ~(A[4] ^ B[4]);
	assign ip1 = ab2 ? y1 : z1;

	assign c[4:0] = (~B[4:0] + 5'b00001);
	assign y = A + c;

	assign s[4:0] = (~B[4:0] + 5'b00001);
	assign z = A + s;

	assign y1 = y[4] ? 1'b1 : 1'b0;
	assign z1 = z[4] ? 1'b1 : 1'b0;

	assign ip2 = A[4] ? 1'b1 : 1'b0;

endmodule

