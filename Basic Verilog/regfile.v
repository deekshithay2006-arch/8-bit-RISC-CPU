module regfile (
    input wire clk,
    input wire rst,
    input wire we,
    input wire [1:0] w_addr,
    input wire [7:0] w_data,
    input wire [1:0] r_addr1,
    input wire [1:0] r_addr2,
    output wire [7:0] r_data1,
    output wire [7:0] r_data2
);

    // 1. Declare 2D Memory Array (4 registers, each 8-bit wide)
    reg [7:0] memory [0:3];

    // 2. Continuous Read Assignments (Combinational Read)
    // Write the two assign statements for r_data1 and r_data2 here
    assign r_data1 = memory[r_addr1];
    assign r_data2 = memory[r_addr2];

    // 3. Sequential Write Logic with Asynchronous Reset
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all 4 memory locations (0 to 3) to 8'h00
            memory[0] <= 8'h00;
            memory[1] <= 8'h00;
            memory[2] <= 8'h00;
            memory[3] <= 8'h00;
        end
        else if (we) begin
            // Write w_data into memory at index w_addr
            memory[w_addr] <= w_data;
        end
    end

endmodule