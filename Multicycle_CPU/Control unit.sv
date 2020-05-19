module mips(input logic clk, reset,
            output logic [31:0] adr, writedata,
 	    output logic memwrite,
 	    input logic [31:0] readdata,
	    output logic [14:0] controls,
	    output logic [31:0] pc, aluresult, instr, srca, srcb);
 	    logic zero, pcen, irwrite, regwrite, alusrca, iord, memtoreg, regdst;
 	    logic [1:0] alusrcb, pcsrc;
            logic [2:0] alucontrol;
 	    logic [5:0] op, funct;
            controller c(clk, reset, op, funct, zero, pcen, memwrite, irwrite, regwrite, alusrca, iord, memtoreg, regdst, alusrcb, pcsrc, alucontrol, controls);
 	    datapath dp(clk, reset, pcen, irwrite, regwrite, alusrca, iord, memtoreg, regdst, alusrcb, pcsrc, alucontrol, op, funct, zero, adr, writedata, pc, aluresult, instr, srca, srcb, readdata);
endmodule 
module controller(input logic clk, reset,
 		input logic [5:0] op, funct,
 		input logic zero,
 		output logic pcen, memwrite, irwrite, regwrite,
 		output logic alusrca, iord, memtoreg, regdst,
 		output logic [1:0] alusrcb, pcsrc,
 		output logic [2:0] alucontrol,
		output logic [14:0] controls);
 		
		logic [1:0] aluop;
 		logic branch, pcwrite;
		logic zero1, sh;
 // Main Decoder and ALU Decoder subunits.
 		maindec md(clk, reset, op,
 			pcwrite, memwrite, irwrite, regwrite,
 			alusrca, branch, iord, memtoreg, regdst,
 			alusrcb, pcsrc, aluop, controls);

 			aludec ad(funct, aluop, alucontrol);
 			assign pcen = pcwrite | (branch & zero1);
			assign sh = op == 6'b000101;
			assign zero1 = sh ? ~ zero : zero;
 // Add combinational logic (i.e. an assign statement)
 // to produce the PCEn signal (pcen) from the branch,
 // zero, and pcwrite signals
endmodule 
module maindec(input logic clk, reset,
 input logic [5:0] op,
 output logic pcwrite, memwrite, irwrite, regwrite,
 output logic alusrca, branch, iord, memtoreg, regdst,
 output logic [1:0] alusrcb, pcsrc,
 output logic [1:0] aluop,
 output logic [14:0] controls);
 parameter FETCH = 4'b0000; // State 0
 parameter DECODE = 4'b0001; // State 1
 parameter MEMADR = 4'b0010; // State 2
 parameter MEMRD = 4'b0011; // State 3
 parameter MEMWB = 4'b0100; // State 4
 parameter MEMWR = 4'b0101; // State 5
 parameter RTYPEEX = 4'b0110; // State 6
 parameter RTYPEWB = 4'b0111; // State 7
 parameter BEQEX = 4'b1000; // State 8
 parameter ADDIEX = 4'b1001; // State 9
 parameter ADDIWB = 4'b1010; // state 10
 parameter JEX = 4'b1011; // State 11
 parameter LW = 6'b100011; // Opcode for lw
 parameter SW = 6'b101011; // Opcode for sw
 parameter RTYPE = 6'b000000; // Opcode for R-type
 parameter BEQ = 6'b000100; // Opcode for beq
 parameter ADDI = 6'b001000; // Opcode for addi
 parameter J = 6'b000010; // Opcode for j
 parameter ORIEX = 4'b1100;// State 12
 parameter BNE = 6'b000101;// Opcode for BNE
 parameter ORI = 6'b001101;// Opcode for ORI
 logic [3:0] state, nextstate;


// state register
 always_ff @(posedge clk or posedge reset)
 if(reset) state <= FETCH;
 else state <= nextstate;

 // ADD CODE HERE
 // Finish entering the next state logic below. The first
 // two states, FETCH and DECODE, have been completed for you.

 // next state logic
 always_comb
 case(state)
 FETCH: nextstate = DECODE;
 DECODE: case(op)
 LW: nextstate = MEMADR;
 SW: nextstate = MEMADR;
 RTYPE: nextstate = RTYPEEX;
 BEQ: nextstate = BEQEX;
 BNE: nextstate = BEQEX;
 ADDI: nextstate = ADDIEX;
 J: nextstate = JEX;
 ORI: nextstate = ORIEX;
 default: nextstate = 4'bx; // should never happen
 endcase 
 // Add code here
 MEMADR: case(op)
	 LW: nextstate = MEMRD;
	 SW: nextstate = MEMWR;
	 default: nextstate = 4'bx;
endcase
 MEMRD: nextstate = MEMWB;
 MEMWB: nextstate = FETCH;
 MEMWR: nextstate = FETCH;
 RTYPEEX: nextstate = RTYPEWB;
 RTYPEWB: nextstate = FETCH;
 BEQEX: nextstate = FETCH;
 ADDIEX: nextstate = ADDIWB;
 ADDIWB: nextstate = FETCH;
 JEX: nextstate = FETCH;
 ORIEX: nextstate = ADDIWB;
 default: nextstate = 4'bx; // should never happen
 endcase
 // output logic
 assign {pcwrite, memwrite, irwrite, regwrite,
 alusrca, branch, iord, memtoreg, regdst,
 alusrcb, pcsrc, aluop} = controls;
 
 always_comb
 case(state)
 FETCH: controls = 15'h5010;
 DECODE: controls = 15'h0030;
 MEMADR: controls = 15'h14a4;
 MEMRD: controls = 15'h05A4;
 MEMWB: controls = 15'h0ca4;
 MEMWR: controls = 15'h25a4;
 RTYPEEX: controls = 15'h1446; 
 RTYPEWB: controls = 15'h1c46; 
 BEQEX: controls = 15'h0605;
 ADDIEX: controls = 15'h1424;
 ADDIWB: controls = 15'h1c24;
 JEX: controls = 15'h4038;
 ORIEX: controls = 15'h0427;
 
 // your code goes here
 default: controls = 15'hxxxx; // should never happen
 endcase
endmodule
module aludec(input logic [5:0] funct,
 input logic [1:0] aluop,
 output logic [2:0] alucontrol);
// output logic Muxsh);
 // ADD CODE HERE
 // Complete the design for the ALU Decoder.
 // Your design goes here. Remember that this is a combinational
 // module.
 // Remember that you may also reuse any code from previous labs.
 // assign Muxsh = funct == 6'b101011;
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