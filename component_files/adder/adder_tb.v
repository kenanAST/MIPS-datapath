`include "adder.v"

module adder_tb();

	reg [31:0] PCin;
	wire [31:0] out;
	
	adder a(PCin, out);
	
	initial begin

        $dumpfile("./component_files/adder/adder_tb.vcd");
    	$dumpvars(0, adder_tb);

		#1
			PCin<= 0;
			$display("%d %d", PCin, out);
        #1
			PCin<= 10;
			$display("%d %d", PCin, out);
        #1
			PCin<= 14;
			$display("%d %d", PCin, out); 
        #1
        $finish;
	end

endmodule