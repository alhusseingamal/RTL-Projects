
/*
	Memory specifications:
	1 - 128 Memory locations --> 128 = 2**7 --> ADDR_WIDTH = 7, 128 adresses from 0 till 127
	2 - Each memory location is 8-bit (1-byte) wide --> DATA_WIDTH = 8
	3 - Synchronous Write
	4 - Asynchronous Read
*/
module reg_file
#(parameter ADDR_WIDTH = 7, DATA_WIDTH = 8)
(
input clk, // clock signal
input write_en, // write enable
input [ADDR_WIDTH - 1 : 0] address_r, address_w, // the addresses of the memory locations to be read from and wrote to
input [DATA_WIDTH - 1 : 0] data_w, // written data from the outside
input [DATA_WIDTH - 1 : 0] data_r // data read from memory
); 

// The memory construct
reg [DATA_WIDTH - 1 : 0] memory [0 : 2**ADDR_WIDTH - 1];

always @(posedge clk)
begin
	// synchronous write port
	if(write_en)
		memory[address_w] <= data_w;
end

// asynchronous read port
assign data_r = memory[address_r];

endmodule