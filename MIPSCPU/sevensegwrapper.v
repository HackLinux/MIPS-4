module sevensegwrapper(input [31:0]register30,
		output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);


	sevenseg hex0(register30[3:0], HEX0);
	sevenseg hex1(register30[7:4], HEX1);
	sevenseg hex2(register30[11:8], HEX2);
	sevenseg hex3(register30[15:12], HEX3);
	sevenseg hex4(register30[19:16], HEX4);
	sevenseg hex5(register30[23:20], HEX5);
	sevenseg hex6(register30[27:24], HEX6);
	sevenseg hex7(register30[31:28], HEX7);
endmodule