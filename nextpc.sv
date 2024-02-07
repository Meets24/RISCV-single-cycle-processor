module nextpc (pc,imm,pcsrc,pc_next);
	input logic pcsrc;
	input logic [31:0] imm,pc;
	output logic [31:0] pc_next;
always_comb
begin
	pc_next=pcsrc?(pc+imm):(pc+32'h00000004);
end
endmodule
