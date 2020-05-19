module CAM(	
		input logic [15:0] data_lookup,
		input logic [1:0] init,
		output logic [2:0] addr,
		output logic valid,
		output logic [2:0] num_match);

	logic [7:0] a;
	logic clk;
	logic [15:0] r0, r1, r2, r3, r4, r5, r6, r7, d0, d1, d2, d3, d4, d5, d6, d7;

	always 
 	begin
 	clk = 1; #5; clk = 0; #5;
 	end

	always_ff@(posedge clk)
	begin
	if(init == 2'b11)
	begin
		r0 = 16'd0;
		r1 = 16'd1;
		r2 = 16'd2;
		r3 = 16'd3;
		r4 = 16'd4;
		r5 = 16'd5;
		r6 = 16'd6;
		r7 = 16'd7;
	

		d0 <= r0;
		d1 <= r1;
		d2 <= r2;
		d3 <= r3;
		d4 <= r4;
		d5 <= r5;
		d6 <= r6;
		d7 <= r7;

	end else begin
		r0 = 16'dx;
		r1 = 16'dx;
		r2 = 16'dx;
		r3 = 16'dx;
		r4 = 16'dx;
		r5 = 16'dx;
		r6 = 16'dx;
		r7 = 16'dx;
		
		d0 <= r0;
		d1 <= r1;
		d2 <= r2;
		d3 <= r3;
		d4 <= r4;
		d5 <= r5;
		d6 <= r6;
		d7 <= r7;
	end
	end

	assign a[0] = d0 == data_lookup;
	assign a[1] = d1 == data_lookup;
	assign a[2] = d2 == data_lookup;
	assign a[3] = d3 == data_lookup;
	assign a[4] = d4 == data_lookup;
	assign a[5] = d5 == data_lookup;
	assign a[6] = d6 == data_lookup;
	assign a[7] = d7 == data_lookup;
	
	always_comb

	begin
	if(init == 3) begin
		num_match = a[0] + a[1] + a[2] + a[3] + a[4] + a[5] + a[6] + a[7];	
	end else begin
		num_match = 3'b0;
	end
	end

	always_comb
	begin
	if (a[7]) begin
		addr = 3'b111;
		valid = 1;
	end else if (a[6]) begin
		addr = 3'b110;
		valid = 1;
	end else if (a[5]) begin
		addr = 3'b101;
		valid = 1;
	end else if (a[4]) begin
		addr = 3'b100;
		valid = 1;
	end else if (a[3]) begin
		addr = 3'b011;
		valid = 1;
	end else if (a[2]) begin
		addr = 3'b010;
		valid = 1;
	end else if (a[1]) begin
		addr = 3'b001;
		valid = 1;
	end else if (a[0]) begin
		addr = 3'b000;
		valid = 1;
	end else begin
		addr = 3'bxxx;
		valid = 0;
	end
	end
	
endmodule
	

		
