class gener;                        // Class declaration
  trans tramp;                      // Declare an instance of the trans class
  mailbox send;                     // Declare a mailbox instance
  
  function new(mailbox send);       // Constructor declaration with a mailbox parameter
    this.send = send;               // Initialize the send mailbox with the passed parameter
  endfunction                       // End of constructor
  
  task gen;                         // Task declaration
    repeat(10)                      // Repeat the following block 10 times
      begin
        tramp = new();              // Create a new instance of the trans class
        tramp.t = 1;                // Assign the value 1 to the t property of tramp
        // tramp.t = $urandom_range(0, 1); // Alternative: Assign a random value between 0 and 1 to tramp.t
        // tramp.randomize();        // Alternative: Randomize the properties of tramp
        send.put(tramp);            // Put the tramp instance into the send mailbox
        $display("display the value of t = %0d", tramp.t); // Display the value of tramp.t
        #10;                        // Wait for 10 time units
      end
  endtask                          // End of task declaration
endclass                           // End of class declaration
