/*Decoder Module to take 4 bit data and convert 
to an active low representation on 7 segment display*/

module sevenseg(input      [3:0] data, 
                output reg [6:0] segments);	
  always @(*)
    case (data)
      //                abc_defg     
      0: segments = 7'b100_0000;
      1: segments = 7'b111_1001;
      2: segments = 7'b010_0100;
      3: segments = 7'b011_0000;
      4: segments = 7'b001_1001;
      5: segments = 7'b001_0010;
      6: segments = 7'b000_0011;
      7: segments = 7'b111_1000;
      8: segments = 7'b000_0000;
      9: segments = 7'b001_1000;
		10: segments = 7'b000_1000;
		11: segments = 7'b000_0011;
		12: segments = 7'b100_0110;
		13: segments = 7'b010_0001;
		14: segments = 7'b000_0110;
		15: segments = 7'b000_1110;
      default: segments = 7'b111_1111; // required
    endcase
endmodule