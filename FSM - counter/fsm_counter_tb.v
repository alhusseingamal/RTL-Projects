
module fsm_counter_tb;

reg clk, reset_n, en;
wire [2:0]num;

// instantiate module(s)/unit(s) under test

fsm_counter uut(
.clk(clk),
.reset_n(reset_n),
.en(en),
.num(num)
);


// generate a clock signal

localparam T = 10;
always
	#(T/2) clk = ~clk;

initial
begin
	clk = 1'b0;
	reset_n = 1'b0;
	en = 1'b0;
	@(negedge clk);
	reset_n = 1'b1;
	en = 1'b1;

	repeat(20) @(negedge clk);	
	$finish;
end

endmodule

