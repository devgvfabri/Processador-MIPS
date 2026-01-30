module PC(clock, pc, proxima_inst, hlt);
input clock;
input hlt;
input wire[31:0] proxima_inst;
output reg[31:0] pc;

always @(posedge clock)
begin
if(hlt == 0) pc = proxima_inst; 
end
endmodule