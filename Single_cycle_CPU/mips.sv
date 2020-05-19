// files needed for simulation:
//  mipsttest.sv   mipstop.sv, mipsmem.sv,  mips.sv,  mipsparts.sv

// single-cycle MIPS processor
module mips(input  logic        clk, reset,
            output logic [31:0] pc,
            input  logic [31:0] instr,
            output logic        memwrite,
            output logic [31:0] aluout, writedata,
            input  logic [31:0] readdata,
	    output logic [31:0] srca);

  logic        memtoreg, branch,
               pcsrc, zero,
               alusrc, regdst, regwrite, jump;
  logic [2:0]  alucontrol;
  

  controller c(instr[31:26], instr[5:0], zero,
               memtoreg, memwrite, pcsrc,
               alusrc, regdst, regwrite, jump,
               alucontrol, ansh, ruu, Muxsh);
  datapath dp(Muxsh, ruu, ansh, clk, reset, memtoreg, pcsrc,
              alusrc, regdst, regwrite, jump,
              alucontrol,
              zero, pc, instr,
              aluout, writedata, readdata, srca);
endmodule

module controller(input  logic [5:0] op, funct,
                  input  logic       zero,
                  output logic       memtoreg, memwrite,
                  output logic       pcsrc, alusrc,
                  output logic       regdst, regwrite,
                  output logic       jump,
                  output logic [2:0] alucontrol,
		  output logic ansh , ruu, Muxsh);

  logic [1:0] aluop;
  logic       branch;
  logic zero1, an, sh;

  maindec md(op, memtoreg, memwrite, branch,
             alusrc, regdst, regwrite, jump,
             aluop);
  aludec  ad(funct, aluop, alucontrol, Muxsh);

  assign pcsrc = branch & zero1; // bne //
  assign zero1 = sh ? ~ zero : zero; //bne//
 // assign sh = ~op[5]&~op[4]&~op[3]&op[2]&~op[1]&op[0]; //bne//
  assign sh = op == 6'b000101; // bne //
  //assign ruu = op == 6'b001111;
  assign ruu = ~op[5]&~op[4]&op[3]&op[2]&op[1]&op[0]; //Lui//
  //assign ansh = ~op[5]&~op[4]&op[3]&op[2]&~op[1]&op[0];  // ORI//
  assign ansh = op == 6'b001101; //Ori//
endmodule

module maindec(input  logic [5:0] op,
               output logic       memtoreg, memwrite,
               output logic       branch, alusrc,
               output logic       regdst, regwrite,
               output logic       jump,
               output logic [1:0] aluop);
 
  logic [8:0] controls;

  assign {regwrite, regdst, alusrc,
          branch, memwrite,
          memtoreg, jump, aluop} = controls;

  always_comb
    case(op)
      6'b000000: controls = 9'b110000010; //Rtype
      6'b100011: controls = 9'b101001000; //LW
      6'b101011: controls = 9'b001010000; //SW
      6'b000100: controls = 9'b000100001; //BEQ
      6'b001000: controls = 9'b101000000; //ADDI
      6'b000010: controls = 9'b000000100; //J
      6'b001101: controls = 9'b101000011; //ori//
      6'b000101: controls = 9'b000100001; //bne//
      6'b001111: controls = 9'b101000000; //lui
      default:   controls = 9'bxxxxxxxxx; //???
    endcase
endmodule

module aludec(input  logic [5:0] funct,
              input  logic [1:0] aluop,
              output logic [2:0] alucontrol,
	      output logic Muxsh);

  assign Muxsh = funct == 6'b101011;
  always_comb
    case(aluop)
      2'b00: alucontrol = 3'b010;  // add
      2'b01: alucontrol = 3'b110;  // sub
      2'b11: alucontrol = 3'b001;  //ori//
      default: case(funct)          // RTYPE
          6'b100000: alucontrol = 3'b010; // ADD
          6'b100010: alucontrol = 3'b110; // SUB
          6'b100100: alucontrol = 3'b000; // AND
          6'b100101: alucontrol = 3'b001; // OR
          6'b101010: alucontrol = 3'b111; // SLT
	  6'b101011: alucontrol = 3'b111; //sltu
	  6'b100110: alucontrol = 3'b011; // XOR//
	  6'b000000: alucontrol = 3'b010; //sll//
          default:   alucontrol = 3'bxxx; // ???
        endcase
    endcase
endmodule

module datapath(input  logic        Muxsh, ruu, ansh, clk, reset,
                input  logic        memtoreg, pcsrc,
                input  logic        alusrc, regdst,
                input  logic        regwrite, jump,
                input  logic [2:0]  alucontrol,
                output logic        zero,
                output logic [31:0] pc,
                input  logic [31:0] instr,
                output logic [31:0] aluout1, writedata,
                input  logic [31:0] readdata,
		output logic [31:0] srca);

  logic [4:0]  writereg;
  logic [31:0] pcnext, pcnextbr, pcplus4, pcbranch;
  logic [31:0] signimm, signimmsh;
  logic [31:0] srcb;
  logic [31:0] result, signimm1, signimm11, writedata1;
  logic [4:0] sh;
  logic [31:0] aluout, aluout2, b;
  logic bun;
  logic [5:0] op, fun;
  // next PC logic
  flopr #(32) pcreg(clk, reset, pcnext, pc);
  adder       pcadd1(pc, 32'b100, pcplus4);
  sl2         immsh(signimm1, signimmsh);
  adder       pcadd2(pcplus4, signimmsh, pcbranch);
  mux2 #(32)  pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
  mux2 #(32)  pcmux(pcnextbr, {pcplus4[31:28], instr[25:0], 2'b00}, 
                    jump, pcnext);

  // register file logic
  regfile     rf(clk, regwrite, instr[25:21],
                 instr[20:16], writereg,
                 result, srca, writedata);
  mux2 #(5)   wrmux(instr[20:16], instr[15:11], regdst, writereg);
  mux2 #(32)  resmux(aluout1, readdata, memtoreg, result);
  signext     se(instr[15:0], signimm);

  // ALU logic
  assign op = instr[31:25];
  assign fun = instr[5:0];
  assign bun = ((op == 6'b000000) & (fun == 6'b000000));
  assign sh = instr[10:6];
  assign aluout2 = aluout << sh;
  //assign b = 0;
  //assign aluout1 = { aluout[31-sh:0], b[sh-1:0]};
  assign aluout1 = bun ? aluout2 : aluout;
  assign signimm11= {signimm1[15:0], 16'b0000000000000000};
  assign writedata1 = ruu ? signimm11 : signimm1;
  assign signimm1 = ansh ? {16'b0000000000000000, instr[15:0]} : signimm;
  mux2 #(32)  srcbmux(writedata, writedata1, alusrc, srcb);
  alu         alu1(.A(srca), .B(srcb), .F(alucontrol), .Y(aluout), .zero(zero), .muxsh(Muxsh));
endmodule



