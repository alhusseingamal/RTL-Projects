`timescale 1ns / 1ps
module D_FF_set_reset
(
input D,
input clk,
input reset_n, // asynchronous reset
input set_n, // synchronous set
output Q
);

reg Q_reg, Q_next;

always @(negedge clk, negedge reset_n)
begin
	if(!reset_n) 	
		Q_reg <= 1'b0;
	else
		Q_reg <= Q_next;
end

always @(D, set_n)
begin
	Q_next = Q_reg; // just a default value for the sake of completion
	if(!set_n)
		Q_next = 1'b1;
	else
		Q_next = D;
end

assign Q = Q_reg;

endmodule

	
