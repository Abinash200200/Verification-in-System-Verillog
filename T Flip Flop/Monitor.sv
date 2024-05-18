class moni;                      // Class declaration
  virtual inter ferr;            // Declare a virtual interface of type inter
  mailbox send;                  // Declare a mailbox instance
  trans tramp;                   // Declare an instance of the trans class
  
  function new(virtual inter ferr, mailbox send); // Constructor declaration with a virtual interface and mailbox parameters
    this.ferr = ferr;            // Initialize the ferr virtual interface with the passed parameter
    this.send = send;            // Initialize the send mailbox with the passed parameter
  endfunction                    // End of constructor
  
  task mon;                      // Task declaration
    send = new();                // Incorrect: Re-assigning send mailbox (should be initialized in the constructor)
    tramp = new();               // Create a new instance of the trans class
    send.put(tramp);             // Put the tramp instance into the send mailbox
    ferr.q = tramp.q;            // Assign the value of tramp.q to the q signal of the ferr interface
    tramp.t = ferr.t;            // Assign the value of the t signal of the ferr interface to tramp.t
    send.put(tramp);             // Put the updated tramp instance into the send mailbox again
    #10;                         // Wait for 10 time units
  endtask                       // End of task declaration
endclass                        // End of class declaration
