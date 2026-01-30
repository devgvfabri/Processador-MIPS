module decode (S, a, b, c, d, e, f, g);

input wire[3:0] S;
output wire a, b, c, d, e, f, g;
reg[6:0] segmentos;
always @(*)
if(S == 4'b0000)
begin
segmentos = 7'b0000001;
end
else if(S == 4'b0001)
begin
segmentos = 7'b1001111;
end
else if(S == 4'b0010)
begin
segmentos = 7'b0010010;
end
else if(S == 4'b0011)
begin
segmentos = 7'b0000110;
end
else if(S == 4'b0100)
begin
segmentos = 7'b1001100;
end
else if(S == 4'b0101)
begin
segmentos = 7'b0100100;
end
else if(S == 4'b0110)
begin
segmentos = 7'b0100000;
end
else if(S == 4'b0111)
begin
segmentos = 7'b0001111;
end
else if(S == 4'b1000)
begin
segmentos = 7'b0000000;
end
else if(S == 4'b1001)
begin
segmentos = 7'b0000100;
end
else
begin
segmentos = 7'b1111111;
end
assign {a,b,c,d,e,f,g} = segmentos;
endmodule