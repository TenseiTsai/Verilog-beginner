`include "addbit.v"
module adder_hier(
    result,
    carry, 
    r1,
    r2,
    ci
);

input [3:0]r1;
input [3:0]r2;
input ci;

output[3:0]result;
output carry;


//port witres
wire [3:0] r1;
wire [3:0] r2;
wire ci;
wire [3:0]result;
wire carry;
//internal variable
wire c1;
wire c2;
wire c3;

//Code start here
addbit u0(r1[0], r2[0],ci, result[0], c1);
addbit u1(r1[1], r2[1],ci, result[1], c2);
addbit u2(r1[2], r2[2],ci, result[2], c3);
addbit u3(r1[3], r2[3],ci, result[3], carry);


endmodule



module tb();

reg [3:0]r1,r2;
reg ci;
wire [3:0]result;
wire carry;


initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0, tb);
    r1=0;
    r2=0;
    ci=0;
    #10 r1=10;
    #10 r2=2;
    #10 ci=1;
    #10 $display ("+---------------------------------------------+");
    $finish;
end


// connect lower module
adder_hier U(result, carry, r1, r2, ci);
initial begin 
    $display("+---------------------------------------");
    $display("|r1|r2|ci|u0.sum|u1.sum|u2.sum|u3.sum");
    $display("+---------------------------------------+)");
    $monitor ("|%h|%h|%h|%h|%h|%h|%h|", r1,r2,ci, tb.U.u0.sum, tb.U.u1.sum, tb.U.u2.sum, tb.U.u3.sum);
end
endmodule