`timescale 1ns / 1ps

module tb;
    reg  [3:0] ten;
    reg  [3:0] one;
    wire [6:0] bin;
    wire       valid;
    integer t;
    integer o;

    bcd_conv dut (
        .one(one),
        .ten(ten),
        .bin(bin),
        .valid(valid)
    );

    task check_key;
        input [3:0] tt;
        input [3:0] oo;
        begin
            ten = tt;
            one = oo;
            #10;
        end
    endtask

    initial begin
        ten = 0;
        one = 0;
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        check_key(0, 0);
        check_key(1, 2);
        check_key(5, 9);
        check_key(9, 9);
        check_key(10, 0);

        for (t = 0; t < 16; t = t + 1) begin
            for (o = 0; o < 16; o = o + 1) begin
                ten = t;
                one = o;
                #1;

                if (valid !== ((t < 10) && (o < 10)))
                    $fatal(1, "BCD valid mismatch: ten=%0d one=%0d valid=%0d",
                           t, o, valid);

                if ((t < 10) && (o < 10) && (bin !== t * 10 + o))
                    $fatal(1, "BCD value mismatch: ten=%0d one=%0d bin=%0d",
                           t, o, bin);
            end
        end

        $display("PASS BCD: 100 valid, 156 invalid");
        $finish;
    end

    initial begin
        #5000;
        $fatal(1, "timeout");
    end
endmodule
