
module mux_4x1_nbit
#(parameter n = 3)
(
input [n-1:0]x0, x1, x2, x3,
input [1:0]s,
output reg [n-1:0]y
);

always @ (*)
begin
case (s)
2'b00: y = x0;
2'b01: y = x1;
2'b10: y = x2;
2'b11: y = x3;
default: y = 'bx;
endcase
// or just
// y = s[1] ? (s[0] ? x3: x2):(s[0] ? x1: x0);
end
endmodule
