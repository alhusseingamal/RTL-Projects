
// In this example we cascade two multi_decade counters to count up to 999,999

`timescale 1ns / 1ps
module multiple_multi_decade_counter_tb;
reg clk, reset_n, en;
wire [3:0]ones, tens, hundreds, thousands, ten_thousands, hundred_thousands;
wire done0, done;
wire a0, a;
// Initiate module under test
multi_decade_counter uut0(
.clk(clk),
.en(en),
.reset_n(reset_n),
.ones(ones),
.tens(tens),
.hundreds(hundreds),
.done(done0)
);

assign a0 = en & done0;

multi_decade_counter uut1(
.clk(clk),
.en(a0),
.reset_n(reset_n),
.ones(thousands),
.tens(ten_thousands),
.hundreds(hundred_thousands),
.done(a)
);

assign done = a;


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
	
	wait(done); // wait until we are done; this happens at countrer value of 999,999

	#20 $stop;
end

endmodule
