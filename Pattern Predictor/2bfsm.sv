module pattern_predictor_2bit ( input logic clk,                   
				input logic reset, rst,
                           	input logic actual_pattern,
				output logic[7:0] x_cnt,
                            	output logic predicted_pattern, z_match,
				output logic[7:0] z_cnt);

  typedef enum logic [1:0]   {Strong_0, Weak_0, Weak_1, Strong_1}    statetype;
  
statetype   state,   nextstate;
  // state register
  always_ff @(posedge clk, posedge reset)
    if (reset) state <= Weak_0;
    else       state <= nextstate;
  // next state logic

  assign z_match = predicted_pattern ~^ actual_pattern;


  always_comb begin
    case (state)
      Strong_0:   if (actual_pattern==1)   nextstate = Weak_0;
              else   nextstate = Strong_0;
      Weak_0:   if (actual_pattern==1)   nextstate = Weak_1;
             else   nextstate = Strong_0;
      Weak_1:   if (actual_pattern==1)   nextstate = Strong_1;
              else   nextstate = Weak_0;
      Strong_1:   if (actual_pattern==1)   nextstate = Strong_1;
              else   nextstate = Weak_1;
       
      default:   nextstate = Weak_0;
    endcase
	 end
  // output logic
  assign predicted_pattern = ((state == Strong_1)||(state == Weak_1));


 always_ff @(negedge clk, posedge rst) begin 
 if(rst == 0) begin
	assign x_cnt = 0;
	assign z_cnt = -1;
  end
  else begin
	assign x_cnt = x_cnt + 1;
	if (z_match) begin
		assign z_cnt = 1 + z_cnt;
	end
  end
  end	
endmodule