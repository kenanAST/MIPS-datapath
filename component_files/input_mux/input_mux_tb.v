`include "input_mux.v"

module mux2to1_tb();
  reg [4:0] a;
  reg [4:0] b;
  reg s;
  wire [4:0] out;

  // Instantiate the multiplexer with 4 inputs
  mux2to1 #(5) dut(a, b, s, out);

  // Test cases
  initial begin

    //gtkwave
    $dumpfile("./component_files/input_mux/input_mux_tb.vcd");
    $dumpvars(0, mux2to1_tb);

    // Test 1
    a = 31;
    b = 15;
    s = 1'b0;
    #1 $display("Test 1: out=%b", out);

    // Test 2
    s = 1'b1;
    #1 $display("Test 2: out=%b", out);

    // Test 3
    s = 1'b0;
    #1 $display("Test 3: out=%b", out);

    // Test 4
    s = 1'b1;
    #1 $display("Test 4: out=%b", out);
  end
endmodule