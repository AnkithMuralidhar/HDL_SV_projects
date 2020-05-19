module tb_Adder32bit();

	logic [31:0] A, B;
	logic [31:0] Ya;
	logic Cin, Ofadd, Ofsub;
	
	Adder32bit add(A, B, Cin, Ya, Ofadd, Ofsub);
	initial begin

	A = 32'h00000000; B = 32'h00000000;	Cin = 1'b0; #10;
	A = 32'hFF; B = 32'hFFFFFFFF;	Cin = 1'b0; #10;

	end
endmodule
