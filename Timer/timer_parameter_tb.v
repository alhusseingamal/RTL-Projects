`timescale 1ns / 1ps
module timer_parameter_tb;
localparam N = 49_999;
reg clk, reset_n, en;
wire done;


// Initiate module under test
timer_parameter #(.N(N)) uut(
.clk(clk),
.en(en),
.reset_n(reset_n),
.done(done)
);

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

	wait(done);

	#20 $stop;
end

endmodule
