module aluMux(input [1:0] aluSrcEx,
		input [15:0] imm,
		input [31:0] regdata2,
		output reg [31:0] alu_data_2);
		

	wire [31:0] outS, outZero;
	wire [31:0] zero = 32'b0;	


	signExt signExt_aluMux(.in(imm), .outS(outS), .outZero(outZero));

	always @(*) begin
		casez(aluSrcEx)
			2'b00: alu_data_2 <= regdata2;	
			2'b01: alu_data_2 <= outS;	
			2'b10: alu_data_2 <= outZero;	
			2'b11: alu_data_2 <= zero;
			default: alu_data_2 <= regdata2;	
		endcase
		
	end
endmodule