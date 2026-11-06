module controlunit (
    input  [3:0] opcode,
    output       reg_write,
    output       use_imm,
    output [2:0] alu_op
);

    //assign blocks for all the outputs
    assign reg_write = 1'b1;
    assign use_imm = opcode[3];
    assign alu_op = opcode[2:0];

endmodule