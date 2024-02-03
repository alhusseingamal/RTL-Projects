
module priority_encoder_4x2
(
input [3:0]w,
input en,
output reg [1:0]y,
output z
);
always @(*)
begin
	y = 2'bxx; // default value
	if(en)
		casex (w)
			4'b1xxx: y = 2'b11;
			4'b01xx: y = 2'b10;
			4'b001x: y = 2'b01;
			4'b0001: y = 2'b00;
			default: y = 2'bxx;
		endcase
	else
		y = 2'bxx;
		
end
endmodule
