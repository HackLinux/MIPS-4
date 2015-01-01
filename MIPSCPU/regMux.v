module regMux(input [1:0] rdrt_EX, input [4:0] rtAddr, rdAddr,
		output reg [4:0] writeAddr);
	

	
always@(*) begin
	if(rdrt_EX==2'b00)
	writeAddr <= rdAddr;
	else if (rdrt_EX==2'b01)
	writeAddr <= rtAddr;
	else if (rdrt_EX==2'b10)
	writeAddr <= 5'd31;
	else
	writeAddr <= rdAddr;
end
endmodule