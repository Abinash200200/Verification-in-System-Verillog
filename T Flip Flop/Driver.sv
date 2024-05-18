class driv;                        // Class declaration
  trans tramp;                     // Declare an instance of the trans class
  mailbox send;                    // Declare a mailbox instance
  virtual inter ferr;              // Declare a virtual interface of type inter
  
  function new(virtual inter ferr, mailbox send); // Constructor declaration with a virtual interface and mailbox parameters
    this.ferr = ferr;              // Initialize the ferr virtual interface with the passed parameter
    this.send = send;              // Initialize the send mailbox with the passed parameter
  endfunction                      // End of constructor
  
  task dri;                        // Task declaration
    repeat(10);                    // Repeat the following block 10 times
    begin
      tramp = new();               // Create a new instance of the trans class
      send.get(tramp);             // Get the next item from the send mailbox and assign it to tramp
      ferr.t = tramp.t;            // Assign the value of tramp.t to the t signal of the ferr interface
      tramp.q = ferr.q;            // Assign the value of the q signal of the ferr interface to tramp.q
      $display("ferr.t=%0d", ferr.t); // Display the value of ferr.t
      #10;                         // Wait for 10 time units
    end
  endtask                         // End of task declaration
endclass                          // End of class declaration
