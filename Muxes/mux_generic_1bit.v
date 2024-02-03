
module mux_generic_1bit
#(parameter INS = 4)
(
input [INS-1:0]x,
input [$clog2(INS):0]s,
output reg y
);

integer i;
always @(*)
begin
	y = 'bx;
	for(i = 0; i < INS; i = i + 1)
		if(i == s)
			y = s[i];
end
endmodule
