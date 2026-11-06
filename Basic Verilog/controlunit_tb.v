module controlunit_tb;
reg [3:0] opcode;
wire reg_write;
wire use_imm;
wire [2:0] alu_op;

controlunit uut(
    .opcode(opcode),
    .reg_write(reg_write),
    .use_imm(use_imm),
    .alu_op(alu_op)
);

initial begin
    $dumpfile("controlunit.vcd");
    $dumpvars(0,controlunit_tb);

    $monitor("opcode=%b reg_write=%b use_imm=%b alu_op=%b", opcode, reg_write, use_imm, alu_op);

    opcode = 4'b0000;
    #10;
    opcode = 4'b1000;
    #10;
    opcode = 4'b0101;
    #10
    opcode = 4'b0001;
    #10;
    $finish;
end

endmodule