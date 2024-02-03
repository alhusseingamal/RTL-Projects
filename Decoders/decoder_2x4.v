module decoder_2x4
#()
(
input [1:0]w,
input en,
output reg [0:3]y // here we have changed the convention, y[3] is the LSB and y[0] is the MSB
);
always @(*)
begin
	y = 4'b0000; // default value
	if(en)
		if(w == 2'b00) y = 4'b1000;
		else if(w == 2'b01) y = 4'b0100;
		else if(w == 2'b10) y = 4'b0010;
		else if(w == 2'b11) y = 4'b0001;
		else y = 4'b0000; // technically, we don't need that as we accounted for all cases
	else
		y = 4'b0000;
		
end
endmodule
