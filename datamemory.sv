module datamemory(clk,memread,memwrite,a,wd,rd);
    input logic clk;
	input logic memread ; // comes from control unit
    input logic memwrite ; // Comes from control unit
    input logic [31:0] a ; // Read / Write address - 9 LSB bits of the ALU output
    input logic [ 31:0] wd ; // Write Data
    output logic [31:0] rd; // Read Data
    
    
    logic [31:0] mem [255:0];
    
    //always_latch 
	 initial
    begin
       if(memread)
            rd <= mem[a];
	 end
    
    always @(posedge clk) begin
       if (memwrite)
            mem[a] = wd;
    end
    
endmodule
