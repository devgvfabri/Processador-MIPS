module MuxOrigALU(dadoLe2, imediato, OrigALU, saidaMuxALU, enderecoAtual);
input [31:0] dadoLe2, imediato, enderecoAtual;
input [1:0] OrigALU;
output reg[31:0] saidaMuxALU;

always@(*)
begin
	case(OrigALU)
	2'b00:
	saidaMuxALU = dadoLe2;
	2'b01:
	saidaMuxALU = imediato;
	2'b10:
	saidaMuxALU = enderecoAtual;
	default: saidaMuxALU = 32'd0;
	endcase
end
endmodule