`timescale 1ns / 1ps
module asynch_up_counter_tb();

parameter n = 4;
reg clk, reset_n;
wire [n-1:0]Q;

asynch_up_counter #(.n(n)) uut(
.clk(clk),
.reset_n(reset_n),
.Q(Q)
);

initial
	#200 $stop;

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
		reset_n = 1'b0;
	#2 	reset_n = 1'b1;
end
endmodule

/*
						Ripple/Asynchronous Counters

	When we simulate this counter, we will notice a little glitch, since our T Flip-Flop has a 2 ns delay until the output reflects the input

	Assume we are working with a 4-bit counter

	What we will see is that unexpected results appear between the time the input changes until the time this change is reflected at the output

	The affect of this delay is perpetuated to the other flip flops in cascade, who themselves have their own delay

	At the nth flip flop, the total delay = n x C2Q_DELAY ==> function of number of bits and Flip Flop delay

	This can be tolerable as long as total delay < T (clock period). It is tolerable since there still exists some moments of time to the end of the 
	
	clock period in which the correct output of the counter is reflected, and we can capture it at that time

	However, if total delay > T, then at some point, the correct output will not be reflected at all and hence we cannot use it

	This phenomena of perpetuating delay is also known as rippling, hence the alternative name: Ripple Counters

	Propagation delay of asynchronous counters is very large, while counting the large number of bits.

	For the reasons mentioned above, Ripple Counters cannot be used with high clock frequencies (high clock frequency --> lower clock period T)
	
*/
