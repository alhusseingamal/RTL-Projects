
module mealy_1001_010_detector
(
input clk,
input reset_n,
input x,
output y
);

reg[2:0]state_reg, state_next;

// state definitions - using binary encoding
localparam s0 = 3'b000;
localparam s1 = 3'b001;
localparam s2 = 3'b010;
localparam s3 = 3'b011;
localparam s4 = 3'b100;
localparam s5 = 3'b101;

// state register
always @(posedge clk, negedge reset_n)
begin
	if(~reset_n)
		state_reg <= s0;
	else
		state_reg <= state_next;
end

// Next state logic
always @(*)
begin
	case(state_reg)
		s0: state_next = (x ? s4 : s1);
		s1: state_next = (x ? s2 : s1);
		s2: state_next = (x ? s4 : s3);
		s3: state_next = (x ? s2 : s5);
		s4: state_next = (x ? s4 : s3);
		s5: state_next = (x ? s2 : s1);
		default: state_next = state_reg;	
	endcase
end

// Output logic	
assign y = ( (state_reg == s2) & (state_next == s3) & ~x ) | ( (state_reg == s5) & (state_next == s2) & x );

endmodule
