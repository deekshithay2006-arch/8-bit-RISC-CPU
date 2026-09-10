module half_adder_tb;
reg A;
reg B;
wire S;
wire C;

half_adder uut(
    .A(A),
    .B(B),
    .S(S),
    .C(C)
);
initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(0,half_adder_tb);
    $monitor("A=%b B=%b S=%b C=%b",A,B,S,C);
    A=0; B=0;
    #10;
    A=0; B=1;
    #10;
    A=1; B=0;
    #10;
    A=1; B=1;
    #10;
    $finish;
end
endmodule    