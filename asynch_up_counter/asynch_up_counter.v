
module asynch_up_counter
#(parameter n = 4)
(
input clk,
input reset_n,
output [n-1:0]Q
);
generate
	genvar i;
	for(i = 0; i < n; i = i + 1) 
	begin: stage
		if(i == 0)
			T_FF A(.clk(clk), .T(1'b1), .reset_n(reset_n), .Q(Q[i]));
		else
			T_FF A(.clk(~Q[i-1]), .T(1'b1), .reset_n(reset_n), .Q(Q[i]));
	end
endgenerate

endmodule

