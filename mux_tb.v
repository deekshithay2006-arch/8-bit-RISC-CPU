module mux_tb;
reg A;
reg B;
reg S;
wire Y;

mux uut(
  .A(A),
  .B(B),
  .S(S),
  .Y(Y)
);
initial begin
    $dumpfile("mux.vcd");
    $dumpvars(0 ,mux_tb);
    $monitor("A=%b B=%b S=%b Y=%b", A,B,S,Y);
    A=0; B=0; S=0;
    #10;
    A=0; B=0; S=1;
    #10;
    A=0; B=1; S=0;
    #10;
    A=0; B=1; S=1;
    #10;
    A=1; B=0; S=0;
    #10;
    A=1; B=0; S=1;
    #10;
    A=1; B=1; S=0;
    #10;
    A=1; B=1; S=1;
    #10;
    $finish;
end 
endmodule 