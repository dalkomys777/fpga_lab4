`timescale 1ns / 1ps

module tb;
    reg  [3:0] a;
    reg  [3:0] b;
    wire [7:0] m;
    integer x;
    integer y;

    mult_4bit dut (
        .a(a),
        .b(b),
        .m(m)
    );

    task check_key;
        input [3:0] aa;
        input [3:0] bb;
        reg   [7:0] expected;
        begin
            a = aa;
            b = bb;
            expected = {4'b0000, aa} * {4'b0000, bb};
            #10;
            if (m !== expected)
                $fatal(1, "multiply mismatch: a=%0d b=%0d m=%0d expected=%0d",
                       aa, bb, m, expected);
        end
    endtask

    initial begin
        a = 0;
        b = 0;
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        check_key(0, 0);
        check_key(3, 5);
        check_key(7, 9);
        check_key(15, 15);

        for (x = 0; x < 16; x = x + 1) begin
            for (y = 0; y < 16; y = y + 1) begin
                a = x;
                b = y;
                #1;
                if (m !== x * y)
                    $fatal(1, "multiply mismatch: a=%0d b=%0d m=%0d",
                           x, y, m);
            end
        end

        $display("PASS multiplier: 256 input pairs");
        $finish;
    end

    initial begin
        #5000;
        $fatal(1, "timeout");
    end
endmodule
