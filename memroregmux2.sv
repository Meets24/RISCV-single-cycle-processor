module memtoregmux2(s,d0,d1,y,ans);
	input logic [31:0] d0, d1;
	input logic s;
	output logic [31:0] y,ans;
always_comb
begin
	y = s ? d1 : d0;
end
assign ans=y;
endmodule
