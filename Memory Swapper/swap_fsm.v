
module swap_fsm
(
input clk,
input reset_n,
input swap, // swap / idle
output w, // flag to control whether we should write or not
output [1:0] sel // selector to control the swap operations
);

reg [1:0] state_reg, state_next;

// Our swap functionality is controlled by a 4-state FSM
parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;

always @(posedge clk, negedge reset_n)
begin
	if(~reset_n)
		state_reg <= 0;
	else
		state_reg <= state_next;
end

always @(*)
begin
	state_next = state_reg;
	case(state_reg)
		s0: 
			if(~swap)
				state_next = s0;
			else
				state_next = s1;
		s1:
			state_next = s2;
		s2:
			state_next = s3;
		s3:
			state_next = s0;
		default:
			state_next = s0;
	endcase
end

assign sel = state_reg;
assign w = (state_reg != s0);

endmodule
