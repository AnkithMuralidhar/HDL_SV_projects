// Example testbench for MIPS processor

module testbench();
		logic       clk, reset;
		logic [14:0] controls;
	   	logic [31:0] pc;
	   	logic [31:0] instr, aluresult; 
           	logic [31:0] addr, writedata; 
           	logic       memwrite;
	   	logic [31:0] srca, srcb;
	   	


  // instantiate device to be tested
  top dut(clk, reset, addr, writedata, memwrite, srca, srcb, controls, pc, instr, aluresult);
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  // check that 7 gets written to address 84
  //always@(negedge clk)
//    begin
//      if(memwrite) begin
//        if(addr === 84 & writedata === 7) begin
//          $display("Simulation succeeded");
//          $stop;
//        end else if (addr !== 80) begin
//          $display("Simulation failed");
//          $stop;
//        end
//      end
//    end
endmodule



