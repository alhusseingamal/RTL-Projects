
module synch_up_counter
#(parameter n = 4)
(
input clk,
input en,
input reset_n,
output [n-1:0]Q
);

wire [n-1:0]Q_next;
generate
	genvar i;
	for(i = 0; i < n; i = i + 1) 
	begin: stage
		if(i == 0)		
			assign Q_next[i] = en;			
		else
			assign Q_next[i] = Q[i-1] & Q_next[i-1];
		T_FF FF(.clk(clk), .T(Q_next[i]), .reset_n(reset_n), .Q(Q[i]));
	end
endgenerate
endmodule
