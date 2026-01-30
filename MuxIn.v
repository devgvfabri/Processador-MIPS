module MuxIn(imediato, entrada, in, saida);
input [13:0] imediato, entrada;
input in;
output reg[31:0] saida;

always@(*)
begin
	case(in)
	1'b0:
	saida = imediato;
	1'b1:
	saida = entrada;
	default: saida = 32'd0;
	endcase
end
	
endmodule