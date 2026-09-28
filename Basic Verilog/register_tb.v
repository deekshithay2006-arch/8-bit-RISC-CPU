`timescale 1ns/1ps

module register_tb;

    // Testbench signals
    reg clk;
    reg rst;
    reg we;
    reg [7:0] d;

    wire [7:0] q;

    // DUT (Device Under Test)
    register uut (
        .clk(clk),
        .rst(rst),
        .we(we),
        .d(d),
        .q(q)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    initial begin
        // Waveform file dumping for GTKWave
        $dumpfile("register_tb.vcd");
        $dumpvars(0, register_tb);

        // 1. Initialize Inputs
        clk = 0;
        rst = 1;
        we  = 0;
        d   = 8'h00;

        #12;
        rst = 0;          // Release reset

        // 2. Try writing without WE
        #10;
        d = 8'hAA;        // q should remain 00

        // 3. Enable write
        #10;
        we = 1;           // q becomes AA at next rising edge

        // 4. Disable write and change data
        #10;
        we = 0;
        d = 8'h55;        // q should still remain AA

        // 5. Asynchronous reset
        #10;
        rst = 1;          // q instantly becomes 00

        #10;
        $finish;
    end

endmodule