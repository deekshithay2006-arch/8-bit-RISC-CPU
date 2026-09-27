module register (
    input wire clk,
    input wire rst,
    input wire we,
    input wire [7:0] d,
    output reg [7:0] q
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 8'h00;   // Reset high aingane 8-bit output clear (0) avthundi
        end
        else if (we) begin
            q <= d;       // Write enable high aithassalu input d val output q lo store avthundi
        end
    end

endmodule