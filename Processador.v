module Processador( trava, d1,d2,d3,d4, entradaswitches, b,  reset,clk, in);
wire EscreveReg, Enable, Escrevemem, jump, branch, jumpR, RegDst, MemToReg, out, hlt;
output wire in;
 wire [1:0] OrigALU;
wire [3:0]OpAlu;
wire [1:0] selExtensor;
wire [13:0] imediato;
input clk;
wire [13:0] switches;
wire[31:0] addr_rom;
 wire [2:0] sinaisControle;
 wire [31:0] novoEnderecoJ;
 wire [31:0] novoEnderecoJal;
 wire[31:0] proxima_inst;
input reset;
wire[31:0] instrucao;
wire[5:0] OPCODE;
wire negativo, zero;
wire[31:0] saida_ula;
wire[31:0] saida_memRAM;
wire[31:0] reg_D;
wire[31:0] saida_reg1;
wire[31:0] saida_reg2;
wire[31:0] extendido;
wire [5:0] saidaMuxRD;
wire [31:0] saidaMuxALU;
wire [31:0] saidaToReg;
wire branchAtivo;
input b;
input [13:0] entradaswitches;
wire[3:0] milhares, centenas, dezenas, unidades; 
wire clock_div;
input trava;

output wire[6:0] d1,d2,d3,d4;
divisor divisor(.CLK(clk), .S(clock_div), .trava(trava));


entrada entrada(.saida(switches), .in(in), .entradafpga(entradaswitches), .b(b));
PC PC(.clock(clk), .proxima_inst(proxima_inst), .pc(addr_rom), .hlt(hlt));
Soma_Endereco Soma_Endereco(.novoEnderecoJ(novoEnderecoJ), .novoEnderecoJR(saida_reg1), .novoEnderecoJal(extendido), .Endbranch(extendido), .clock(clk), .novoEndereco(proxima_inst), .endereco(addr_rom) ,.resetCPU(reset), .sinaisControle(sinaisControle));
extensorJ extensorJ(.entradaJ(instrucao[25:0]), .saida(novoEnderecoJ));
MemoriaRom MemoriaRom(.clk(clk), .addr(addr_rom), .q(instrucao));
UnidadeDeControle UnidadeDeControle(.OPCODE(instrucao[31:26]), .in(in), .out(out), .Jr(jumpR), .Jump(jump), .RegDst(RegDst), .Branch(branch), .Memtoreg(MemToReg), .OpALU(OpAlu), .EscreveMem(Escrevemem), .OrigALU(OrigALU), .EscreveReg(EscreveReg), .Enable(Enable), .selExtensor(selExtensor), .hlt(hlt));
MuxIn MuxIn(.imediato(instrucao[13:0]), .entrada(switches), .in(in), .saida(imediato));
MuxRegDst MuxRegDst(.RT(instrucao[19:14]), .RD(instrucao[13:8]), .RegDst(RegDst), .saidaReg(saidaMuxRD));
bancoReg bancoReg(.RLe1(instrucao[25:20]), .RLe2(instrucao[19:14]), .REscrita(saidaMuxRD),.clock(clk), .EscreveReg(EscreveReg), 
.DadoLe1(saida_reg1),.DadoLe2(saida_reg2), .DadoEscrita(saidaToReg), .DadoRD(reg_D));
extensorBit extensorBit(.selecao(selExtensor), .entrada1(instrucao[19:0]), .entrada2(imediato), .entrada3(switches), .saida(extendido));
MuxOrigALU MuxOrigALU(.dadoLe2(saida_reg2), .imediato(extendido), .OrigALU(OrigALU), .enderecoAtual(addr_rom), .saidaMuxALU(saidaMuxALU));
ula ula(.Resultado(saida_ula), .S(OpAlu), .Enable(Enable), .Dado1(saida_reg1), .Dado2(saidaMuxALU), .Negativo(negativo), .zero(zero), .branchAtivo(branchAtivo), .branch(branch));
MemoriaRAM MemoriaRAM(.clk(clk), .we(Escrevemem), .q(saida_memRAM), .data(saida_reg2), .read_addr(saida_ula), .write_addr(saida_ula));
MuxMemToREG MuxMemToREG(.saidaULA(saida_ula), .saidaMem(saida_memRAM), .MemToReg(MemToReg), .saidaToReg(saidaToReg));
saida saida(.clock(clk), .out(out), .valorsaida(saidaToReg), .milhares(milhares), .centenas(centenas), .dezenas(dezenas), .unidades(unidades), .d1(d1), .d2(d2), .d3(d3), .d4(d4));

assign sinaisControle = {branchAtivo, jump, jumpR};

endmodule