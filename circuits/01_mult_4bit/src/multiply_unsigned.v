`timescale 1ns / 1ps

module multiply_unsigned #(
    parameter WIDTH = 4
)(
    input  wire [WIDTH-1:0]   a,
    input  wire [WIDTH-1:0]   b,
    output wire [2*WIDTH-1:0] product
);
    wire [2*WIDTH-1:0] a_ext = {{WIDTH{1'b0}}, a};
    wire [2*WIDTH-1:0] b_ext = {{WIDTH{1'b0}}, b};

    assign product = a_ext * b_ext;
endmodule
