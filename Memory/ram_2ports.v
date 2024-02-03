
module ram_2ports
#(parameter ADDR_WIDTH = 3, DATA_WIDTH = 8)
(
input clk,
input write_en,
input [ADDR_WIDTH - 1: 0] r_addr, // reading address
input [ADDR_WIDTH - 1: 0] w_addr, // writing address
input [DATA_WIDTH - 1: 0] w_data, // writing data
output [DATA_WIDTH - 1: 0] r_data // reading data
);

reg [DATA_WIDTH - 1: 0] memory [0: 2 ** ADDR_WIDTH - 1];

 // synchronous write operation
always @(posedge clk)
begin
    if (write_en)
        memory[w_addr] <= w_data;
end

// asynchronous read
assign r_data = memory[r_addr];

endmodule
