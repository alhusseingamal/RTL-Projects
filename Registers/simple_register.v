
module simple_register
#(parameter n = 4)
(
input clk,
input [n-1:0]I,
output[n-1:0]Q
);

// structural representation
/*
genvar i
generate
	for(i = 0; i < n; i = i + 1)
	begin: FF
		D_FF_reset(.clk(clk), .D(I[i]), .Q(Q[k]), .reset_n(), .clear_n());
	end
endgenerate
*/

reg [n-1:0]Q_reg, Q_next;

// behavioral representation

// sequential part
always @(posedge clk)
begin
	Q_reg <= Q_next;	
end

// combinational part
always @(I)
begin
	Q_next = I;
end
assign Q = Q_reg;

endmodule

