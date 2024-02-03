
// video 30 - registers in verilog
module LFSR
#(parameter n = 3)
(
input clk,
input reset_n,
output [1:n] Q // opposite to the convention, MSB has index 1 and not n-1
);

reg[1:n]Q_reg, Q_next;
wire taps;

always @(posedge clk, negedge reset_n)
begin
	if(~reset_n)
		Q_reg <= 'd1; // reset to 1. It shouldn't start with 0 or FFFF
	else
		Q_reg <= Q_next;
end


// Next state logic
always @(taps, Q_reg)
	Q_next = {taps, Q_reg[1:n-1]};

assign Q = Q_reg;

// n = 3
assign taps = Q_reg[3] ^ Q_reg[2];

// n = 8
// assign taps = Q_reg[8] ^ Q_reg[6] ^ Q_reg[5] ^ Q_reg[4];

/*
	For maximum length LFSR taps, check the table in the following link
	https://www.xilinx.com/support/documentation/application_notes/xapp052.pdf
*/

endmodule

