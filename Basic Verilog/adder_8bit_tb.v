module adder_8bit_tb;
reg [7:0] A;
reg [7:0] B;
wire [7:0] S;
wire C;

adder_8bit uut(
    .A(A),
    .B(B),
    .S(S),
    .C(C)
);

initial begin
    $dumpfile("adder_8bit.vcd");
    $dumpvars(0,adder_8bit_tb);
    $monitor("A=%b B=%b S=%b C=%b", A,B,S,C);
    A = 8'b10001100; B = 8'b00001111;
    #10;
    A = 8'b11110000; B = 8'b11110000;
    #10;
    A = 8'b00101011; B = 8'b11000011;
    #10;
    $finish;
end    
endmodule    
    