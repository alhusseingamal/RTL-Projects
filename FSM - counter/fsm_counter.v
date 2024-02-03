
module fsm_counter
(
input clk, reset_n, en,
output [2:0]num
);

reg[2:0]state_reg, state_next;

// state definitions - using binary encoding
localparam s0 = 3'b000;
localparam s1 = 3'b001;
localparam s2 = 3'b010;
localparam s3 = 3'b011;
localparam s4 = 3'b100;
localparam s5 = 3'b101;
localparam s6 = 3'b110;
localparam s7 = 3'b111;

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
	if(en)
		case(state_reg)
			s0: state_next = s1;
			s1: state_next = s2;
			s2: state_next = s3;
			s3: state_next = s4;
			s4: state_next = s5;
			s5: state_next = s6;
			s6: state_next = s7;
			s7: state_next = s0;
			default: state_next = state_reg;	
		endcase
	else
		state_next = state_reg;		
end

// Output logic	
assign num = state_reg;

endmodule
