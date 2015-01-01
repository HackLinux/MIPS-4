module signExt(input [15:0]in, output [31:0] outS, output [31:0] outZero);
  assign outS[15:0] = in[15:0];
  assign outS[31:16] = in[15];
  assign outZero[15:0] = in[15:0];
  assign outZero[31:16] = 16'h0000;
  
endmodule