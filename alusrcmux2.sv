module alusrcmux2(s,d0,d1,y);
	input logic [31:0] d0, d1;
	input logic s;
	output logic [31:0] y;
always_comb
begin
	y = s ? d1 : d0;
end
endmodule
