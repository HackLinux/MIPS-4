module cpu(input clk, rst,
		input [31:0] reg30_in,
		output [31:0] reg30_out);

//MIPS CPU with F E W.
	wire [31:0] instructions_CPU, regAddr, data2;
	wire [9:0] pc_FETCH, jaddr;
	
	
	wire [4:0] regdest_WB;
	
	
	wire [2:0] regsel;
	wire [1:0] pc_src_EX;
	
	wire [31:0] aluhi, alulo, memdata, wbdata;
	wire regwrite_WB, stall_EX;
	reg write_we;

	wire[9:0]branch_addr_EX, jtype_addr_EX, reg_addr_EX;

	
wire[31:0] lo;


		
	simpleFetch fetch_cpu(	.clk(clk), .rst(rst), .stall_EX(stall_EX), .jtype_addr_EX(jtype_addr_EX), .branch_addr_EX(branch_addr_EX), .reg_addr_EX(reg_addr_EX),
			.pc_src_EX(pc_src_EX),
			.instructions(instructions_CPU),
			.pc_FETCH(pc_FETCH));


	execute execute_cpu( .clk(clk),.rst(rst), .rtAddr(instructions_CPU[20:16]), .pc_FETCH(pc_FETCH), .instructions(instructions_CPU), .regAddr(regAddr), .readdata2(data2), .regwrite_WB(regwrite_WB),
			.stall_EX(stall_EX),
			.regsel(regsel),
			.pc_src_EX(pc_src_EX),
			.regdest_WB(regdest_WB),
			.jaddr(jaddr),
			.jtype_addr_EX(jtype_addr_EX), .branch_addr_EX(branch_addr_EX), .reg_addr_EX(reg_addr_EX),
			.aluhi(aluhi), .lo(lo), .alulo(alulo), .memdata(memdata));

			
				regfile32x32 regfile32x32_cpu(	.clk(clk), .we(regwrite_WB), .rst(rst), .readaddr1(instructions_CPU[25:21]), .readaddr2(instructions_CPU[20:16]), .writeaddr(regdest_WB),
			.writedata(wbdata), .reg30_in(reg30_in),
			.readdata1(regAddr), .readdata2(data2), .reg30_out(reg30_out));
			
	writeback writeback_cpu(	.regsel(regsel),
			.aluhi(aluhi), .lo(lo), .alulo(alulo), .memdata(memdata), .jaddr(jaddr),
			.wbdata(wbdata));
endmodule