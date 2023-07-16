`timescale 1ns/1ns
`include "Divider.v"

module Dividertb ;
reg [7:0]a;
reg [7:0]b;
reg [6:0]f;
reg [7:0]cin;
wire [7:0]q;
wire [7:0]r;
wire overflow;
integer i;

Unsigned_Divider divider (.a(a), .b(b), .f(f), .cin(cin), .q(q), .r(r), .overflow(overflow));

initial begin
    $dumpfile("Divider.vcd");
    $dumpvars();

    for (i = 0; i <= 10; i=i+1) begin
            a = $random;
            b = $random;
            f = 7'b0000000;
            cin = 8'b11111111;
            #5;
        end
    end



endmodule