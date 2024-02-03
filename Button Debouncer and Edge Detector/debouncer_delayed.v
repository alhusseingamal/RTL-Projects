
module debouncer_delayed #(parameter WAIT = 1_999_999)(
input clk, 
input reset_n,
input noisy,
output debounced
);

wire timer_done, timer_reset;

debouncer_delayed_fsm FSM0(
.clk(clk),
.reset_n(reset_n),
.noisy(noisy),
.timer_done(timer_done),
.timer_reset(timer_reset),
.debounced(debounced)
);


timer_parameter #(.N(WAIT)) T0(
.clk(clk),
.reset_n(~timer_reset),
.en(~timer_reset),
.done(timer_done)
);

endmodule

