module entrada(entradafpga, in, saida, b);
input wire[13:0] entradafpga;
input in, b;
output reg[13:0] saida;

always@(posedge b)
begin
	saida <= entradafpga;
end

endmodule