`timescale 1ns / 1ps
module up_down_load_counter_tb();

parameter n = 4;
reg clk, reset_n, en, up, load;
wire [n-1:0]Q;
reg [n-1:0]D;

// Initiate module under test
up_down_counter #(.n(n)) uut(
.clk(clk),
.reset_n(reset_n),
.en(en),
.up(up),
.load(load),
.D(D),
.Q(Q)
);


// timer
initial
	#450 $stop;

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
en = 1'b0;
up = 1'b1;
load = 1'b0;
#2 	reset_n = 1'b1;
repeat (2) @ (posedge clk);
en = 1'b1;

wait (Q == 15);
en  = 1'b0;

repeat(2) @ (negedge clk);
up = 1'b0;
en = 1'b1;

repeat(2) @ (negedge clk);
D = 9;
load = 1'b1;

@(negedge clk)
load = 1'b0;

end
endmodule
