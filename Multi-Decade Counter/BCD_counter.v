
module BCD_counter
(
input clk,
input reset_n,
input en,
wire done,
output [3:0] Q
);

reg [3:0]Q_reg, Q_next;

always @(posedge clk, negedge reset_n)
begin
	if(~reset_n)
		Q_reg <= 0;
	else if(en)
		Q_reg <= Q_next;
	else
		Q_reg <= Q_reg;
end

// Next state logic

assign done = Q_reg == 9;

always @(*)
	Q_next = done ? 'b0 : Q_reg + 1;		

// output logic
assign Q = Q_reg;

endmodule

