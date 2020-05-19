module add4bit(
		input logic [3:0] A, B,
		input logic As, Bs,
		output logic [3:0] Y,
		output logic Ys, OF_sum);

	logic C1, C2, C3, cp, y1;
	logic [3:0] Ya, Yb, Yc;

	FA4bit FA (A, B, Ya, C1);
	sub4b Sub1 (A, B, Yb, C2);
	sub4b Sub2 (B, A, Yc, C3);
	comp cmp (A, B, cp);
	
	always_comb

	if (As == Bs) begin
		Y = Ya;
		Ys = As;
	end
			
	else begin
		if(cp == 1) begin
			Ys = Bs;
			Y = Yc;
		end else begin
			Ys = As;
			Y = Yb;
		end
	end

	assign OF_sum = C1;

endmodule

module FA4bit(
		input logic [3:0] A, B,
		output logic [3:0] S, 
		output logic Cout);

	logic C1, C2, C3, Cin;
	assign Cin = 1'b0;
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

module sub4b (
		input logic [3:0] A, B,
		output logic [3:0] Diff,
		output logic bout);
	logic b1, b2, b3, bin;
	assign bin = 1'b0;
	sub_1b s1 (A[0], B[0], bin, Diff[0], b1);
	sub_1b s2 (A[1], B[1], b1, Diff[1], b2);
	sub_1b s3 (A[2], B[2], b2, Diff[2], b3);
	sub_1b s4 (A[3], B[3], b3, Diff[3], bout);
endmodule

module sub_1b (
		input logic a, b, bin,
		output logic diff, Bout);
	
	logic x, y, z, w;
	assign x = a ^ b;
	assign diff = x ^ bin;
	assign w = ~a & b;
	assign z = ~x & bin;
	assign Bout = w | z;
endmodule

module comp (
		input logic [3:0] A, B,
		output logic c );
	always_comb
	if (A[3] != B[3])
	begin
		if (A[3] == 1'b1)
		begin
		c = 1'b0;
		end
		else
		begin
		c = 1'b1;
		end
	end
	else
	begin
		if (A[2] != B[2])
		begin
			if (A[2] == 1'b1)
			begin
			c = 1'b1;
			end
			else
			begin
			c = 1'b0;
			end
		end
		else
		begin
			if(A[1] != B[1])
			begin
				if(A[1] == 1'b1)
				begin
				c = 1'b0;
				end
				else
				begin
				c = 1'b1;
				end
			end
			else
			begin
				if (A[0] != B[0])
				begin
					if (A[0] == 1'b1)
					begin
					c = 1'b0;
					end
					else
					begin
					c = 1'b1;
					end
				end
				else
				begin
					c = 1'b0;
				end
			end
		end
	end
endmodule

// module Fa(
//		input logic A, B, Cin,
//		output logic S, Cout);

//	assign S = A ^ B ^ Cin;
//	assign Cout = (A & B) | (B & Cin) | (A & Cin);

// endmodule