`timescale 1ns / 1ps
module traffic_light_controller_tb;
    
    reg clk, reset_n, Sa, Sb;
    wire Ra, Ya, Ga;
    wire Rb, Yb, Gb;
    
    
    // Instantiate unit under test
    traffic_light_controller CTRL0(
        .clk(clk),
        .reset_n(reset_n),
        .Sa(Sa),
        .Sb(Sb),
        .Ra(Ra),
        .Ya(Ya),
        .Ga(Ga),
        .Rb(Rb),
        .Yb(Yb),
        .Gb(Gb)
    );
    
    // To make the output of the simulator simpler to read
    // reduce the 6 different lights into light_A and light_B
    // with values R, Y, G
    wire [1:0] light_A, light_B;
    
    localparam  R = 0;
    localparam  Y = 1;
    localparam  G = 2;
    
    assign light_A = Ra? R: Ya ? Y: Ga? G: light_A;
    assign light_B = Rb? R: Yb ? Y: Gb? G: light_B;

    
    // Generate stimuli
    
    // Generating a clk signal
    localparam T = 10;
    always
        #(T / 2) clk = ~clk;
      
        
    initial
    begin
	// initialize clock
	clk = 1'b0;
        // issue a quick reset for 2 ns
        reset_n = 1'b0;
        #2  
        reset_n = 1'b1;
        
        // No cars at either streets        
        Sa = 0;
        Sb = 0;
        
        #80;
        
        // No cars at A, Some cars at B
        Sa = 0;
        Sb = 1;
        #100
        
        // Cars at both streets
        Sa = 1;
        Sb = 1;
        #300;
        
        // Car appears at B, then no cars at either streets
        Sa = 0;
        Sb = 1;     
        #20;
        Sb = 0;
        Sa = 0;
       
        #300 $stop;
     end
        
endmodule