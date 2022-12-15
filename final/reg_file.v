module reg_file(
  input clk, rst,
  input [4:0] R1, R2, 
  input [4:0] W1,
  input [31:0] D1,
  output reg [31:0] Out1, Out2
  );

  reg [31:0] rf[31:0];

  always @(posedge clk)
  begin
    rf[W1] <= D1;
    Out1 <= rf[R1];
    Out2 <= rf[R2];
  end
endmodule