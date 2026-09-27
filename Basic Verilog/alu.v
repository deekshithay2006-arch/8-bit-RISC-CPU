// 1. Module Name & Pin List
module alu (
    input  [7:0] A,          // 8-bit Input A
    input  [7:0] B,          // 8-bit Input B
    input  [2:0] ALU_Sel,    // 3-bit Operation Select
    output reg [7:0] ALU_Out,// 8-bit Output Result
    output reg CarryOut,     // 1-bit Carry Output
    output Zero              // 1-bit Zero Flag Output
);

    // 2. Zero Flag Hardware Connection (Uses ? and :)
    assign Zero = (ALU_Out == 8'b00000000) ? 1'b1 : 1'b0;

    // 3. Main Combinational Logic Block
    always @(*) begin
        // Default Carry Value
        CarryOut = 1'b0;

        // 4. Operation Selector Switch Box
        case (ALU_Sel)
            3'b000: {CarryOut, ALU_Out} = A + B; // ADD
            3'b001: {CarryOut, ALU_Out} = A - B;            // SUB
            3'b010: ALU_Out = A & B;            // Bitwise AND
            3'b011: ALU_Out = A | B;                 // Bitwise OR  
            3'b100: ALU_Out = A ^ B;                 // Bitwise XOR 
            3'b101: ALU_Out = ~A;                 // Bitwise NOT -> Fill this (~A)
            3'b110: ALU_Out = A << 1;                 // Shift Left  -> Fill this (A << 1)
            3'b111: ALU_Out = A >> 1;                 // Shift Right -> Fill this (A >> 1)
            default: ALU_Out = 8'b00000000;
        endcase
    end

endmodule