`include "sign_extender.v"

module sign_extender_tb();

  reg [15:0] in;
  wire [31:0] out;

  sign_extender sedd(in, out);
  
  initial begin 
    
    $dumpfile("./component_files/sign_extender/sign_extender_tb.vcd");
    $dumpvars(0, sign_extender_tb);

    in <= 16'b1100101110111010;
    #5
    in <= 16'b0011100101101100;
    #6
    $finish;
  end

endmodule
