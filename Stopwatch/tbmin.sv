module tbcmin ();
	logic reset, run;
	logic [6:0] min;
	logic [6:0] sec;
	logic [7:0] centi;

	minute m1 (reset, run, min, sec, centi);
	initial begin
	reset = 1;	run = 0;	#100ms;
	reset = 0;	run = 1;	#1000s;
	reset = 1; 	run = 1;	#1000ms;
	reset = 0; 	run = 1;	#1000ms;
	reset = 0; 	run = 0;	#100ms;
	reset = 0; 	run = 1;	#100ms;


	end
endmodule	
