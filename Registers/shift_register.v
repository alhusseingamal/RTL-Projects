
module shift_register
#(parameter n = 4)
(
input SI,
input clk,
output [n-1:0]Q_out, // if we care about the full content and not just the last bit
output SO
);

reg[n-1:0]Q_reg, Q_next;


always @(posedge clk)
begin
	Q_reg <= Q_next;
end


// Next state logic
always @(SI, Q_reg)
begin
	// right shift
	Q_next = {SI, Q_reg[n-1:1]};

	// left shift
	// Q_next = {Q_reg[n-2:0], SI};
end

assign SO = Q_reg[0]; // for left shift that would be the MSB
assign Q_out = Q_reg;
endmodule

