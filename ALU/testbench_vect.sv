module tblab3int();  
 logic clk, reset;  
 logic [2:0]  f;
 logic [31:0] a, b;           
 
 logic [31:0] y,yexpected;
 logic zeroexpected,zero, OF, OFexpected;
 logic [3:0]f_dummy, zero_dummy, OF_dummy;
  
 logic [31:0] vectornum, errors;    
 logic [107:0] testvectors[1000:0]; 

 lab3_integrated l1(a, b, f, y, OF, zero);      
    
 always         
 begin       
 clk = 1; #5; 
 clk = 0; #5;   
 end 
  
initial    
	begin      
		$readmemh("testlab3.tv", testvectors);      
		vectornum = 0; errors = 0;       
		reset = 1; 
		#27;
		reset = 0;     
	end 
  
 always @(posedge clk)     
	begin       
		#1; {f_dummy,a, b, yexpected, zero_dummy, OF_dummy} = testvectors[vectornum];   
			f =f_dummy[2:0];
			zeroexpected = zero_dummy[0];
			OFexpected = OF_dummy[0];
	end 
	
 always @(negedge clk)    
	if (~reset) begin       
		if (y !== yexpected) begin           
	$display("Error: inputs = %h", {f, a, b});         
	$display("  outputs = %h (%h expected),%h (%h expected)",y,yexpected, zero, zeroexpected);         
	errors = errors + 1;       
	end
	      
    vectornum = vectornum + 1;     
	if (testvectors[vectornum] === 108'bx)
	begin            
		$display("%d tests completed with %d errors", vectornum, errors);        
		//$finish;       
	end     
end 
	endmodule 


