module alu (alu_control,inp1,inp2,alu_result,zeroflag);
    input [31:0] inp1,inp2;
    input[3:0] alu_control;
    output reg [31:0] alu_result;
    output reg zeroflag;
    always@(alu_control,inp1,inp2)
    begin
        case(alu_control)

        4'b0011: alu_result = inp1&inp2;
        4'b0001: alu_result = inp1|inp2;
        4'b0010: alu_result = inp1+inp2;
        4'b0100: alu_result = inp1-inp2;
		  default: alu_result= 32'bx;
        endcase

        if (alu_result == 0)
            zeroflag = 1;
        else
            zeroflag = 0;
        
    end
endmodule
