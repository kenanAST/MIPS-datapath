module sign_extender(input [15:0] in, output [31:0] out);
    reg [31:0] out;

    // Check the sign bit (bit 15) of the input
    always @(*) begin
        if (in[15]) begin
            // If the sign bit is 1, extend the sign by filling the upper 16 bits with 1s
            out = {16'b1111111111111111, in};
        end else begin
            // If the sign bit is 0, extend the sign by filling the upper 16 bits with 0s
            out = {16'b0000000000000000, in};
        end
    end
endmodule