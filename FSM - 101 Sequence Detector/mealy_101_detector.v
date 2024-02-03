
module mealy_101_detector
(
input clk,
input reset_n,
input x,
input y
);

reg[1:0]state_reg, state_next;

// state definitions - using binary encoding
localparam s0 = 2'b00;
localparam s1 = 2'b01;
localparam s2 = 2'b10;

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
		s0: state_next = (x == 1 ? s1 : s0);
		s1: state_next = (x == 1 ? s1 : s2);
		s2: state_next = (x == 1 ? s1 : s0);
		default: state_next = state_reg;	
	endcase
end

// Output logic	
assign y = (state_reg == s2) & x;

endmodule
