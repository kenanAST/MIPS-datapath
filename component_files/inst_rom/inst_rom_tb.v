`include "inst_rom.v"
`include "program_counter.v"
`include "adder.v"

module inst_rom_tb();
    reg clk, rst;
    wire [31:0] inst_rom_in;
    wire [31:0] inst_rom_out;
    wire [31:0] PCout;

    program_counter pc(clk, rst, inst_rom_in, PCout);
	adder a(PCout, inst_rom_in);
    inst_rom instruction_memory(clk, rst, PCout, inst_rom_out);
    
    always #1 clk = ~clk;

    initial begin 

        $dumpfile("./component_files/inst_rom/inst_rom_tb.vcd");
        $dumpvars(0, inst_rom_tb);
        clk <= 0;
		rst <= 1;
		$display("%d %d", inst_rom_in, PCout);	

		#1.5
		rst <= 0;
		$display("%d %d", inst_rom_in, PCout);

		#40	
		$finish;
    end

endmodule
