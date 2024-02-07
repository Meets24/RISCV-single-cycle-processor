module datapath_tb();
	reg clk_tb;
	reg [31:0] imm_tb;
	reg reset_tb;
	wire [31:0] final_answer_tb;
datapath dut(clk_tb,imm_tb,reset_tb,final_answer_tb);
initial
begin
	clk_tb=1;
forever
begin
	#10 clk_tb=~clk_tb;
end
end

initial
begin
reset_tb=1;
#30;
reset_tb=0;imm_tb=4;
#30;
reset_tb=0;imm_tb=4;
#30;
reset_tb=0;imm_tb=4;
#30;
#30;

$stop;
end
endmodule
