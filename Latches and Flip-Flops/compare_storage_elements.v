
module compare_storage_elements
(
input D, clk,
output Qa, Qb, Qc
);

D_latch(.D(D), .clk(clk), .Q(Qa), .Q_n());

D_FF_neg(.D(D), .clk(clk), .Q(Qb));

D_FF_pos(.D(D), .clk(clk), .Q(Qc));
endmodule
