`timescale 1ns/1ps

module pc_tb;
reg clk;
reg rst;
wire [7:0]pc_out;

pc uut(
    .clk(clk),
    .rst(rst),
    .pc_out(pc_out)
);
always #5 clk = ~clk;
initial begin
    $dumpfile("pc_tb.vcd");
    $dumpvars(0,pc_tb);

    clk=0;
    rst=1;
    #10;

    rst=0;
    #50;

    rst=1;
    #10;

    $finish;
end
endmodule
