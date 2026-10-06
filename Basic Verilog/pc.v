module pc (
    input wire clk,
    input wire rst,
    output reg [7:0] pc_out
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // 1. Reset logic: pc_out value zero aipovali
            pc_out <= 8'h00;
        end
        else begin
            // 2. Normal logic: pc_out count 1 increment avvali (pc_out + 1)
            pc_out <= pc_out + 1'b1 ;
        end
    end

endmodule