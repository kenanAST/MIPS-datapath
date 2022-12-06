`timescale 1ns / 1ps
`include "reg_file.v"


module reg_file_tb();

  reg [4:0] R1, R2;
  reg [4:0] W1;
  reg [31:0] D1;
  wire [31:0] Out1, Out2;


  reg_file kenan(R1, R2, W1, D1, Out1, Out2);

  initial begin 

    $dumpfile("reg_file_tb.vcd");
    $dumpvars(0, reg_file_tb);
    R1 = 2; R2 = 1; W1 = 2; D1 = 25;
    $display("%d %d %d %d %d", R1, R2, W1, Out1, Out2);
    #1
    R1 = 5; R2 = 5; W1 = 5; D1 = 3;
    $display("%d %d %d %d %d", R1, R2, W1, Out1, Out2);
    #1
    R1 = 5; R2 = 5; W1 = 5; D1 = 3;
    $display("%d %d %d %d %d", R1, R2, W1, Out1, Out2);
    #15 $finish;
  end

endmodule