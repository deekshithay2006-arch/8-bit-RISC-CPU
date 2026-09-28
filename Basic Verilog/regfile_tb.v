`timescale 1ns/1ps

module regfile_tb;

    // Inputs -> reg
    reg clk;
    reg rst;
    reg we;
    reg [1:0] w_addr;
    reg [7:0] w_data;
    reg [1:0] r_addr1;
    reg [1:0] r_addr2;

    // Outputs -> wire
    wire [7:0] r_data1;
    wire [7:0] r_data2;
    regfile uut (
        .clk(clk),
        .rst(rst),
        .we(we),
        .w_addr(w_addr),
        .w_data(w_data),
        .r_addr1(r_addr1),
        .r_addr2(r_addr2),
        .r_data1(r_data1),
        .r_data2(r_data2)
    );
    always #5 clk = ~clk;
    initial begin
        // GTKWave File setup
        $dumpfile("regfile_tb.vcd");
        $dumpvars(0, regfile_tb);

        // 1. Start with Reset
        clk = 0;
        rst = 1;
        we = 0;
        w_addr = 0; w_data = 0;
        r_addr1 = 0; r_addr2 = 0;

        #12;
        rst = 0; // Release Reset

        // 2. Write 8'hA1 into Register 0 (w_addr = 2'b00)
        #10;
        we = 1;
        w_addr = 2'b00;
        w_data = 8'hA1;

        // 3. Write 8'hB2 into Register 1 (w_addr = 2'b01)
        #10;
        w_addr = 2'b01;
        w_data = 8'hB2;

        // 4. Read Register 0 and Register 1 together!
        #10;
        we = 0; // Stop writing
        r_addr1 = 2'b00; // Read Reg 0 (Expect A1 on r_data1)
        r_addr2 = 2'b01; // Read Reg 1 (Expect B2 on r_data2)

        #20;
        $finish;
    end
endmodule