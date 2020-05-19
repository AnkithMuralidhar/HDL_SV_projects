module lessthan_structural(
		input logic [4:0] A, B,
		output logic ab);

	logic y1, z1, ip1, ip2, ab1, ab2;
	logic [4:0] y, z, c, s;


	assign ab1 = A[4] ^ B[4];

	assign ab = ab1 ? ip2 : ip1;

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