module mux2to1#(parameter N = 5)(input [N-1:0] a, input[N-1:0] b, input s, output[N-1:0] out);
  assign out = (s == 1'b0) ? a : b;
endmodule