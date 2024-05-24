`include "Test.sv"
`include "Interface.sv"

module tb;
  test ts;
  inter inr();
  mailbox mbx;
  
  // Instantiate the RAM module and connect it to the interface
  ram ii(
    .din(inr.din), 
    .addr(inr.addr),
    .clk(inr.clk),
    .rst(inr.rst),
    .we(inr.we),
    .dout(inr.dout)
  );
  
  // Clock generation
  always #5 inr.clk = ~inr.clk; // Toggle the clock every 5 time units
  
  // Initial block to set up the reset signal
  initial begin
    inr.clk = 1; //  Initialize clock
    inr.rst = 1; //  Assert reset
    #10;
    inr.rst = 0; //  Deassert reset
  end
  
  // Initial block to set up and run the test environment
  initial begin
    mbx = new(); // Initialize mailbox
    ts = new(inr, mbx); //  Create test object with interface and mailbox
    dumpfile("ram.vcd"); // Setup VCD dump file for waveform
    $dumpvars(0, tb); //  Dump variables for the testbench module

    fork
      ts.memm(); // Call the memm task of the test object
      ts.run(); // Call the run task of the test object
    join
  end
  
  // Initial block to monitor signals and finish simulation
  initial begin
    $monitor("$time=%0t inr.din=%0d inr.addr=%0d inr.clk=%0b inr.rst=%0d inr.we=%0d inr.dout=%0d",
             $time, inr.din, inr.addr, inr.clk, inr.rst, inr.we, inr.dout); // Monitor interface signals
    #100; // Wait for 100 time units
    $finish; // Finish simulation
  end
  
endmodule
