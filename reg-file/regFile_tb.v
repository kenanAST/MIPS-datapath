`timescale 1ns / 1ps
`include "regFile.v"


module regFile_tb();

  reg [4:0] R1, R2;
  reg [4:0] W1;
  reg [31:0] D1;
  wire [31:0] Out1, Out2;


  regFile kenan(R1, R2, W1, D1, Out1, Out2);

  initial begin 

    $dumpfile("regFile_tb.vcd");
    $dumpvars(0, regFile_tb);
    R1 = 3; R2 = 6; W1 = 0; D1 = 0;
    #1
    R1 = 5; R2 = 5; W1 = 5; D1 = 5;
    #1
    R1 = 5; R2 = 5; W1 = 5; D1 = 5;
    $display("%b", Out1);
    #15 $finish;
  end

endmodule
