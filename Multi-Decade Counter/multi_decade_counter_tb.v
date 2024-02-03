
// In this example we test our multi_decade_counter to count up to 999

`timescale 1ns / 1ps
module multi_decade_counter_tb;
reg clk, reset_n, en;
wire [3:0]ones, tens, hundreds;
wire done;

// Initiate module under test
multi_decade_counter uut(
.clk(clk),
.en(en),
.reset_n(reset_n),
.ones(ones),
.tens(tens),
.hundreds(hundreds),
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