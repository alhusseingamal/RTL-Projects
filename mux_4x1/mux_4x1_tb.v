`include "mux_4x1.v"
`timescale 1ns / 1ps

module mux_4x1_tb;
reg [3:0]x;
reg [1:0]sel;
wire y;

mux_4x1 uut(.x0(x[0]), .x1(x[1]), .x2(x[2]), .x3(x[3]), .s0(sel[0]), .s1(sel[1]), .y(y));

initial begin
x = 4'b1001;

#2 sel = 2'b00;
#2 sel = 2'b01;
#2 sel = 2'b10;
#2 sel = 2'b11;

end
endmodule

