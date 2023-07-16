module SUB (input a, input b, input cin, output z, output cout);

wire x1, x2, x3, x4;

not(x1,b);
xor(x2,a,x1);
xor(z,x2,cin);
and(x3,a,x1);
and(x4,x2,cin);
or(cout,x3,x4);

endmodule



module PU(input a, input b, input cin, input sel, output cout, output z);

wire y;
SUB sub (.a(a), .b(b), .cin(cin), .z(y), .cout(cout));
assign z = sel ? y : a;

endmodule

module Unsigned_Divider(input [7:0]a, input [7:0]b, input[6:0]f, input [7:0]cin, output[7:0]q, output[7:0]r, output overflow);

wire [300:0]x;
wire [300:0]y;
//First layer
PU P0 (.a(a[7]), .b(b[0]), .cin(cin[0]), .sel(q[7]), .cout(x[0]), .z(y[0]));
PU P1 (.a(f[0]), .b(b[1]), .cin(x[0]), .sel(q[7]), .cout(x[1]), .z(y[1]));
PU P2 (.a(f[1]), .b(b[2]), .cin(x[1]), .sel(q[7]), .cout(x[2]), .z(y[2]));
PU P3 (.a(f[2]), .b(b[3]), .cin(x[2]), .sel(q[7]), .cout(x[3]), .z(y[3]));
PU P4 (.a(f[3]), .b(b[4]), .cin(x[3]), .sel(q[7]), .cout(x[4]), .z(y[4]));
PU P5 (.a(f[4]), .b(b[5]), .cin(x[4]), .sel(q[7]), .cout(x[5]), .z(y[5]));
PU P6 (.a(f[5]), .b(b[6]), .cin(x[5]), .sel(q[7]), .cout(x[6]), .z(y[6]));
PU P7 (.a(f[6]), .b(b[7]), .cin(x[6]), .sel(q[7]), .cout(x[7]), .z(y[7]));
assign q[7]= x[7];

//Second layer
PU P8 (.a(a[6]), .b(b[0]), .cin(cin[1]), .sel(q[6]), .cout(x[8]), .z(y[8]));
PU P9 (.a(y[0]), .b(b[1]), .cin(x[8]), .sel(q[6]), .cout(x[9]), .z(y[9]));
PU P10 (.a(y[1]), .b(b[2]), .cin(x[9]), .sel(q[6]), .cout(x[10]), .z(y[10]));
PU P11 (.a(y[2]), .b(b[3]), .cin(x[10]), .sel(q[6]), .cout(x[11]), .z(y[11]));
PU P12 (.a(y[3]), .b(b[4]), .cin(x[11]), .sel(q[6]), .cout(x[12]), .z(y[12]));
PU P13 (.a(y[4]), .b(b[5]), .cin(x[12]), .sel(q[6]), .cout(x[13]), .z(y[13]));
PU P14 (.a(y[5]), .b(b[6]), .cin(x[13]), .sel(q[6]), .cout(x[14]), .z(y[14]));
PU P15 (.a(y[6]), .b(b[7]), .cin(x[14]), .sel(q[6]), .cout(x[15]), .z(y[15]));
assign q[6]= x[15];

//Third layer
PU P16 (.a(a[5]), .b(b[0]), .cin(cin[2]), .sel(q[5]), .cout(x[16]), .z(y[16]));
PU P17 (.a(y[8]), .b(b[1]), .cin(x[16]), .sel(q[5]), .cout(x[17]), .z(y[17]));
PU P18 (.a(y[9]), .b(b[2]), .cin(x[17]), .sel(q[5]), .cout(x[18]), .z(y[18]));
PU P19 (.a(y[10]), .b(b[3]), .cin(x[18]), .sel(q[5]), .cout(x[19]), .z(y[19]));
PU P20 (.a(y[11]), .b(b[4]), .cin(x[19]), .sel(q[5]), .cout(x[20]), .z(y[20]));
PU P21 (.a(y[12]), .b(b[5]), .cin(x[20]), .sel(q[5]), .cout(x[21]), .z(y[21]));
PU P22 (.a(y[13]), .b(b[6]), .cin(x[21]), .sel(q[5]), .cout(x[22]), .z(y[22]));
PU P23 (.a(y[14]), .b(b[7]), .cin(x[22]), .sel(q[5]), .cout(x[23]), .z(y[23]));
assign q[5]= x[23];

//Forth layer
PU P24 (.a(a[4]), .b(b[0]), .cin(cin[3]), .sel(q[4]), .cout(x[24]), .z(y[24]));
PU P25 (.a(y[16]), .b(b[1]), .cin(x[24]), .sel(q[4]), .cout(x[25]), .z(y[25]));
PU P26 (.a(y[17]), .b(b[2]), .cin(x[25]), .sel(q[4]), .cout(x[26]), .z(y[26]));
PU P27 (.a(y[18]), .b(b[3]), .cin(x[26]), .sel(q[4]), .cout(x[27]), .z(y[27]));
PU P28 (.a(y[19]), .b(b[4]), .cin(x[27]), .sel(q[4]), .cout(x[28]), .z(y[28]));
PU P29 (.a(y[20]), .b(b[5]), .cin(x[28]), .sel(q[4]), .cout(x[29]), .z(y[29]));
PU P30 (.a(y[21]), .b(b[6]), .cin(x[29]), .sel(q[4]), .cout(x[30]), .z(y[30]));
PU P31 (.a(y[22]), .b(b[7]), .cin(x[30]), .sel(q[4]), .cout(x[31]), .z(y[31]));
assign q[4]= x[31];

//Fifth layer
PU P32 (.a(a[3]), .b(b[0]), .cin(cin[4]), .sel(q[3]), .cout(x[32]), .z(y[32]));
PU P33 (.a(y[24]), .b(b[1]), .cin(x[32]), .sel(q[3]), .cout(x[33]), .z(y[33]));
PU P34 (.a(y[25]), .b(b[2]), .cin(x[33]), .sel(q[3]), .cout(x[34]), .z(y[34]));
PU P35 (.a(y[26]), .b(b[3]), .cin(x[34]), .sel(q[3]), .cout(x[35]), .z(y[35]));
PU P36 (.a(y[27]), .b(b[4]), .cin(x[35]), .sel(q[3]), .cout(x[36]), .z(y[36]));
PU P37 (.a(y[28]), .b(b[5]), .cin(x[36]), .sel(q[3]), .cout(x[37]), .z(y[37]));
PU P38 (.a(y[29]), .b(b[6]), .cin(x[37]), .sel(q[3]), .cout(x[38]), .z(y[38]));
PU P39 (.a(y[30]), .b(b[7]), .cin(x[38]), .sel(q[3]), .cout(x[39]), .z(y[39]));
assign q[3]= x[39];

//Sixth layer
PU P40 (.a(a[2]), .b(b[0]), .cin(cin[5]), .sel(q[2]), .cout(x[40]), .z(y[40]));
PU P41 (.a(y[32]), .b(b[1]), .cin(x[40]), .sel(q[2]), .cout(x[41]), .z(y[41]));
PU P42 (.a(y[33]), .b(b[2]), .cin(x[41]), .sel(q[2]), .cout(x[42]), .z(y[42]));
PU P43 (.a(y[34]), .b(b[3]), .cin(x[42]), .sel(q[2]), .cout(x[43]), .z(y[43]));
PU P44 (.a(y[35]), .b(b[4]), .cin(x[43]), .sel(q[2]), .cout(x[44]), .z(y[44]));
PU P45 (.a(y[36]), .b(b[5]), .cin(x[44]), .sel(q[2]), .cout(x[45]), .z(y[45]));
PU P46 (.a(y[37]), .b(b[6]), .cin(x[45]), .sel(q[2]), .cout(x[46]), .z(y[46]));
PU P47 (.a(y[38]), .b(b[7]), .cin(x[46]), .sel(q[2]), .cout(x[47]), .z(y[47]));
assign q[2]= x[47];

//Seventh layer
PU P48 (.a(a[1]), .b(b[0]), .cin(cin[6]), .sel(q[1]), .cout(x[48]), .z(y[48]));
PU P49 (.a(y[40]), .b(b[1]), .cin(x[48]), .sel(q[1]), .cout(x[49]), .z(y[49]));
PU P50 (.a(y[41]), .b(b[2]), .cin(x[49]), .sel(q[1]), .cout(x[50]), .z(y[50]));
PU P51 (.a(y[42]), .b(b[3]), .cin(x[50]), .sel(q[1]), .cout(x[51]), .z(y[51]));
PU P52 (.a(y[43]), .b(b[4]), .cin(x[51]), .sel(q[1]), .cout(x[52]), .z(y[52]));
PU P53 (.a(y[44]), .b(b[5]), .cin(x[52]), .sel(q[1]), .cout(x[53]), .z(y[53]));
PU P54 (.a(y[45]), .b(b[6]), .cin(x[53]), .sel(q[1]), .cout(x[54]), .z(y[54]));
PU P55 (.a(y[46]), .b(b[7]), .cin(x[54]), .sel(q[1]), .cout(x[55]), .z(y[55]));
assign q[1]= x[55];

//Eigth layer
PU P56 (.a(a[0]), .b(b[0]), .cin(cin[7]), .sel(q[0]), .cout(x[56]), .z(r[0]));
PU P57 (.a(y[48]), .b(b[1]), .cin(x[56]), .sel(q[0]), .cout(x[57]), .z(r[1]));
PU P58 (.a(y[49]), .b(b[2]), .cin(x[57]), .sel(q[0]), .cout(x[58]), .z(r[2]));
PU P59 (.a(y[50]), .b(b[3]), .cin(x[58]), .sel(q[0]), .cout(x[59]), .z(r[3]));
PU P60 (.a(y[51]), .b(b[4]), .cin(x[59]), .sel(q[0]), .cout(x[60]), .z(r[4]));
PU P61 (.a(y[52]), .b(b[5]), .cin(x[60]), .sel(q[0]), .cout(x[61]), .z(r[5]));
PU P62 (.a(y[53]), .b(b[6]), .cin(x[61]), .sel(q[0]), .cout(x[62]), .z(r[6]));
PU P63 (.a(y[54]), .b(b[7]), .cin(x[62]), .sel(q[0]), .cout(x[63]), .z(r[7]));
assign q[0]= x[63];

assign overflow = ~(b[7]|b[6]|b[5]|b[4]|b[3]|b[2]| b[1]|b[0]);

endmodule

