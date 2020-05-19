module lessthan(
		input logic [4:0] A, [4:0] B,
		output logic ab);

	logic [4:0] y, z, s, c;
	always_comb
	if (A[4] != B[4]) begin

		if(A[4]==1  && B[4]==0) 
			assign ab = 1'b1;

		else 
			assign ab = 1'b0;

	end else begin

		if((A[4] == 1'b0) && (B[4] == 1'b0)) begin
			c[4:0] = (~B[4:0] + 5'b00001);
			assign y = A + c;
			if(y[4] == 1'b0)
				assign ab = 1'b0;
			else
				assign ab = 1'b1;
		end else begin
			s[4:0] = (~B[4:0] + 5'b00001);
			assign z = A + s;
			if(z[4] == 1'b1)
				assign ab = 1'b1;
			else
				assign ab = 1'b0;
		end
	end
endmodule


