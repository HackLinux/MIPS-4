module de2Wrapper(input CLOCK_27,input [3:0] KEY,input [17:0] SW,
output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);


	wire clk, rst;
	wire [31:0] segoutput, switches;

	assign clk = CLOCK_27;
	assign rst = ~KEY[0];
	assign switches = SW[17:0];


	cpu cpu_de2(clk,rst,switches,segoutput);
	
	sevensegwrapper sevensegwrapper_de2(segoutput,HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	
endmodule