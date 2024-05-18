`include "Transaction.sv"          // Include the Transaction module
`include "Generator.sv"            // Include the Generator module
`include "Driver.sv"               // Include the Driver module
`include "Monitor.sv"              // Include the Monitor module
`include "Scoreboard.sv"           // Include the Scoreboard module

class env;                      // Class declaration
  driv drive;                   // Declare an instance of the driv class
  score s1;                     // Declare an instance of the score class
  virtual inter ferr;           // Declare a virtual interface of type inter
  mailbox send;                 // Declare a mailbox instance
  gener gene;                   // Declare an instance of the gener class
  moni moo;                     // Declare an instance of the moni class
  
  function new(virtual inter ferr, mailbox send); // Constructor declaration with a virtual interface and mailbox parameters
    this.ferr = ferr;           // Initialize the ferr virtual interface with the passed parameter
    this.send = send;           // Initialize the send mailbox with the passed parameter
  endfunction                   // End of constructor
  
  task mem;                     // Task declaration
    send = new();               // Incorrect: Re-assigning send mailbox (should be initialized in the constructor)
    moo = new(ferr, send);      // Initialize the moo instance with the ferr interface and send mailbox
    gene = new(send);           // Initialize the gene instance with the send mailbox
    drive = new(ferr, send);    // Initialize the drive instance with the ferr interface and send mailbox
    s1 = new(send);             // Initialize the s1 instance with the send mailbox
  endtask                       // End of task declaration
  
  task run;                     // Task declaration
    fork                       // Begin parallel execution of tasks
      gene.gen;                // Start the gen task of the gene instance
      drive.dri;               // Start the dri task of the drive instance
      moo.mon();               // Start the mon task of the moo instance
      s1.main();               // Start the main task of the s1 instance
    join                       // Wait for all forked tasks to complete
  endtask                      // End of task declaration
endclass                       // End of class declaration
