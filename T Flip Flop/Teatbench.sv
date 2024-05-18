`include "Test.sv"                 // Include the T Flip-Flop module
`include "Interface.sv"           // Include the interface module

module tff_tb;                    // Testbench module declaration
  test tb;                        // Declare an instance of the test class
  mailbox send;                   // Declare a mailbox instance
  inter ferr();                   // Declare an instance of the interface

  tff inst(.clk(ferr.clk),        // Instantiate the T Flip-Flop module and connect its ports
           .reset(ferr.reset), 
           .t(ferr.t), 
           .q(ferr.q));
  
  initial begin                   // Initial block for testbench initialization
    send = new();                 // Create a new mailbox instance
    tb = new(ferr, send);         // Instantiate the test class with the interface and mailbox
    fork                         // Begin parallel execution of tasks
      tb.memm;                    // Call the memm task of the test instance
      tb.run;                     // Call the run task of the test instance
    join                         // Wait for all forked tasks to complete
  end
  
  initial begin                   // Initial block for clock generation
    ferr.clk = 1'b1;              // Initialize clock signal
    forever 
      #10 
      ferr.clk = ~ferr.clk;       // Toggle clock signal every 10 time units
  end
  
  initial begin                   // Initial block for reset signal
    ferr.reset = 0;               // Initialize reset signal to 0
    #12;                          // Wait for 12 time units
    ferr.reset = 1;               // Set reset signal to 1
  end
  
  initial begin                   // Initial block for monitoring and dumping waveform
    $monitor("time=%0t clk=%0b reset=%0b t=%0b q=%0b", $time, ferr.clk, ferr.reset, ferr.t, ferr.q); // Monitor signals and print them
    $dumpfile("tff.vcd");         // Specify the dump file for waveform
    $dumpvars(1);                 // Dump all variables for waveform generation
    #80;                          // Run the simulation for 80 time units
    $finish;                      // Finish the simulation
  end
endmodule                         // End of testbench module
