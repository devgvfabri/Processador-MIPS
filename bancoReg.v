module bancoReg(RLe1, RLe2, REscrita, DadoEscrita, clock, EscreveReg, DadoLe1, DadoLe2, DadoRD);
input [5:0] RLe1, RLe2, REscrita;
input [31:0] DadoEscrita;
input clock, EscreveReg;
output [31:0] DadoLe1, DadoLe2, DadoRD;

integer primeiroClock = 1;// seta os registradores fixos

reg[31:0] rega[63:0];
always@(posedge clock)
begin
	if(primeiroClock == 1)
	begin
		rega[62] = 255; //registrador zero
		rega[61] = 255; //registrador $ra
		primeiroClock <=2;
	end
	if(EscreveReg)
	begin
		rega[REscrita] = DadoEscrita; // escreve o dado vindo da ula/memoria
	end
end
assign DadoLe1 = rega[RLe1];
assign DadoLe2 = rega[RLe2];
assign DadoRD = rega[REscrita];

endmodule