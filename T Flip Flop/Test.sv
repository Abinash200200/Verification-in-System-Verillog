`include "environment.sv"               // Include the environment module

class test;                      // Class declaration
  env envv;                      // Declare an instance of the env class
  mailbox send;                  // Declare a mailbox instance
  virtual inter ferr;            // Declare a virtual interface of type inter
  
  function new(virtual inter ferr, mailbox send); // Constructor declaration with a virtual interface and mailbox parameters
    this.send = send;            // Initialize the send mailbox with the passed parameter
    this.ferr = ferr;            // Initialize the ferr virtual interface with the passed parameter
  endfunction                    // End of constructor
  
  task memm;                     // Task declaration
    send = new();                // Incorrect: Re-assigning send mailbox (should be initialized in the constructor)
    envv = new(ferr, send);      // Initialize the envv instance with the ferr interface and send mailbox
  endtask                        // End of task declaration
  
  task run;                      // Task declaration
    fork                         // Begin parallel execution of tasks
      envv.mem;                  // Start the mem task of the envv instance
      envv.run;                  // Start the run task of the envv instance
    join                         // Wait for all forked tasks to complete
  endtask                        // End of task declaration
endclass                         // End of class declaration
