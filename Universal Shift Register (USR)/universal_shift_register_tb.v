`timescale 1ns / 1ps
module universal_shift_register_tb;

localparam n = 4;
reg clk, reset_n, MSB_in, LSB_in;
reg [n - 1 : 0] I;
reg [1:0] s;
wire [n-1:0]Q;
integer i;

universal_shift_register #(.n(n)) uut(
.clk(clk),
.reset_n(reset_n),
.MSB_in(MSB_in),
.LSB_in(LSB_in),
.I(I),
.s(s),
.Q(Q)
);

// define a clock
localparam T = 10;
always
	#(T / 2) clk = ~clk;

initial
begin
	clk = 1'b0;
	s = 2'b00;
	// issue a quick reset for 2ns
	reset_n = 1'b0;
	#2
	reset_n = 1'b1;
	I = 'b0010;
	s = 2'b11;
	@(negedge clk);
	MSB_in = 1'b1;
	@(negedge clk);
	s = 2'b01;
	@(negedge clk);
	MSB_in = 1'b0;
	@(negedge clk);
	LSB_in = 1'b0;
	@(negedge clk);
	s = 2'b10;
	LSB_in = 1'b1;
	@(negedge clk);
	LSB_in = 1'b1;
	@(negedge clk);
	I = 4'b0000;
	s = 2'b11;
	@(negedge clk);
	s = 2'b01;
	#2 MSB_in = 0;
	for(i = 0; i < 6; i = i + 1)
	begin
		@(negedge clk);
		MSB_in = ~MSB_in;
	end

	#20 $stop;
end

endmodule


