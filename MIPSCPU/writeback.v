module writeback(	input [2:0] regsel,
		input [9:0] jaddr,
		input [31:0] aluhi, lo, alulo, memdata,
		output reg [31:0] wbdata);
				
		always @(*) begin
			if(regsel==3'b000) begin
			wbdata <= alulo;
			end else if(regsel==3'b001) begin
			wbdata <= aluhi;
			end else if(regsel==3'b010) begin
			wbdata <= lo;
			end else if(regsel==3'b011) begin
			wbdata <= memdata;
			end else if (regsel==3'b111)begin
			wbdata <= {22'b0,jaddr};
			end else
			wbdata <= 32'd0;
			end

endmodule