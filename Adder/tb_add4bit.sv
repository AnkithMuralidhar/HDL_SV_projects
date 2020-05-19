module tb_add4bit();

	logic [3:0] A, B;
	logic [3:0] Y; 
	logic As, Bs, Ys;
	
	add4bit dut(A, B, As, Bs, Y, Ys);

	initial begin
	
	As=1'b0;	Bs=1'b0;	A=10;	B=5;	#10;
					A=5;	B=10;	#10;
			Bs=1'b1;	A=10;	B=5;	#10;
	As=1'b1;	Bs=1'b0;	A=10;	B=5;	#10;
					A=5;	B=10;	#10;
			Bs=1'b1;	A=10;	B=5;	#10;
	
	end
endmodule

