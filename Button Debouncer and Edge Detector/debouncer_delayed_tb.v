
module debouncer_delayed_tb;
    parameter WAIT = 1_999_999;
    reg clk, reset_n;
    reg noisy;
    wire debounced;
    integer i;
    
    // Instantiate unit under test
    debouncer_delayed #(.WAIT(WAIT))uut(
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy),
        .debounced(debounced)
    );

    
    // Generate stimuli
    
    // Generating a clk signal
    localparam T = 10;
    always
	#(T / 2) clk = ~clk;
    
    localparam DELAY = 50_000_000;
    
    initial
    begin
	// initialize the clock
	clk = 1'b0;
        // issue a quick reset for 2 ns
        reset_n = 1'b0;
        noisy = 1'b0;
        #2  
        reset_n = 1'b1;
        
        repeat(2) @(negedge clk);
        noisy = 1'b1;
        
        #(DELAY);
        noisy = 1'b0;
        
        #(DELAY);
        
        repeat(20) @(negedge clk);
        for (i = 0; i < 5; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;
        
        #(DELAY/2);
        for (i = 0; i < 5; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;

        #(DELAY/2);
        noisy = ~noisy;
        for (i = 0; i < 5; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;
                    
        #(DELAY/2);
        noisy = ~noisy;
        
        #(DELAY/2);
        for (i = 0; i < 6; i = i + 1)       
            #(DELAY/40) noisy = ~noisy;

        #(DELAY/2) noisy = 1'b0;                                                
        #(DELAY) $stop;
        
    end        
endmodule
