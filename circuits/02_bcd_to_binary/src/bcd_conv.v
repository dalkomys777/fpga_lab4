`timescale 1ns / 1ps

module bcd_conv(
    input  wire [3:0] one,
    input  wire [3:0] ten,
    output wire [6:0] bin,
    output wire       valid
);
    bcd_to_binary u_convert (
        .ten(ten),
        .one(one),
        .binary(bin),
        .valid(valid)
    );
endmodule
