
module universal_shift_register
#(parameter n = 4)
(
input clk,
input reset_n,
input MSB_in, // serial input - MSB(left) - for shift right operation
input LSB_in, // serial input - LSB(right) - for shift left operation
input [n-1:0]I, // parallel input
input [1:0]s, // 00 : no change, 01: shift right, 10: shift left, 11: parallel load
output [n-1:0]Q
);

reg [n-1:0] Q_reg, Q_next;

always @(posedge clk, negedge reset_n)
begin
	if(!reset_n)
		Q_reg <= 'b0;
	else
		Q_reg <= Q_next;
end

// Next state logic
always @(s, Q_reg, I, MSB_in, LSB_in)
begin
	Q_next = Q_reg;
	case (s)
		2'b00: Q_next = Q_reg;
		2'b01: Q_next = {MSB_in, Q_reg[n-1:1]};
		2'b10: Q_next = {Q_reg[n-2:0], LSB_in};
		2'b11: Q_next = I;
		default: Q_next = Q_reg;
	endcase
end

// output logic
assign Q = Q_reg;

endmodule

