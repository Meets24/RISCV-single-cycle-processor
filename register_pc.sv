module reg_ister (clk,reset,in_put,out_put);
	input logic clk;
	input logic reset;
	input logic [31:0] in_put;
	output logic [31:0] out_put;
always_ff@(posedge clk)
begin
if(reset==1'b1)
	out_put<=32'b0;
else 
	out_put<=in_put;
end
endmodule
