module add4bit(
		input logic [3:0] A, B,
		input logic Cin,
		output logic [3:0] S,
		output logic Cout, OF);

	logic C1, C2, C3;

	FA fa1(A[0], B[0], Cin, S[0], C1);
	FA fa2(A[1], B[1], C1, S[1], C2);
	FA fa3(A[2], B[2], C2, S[2], C3);
	FA fa4(A[3], B[3], C3, S[3], Cout);

	always_comb

	if((A[3] & B[3] == 1'b1) && (S[3] == 1'b0)) begin
		OF = 1'b1;

	end else if((A[3] & B[3] == 1'b0) && (S[3] == 1'b1)) begin
		OF = 1'b1;

	end else if (Cout == 1'b1) begin
		OF = 1'b1;

	end else begin
		OF = 1'b0;
	end

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


// module Fa(
//		input logic A, B, Cin,
//		output logic S, Cout);

//	assign S = A ^ B ^ Cin;
//	assign Cout = (A & B) | (B & Cin) | (A & Cin);

// endmodule