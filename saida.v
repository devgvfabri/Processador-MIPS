module saida(milhares, centenas, dezenas, unidades, out, valorsaida, clock, d1, d2, d3, d4);
input out, clock;
input [31:0] valorsaida;
output reg[3:0] milhares, centenas, dezenas, unidades;
output [6:0] d1, d2, d3, d4;

reg [31:0] temp;


always @(posedge clock) begin
  if (out) begin
    temp     = valorsaida / 1000;
    milhares = temp[3:0];

    temp     = (valorsaida % 1000) / 100;
    centenas = temp[3:0];

    temp     = (valorsaida % 100) / 10;
    dezenas  = temp[3:0];

    temp     = valorsaida % 10;
    unidades = temp[3:0];
  end
  else begin
    milhares = 0;
    centenas = 0;
    dezenas  = 0;
    unidades = 0;
  end
end



	
	decode decode1(.S(milhares),.a(d1[0]), .b(d1[1]), .c(d1[2]), .d(d1[3]), .e(d1[4]), .f(d1[5]), .g(d1[6]));
	decode decode2(.S(centenas),.a(d2[0]), .b(d2[1]), .c(d2[2]), .d(d2[3]), .e(d2[4]), .f(d2[5]), .g(d2[6]));
	decode decode3(.S(dezenas), .a(d3[0]), .b(d3[1]), .c(d3[2]), .d(d3[3]), .e(d3[4]), .f(d3[5]), .g(d3[6]));
	decode decode4(.S(unidades),.a(d4[0]), .b(d4[1]), .c(d4[2]), .d(d4[3]), .e(d4[4]), .f(d4[5]), .g(d4[6]));


endmodule