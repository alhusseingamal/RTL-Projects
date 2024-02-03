`timescale 1ns / 1ps
module synch_up_counter_tb();

parameter n = 4;
reg clk, reset_n;
wire [n-1:0]Q;

synch_up_counter #(.n(n)) uut(
.clk(clk),
.en(1'b1),
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
						Synchronous Counters

*/
