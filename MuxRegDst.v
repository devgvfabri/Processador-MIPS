module MuxRegDst(RT, RD, RegDst, saidaReg);
input [5:0] RD, RT;
input RegDst;
output reg[5:0] saidaReg;

always@(*)
begin
	case(RegDst)
	1'b0:
	saidaReg = RT;
	1'b1:
	saidaReg = RD;
	default: saidaReg = 6'd0;
	endcase
end

endmodule