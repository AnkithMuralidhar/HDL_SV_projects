module testall ();
	logic [4:0] A, B, Sum, Abs_Sum, Diff;
	logic OF_add, OF_sub, Lessthan;

	lab_integrated dut (A, B, Sum, Abs_Sum, Diff, OF_add, OF_sub, Lessthan);

	initial begin
	A=4;	B=8;	#10;
	A=5;	B=-15;	#10;
	A=6;	B=-11;	#10;
	A=5;	B=-6;	#10;
	A=7;	B=-4;	#10;
	A=8;	B=12;	#10;
	A=8;	B=-4;	#10;
	A=13;	B=-15;	#10;
	A=-13;	B=-12;	#10;
	A=-11;	B=7;	#10;
	A=-12;	B=8;	#10;
	A=-12;	B=12;	#10;
	A=-12;	B=-16;	#10;
	A=-12;	B=-12;	#10;
	A=-12;	B=-8;	#10;
	A=-11;	B=-3;	#10;
	A=-7;	B=-2;	#10;
	A=-16;	B=15;	#10;
	end
endmodule
