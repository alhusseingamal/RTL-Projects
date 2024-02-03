
module priority_encoder_generic_tb ();

// 1) Declare local reg and vire identifiers

parameter n = 6;

reg [n - 1 : 0]w;

wire z;

wire [$clog2(n) - 1 : 0] y;

integer k;

// 2) Instantiate the unit under test 
priority_encoder_generic #(.n(n)) uut(.w(w), .z(z), .y(y));

// 3) Specify a stopwatch to stop the simulation 
initial #(10 * 2**n + 10) $finish;

// 4) Generate stimuli, using initial and always 

initial
begin
	w = 0;
	for (k = 0; k < 2**n * 2; k = k + 1)
	begin
		#5 w = w + 1;
	end
end
endmodule
