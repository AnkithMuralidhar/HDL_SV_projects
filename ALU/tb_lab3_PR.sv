module tb_lab3_PR();

	logic [31:0] A, B;
	logic [16:0] z;

	lab3_PR dut(A, B, z);
	initial begin
		
		A = 32'hF1111000; B = 32'h00011111; #10;
		A = 32'h4780ADAD; B = 32'hAFCE780A; #10;
		A = 32'h0A0A0909; B = 32'h11110A09; #10;
		A = 32'h00000100;	B = 32'h00000010;	#10;

	end

endmodule
