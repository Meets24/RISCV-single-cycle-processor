module control(
    input [6:0] funct7,
    input [2:0] funct3,
    input [6:0] opcode,
    output reg [3:0] alu_opera,
    output reg regwrite,memread,memwrite,branch,alusrc,memtoreg
);
logic [1:0] aluop;
    always @(funct3 or funct7 or opcode)
    begin
	 case(opcode)
	 51:begin regwrite=1; memread=0; memwrite=0; branch=0; alusrc=0; memtoreg=0; aluop=2'b10; alu_opera=4'b0010;end //add
    19:begin regwrite=1; memread=0; memwrite=0; branch=0; alusrc=1; memtoreg=0; alu_opera=4'b0010;end //addi
    3:begin  regwrite=1; memread=1; memwrite=0; branch=0; alusrc=1; memtoreg=1; aluop=2'b00; alu_opera=4'b0010;end //load
    35:begin regwrite=0; memread=0; memwrite=1; branch=0; alusrc=1; memtoreg=1; aluop=2'b00; alu_opera=4'b0010;end //store
	 103:begin regwrite=0; memread=0; memwrite=0; branch=1; alusrc=0; memtoreg=0; alu_opera=4'b0100;end //beq
    default:begin regwrite=1'bx; memread=1'bx; memwrite=1'bx; branch=1'bx; alusrc=1'bx; memtoreg=1'bx; alu_opera=4'bx;end
endcase
end
endmodule
