/*This is the register file for the Execution stage.  The changes I made were to register 30.
We can now use register 30 and get values from the MIPS program*/

module regfile32x32 (input clk, we, rst,
		input [4:0] readaddr1, readaddr2, writeaddr,
		input [31:0] writedata, reg30_in,
		output reg [31:0] readdata1, readdata2, reg30_out);


	reg [31:0] mem[31:0];
	

	initial begin
		mem[31'd29] <= 31'h7fffeffc; //sp
		mem[31'd30] <= reg30_in;
	end
	

	always @(*) begin
		if (readaddr1 == 5'd0)
			readdata1 <= 32'd0;
		else if ((readaddr1 == 32'd30))
			readdata1 <= reg30_in;
		else if ((readaddr1 == writeaddr) && we)  //reads current write
			readdata1 <= writedata;
		else
			readdata1<= mem[readaddr1][31:0];
	end

	always @(*) begin
		if (readaddr2 == 5'd0)
			readdata2 = 32'd0;
		else if ((readaddr2 == 32'd30))
		   readdata2 = reg30_in;
		else if ((readaddr2 == writeaddr) && we)
			readdata2 = writedata;
		else
			readdata2 = mem[readaddr2][31:0];
	end
	
	always @(posedge clk) begin
		 if(we && writeaddr==5'd30) begin
			reg30_out <= writedata;
		end else if(we && writeaddr!==5'd0) begin
			mem[writeaddr] <= writedata;
		end
	end
	
	
endmodule