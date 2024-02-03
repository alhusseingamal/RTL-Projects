
module encoder_4x2
(
input [3:0]w,
input en,
output reg [1:0]y 
);
always @(*)
begin
	y = 2'bxx; // default value
	if(en)
		case (w)
			4'b0001: y = 0;
			4'b0010: y = 1;
			4'b0100: y = 2'b10;
			4'b1000: y = 2'b11;
			default: y = 2'bxx;
		endcase
	else
		y = 2'bxx;
		
end
endmodule
