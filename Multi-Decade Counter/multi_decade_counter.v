
module multi_decade_counter
(
input clk,
input reset_n,
input en,
wire done, // for the ability to even cascade to multiple multi_decade_counter themselves
output [3:0] ones, tens, hundreds
);

wire done0, done1, done2;
wire a0, a1, a2;

BCD_counter D0(
.clk(clk),
.reset_n(reset_n),
.en(en),
.done(done0),
.Q(ones)
);

assign a0 = en  & done0;

BCD_counter D1(
.clk(clk),
.reset_n(reset_n),
.en(a0),
.done(done1),
.Q(tens)
);

assign a1 = a0 & done1;

BCD_counter D2(
.clk(clk),
.reset_n(reset_n),
.en(a1),
.done(done2),
.Q(hundreds)
);

assign a2 = a1 & done2;

assign done = a2;

endmodule

