module tb_lab3_integrated();

	reg [31:0] A, B;
	logic [31:0] Y;
	logic [2:0] F;
	logic OF;
	lab3_integrated dut(A, B, F, Y, OF);
	initial begin

	A = 32'h00000000;	B = 32'h00000000;	F = 2;	#10;
	A = 32'h7FFFFFFF;	B = 32'h7FFFFFFF;	F = 2;	#10;
	A = 0;	B = -1;	F = 2;	#10;
	A = 1;	B = -1;	F = 2;	#10;
	A = 32'hFF;	B = 1;	F = 2;	#10;
	A = 0;	B = 0;	F = 6;	#10;
	A = 0;	B = -1;	F = 6;	#10;
	A = 1;	B = 1;	F = 6;	#10;
	A = 32'h00000100;	B = 32'h00000010;	F = 6;	#10;
	A = 32'h7FFFFFFF;	B = 32'h80000001;	F = 6;	#10;
	A = 0;	B = 0;	F = 2;	#10;
	A = 0;	B = 1;	F = 6;	#10;
	A = 0;	B = -1;	F = 2;	#10;
	A = 1;	B = 0;	F = 6;	#10;
	A = -1;	B = 0;	F = 6;	#10;
	A = 32'hFFFFFFFF;	B = 32'hFFFFFFFF;	F = 2;	#10;
	A = 32'hFFFFFFFF;	B = 32'h12345678;	F = 2;	#10;	
	A = 32'h12345678;	B = 32'h87654321;	F = 2;	#10;
	A = 32'h00000000;	B = 32'hFFFFFFFF;	F = 6;	#10;
	A = 32'hFFFFFFFF;	B = 32'hFFFFFFFF;	F = 6;	#10;
	A = 32'h12345678;	B = 32'h87654321;	F = 6;	#10;
	A = 32'h00000000;	B = 32'hFFFFFFFF;	F = 6;	#10;
	A = 32'h00000000;	B = 32'h00000000;	F = 2;	#10;
	A = 32'h00000100;	B = 32'h00000010;	F = 2;	#10;
	A = 32'h4780ADAD; B = 32'hAFCE780A; F = 2; #10;
	A = 32'h0A0A0909; B = 32'h11110A09; F = 6; #10;
	end
endmodule

