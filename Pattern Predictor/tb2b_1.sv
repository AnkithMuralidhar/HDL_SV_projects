module tb2b_1();logic clk, reset, actual_pattern, predicted_patter, z_match, rst;
	logic [7:0] x_cnt, z_cnt;
	
	pattern_predictor_2bit a (clk, reset, rst, actual_pattern, x_cnt, predicted_patter, z_match, z_cnt);
	
	always
		begin
			clk = 1; #5; clk = 0; #5;
		end

	initial begin
		
		
		rst = 0; reset = 0; actual_pattern = 0; #10; 
	
		rst = 1; 
		actual_pattern = 0; #35;
		actual_pattern = 1; #40;
		actual_pattern = 0; #40;
		actual_pattern = 1; #40;
		actual_pattern = 0; #40;
		actual_pattern = 1; #40;
		actual_pattern = 0; #40;
		actual_pattern = 1; #40;
		actual_pattern = 0; #40;
		actual_pattern = 1; #40;
		actual_pattern = 0; #200;
		actual_pattern = 1; #200;
		actual_pattern = 0; #40;
		actual_pattern = 1; #160;
		actual_pattern = 0; #80;
		actual_pattern = 1; #120;
		actual_pattern = 0; #120;
		actual_pattern = 1; #80;
		actual_pattern = 0; #160;
		actual_pattern = 1; #40;
		actual_pattern = 0; #40;
		actual_pattern = 1; #120;
		actual_pattern = 0; #40;
		actual_pattern = 1; #40;
		actual_pattern = 0; #120;
		actual_pattern = 1; #40;
		actual_pattern = 0; #80;
		actual_pattern = 1; #40;
		actual_pattern = 0; #80;
		actual_pattern = 1; #80;
		actual_pattern = 0; #40;
		actual_pattern = 1; #80;
		end
endmodule
		

