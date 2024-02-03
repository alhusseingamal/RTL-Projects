
module up_down_load_counter
#(parameter n = 4)
(
input clk, reset_n, en, up, load,
input [n-1:0] D, Q
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
always @(up, Q_reg, load, D)
begin
	Q_next = Q_reg;
	if(en)
	casex({load, up})
		2'b00: Q_next = Q_reg - 1;
		2'b01: Q_next = Q_reg + 1;
		2'b1x: Q_next = D;
		default: Q_next = Q_reg;
	endcase
end

// output logic
assign Q = Q_reg;

endmodule
