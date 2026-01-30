module MuxMemToREG(saidaULA, saidaMem, MemToReg, saidaToReg);
input [31:0] saidaULA, saidaMem;
input MemToReg;
output reg[31:0] saidaToReg;

always @(*) begin
  case (MemToReg)
    1'b0: saidaToReg = saidaULA;
    1'b1: saidaToReg = saidaMem;
    default: saidaToReg = 32'd0;
  endcase
end
endmodule