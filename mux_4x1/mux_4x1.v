`include "../mux_2x1/mux_2x1.v"
`timescale 1ns / 1ps

module mux_4x1(x0, x1, x2, x3, s0, s1, y);
input x0, x1, x2, x3;
input s0, s1;
output y;
mux_2x1 m0(.x0(x0), .x1(x1), .sel(s0), .y(m0_y));
mux_2x1 m1(.x0(x2), .x1(x3), .sel(s0), .y(m1_y));
mux_2x1 m2(.x0(m0_y), .x1(m1_y), .sel(s1), .y(y));
endmodule
