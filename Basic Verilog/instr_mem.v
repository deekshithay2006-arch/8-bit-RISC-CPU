module instr_mem(
    input [7:0] addr,
    output [15:0] instr
);
reg [15:0] mem [0:15];
initial begin
    mem[0] = 16'b1000010000000101;
    mem[1] = 16'b1000100000000011;
    mem[2] = 16'b0000110110000000;
    end
    assign instr = mem[addr[3:0]];
endmodule