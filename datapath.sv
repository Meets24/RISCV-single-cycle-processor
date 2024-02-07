module datapath (clk,imm,reset,final_answer);
	input logic clk;
	input logic reset;
	input logic [31:0] imm;
	output reg [31:0] final_answer;
nextpc u1(pc,imm,pcsrc,pc_next);
reg_ister pc_reg(clk,reset,pc_next,pc);
instrmemory inst_mem(clk,pc,machcode);
decoder dc(clk,reset,machcode,rs1,rs2,rd,function7,function3,opercode,immed);
//immeconcate immconca(imm5s,imm7s,imm11b,imm12b,imm4b,imm6b,imm_store,imm_branch);
signextension sgnext(immed,sgneximme);
control ctrl(function7,function3,opercode,alu_opera,regwrite,memread,memwrite,branch,alusrc,memtoreg);
regfile regif(clk,reset,regwrite,rs1,rs2,rd,final_data,cont_reg1,cont_reg2);
alusrcmux2 muxalsrc(alusrc,cont_reg2,sgneximme,oper2);
alu alumod(alu_opera,cont_reg1,oper2,alu_result,zeroflag);
pcsrcand pcand(zeroflag,branch,pcsrc);
datamemory damem(clk,memread,memwrite,alu_result,cont_reg2,read_data);
memtoregmux2 memregmux(memtoreg,read_data,alu_result,final_data,final_answer);
endmodule
