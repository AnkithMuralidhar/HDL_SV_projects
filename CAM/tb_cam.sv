module tb_cam();

	logic [15:0] data_lookup;
	logic [1:0] init;
	logic [2:0] addr;
	logic valid;
	logic [2:0] num_match;
	
	CAM c(data_lookup, init, addr, valid, num_match);

	initial 
	begin
	data_lookup = 16'd0; init = 3; #10;
	data_lookup = 16'd1; init = 3; #10;
	data_lookup = 16'd2; init = 3; #10;
	data_lookup = 16'd2; init = 2; #10;
	data_lookup = 16'd9; init = 3; #10;
	data_lookup = 16'd3; init = 3; #10;
	data_lookup = 16'd4; init = 3; #10;
	data_lookup = 16'd5; init = 3; #10;
	data_lookup = 16'd0; init = 3; #10;
	data_lookup = 16'd7; init = 3; #10;
	
	end
endmodule



