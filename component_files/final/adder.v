module adder(PC_in1, PC_in2,  out);

	input [31:0] PC_in1;
	input [31:0] PC_in2;
	output reg [31:0] out;
	

	always @(PC_in1) begin
		out <= PC_in1 + PC_in2;
	end
endmodule
	