module instrmemory #(parameter width=32)(clk,addr,inst_out);
	input logic clk;
	input logic [31:0] addr;
	output logic [width-1:0] inst_out;
	reg [width-1:0] imem [255:0];
	always_ff @ (posedge clk)
  //initial
  begin
	imem[0]=32'b00000000000100000000000110010011;//addi x3,x0,1
	imem[4]=32'b00000000010000101010000100000011;//lw x2,4(x5)
	imem[8]=32'b00000000000100010000001000110011;//add x4,x2,x1
	imem[12]=32'b00000000010000101010010000100011;//sw x4,8(x5)
	imem[16]=32'b00000000000000011000111001100111;//beq x3,x0,3
	imem[20]=32'b00000000001100000000001100010011;//addi x6,x0,3
	imem[24]=32'b00000000011000101010011000100011;//sw x6,12(x5)
	imem[28]=32'b0;

  end

always_ff@(posedge clk)
inst_out<=imem[addr];

endmodule
