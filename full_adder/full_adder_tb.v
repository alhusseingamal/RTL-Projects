`timescale 1ns / 1ps
module full_adder_tb;
// inputs
reg a;
reg b;
reg c;

// outputs
wire sum;
wire carry;

// instantiate the UUT
full_adder uut(.a(a), .b(b), .c(c), .sum(sum), .carry(carry));

initial begin
a = 1'b0;
b = 1'b0;
c = 1'b0;
#2 a = 1'b0; b = 1'b0; c = 1'b1; 
#2 a = 1'b0; b = 1'b1; c = 1'b0;
#2 a = 1'b0; b = 1'b1; c = 1'b1;
#2 a = 1'b1; b = 1'b0; c = 1'b0;
#2 a = 1'b1; b = 1'b0; c = 1'b1;
#2 a = 1'b1; b = 1'b1; c = 1'b0;
#2 a = 1'b1; b = 1'b1; c = 1'b1;
end
endmodule
