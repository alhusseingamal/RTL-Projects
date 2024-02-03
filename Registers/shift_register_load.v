
module shift_register_load
#(parameter n = 4)
(
input clk,
input SI, // serial input
input [n-1:0] I, // parallel n-bit input
input load, // 1 for loading a parallel input
input reset_n, // reset
output SO, // single output
output [n-1:0]Q
);

reg [n-1:0]Q_reg, Q_next;

always @(posedge clk, negedge reset_n)
begin
	if(!reset_n)
		Q_reg <= 'b0;
	else
		Q_reg <= Q_next;
end

// Next state logic

always @(load, I, SI, Q_reg)
begin
	if(load)
		Q_next = I;
	else
		Q_next = {SI, Q_reg[n-1:1]};
end

assign SO = Q_reg[0];
assign Q = Q_reg;
endmodule


