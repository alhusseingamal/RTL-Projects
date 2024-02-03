
// a register that can be loaded with value
module simple_register_load
#(parameter n = 4)
(
input clk,
input load,
input [n-1:0]I,
output[n-1:0]Q
);

reg [n-1:0]Q_reg, Q_next;

// sequential part
always @(posedge clk)
begin
	Q_reg <= Q_next;	
end

// combinational part
always @(I, load)
begin
	Q_next = Q_reg; // default value
	if(load)
		Q_next = I;
	else
		Q_next = Q_reg;
end	
assign Q = Q_reg;
endmodule

