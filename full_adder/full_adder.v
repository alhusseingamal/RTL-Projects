`include "../half_adder/half_adder.v"
`timescale 1ns / 1ps
module full_adder(a, b, c, sum, carry);
input a, b, c;
output sum, carry;
wire sum_h1, sum_h2;

half_adder h1(a, b, sum_h1, carry_h1);
half_adder h2(c, sum_h1, sum, carry_h2);
or(carry, carry_h1, carry_h2);
endmodule

