module tb_safe_vault();

	logic [15:0] passcode;
	logic ct_dn, Enter_PSW, reset;
	logic unlock, alarm; 
	logic a, start;
	logic [2:0] sec;

	safe_vault s1 (passcode, ct_dn, Enter_PSW,  reset, alarm, unlock,  sec, a, start);

	initial begin

	Enter_PSW = 0; reset = 1; ct_dn = 0; passcode = 16'hE469; #2s;
	
	reset = 0; ct_dn = 1; passcode = 16'hE469; #2s;
	Enter_PSW = 1;				   #1s;
	reset = 1;	#1s
	reset = 0; ct_dn = 0;	passcode =16'h0;	Enter_PSW = 0;	#3s
	
	reset = 1; 				#1s;
	reset = 0; ct_dn = 1; passcode = 16'hE479; #2s;
	Enter_PSW = 1;				   #1s;
	reset = 1;				#1s

	reset = 0; ct_dn = 0;	passcode =16'h0;	Enter_PSW = 0;	#3s

	reset = 1;  				   #1s;
	reset = 0; ct_dn = 1; passcode = 16'hD469; #7s;
	reset = 1;				#2s;

	reset = 0; ct_dn = 0;	passcode =16'h0;	Enter_PSW = 0;	#3s

	reset = 1; 				   #1s;
	reset = 1; ct_dn = 1; passcode = 16'hE469; #2s;

	reset = 1; 				   #1s;
	reset = 1; ct_dn = 0; passcode = 16'hE469; #2s;
	reset = 1; 				   #1s;

	end
endmodule

	 

	
