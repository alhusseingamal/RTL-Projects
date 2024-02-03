
module mux_2x1_nbit
#(parameter n = 3)
(
input[n-1:0] x0, x1,
input s,
output reg [n-1:0]y
);


always @(*)
begin
y = s ? x1 : x0;
end
endmodule
