module Soma_Endereco(novoEnderecoJ, novoEnderecoJR, Endbranch, clock, endereco, novoEndereco, novoEnderecoJal, resetCPU, sinaisControle);
input clock, resetCPU;
input [2:0] sinaisControle;
input [31:0] novoEnderecoJ, novoEnderecoJR, novoEnderecoJal, Endbranch;
input [31:0] endereco;
output reg[31:0] novoEndereco;

always@(*)
begin
	novoEndereco = 32'd0; 
	if(sinaisControle == 3'b000 ) // apenas pc + 1
	begin
		novoEndereco =  endereco + 32'd1;
	end
	if(sinaisControle == 3'b010) // jump
	begin
		novoEndereco = endereco + 1;
		novoEndereco = {novoEndereco[31:28], novoEnderecoJ[27:0]};
	end
	if(sinaisControle == 3'b001) // jump register
	begin
		novoEndereco = novoEnderecoJR;
	end
	if(sinaisControle == 3'b100) // branch
	begin
		novoEndereco = endereco + 1;
		novoEndereco =  novoEndereco + Endbranch;
	end
	if(sinaisControle == 3'b011) // jal
	begin
		novoEndereco = novoEnderecoJal;
	end
	if(resetCPU) // reset
	begin
		novoEndereco = 0;
	end
	
end







endmodule