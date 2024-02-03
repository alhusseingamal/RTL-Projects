`timescale 1ns / 1ps
module mod_counter_tb;
localparam N = 10;
localparam n = $clog2(N);
reg clk, reset_n, en;
wire [n-1:0]Q;


// Initiate module under test
mod_counter #(.N(N)) uut(
.clk(clk),
.en(en),
.reset_n(reset_n),
.Q(Q)
);

// timer
initial
	#400 $stop;

// generate stimuli

// generating a clk signal

localparam T = 10;
always
begin
	clk = 1'b0;
	#(T/2);
	clk = 1'b1;
	#(T/2);
end

initial
begin
	// issue a quick reset for 2ns
	reset_n = 1'b0;
	#2
	reset_n = 1'b1;
	#2
	en = 1'b1;

	repeat(N + 3)@ (negedge clk);
	#20 $stop;
end

endmodule
