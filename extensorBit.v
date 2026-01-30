module extensorBit(selecao, entrada1, entrada2, entrada3, saida);

input[19:0] entrada1;
input[13:0] entrada2;
input[14:0] entrada3;
input[1:0] selecao;
output reg[31:0] saida;

always@(*)
begin
	case(selecao)
	2'b00:
	begin
		saida = entrada1;
		if(entrada1[19] == 1'b1) saida = saida + 32'b11111111111100000000000000000000;
	end
	2'b01:
	begin
		saida = entrada2;
		if(entrada2[13] == 1'b1) saida = saida + 32'b11111111111111111100000000000000;
	end
	2'b10:
	begin
		saida = entrada3;
		if(entrada3[14] == 1'b1) saida = saida + 32'b11111111111111111000000000000000;
	end
	default:
	begin
	saida = 32'b1;
	end
	endcase
end
endmodule