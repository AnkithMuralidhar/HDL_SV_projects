module testbench();
	logic clk, reset, actual_pattern, predicted_patter, y_match, z, z_match, rst;
	logic [7:0] x_cnt, y_cnt, z_cnt;
	
	fsmNewDesign a (clk, reset, rst, actual_pattern, x_cnt, predicted_patter, y_match, z, z_match, y_cnt, z_cnt);
	
	always
		begin
			clk = 1; #5; clk = 0; #5;
		end

	initial begin
		
		
		rst = 0; reset = 0; actual_pattern = 0; #10; 
		rst = 1;
		reset = 0; actual_pattern = 0; #10;
		actual_pattern = 0; #20;
		actual_pattern = 1; #80;
		actual_pattern = 0; #40;
		actual_pattern = 1; #40;
		actual_pattern = 0; #80;
		actual_pattern = 1; #40;
		actual_pattern = 0; #40;
		end
endmodule
		