module decoder (
    input  [15:0] instr,
    output [3:0]  opcode,
    output [1:0]  rd,
    output [1:0]  rs1,
    output [1:0]  rs2,
    output [7:0]  imm
);

    assign opcode = instr[15:12];
    assign rd     = instr[11:10];
    assign rs1    = instr[9:8];
    assign rs2    = instr[7:6];
    assign imm    = instr[7:0];

endmodule