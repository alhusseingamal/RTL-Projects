module D_latch
(
input D,
input clk,
output reg Q,
output Q_n
);

always @(D, clk)
begin
//	Q = Q;
	if(clk)
	Q = D;
//	else
//	Q = Q;
// The commented lines can be uncommented for good coding style. Even without them, the synthesizer should still infer a latch
end
assign Q_n = ~Q;

endmodule
