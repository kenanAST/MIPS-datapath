`include "and2.v"

module and2_tb();
    reg a, b;
    wire c;
    
    and2 and_gate(a, b, c);    

    initial begin 

        $dumpfile("and2.vcd");
        $dumpvars(0, and2_tb);

        #1 
        a <= 0;
        b <= 0;

        #1 
        a <= 1;
        b <= 0;

        #1 
        a <= 0;
        b <= 1;

        #1 
        a <= 1;
        b <= 1;
        #1 $finish;
    end

endmodule
