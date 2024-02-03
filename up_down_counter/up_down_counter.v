
module up_down_counter
#(parameter n = 4)
(
input clk,
input reset_n, // asynchronous reset
input en, // synchronous enable
input up,
output [n-1:0]Q
);

reg [n-1:0]Q_reg, Q_next;

always @(posedge clk, negedge reset_n)
begin
	if(~reset_n)
		Q_reg <= 0;
	else if(en)
		Q_reg <= Q_next;
	else
		Q_reg <= Q_reg; // not necessary but just makes the code more robust
end


// Next state logic
always @(up, Q_reg)
begin
	if(up)
		Q_next = Q_reg + 1;
	else
		Q_next = Q_reg - 1;
end

// output logic
assign Q = Q_reg;

endmodule
