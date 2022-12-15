`include "inst_rom.v"
`include "reg_file.v"
`include "input_mux.v"
`include "sign_extender.v"
`include "alu.v"
`include "data_memory.v"

module processor(
  input clock,
  input reset,
  //these ports are used for serial IO and
  //must be wired up to the data_memory
  //module
  input [7:0] serial_in,
  input serial_valid_in,
  input serial_ready_in,
  output reg [7:0] serial_out,
  output reg serial_rden_out,
  output reg serial_wren_out
);
  reg clk, rst;
  reg [31: 0] inst_rom_in;
  wire[31:0] inst_rom_out;
  wire [4:0] first_mux_out;
  wire [31:0] second_mux_out;
  wire [31:0] third_mux_out;
  wire [31:0] sign_extender_out;
  wire [31:0] reg_file_out1, reg_file_out2;

  //ALU
  wire [31:0] alu_out;
  wire alu_branch_out;
  wire alu_jump_out;

  //dataMemory
  wire [31:0] data_mem_out;
  wire [7:0] serial_out;
  wire serial_rden_out;
  wire serial_wren_out;

  inst_rom instruction_memory(clk, rst, inst_rom_in, inst_rom_out);
  mux2to1 #(5) dut(inst_rom_out[20:16], inst_rom_out[15:11], 1'b0, first_mux_out);
  reg_file register_file(clk, rst, inst_rom_out[25:21], inst_rom_out[20:16], first_mux_out, third_mux_out, reg_file_out1, reg_file_out2);
  sign_extender sign_extend(inst_rom_out[15:0], sign_extender_out);
  mux2to1 #(32) dut2(reg_file_out2, sign_extender_out, 1'b1, second_mux_out);
  alu al(inst_rom_out[31:26], reg_file_out1, second_mux_out, alu_out, alu_branch_out, alu_jump_out);
  data_memory data_mem(clk, rst, alu_out, reg_file_out2, 1'b1, 1'b1, 2'b11, data_mem_out, 8'b00000000, 1'b0, 1'b0, serial_out, serial_rden_out, serial_wren_out);
  mux2to1 #(32) dut3(data_mem_out, alu_out, 1'b0, third_mux_out);
endmodule