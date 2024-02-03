# Swap Two Memory Locations
This design aims to create procedure for swapping the values of two memory locations.
## Memory specifications:
	1 - 128 Memory locations --> 128 = 2**7 --> ADDR_WIDTH = 7, 128 adresses from 0 till 127
	2 - Each memory location is 8-bit (1-byte) wide --> DATA_WIDTH = 8
	3 - Synchronous Write
	4 - Asynchronous Read

## To swap 2 memory locations, we follow those steps:
	0 - If idle ==> MUX_READ_Y = address_r, MUX_WRITE_Y = address_w
	1 - store *A --> 0x00 ==> MUX_READ_Y = address_A, MUX_WRITE_Y = 0
	2 - store *B --> &A ==> MUX_READ_Y = address_B, MUX_WRITE_Y = address_A
	3 - store *0x00 --> &B ==> MUX_READ_Y = 0, MUX_WRITE_Y = address_B

## A FSM is used to coordintate the steps of the swap operation.

 ## System Diagram
![System Diagram](https://github.com/alhusseingamal/RTL-Projects/blob/main/Memory%20Swapper/Swap%20two%20memory%20locations%20-%20block%20diagram%20and%20FSM.jpg)
