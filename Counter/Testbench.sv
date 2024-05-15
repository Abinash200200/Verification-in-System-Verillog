`include "Test.sv"          // Include the Test class definition
`include "Interface.sv"     // Include the interface definition

module counter_tb;
  tee ts;                   // Declare a variable 'ts' of type 'tee'
  mailbox M1;               // Declare a mailbox 'M1'
  cou Mq();                 // Declare an instance 'Mq' of the interface 'cou'
    
  counter ii(               // Instantiate the counter module and connect it to the interface signals
    .data(Mq.data), 
    .load(Mq.load),
    .clk(Mq.clk),
    .rst(Mq.rst),
    .up_down(Mq.up_down),  
    .count(Mq.count)
  );
 
  always #5 Mq.clk = ~Mq.clk; // Generate a clock signal by toggling 'Mq.clk' every 5 time units
  initial begin               // Initial block for setup and waveform dumping
    Mq.clk = 1;               // Initialize clock signal
    Mq.rst = 1;               // Assert reset signal
    #5                        // Wait for 5 time units
    Mq.rst = 0;               // Deassert reset signal
    $dumpfile("counter.vcd"); // Specify the dump file for waveform output
    $dumpvars(1);             // Dump all variables for level 1 of the hierarchy
  end
  
  initial begin               // Initial block for testbench instantiation and execution
    M1 = new();               // Create a new instance of the mailbox 'M1'
    ts = new(Mq, M1);         // Create a new instance of the testbench class 'tee' with the interface 'Mq' and mailbox 'M1'
    fork                     // Start parallel execution
      ts.memm;                // Run the 'memm' task of the testbench class
      ts.run;                 // Run the 'run' task of the testbench class
    join                      // End of parallel execution
  end
  
  initial begin               // Initial block for monitoring signals
    $monitor("time=%0t , Mq.data=%0d , Mq.load=%0d , Mq.clk=%0b , Mq.rst=%0b , Mq.up_down=%0d ,q.count=%0d",
             $time, Mq.data, Mq.load, Mq.clk, Mq.rst, Mq.up_down, Mq.count); // Monitor and display signal values
    #30;                     // Wait for 30 time units
    $finish;                  // End simulation
  end
endmodule                     // End of the testbench module definition
