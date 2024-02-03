
module encoder_generic
#(parameter n = 2)
(
input [0 : 2**n - 1]w,
input en,
output reg [0 : n - 1]y // here y[0] = MSB
);
always @(*)
begin
	y = 'b0; // default value
	if(en)
		y[w] = 1'b1; // just put a 1 at the w'th bit
	else
		y = 'b0;
		
end
endmodule