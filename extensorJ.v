module extensorJ( entradaJ, saida);

input[25:0] entradaJ;
output reg[31:0] saida;

always@(*)
begin
	saida = entradaJ;
end
endmodule