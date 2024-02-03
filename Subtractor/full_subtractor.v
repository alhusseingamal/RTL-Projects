`include "half_subtractor.v"

module full_subtractor(a, b, borrow_in, difference, borrow_out);
input a, b, borrow_in;
output difference, borrow_out;

half_subtractor h0(.a(a), .b(b), .difference(h0_difference), .borrow(h0_borrow));
half_subtractor h2(.a(h0_difference), .b(borrow_in), .difference(h1_difference), .borrow(h1_borrow));
assign difference = h1_difference;
or(borrow, h0_borrow, h1_borrow);
endmodule
