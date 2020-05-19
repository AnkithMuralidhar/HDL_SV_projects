module tbmagsign ();
	logic As, Bs, op, Ys, OF, Lessthan, Equal;
	logic [3:0] Am, Bm, Ym;

	lab2_Integrated m1 (Am, Bm, As, Bs, op, Ym, Ys, OF, Equal, Lessthan);
	
	initial begin

	As=1;	Am=3;	Bs=0;	Bm=2;	op=1;	#10;
	As=1;	Am=3;	Bs=1;	Bm=2;	op=1;	#10;
	As=0;	Am=3;	Bs=0;	Bm=2;	op=1;	#10;
	As=0;	Am=3;	Bs=1;	Bm=2;	op=1;	#10;

	As=0;	Am=14;	Bs=0;	Bm=3;	op=1;	#10;
	As=1;	Am=14;	Bs=1;	Bm=3;	op=1;	#10;
	As=0;	Am=14;	Bs=1;	Bm=3;	op=1;	#10;
	As=1;	Am=14;	Bs=0;	Bm=3;	op=1;	#10;

	As=1;	Am=3;	Bs=0;	Bm=2;	op=0;	#10;
	As=1;	Am=3;	Bs=1;	Bm=2;	op=0;	#10;
	As=0;	Am=3;	Bs=0;	Bm=2;	op=0;	#10;
	As=0;	Am=3;	Bs=1;	Bm=2;	op=0;	#10;

	As=1;	Am=4;	Bs=1;	Bm=13;	op=0;	#10;
	As=0;	Am=13;	Bs=1;	Bm=-4;	op=0;	#10;
	As=1;	Am=13;	Bs=1;	Bm=4;	op=0;	#10;
	As=1;	Am=4;	Bs=0;	Bm=13;	op=0;	#10;
	As=0;	Am=4;	Bs=0;	Bm=13;	op=0;	#10;
	As=0;	Am=13;	Bs=0;	Bm=4;	op=0;	#10;

	As=0;	Am=15;	Bs=1;	Bm=15;	op=1;	#10;
	As=1;	Am=15;	Bs=1;	Bm=15;	op=1;	#10;
	As=0;	Am=15;	Bs=0;	Bm=15;	op=1;	#10;
	As=0;	Am=15;	Bs=0;	Bm=15;	op=0;	#10;
	As=1;	Am=15;	Bs=1;	Bm=15;	op=0;	#10;
	As=1;	Am=15;	Bs=0;	Bm=15;	op=0;	#10;

	As=0;	Am=0;	Bs=1;	Bm=0;	op=0;	#10;
	As=1;	Am=0;	Bs=0;	Bm=0;	op=0;	#10;
	As=1;	Am=0;	Bs=0;	Bm=0;	op=1;	#10;
	As=0;	Am=0;	Bs=1;	Bm=0;	op=1;	#10;

	end
endmodule
