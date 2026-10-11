`timescale 1ns / 1ps

module bcd_to_binary(
    input  wire [3:0] ten,
    input  wire [3:0] one,
    output wire [6:0] binary,
    output wire       valid
);
    assign binary = ten * 7'd10 + one;
    assign valid  = (ten <= 4'd9) && (one <= 4'd9);
endmodule
