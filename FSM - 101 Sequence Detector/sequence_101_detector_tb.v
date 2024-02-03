
module sequence_101_detector_tb;
reg clk, reset_n, x;
wire y_moore, y_mealy;

// instantiate module(s)/unit(s) under test

mealy_101_detector uut_mealy(
.clk(clk),
.reset_n(reset_n),
.x(x),
.y(y_mealy)
);

moore_101_detector uut_moore(
.clk(clk),
.reset_n(reset_n),
.x(x),
.y(y_moore)
);


// generate a clock signal

localparam T = 10;
always
begin
	clk = 1'b0;
	#(T / 2);
	clk = 1'b1;
	#(T / 2);
end

initial
begin
	reset_n = 1'b0;
	x = 1'b0;
	@(negedge clk);
	reset_n = 1'b1;
	
	   x = 1'b0;
	#T x = 1'b0;
	#T x = 1'b1;
	#T x = 1'b1;
	#T x = 1'b0;
	#T x = 1'b1;
	#T x = 1'b1;
	#T x = 1'b0;
	#T x = 1'b0;
	#T x = 1'b1;
	#T x = 1'b0;
	#T x = 1'b1;
	#T x = 1'b0;
	#T x = 1'b1;
	#T x = 1'b0;
	#T x = 1'b1;
	#T x = 1'b0;
	#T x = 1'b0;
	#T $finish;
end

endmodule
