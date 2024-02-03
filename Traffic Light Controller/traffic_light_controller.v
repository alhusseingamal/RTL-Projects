
/*
Problem Specification
- Intersection between two streets: A(main street) and B
- if Sa = 1 then a car is approaching at street A. Similarly Sb = 1 indicates a car is approaching street B.
- street A has a green light until a car approaches on street B
- In that case, street B has 50 seconds of green light
- If 50 seconds of green light for street B finish and a car is approcahing on B (Sb = 1) while no car is approaching at A, 
  then the period extends to an additional 10 seconds. The period keeps extending as long as a car is approaching street B and none on street A.
- When A is green, it remains green for at least 60 seconds, and changes only when a car approaches on B.

- The controller should have 6 outputs, indicating Red, Yellow, Green for both streets A and B: Ra Ya Ga and Rb Yb Gb

*/

module traffic_light_controller(
input clk,
input reset_n,
input Sa,
input Sb,
output reg Ra, Ya, Ga,
output reg Rb, Yb, Gb
);

reg[3:0] state_reg, state_next;

localparam s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5, s6 = 6, s7 = 7, s8 = 8, s9 = 9, s10 = 10, s11 = 11, s12 = 12;

always @(posedge clk, negedge reset_n)
begin
	if(~reset_n) state_reg <= s0;
	else state_reg <= state_next;	
end

always @(*)
begin
	state_next = state_reg;
	case(state_reg)
		s0: state_next = s1;
		s1: state_next = s2;
		s2: state_next = s3;
		s3: state_next = s4;
		s4: state_next = s5;
		s5: state_next = ~Sb ? s5: s6;
		s6: state_next = s7;
		s7: state_next = s8;
		s8: state_next = s9;
		s9: state_next = s10;
		s10: state_next = s11;
		s11: state_next = (~Sa & Sb) ? s11 : s12;
		s12: state_next = s0;
		default: state_next = s0;
	endcase
end


// output logic
// Output logic
    always @(*)
    begin
        Ra = 1'b0;
        Ya = 1'b0;
        Ga = 1'b0;
        Rb = 1'b0;
        Yb = 1'b0;
        Gb = 1'b0;
        case(state_reg)
            s0, s1, s2, s3, s4, s5:
                begin
                    Ga = 1'b1;
                    Rb = 1'b1;
                end
            s6: 
                begin
                    Ya = 1'b1;
                    Rb = 1'b1;
                end
            s7, s8, s9, s10, s11:
                begin
                    Ra = 1'b1;
                    Gb = 1'b1;
                end
            s12:
                begin
                    Ra = 1'b1;
                    Yb = 1'b1;
                end                                       
        endcase
    end
endmodule