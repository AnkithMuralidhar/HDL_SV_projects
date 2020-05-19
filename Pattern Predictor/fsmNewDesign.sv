module fsmNewDesign ( input logic clk,                   
		   input logic reset, rst,
                   input logic actual_pattern,
		   output logic [7:0] x_cnt,
                   output logic predicted_pattern, y_match, z, z_match,
		   output logic [7:0] y_cnt, z_cnt);

	typedef enum logic [2:0]   {S1, S2, S3, S4, S5, S6, S7, S8}    statetype;
	logic [7:0] x_count;
	
pattern_predictor_2bit a (clk, reset, rst, actual_pattern, x_count, z, z_match, z_cnt);
statetype   state,   nextstate;
  // state register
  always_ff @(posedge clk, posedge reset)
    if (reset) state <= S3;
    else       state <= nextstate;
  // next state logic

 // always_ff@(negedge clk)
 // 	a <= predicted_pattern;

  assign y_match = predicted_pattern ~^ actual_pattern;


  always_comb begin

    case (state)
      S1:   if (actual_pattern==0)   nextstate = S5;
              else   nextstate = S2;
      S5:   if (actual_pattern==0)   nextstate = S6;
             else   nextstate = S2;
      S6:   if (actual_pattern==0)   nextstate = S7;
              else   nextstate = S7;
      S7:   if (actual_pattern==1)   nextstate = S2;
              else   nextstate = S1;
      S2:   if (actual_pattern==0)   nextstate = S8;
              else   nextstate = S4;
      S4:   if (actual_pattern==1)   nextstate = S8;
              else   nextstate = S1;
      S8:   if (actual_pattern==0)   nextstate = S1;
              else   nextstate = S3;
      S3:   if (actual_pattern==1)   nextstate = S2;
              else   nextstate = S1;
      
       
      default:   nextstate = S3;
    endcase
end
   // output logic
  assign predicted_pattern = ((state == S2)||(state == S4)||(state == S7)||(state == S8));


 always_ff @(negedge clk, posedge rst) begin 
 if(rst == 0) begin
	assign x_cnt = 0;
	assign y_cnt = -1;
  end
  else begin
	assign x_cnt = x_cnt + 1;
	if (y_match) begin
		assign y_cnt = 1 + y_cnt;
	end
  end
  end	
endmodule

 


