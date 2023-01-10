module adder(PC_in, out);

	input [31:0] PC_in;
	output reg [31:0] out;
	

	always @(PC_in) begin
		out <= PC_in + 32'h00000004;
	end
endmodule
	