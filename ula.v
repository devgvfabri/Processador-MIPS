module ula(Dado1, Dado2, S, Enable, Resultado, Negativo, zero, branchAtivo, branch);
input wire[31:0] Dado1, Dado2;
input wire[3:0] S;
input wire Enable, branch;
output reg[31:0] Resultado;
output reg zero, branchAtivo;
output wire Negativo;

always @(*) begin
  // Defaults para evitar latch
  Resultado = 32'd0;
  zero = 0;
  branchAtivo = 0;

  if (Enable == 1) begin
    case(S)
      4'b0000: Resultado = Dado1 + Dado2;
      4'b0001: Resultado = Dado1 - Dado2;
      4'b0010: Resultado = Dado1 * Dado2;
      4'b0011: Resultado = Dado1 / Dado2;
      4'b0100: Resultado = Dado1 & Dado2;
      4'b0101: Resultado = Dado1 | Dado2;
      4'b0110: Resultado = ~Dado1;
      4'b0111: begin
        Resultado = Dado1 - Dado2;
        if (Resultado == 0)
          zero = 1;
        branchAtivo = branch & zero;
      end
      4'b1000: begin
        if (Dado1 > Dado2)
          zero = 1;
        branchAtivo = branch & zero;
      end
      4'b1001: begin
        if (Dado1 <= Dado2)
          zero = 1;
        branchAtivo = branch & zero;
      end
      4'b1010: begin
        if (Dado1 < Dado2)
          Resultado = 0;
        else
          Resultado = 1;
      end
      4'b1011: Resultado = Dado2 + 32'd1;
      default: Resultado = 32'd0;
    endcase
  end
end

assign Negativo = Resultado[31];

endmodule

