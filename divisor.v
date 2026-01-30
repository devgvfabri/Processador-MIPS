module divisor (CLK,S, trava);
input CLK, trava;
output reg S;
reg[26:0] out;
always @ (posedge CLK or posedge trava)
if(trava == 1)
begin
	out <= 27'd0; 
end
else if( out == 27'd25000000)
begin
out<= 27'd0;
S <= ~S;
end
else
begin
out <= out + 27'd1;

end
endmodule