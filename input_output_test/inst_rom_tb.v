`include "inst_rom.v"
`include "reg_file.v"
`include "input_mux.v"
`include "sign_extender.v"
`include "alu.v"

module inst_rom_tb();
    reg clk, rst;
    reg [31: 0] inst_rom_in;
    wire[31:0] inst_rom_out;
    wire [4:0] first_mux_out;
    wire [4:0] second_mux_out;
    wire [31:0] sign_extender_out;
    wire [31:0] reg_file_out1, reg_file_out2;

    //ALU
    wire [31:0] alu_out;
    wire alu_branch_out;
    wire alu_jump_out;

    inst_rom instruction_memory(clk, rst, inst_rom_in, inst_rom_out);
    mux2to1 #(5) dut(inst_rom_in[20:16], inst_rom_in[15:11], 0, first_mux_out);
    reg_file register_file(clk, rst, inst_rom_in[25:21], inst_rom_in[20:16], first_mux_out, "ADD LATER", reg_file_out1, reg_file_out2);
    sign_extender sign_extend(inst_rom_in[15:11], sign_extender_out);
    mux2to1 #(32) dut2(reg_file_out2, sign_extender_out, 0, second_mux_out);
    alu al(inst_rom_in[31:26], reg_file_out1, second_mux_out, alu_out. alu_branch_out, alu_jump_out)

    always #1 clk = ~clk;

    initial begin 

        $dumpfile("inst_rom_tb.vcd");
        $dumpvars(0, inst_rom_tb);
        clk <= 0;
        rst <= 0;
        
        #1
        rst <= 1;

        #1
        rst <= 0;
        #1 inst_rom_in <= 32'b00000000000000000000000000000000;
        #1 inst_rom_in <= 32'b00000000000000000000000000000001;
        #1 inst_rom_in <= 32'b00000000000000000000000000000010;
        #1 inst_rom_in <= 32'b00000000000000000000000000000011;
        #1 inst_rom_in <= 32'b00000000000000000000000000000100;
        // #1 inst_rom_in <= 32'b00000000000000000000000000000101;
        // #1 inst_rom_in <= 32'b00000000000000000000000000000110;
        // #1 inst_rom_in <= 32'b00000000000000000000000000000111;
        // #1 inst_rom_in <= 32'b00000000000000000000000000001000;
        // #1 inst_rom_in <= 32'b00000000000000000000000000001001;
        // #1 inst_rom_in <= 32'b00000000000000000000000000001010;
        // #1 inst_rom_in <= 32'b00000000000000000000000000001011;
        // #1 inst_rom_in <= 32'b00000000000000000000000000001100;
        // #1 inst_rom_in <= 32'b00000000000000000000000000001101;
        // #1 inst_rom_in <= 32'b00000000000000000000000000001110;
        // #1 inst_rom_in <= 32'b00000000000000000000000000001111;
        // #1 inst_rom_in <= 32'b00000000000000000000000000010000;
        $display("%b", inst_rom_out[5:0]);
        #15 $finish;
    end

endmodule
