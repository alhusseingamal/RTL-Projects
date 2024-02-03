`timescale 1ns / 1ps
module mux_2x1(input x0, input x1, input sel, output y);
assign y = sel ? x1 : x0;
endmodule