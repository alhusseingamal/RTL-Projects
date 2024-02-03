`timescale 1ns / 1ps
module T_FF
(
input clk,
input T,
input reset_n,
output Q
);

localparam C2Q_DELAY = 2; // Clock-to-Q delay. To simulate the actual delay witnessed when we make an actual T-FF on an FPGA.

reg Q_reg;
wire Q_next;

always @(posedge clk, negedge reset_n)
begin
	if(~reset_n)
		Q_reg <= 1'b0;
	else
		#C2Q_DELAY Q_reg <= Q_next;
end

// Next state logic
assign Q_next = T ? ~Q_reg : Q_reg;

// Output logic
assign Q = Q_reg;

endmodule
