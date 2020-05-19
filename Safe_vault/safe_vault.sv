module safe_vault(
		input logic [15:0]passcode,
		input logic CT_DN, Enter_PSW, reset, 
		output logic alarm, unlock,
		output logic [2:0] sec,
		output logic a,
		output logic start);

	logic  clk;
	reg [15:0] register;
	
	
	ct_dn c1 (reset, CT_DN, start);

	assign register = 16'hE469;
	assign a = passcode == register;
	always begin
		clk = 1; #0.5s; 
		clk = 0; #0.5s;
	end


	always_comb

	if(reset) begin
		alarm = 0;
		unlock = 0;
		sec = 0;

	end else begin

		if (start == 1) begin
			
			sec = clk+sec;
		
			if(sec < 3'd6) begin
				if (Enter_PSW == 1'b1) begin
					 
					if(a == 1'b1) begin
						alarm = 0;
						unlock = 1;
					end else if (a == 1'b0) begin
						alarm = 1;
						unlock = 0;
				end
			end else begin
				alarm = 0;
				unlock = 0;
			end
			end else begin
				alarm = 1;
				unlock = 0;
			end
	 	end else begin
			alarm = 0;
			unlock = 0;
		end
	end

endmodule
