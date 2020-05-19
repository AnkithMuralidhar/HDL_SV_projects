module controller_tb();
	logic clk, reset;
 	logic [5:0] op, funct;
 	logic zero;
 	logic pcen, memwrite, irwrite, regwrite;
 	logic alusrca, iord, memtoreg, regdst;
 	logic [1:0] alusrcb, pcsrc;
 	logic [2:0] alucontrol;
	
	controller c (clk, reset, op, funct, zero, pcen, memwrite, irwrite, regwrite, alusrca, iord, memtoreg, regdst, alusrcb, pcsrc, alucontrol);

	always begin
	clk = 1; #5; clk=0; #5;
	end
	
	initial begin
	reset = 1;#10;
	reset = 0;
	op = 0; funct = 6'h20; #40;
	op = 0; funct = 6'h22; #40;
	op = 6'h04; zero = 1; #30; 
	op = 0; funct = 6'h24; #40;
	op = 0; funct = 6'h25; #40;
	op = 0; funct = 6'h2a; #40;
	op = 6'h08; #40;
	op = 6'h23; #50;
	op = 6'h2b; #40;
	op = 0; funct = 6'h22; #40;
	op = 6'h04; zero = 0; #30; 
	op = 6'h04; zero = 1; #30; 
	op = 6'h02; #30;
	end
endmodule
