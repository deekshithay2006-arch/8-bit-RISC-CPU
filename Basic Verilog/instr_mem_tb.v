module instr_mem_tb;
reg [7:0] addr;
wire [15:0] instr;

instr_mem uut(
    .addr(addr),
    .instr(instr)
);
initial begin
    $dumpfile("instr_mem.vcd");
    $dumpvars(0, instr_mem_tb);

        $monitor("addr=%d  instr=%b", addr, instr);
        addr = 0;  #10;
        addr = 1;  #10;
        addr = 2;  #10;
        addr = 3;  #10;
        $finish;
    end
endmodule