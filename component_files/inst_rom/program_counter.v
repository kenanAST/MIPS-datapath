module program_counter(clk, rst, PCin, PCout);
	
	input clk, rst;
	input [31:0] PCin;
	output reg [31:0] PCout;
	
	
	always @(posedge clk) begin
		if(rst == 1)
			PCout <= 32'h00000000;
		else
			PCout <= PCin;
	end
endmodule