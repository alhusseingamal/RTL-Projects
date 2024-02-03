
module half_subtractor(input a, b, output difference, borrow);
not(a_, a);
xor(difference, a, b);
and(borrow, a_, b);
endmodule