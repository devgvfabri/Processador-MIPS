module UnidadeDeControle(OPCODE, in, out, Jr, Jump, RegDst, Branch, Memtoreg, OpALU, EscreveMem, OrigALU, EscreveReg, Enable, selExtensor, hlt);
input[5:0] OPCODE;
output reg[1:0] selExtensor;
output reg in;
output reg out;
output reg Jr;
output reg Jump; 
output reg RegDst; 
output reg Branch;  
output reg Memtoreg;
output reg[3:0] OpALU; 
output reg EscreveMem; 
output reg[1:0] OrigALU; 
output reg EscreveReg;
output reg Enable;
output reg hlt;

always@(OPCODE)
begin
	  in = 0;
	  out = 0;
	  Jr = 0;
	  Jump = 0;
	  RegDst = 0;
	  Branch = 0;
	  Memtoreg = 0;
	  OpALU = 4'b0000;
	  EscreveMem = 0;
	  OrigALU = 2'b00;
	  EscreveReg = 0;
	  Enable = 0;
	  selExtensor = 2'b00;
	  hlt = 0;
	case(OPCODE)
		6'b000000: // add
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 1;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0000;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'bxx;
			hlt = 0;
		end
		6'b000001:  // sub
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 1;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0001;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'bxx;
			hlt = 0;
		end
		6'b000010:  // mul
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 1;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0010;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'bxx;
			hlt = 0;
		end
		6'b000011: // div
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 1;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0011;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'bxx;
			hlt = 0;
		end
		6'b000100:  // addI
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0000;
			EscreveMem = 0;
			OrigALU = 2'b01;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b000101: // subI
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0001;
			EscreveMem = 0;
			OrigALU = 2'b01;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b000110: // Or
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 1;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0101;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'bxx;
			hlt = 0;
		end
		6'b000111: // not
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0110;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b001000: // And
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 1;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0100;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'bxx;
			hlt = 0;
		end
		6'b001001: // load word
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 1;
			OpALU = 4'b0000;
			EscreveMem = 0;
			OrigALU = 2'b01;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b001010: // store word
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0000;
			EscreveMem = 1;
			OrigALU = 2'b01;
			EscreveReg = 0;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b001011: // loadi verificar depois
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 1;
			OpALU = 4'b0000;
			EscreveMem = 0;
			OrigALU = 2'b01;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b001100: // move 
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0000;
			EscreveMem = 0;
			OrigALU = 2'b01;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b001101: // nop
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0000;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 0;
			Enable = 0;
			selExtensor = 2'b00;
			hlt = 0;
		end
		6'b001110: // hlt
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'bxxxx;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 0;
			Enable = 0;
			selExtensor = 2'bxx;
			hlt = 1;
		end
		6'b001111: //in
		begin
			in = 1;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0000;
			EscreveMem = 0;
			OrigALU = 2'b01;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b010000: // out
		begin
			in = 0;
			out = 1;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0000;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 0;
			Enable = 1;
			selExtensor = 2'b00;
			hlt = 0;
		end
		6'b010001: //jr
		begin
			in = 0;
			out = 0;
			Jr = 1;
			Jump = 0;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'bxxxx;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 0;
			Enable = 0;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b010010: // jal 
		begin
			in = 0;
			out = 0;
			Jr = 1;
			Jump = 1;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b1011;
			EscreveMem = 0;
			OrigALU = 2'b10;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b010011: // jump
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 1;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0000;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 0;
			Enable = 0;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b010100: // slt
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 1;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b1010;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'bxx;
			hlt = 0;
		end
		6'b010101: // branch
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 1;
			Memtoreg = 0;
			OpALU = 4'b0111;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 0;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b010110: // bgt 
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 1;
			Memtoreg = 0;
			OpALU = 4'b1000;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 0;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b010111: // blet
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 1;
			Memtoreg = 0;
			OpALU = 4'b1001;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 0;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b011000: // loadR
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 1;
			Branch = 0;
			Memtoreg = 1;
			OpALU = 4'b0000;
			EscreveMem = 0;
			OrigALU = 2'b00;
			EscreveReg = 1;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b011001: // storeI
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0000;
			EscreveMem = 1;
			OrigALU = 2'b01;
			EscreveReg = 0;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		6'b011010: // storeR
		begin
			in = 0;
			out = 0;
			Jr = 0;
			Jump = 0;
			RegDst = 0;
			Branch = 0;
			Memtoreg = 0;
			OpALU = 4'b0000;
			EscreveMem = 1;
			OrigALU = 2'b00;
			EscreveReg = 0;
			Enable = 1;
			selExtensor = 2'b01;
			hlt = 0;
		end
		default: begin
			 in = 0;
			 out = 0;
			 Jr = 0;
			 Jump = 0;
			 RegDst = 0;
			 Branch = 0;
			 Memtoreg = 0;
			 OpALU = 4'b0000;
			 EscreveMem = 0;
			 OrigALU = 2'b00;
			 EscreveReg = 0;
			 Enable = 0;
			 selExtensor = 2'b00;
			 hlt = 0;
		end
		endcase

end

endmodule