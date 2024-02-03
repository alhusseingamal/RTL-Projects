`timescale 1ns / 1ps
module LFSR_tb;
    
    localparam n = 3;
    reg clk, reset_n;
    wire [1:n] Q;
    
    // Instantiate unit under test
    LFSR #(.n(n)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .Q(Q)
    );
    

    
    // Generating a clk signal
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial
    begin
        // issue a quick reset for 2 ns
        reset_n = 1'b0;
        #2  
        reset_n = 1'b1;
        
        repeat(2) @(negedge clk);
        wait (Q == 1);
        
        #20 $stop;
    end
    
endmodule
