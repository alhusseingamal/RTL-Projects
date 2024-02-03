`include "mux_2x1.v"
`timescale 1ns / 1ps
module mux_2x1_tb;
reg [1:0]x;
reg sel;
wire y;

mux_2x1 uut(.x0(x[0]), .x1(x[1]), .sel(sel), .y(y));
initial begin
x[1] = 1'b1;
x[0] = 1'b0;

#2 sel = 1'b0;
#2 sel = 1'b1;
#2 sel = 1'b0;
#2 sel = 1'b1;
#2 sel = 1'b0;
#2 sel = 1'b1;
end
endmodule
