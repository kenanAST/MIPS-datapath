`include "adder.v"

module adder_tb();

	reg [31:0] PCin1;
	wire [31:0] out;
	wire [31:0] adder_constant = 32'h00000004;

	
	adder a(PCin1, adder_constant, out);
	
	initial begin

        $dumpfile("./component_files/adder/adder_tb.vcd");
    	$dumpvars(0, adder_tb);

		#1
			PCin1<= 0;
			$display("%d %d", PCin1, out);
        #1
			PCin1<= 10;
			$display("%d %d", PCin1, out);
        #1
			PCin1<= 14;
			$display("%d %d", PCin1, out); 
        #1
        $finish;
	end

endmodule