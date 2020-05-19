//Multi-cycle processor MIPS datapath unit

module datapath(input  logic 	     clk, reset,
 	        input  logic 	     pcen, irwrite, regwrite,
		input  logic 	     alusrca, iord, memtoreg, regdst,
		input  logic  [1:0]  alusrcb, pcsrc,
		input  logic  [2:0]  alucontrol,
		output logic  [5:0]  op, funct,
		output logic         zero,
		output logic  [31:0] adr, writedata, pc, aluresult, instr, srca, srcb,
		input  logic  [31:0] readdata);
					 
		// Below are the internal signals of the datapath module.
		logic [4:0]  writereg;
		logic [31:0] pcnext, pcjump;
		logic [31:0] data;
   	    	logic [31:0] a;
		logic [31:0] aluout;
		logic [31:0] signimm, signimm1, signimmsh;   // the sign-extended immediate & the sign-extended immediate shifted left by 2
		logic [31:0] wd3, rd1, rd2;
		logic [5:0] ansh;

		// op and funct fields to controller
		assign op = instr[31:26];
		assign funct = instr[5:0];
		assign pcjump = {pc[31:28], instr[25:0], 2'b00};
		assign ansh = op == 6'b001101; //Ori//
		assign signimm1 = ansh ? {16'b0000000000000000, instr[15:0]} : signimm;
		
		//next PC logic
		flopenr #(32) pcreg(clk, reset, pcen, pcnext, pc);
		mux2 #(32) adrmux(pc, aluout, iord, adr);
		mux3 #(32) pcmux(aluresult, aluout, pcjump, pcsrc, pcnext);
		signext se(instr[15:0], signimm);
		sl2 signsh(signimm, signimmsh);
		
		//register file logic
		flopenr #(32) instrreg(clk, reset, irwrite, readdata, instr);
		flopr #(32) datareg(clk, reset, readdata, data);		
		mux2 #(5) regdstmux(instr[20:16], instr[15:11], regdst, writereg);
		mux2 #(32) wdmux(aluout, data, memtoreg, wd3);
		regfile rf(clk, regwrite, instr[25:21], instr[20:16], writereg, wd3, rd1, rd2);		
		flopr #(32) areg(clk, reset, rd1, a);
		flopr #(32) breg(clk, reset, rd2, writedata);
		flopr #(32) creg(clk, reset, aluresult, aluout);
		
		//ALU logic
		mux2 #(32) srcamux(pc, a, alusrca, srca);
		mux4 #(32) srcbmux(writedata, 32'b100, signimm1, signimmsh, alusrcb, srcb);
		alu alu(.A(srca), .B(srcb), .F(alucontrol), .Y(aluresult), .zero(zero));
		flopr #(32) alureg(clk, reset, aluresult, aluout);
		

endmodule

