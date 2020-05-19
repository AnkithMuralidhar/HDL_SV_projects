//------------------------------------------------
// Top level system including MIPS and memories
//------------------------------------------------

module top(input  logic       clk, reset, 
           output logic [31:0] adr, writedata, 
           output logic       memwrite,
	   output logic [31:0] srca, srcb,
	   output logic [14:0] controls,
	   output logic [31:0] pc,
	   output logic [31:0] instr, aluresult);

  logic [31:0] readdata;
  
  // instantiate processor and memories

  mips mips(clk, reset, adr, writedata, memwrite, readdata, controls, pc, aluresult, instr, srca, srcb);

  imem imem(adr[7:2], readdata);

  dmem dmem(clk, memwrite, dataadr, writedata, readdata);

endmodule
