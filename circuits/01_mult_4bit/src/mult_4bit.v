`timescale 1ns / 1ps

module mult_4bit(
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [7:0] m
);
    multiply_unsigned #(.WIDTH(4)) u_multiply (
        .a(a),
        .b(b),
        .product(m)
    );
endmodule
