`timescale 1ns / 1ps

module tb_alu;

    // 1. Testbench Signals (Inputs become 'reg', Outputs become 'wire')
    reg  [7:0] A;
    reg  [7:0] B;
    reg  [2:0] ALU_Sel;
    wire [7:0] ALU_Out;
    wire CarryOut;
    wire Zero;

    // 2. Unit Under Test
    alu uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .CarryOut(CarryOut),
        .Zero(Zero)
    );

    // 3. Apply Test Inputs Sequentially
    initial begin
        // Setup GTKWave dump file
        $dumpfile("alu_test.vcd");
        $dumpvars(0, tb_alu);

        // Test 1: ADD (10 + 20)
        A = 8'd10; B = 8'd20; ALU_Sel = 3'b000;
        #10; // Wait 10 nanoseconds

        // Test 2: SUB (20 - 10)
        A = 8'd20; B = 8'd10; ALU_Sel = 3'b001;
        #10;

        // Test 3: ZERO FLAG CHECK (5 - 5)
        A = 8'd5; B = 8'd5; ALU_Sel = 3'b001;
        #10;

        // Test 4: Bitwise AND (3 & 4)
        A = 8'd3; B = 8'd4; ALU_Sel = 3'b010;
        #10;

        // Test 5: Shift Left (3)
        A = 8'd3; ALU_Sel = 3'b110;
        #10;

        $display("Simulation Finished!");
        $finish; // Stop simulation
    end

endmodule