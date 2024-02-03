
module mod_counter
#(parameter N = 10)
(
input clk,
input reset_n,
input en,
output [$clog2(N-1)-1:0] Q
);

 localparam n = $clog2(N-1); // the number of bits needed to represent the counter values

reg [n-1:0]Q_reg, Q_next;
wire done;

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

assign done = Q_reg == N - 1;

always @(*)
	Q_next = done ? 'b0 : Q_reg + 1;		

// output logic
assign Q = Q_reg;

endmodule

