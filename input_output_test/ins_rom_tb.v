`include "inst_rom.v"

module inst_rom_tb();
    reg clk, rst;
    reg [31: 0] addr_in;
    wire[31:0] data_out;
    
    inst_rom instruction_memory(clk, rst, addr_in, data_out);

    always #1 clk = ~clk;

    initial begin 

        $dumpfile("instruction_memory.vcd");
        $dumpvars(0, inst_rom_tb);
        clk <= 0;
        rst <= 0;
        
        #1
        rst <= 1;

        #1
        rst <= 0;
        #1 addr_in <= 32'b00000000000000000000000000000000;
        #1 addr_in <= 32'b00000000000000000000000000000001;
        #1 addr_in <= 32'b00000000000000000000000000000010;
        #1 addr_in <= 32'b00000000000000000000000000000011;
        #1 addr_in <= 32'b00000000000000000000000000000100;
        #1 addr_in <= 32'b00000000000000000000000000000101;
        #1 addr_in <= 32'b00000000000000000000000000000110;
        #1 addr_in <= 32'b00000000000000000000000000000111;
        #1 addr_in <= 32'b00000000000000000000000000001000;
        #1 addr_in <= 32'b00000000000000000000000000001001;
        #1 addr_in <= 32'b00000000000000000000000000001010;
        #1 addr_in <= 32'b00000000000000000000000000001011;
        #1 addr_in <= 32'b00000000000000000000000000001100;
        #1 addr_in <= 32'b00000000000000000000000000001101;
        #1 addr_in <= 32'b00000000000000000000000000001110;
        #1 addr_in <= 32'b00000000000000000000000000001111;
        #1 addr_in <= 32'b00000000000000000000000000010000;
        $display("%b", addr_in[5:0]);
        #15 $finish;
    end

endmodule
