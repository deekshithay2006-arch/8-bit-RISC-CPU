module decoder_tb;
reg [15:0] instr;
wire [3:0] opcode;
wire [1:0] rd;
wire [1:0] rs1;
wire [1:0] rs2;
wire [7:0] imm;

decoder uut(
    .instr(instr),
    .opcode(opcode),
    .rd(rd),
    .rs1(rs1),
    .rs2(rs2),
    .imm(imm)
);

initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(0,decoder_tb);

    $monitor("instr=%b opcode=%b rd=%b rs1=%b rs2=%b imm=%b", instr, opcode, rd, rs1, rs2, imm);
    instr = 16'b0010000110000000;
    #10;
    instr = 16'b0001100111000000;
    #10;
    instr = 16'b0000000110000000;
    #10;
    $finish;
end
endmodule