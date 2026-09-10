module adder_8bit(
    input [7:0] A,
    input [7:0] B,
    output [7:0] S,
    output C
);
wire [8:0] result;
assign result = A+B;
assign S = result[7:0];
assign C = result[8];

endmodule