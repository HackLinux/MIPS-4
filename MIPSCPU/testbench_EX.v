module testbench_EX();
reg clk_tb;
reg rst_tb;
wire [31:0] reg30out;

initial begin rst_tb=1; #1; rst_tb=0; end
always begin clk_tb=0; #1; clk_tb=1; #1; end

cpu cpu_dut(.clk(clk_tb), .rst(rst_tb), .reg30_in(32'd256),  .reg30_out(reg30out));
	
endmodule	