`timescale 1ns / 1ps
module compare_storage_elements_tb;

// Declare local reg and wire
reg clk, D;
wire Q_latch, Q_ff_neg, Q_ff_pos;

// instantiate the unit under test
compare_storage_elements uut
(
.D(D),
.clk(clk),
.Qa(Q_latch),
.Qb(Q_ff_neg),
.Qc(Q_ff_pos)
);

// Generate stimuli, using initial and always
// There's many ways to generate a clock in verilog, here's one of them

localparam T = 20; // clock period

always
begin
clk = 1'b0;
#(T/2);
clk = 1'b1;
#(T/2);
end

endmodule

