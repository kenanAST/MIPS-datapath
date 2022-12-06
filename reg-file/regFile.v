module regFile(R1, R2, W1, D1, Out1, Out2);
  input [4:0] R1, R2;
  input [4:0] W1;
  input [31:0] D1;
  output reg [31:0] Out1, Out2;

  reg [31:0] rf[31:0];

  always@* begin
    Out1 <= rf[R1];
    Out2 <= rf[R2];
  end
endmodule