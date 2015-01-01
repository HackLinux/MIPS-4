module control_unit(	input [4:0] shamt,
		input [5:0] function_code, immOpp,
		output reg enhilo_EX, regwrite_EX, memwrite_EX, stall,
		output reg [1:0] alu_src, rdrt_EX, pc_src,
		output reg [2:0] regsel,
		output reg [3:0] alu_op,
		output reg [4:0] alu_shamt);


wire [6:0] test = (immOpp == 6'b0) ? {1'b0,function_code}:
							{1'b1,immOpp}; //determines type of instruction


	always @(*) begin
		casez(test)
			7'b010000?: begin // add or addu
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'b00;			
				alu_op <= 4'b0100;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b010001?: begin // sub or subu
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'b00;			
				alu_op <= 4'b0101;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b0011000: begin // mult
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'bx;			
				alu_op <= 4'b0110;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b1;		
				regsel <= 3'bx;		
				regwrite_EX <= 1'b0;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b0011001: begin // multu
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'bx;			
				alu_op <= 4'b0111;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b1;		
				regsel <= 3'bx;		
				regwrite_EX <= 1'b0;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b0100100: begin // and
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'b00;			
				alu_op <= 4'b0000;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b0100101: begin // or
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'b00;			
				alu_op <= 4'b0001;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b0100111: begin // nor
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'b00;			
				alu_op <= 4'b0010;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b0100110: begin // xor
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'b00;			
				alu_op <= 4'b0011;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b0000000: begin // sll or nop
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'b00;			
				alu_op <= 4'b1000;	
				alu_shamt <= shamt;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b0000010: begin // srl
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'b00;			
				alu_op <= 4'b1001;	
				alu_shamt <= shamt;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b0000011: begin // sra
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'b00;			
				alu_op <= 4'b101x;	
				alu_shamt <= shamt;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b0101010: begin // slt
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'b00;			
				alu_op <= 4'b1100;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b0101011: begin // sltu
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'b00;			
				alu_op <= 4'b11xx;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b0010000: begin // mfhi
				memwrite_EX <= 1'b0;		
				alu_src <= 2'bx;		
				rdrt_EX <= 2'b00;			
				alu_op <= 4'bx;		
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b001;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b0010010: begin // mflo
				memwrite_EX <= 1'b0;		
				alu_src <= 2'bx;		
				rdrt_EX <= 2'b00;			
				alu_op <= 4'bx;		
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b010;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end

			7'b1001000: begin // addi
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b01;		
				rdrt_EX <= 2'b01;			
				alu_op <= 4'b0100;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b1001001: begin // addiu
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b10;		
				rdrt_EX <= 2'b01;			
				alu_op <= 4'b0100;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b1001100: begin // andi
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b10;		
				rdrt_EX <= 2'b01;			
				alu_op <= 4'b0000;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b1001101: begin // ori
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b10;		
				rdrt_EX <= 2'b01;			
				alu_op <= 4'b0001;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b1001110: begin // xori
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b10;		
				rdrt_EX <= 2'b01;			
				alu_op <= 4'b0011;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b1001010: begin // slti
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b01;		
				rdrt_EX <= 2'b01;			
				alu_op <= 4'b1100;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b1100011: begin // lw
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b01;		
				rdrt_EX <= 2'b01;			
				alu_op <= 4'b0100;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b011;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b1101011: begin // sw
				memwrite_EX <= 1'b1;		
				alu_src <= 2'b01;		
				rdrt_EX <= 2'b01;			
				alu_op <= 4'b0100;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'bx;		
				regwrite_EX <= 1'b0;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
			7'b1001111: begin // lui
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b10;		
				rdrt_EX <= 2'b01;			
				alu_op <= 4'b1000;	
				alu_shamt <= 5'd16;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b000;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end 
			7'b1000100: begin // beq
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'bx;			
				alu_op <= 4'b0101;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'bx;		
				regwrite_EX <= 1'b0;		
				stall <= 1'b1;			
				pc_src <= 2'b01;		
			end
			7'b1000101: begin // bne
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'bx;			
				alu_op <= 4'b0011;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'bx;		
				regwrite_EX <= 1'b0;		
				stall <= 1'b1;			
				pc_src <= 2'b01;		
			end
			7'b1000001: begin // bgez
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b11;		
				rdrt_EX <= 2'bx;			
				alu_op <= 4'b1100;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'bx;		
				regwrite_EX <= 1'b0;		
				stall <= 1'b1;			
				pc_src <= 2'b01;		
			end
			7'b1000010: begin // j
				memwrite_EX <= 1'b0;		
				alu_src <= 2'bx;		
				rdrt_EX <= 2'bx;			
				alu_op <= 4'bx;		
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'bx;		
				regwrite_EX <= 1'b0;		
				stall <= 1'b1;			
				pc_src <= 2'b10;		
			end
			7'b1000011: begin // jal
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b11;		
				rdrt_EX <= 2'b10;			
				alu_op <= 4'b1000;	
				alu_shamt <= 5'b0;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'b111;		
				regwrite_EX <= 1'b1;		
				stall <= 1'b1;			
				pc_src <= 2'b10;		
			end
			7'b0?01000: begin // jr
				memwrite_EX <= 1'b0;		
				alu_src <= 2'b00;		
				rdrt_EX <= 2'bx;			
				alu_op <= 4'b0100;	
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'bx;		
				regwrite_EX <= 1'b0;		
				stall <= 1'b1;			
				pc_src <= 2'b11;		
			end	
			
			default: begin // nop
				memwrite_EX <= 1'b0;		
				alu_src <= 2'bx;		
				rdrt_EX <= 2'bx;			
				alu_op <= 4'bx;		
				alu_shamt <= 5'bx;	
				enhilo_EX <= 1'b0;		
				regsel <= 3'bx;		
				regwrite_EX <= 1'b0;		
				stall <= 1'b0;			
				pc_src <= 2'b00;		
			end
		endcase
	end
endmodule