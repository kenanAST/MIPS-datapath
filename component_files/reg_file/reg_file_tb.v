`include "reg_file.v"


module reg_file_tb();
  reg clk, rst;
  reg [4:0] R1, R2;
  reg [4:0] W1;
  reg [31:0] D1;
  wire [31:0] Out1, Out2;


  reg_file register_file(clk, rst, R1, R2, W1, D1, Out1, Out2);
  
  always #1 clk = ~clk;

  initial begin 
    
    $dumpfile("./component_files/reg_file/reg_file_tb.vcd");
    $dumpvars(0, reg_file_tb);

    clk <= 0;
    rst <= 1;
    #1
    rst<=0;
    #1
    R1 = 2'b0001; R2 = 2'b0011; W1 = 2'b0001; D1 = 32;
    $display("%d %d %d %d %d", R1, R2, W1, Out1, Out2);
    #1
    W1 = 2'b0011; D1 = 25;
    $display("%d %d %d %d %d", R1, R2, W1, Out1, Out2);
    #1
    $display("%d %d %d %d %d", R1, R2, W1, Out1, Out2);
    #15 $finish;
  end

endmodule
