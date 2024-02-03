`include "mux_4x1_nbit.v"
`timescale 1ns / 1ps

module mux_4x1_nbit_tb;
parameter n = 4;
reg [n-1:0]x0, x1, x2, x3;
reg [1:0]s;
wire [n-1:0]y;

mux_4x1 #(.n(n)) uut(
.x0(x0),
.x1(x1),
.x2(x2),
.x3(x3),
.s(s),
.y(y));

initial begin
x0 = 4'b1001;
x1 = 4'b1101;
x2 = 4'b1011;
x3 = 4'b0011;

#2 s = 2'b00;
#2 s = 2'b01;
#2 s = 2'b10;
#2 s = 2'b11;

end
endmodule

