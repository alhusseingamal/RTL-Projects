
`include "full_subtractor.v"
`timescale 1ns / 1ps

module subtractor(input[3:0]a, b, output[3:0]difference, output borrow_out);
full_subtractor S0(.a(a[0]), .b(b[0]), .borrow_in(0), .difference(difference[0]), .borrow_out(S0_borrow_out));
full_subtractor S1(.a(a[1]), .b(b[1]), .borrow_in(S0_borrow_out), .difference(difference[1]), .borrow_out(S1_borrow_out));
full_subtractor S2(.a(a[2]), .b(b[2]), .borrow_in(S1_borrow_out), .difference(difference[2]), .borrow_out(S2_borrow_out));
full_subtractor S3(.a(a[3]), .b(b[3]), .borrow_in(S2_borrow_out), .difference(difference[3]), .borrow_out(S3_borrow_out));

assign borrow_out = S3_borrow_out;
if(borrow_out) begin
	for(i = 0; i < 4; i = i + 1) begin
		assign difference[i] = ~difference[i];
	end
	assign difference = difference + 1;
	assign difference[4] = borrow_out;
end

endmodule
