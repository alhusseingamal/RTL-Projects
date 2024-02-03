`timescale 1ns / 1ps // timestep = 1ns, precision up to 1ps
module half_adder_tb;

// inputs
reg a;
reg b;

// outputs
wire s;
wire c;

// Instantiate the Unit Under Test (UUT)
half_adder uut(.s(s), .c(c), .a(a), .b(b));

initial begin
a = 1'b0;
b = 1'b0;
#2 a = 1'b0; b = 1'b1;
#2 a = 1'b1; b = 1'b0;
#2 a = 1'b1; b = 1'b1;
end

initial $monitor("time = %g, s = %b, c = %b, a = %b, b = %b", $time, s, c, a, b);
initial #10 $finish;
endmodule
