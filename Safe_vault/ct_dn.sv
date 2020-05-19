module ct_dn(
		input logic reset, d,
		output logic q);
	
	logic clk; 
	always begin
		clk = 1; #5; 
		clk = 0; #5;
	end

	always_ff @ (posedge clk, posedge reset)
	if (reset)
		q<=1'b0;
	else if (d)
		q<=d;
endmodule
	
