module dff_from();

wire Q, Qbar;
reg D, CLK;

nand U1(X, D, CLK);
nand U2(Y, X, CLK);
nand U3(Q, Qbar, X);
nand U4(Qbar, Q, Y);

initial begin
    $monitor ("D=%b CLK=%b Q=%b Qbar=%b", D, CLK, Q, Qbar);
     $dumpfile("dff.vcd");
    $dumpvars(0, dff_from);
    D=0;
    CLK=0;
    #10 D=1;
    #10 D=0;
    #10 $finish;

end

always #5 CLK= ~CLK;

endmodule