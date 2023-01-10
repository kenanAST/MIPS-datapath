`include "program_counter.v"
`include "adder.v"

module program_counter_tb();
	reg clk, rst;
	wire [31:0] PCout;
	wire [31:0] adder_out;

	program_counter pc(clk, rst, adder_out, PCout);
	adder a(PCout, adder_out);

	always #1 clk = ~clk;
	
	initial begin 

		$dumpfile("./component_files/program_counter/program_counter_tb.vcd");
    	$dumpvars(0, program_counter_tb);

		clk <= 0;
		rst <= 1;

		#1 
		rst <= 0;
		$display("%d %d", adder_out, PCout);	

		#1	
		rst <= 1;
		$display("%d %d", adder_out, PCout);

		#	
		rst <= 0;
		$display("%d %d", adder_out, PCout);

		#1	
		$finish;
	end
endmodule