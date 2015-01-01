module datamemory(input clk, we, input [9:0] addr, input [31:0] datain,
		output reg [31:0] dataout);
	

	reg [31:0] mem[1023:0];	
	
	initial begin  //initiallizing memory with values
mem[31'd0] <= 31'd1;
mem[31'd1] <= 31'd2;
mem[31'd2] <= 31'd3;
mem[31'd3] <= 31'd4;
mem[31'd4] <= 31'd5;
mem[31'd5] <= 31'd6;
mem[31'd6] <= 31'd7;
mem[31'd7] <= 31'd12;  //adds up to 32. Nice and even for dividing by 8
end

	always @(negedge clk) begin
		if(we) begin
		dataout <= 32'd0;
		mem[addr] <= datain;			
		end else begin
		dataout <= mem[addr];
		end
	end
endmodule