
/*
	To swap 2 memory locations, we follow those steps:
	0 - If idle ==> MUX_READ_Y = address_r, MUX_WRITE_Y = address_w
	1 - store *A --> 0x00 ==> MUX_READ_Y = address_A, MUX_WRITE_Y = 0
	2 - store *B --> &A ==> MUX_READ_Y = address_B, MUX_WRITE_Y = address_A
	3 - store *0x00 --> &B ==> MUX_READ_Y = 0, MUX_WRITE_Y = address_B
*/
module swap_reg_file
#(parameter ADDR_WIDTH = 7, DATA_WIDTH = 8)
(
input clk,
input reset_n,
input write_en,
input [ADDR_WIDTH - 1 : 0] address_r, address_w,
input [DATA_WIDTH - 1 : 0] data_w,
output [DATA_WIDTH - 1 : 0] data_r,

// inputs for swap functionality
input [ADDR_WIDTH - 1 : 0] address_A, address_B,
input swap
);

wire [1:0] sel;
wire w;
wire [ADDR_WIDTH - 1 : 0] MUX_WRITE_Y, MUX_READ_Y;

reg_file #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) REG0(
.clk(clk),
.write_en(w ? 1'b1 : write_en),
.address_r(MUX_READ_Y),
.address_w(MUX_WRITE_Y),
.data_w(w ? data_r : data_w), // if we are writing, then we write the data we just read, else there is no change
.data_r(data_r)
);


swap_fsm FSM0(
.clk(clk),
.reset_n(reset_n),
.swap(swap),
.w(w),
.sel(sel)
);


mux_4x1_nbit #(.n(ADDR_WIDTH)) MUX_READ(
.x0(address_r),
.x1(address_A),
.x2(address_B),
.x3('b0),
.s(sel),
.y(MUX_READ_Y)
);


mux_4x1_nbit #(.n(ADDR_WIDTH)) MUX_WRITE(
.x0(address_w),
.x1('b0),
.x2(address_A),
.x3(address_B),
.s(sel),
.y(MUX_WRITE_Y)
);

endmodule
