module minute (
	input logic reset, run,
	output logic [6:0] min,
	output logic [6:0] sec,
	output logic [7:0] centi);
	
	logic [6:0] D;
	logic clk, reset1, reset2, reset33;
	second s1 (reset, run, clk, sec, centi, reset22);
	always begin
		clk =  1; #50000000ns; clk = 0; #50000000ns;
	end
	
	assign reset3 = reset | reset33;
	assign D = min + reset22;
	always_ff @(posedge clk, posedge reset)
		if (reset3) min <= 7'b0;
		else if (run) min <= D;   
	always_comb
	
	if (D == 7'd60)
	begin
		reset33 = 1'b1;
	end
	else 
	begin
		reset33 = 1'b0;
	end
endmodule

module second (
	input logic reset, run, clk,
	output logic [6:0] sec,
	output logic [7:0] centi,
	output logic reset22);
	
	logic [6:0] D;
	logic reset1;
	centisecond c1 (reset, run, clk, centi, reset2);
	
	assign reset1 = reset | reset22;
	assign D = sec + reset2;
	always_ff @(posedge clk, posedge reset)
		if (reset1) sec <= 7'b0;
		else if (run) sec <= D;   
	always_comb
	
	if (D == 7'd60)
	begin
		reset22 = 1'b1;
	end
	else 
	begin
		reset22 = 1'b0;
	end
endmodule

module centisecond (
	input logic reset, run, clk,
	output logic [7:0] centi,
	output logic reset2);

	logic [7:0] D;
	logic reset1;
	assign reset1 = reset | reset2;
	assign D = centi + 1;
	always_ff @(posedge clk, posedge reset)
		if (reset1) centi <= 8'b0;
		else if (run) centi <= D;   
	always_comb
	
	if (D == 8'd100)
	begin
		reset2 = 1'b1;
	end
	else 
	begin
		reset2 = 1'b0;
	end
endmodule
	
	
	
