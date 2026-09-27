`timescale 1ns/1ps

module register_tb;

    reg clk;
    reg rst;
    reg we;
    reg [7:0] d;
    wire [7:0] q; // Instantiate Register Module
    register uut (
        .clk(clk),
        .rst(rst),
        .we(we),
        .d(d),
        .q(q)
    );

    // Clock Generation (Period = 10ns)
    always #5 clk = ~clk;

    initial begin
        // Waveform file dumping for GTKWave
        $dumpfile("register_tb.vcd");
        $dumpvars(0, register_tb);

        // 1. Initialize Inputs
        clk = 0;
        rst = 1; // Start in Reset state
        we = 0;
        d = 8'h00;

        #12;
        rst = 0; // Release Reset

        // 2. Try writing data without Write Enable (we = 0)
        #10;
        d = 8'hAA; // Output q should REMAIN 00 because we=0

        // 3. Enable Write (we = 1)
        #10;
        we = 1;    // Output q should become 8'hAA on next clock edge

        // 4. Change input without Write Enable
        #10;
        we = 0;
        d = 8'h55; // Output q should STILL REMAIN 8'hAA

        // 5. Test Asynchronous Reset mid-operation
        #10;
        rst = 1;   // Output q should INSTANTLY drop to 00 without waiting for clk

        #10;
        $finish;
    end

endmodule