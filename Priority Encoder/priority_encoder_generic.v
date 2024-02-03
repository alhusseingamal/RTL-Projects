
module priority_encoder_generic
#(parameter n = 4)
(
input [n-1:0]w,
output reg [$clog2(n)-1:0]y,
output z
);

assign z = |w;

integer i;

always @(w)
begin
	y = 'bx;
	for(i = 0; i < n; i = i + 1)
		if(w[i])
			y = i;
		
end
endmodule


/*
Illustration Example:
	4 bit Priority Encoder
Truth Table:
w3	w2	w1	w0	|	y1	y0	z
0	0	0	0	|	d	d	0
0	0	0	1	|	0 	0	1
0	0	1	x	|	0	1	1
0	1	x	x	|	1	0	1
1	x	x	x	|	1	1	1

The code subtly implements this truth table
*/
