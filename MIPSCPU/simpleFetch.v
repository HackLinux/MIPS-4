module simpleFetch(	input clk, stall_EX, rst,
		input [9:0] branch_addr_EX, jtype_addr_EX, reg_addr_EX,
		input [1:0] pc_src_EX,
		output reg [31:0] instructions,	output reg [9:0] pc_FETCH);



	reg [9:0] pc_out;
	reg [31:0] mem[1023:0];


	initial begin
		pc_FETCH <= 10'b0;
		$readmemh("sqrt",mem); 
	end
	
	always @(posedge clk) begin
		if(rst) begin
			pc_FETCH <= 10'b0;
		end else begin
			pc_FETCH <= pc_out;
		end 
		if((rst | stall_EX) || pc_FETCH==32'b0) begin
			instructions <= 32'b0; 
		end else begin
			instructions <= mem[pc_FETCH-1]; 
		end
	end
	
	//Fetch Mux
	always @(*) begin
		casez(pc_src_EX)
			2'd0: pc_out <= pc_FETCH+1;			
			2'd1: pc_out <= branch_addr_EX;	
			2'd2: pc_out <= jtype_addr_EX+1;	
			2'd3: pc_out <= reg_addr_EX+1;	
			default: pc_out <= pc_FETCH+1;
		endcase
	end
	
endmodule