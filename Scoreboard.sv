class score;                     // Class declaration
  mailbox send;                  // Declare a mailbox instance
  int no_trans;                  // Declare an integer variable to count the number of transactions
  trans tramp;                   // Declare an instance of the trans class

  function new(mailbox send);    // Constructor declaration with a mailbox parameter
    this.send = send;            // Initialize the send mailbox with the passed parameter
  endfunction                    // End of constructor

  task main;                     // Task declaration
    forever begin                // Forever loop to continuously monitor transactions
      send.get(tramp);           // Get the next item from the send mailbox and assign it to tramp
      if(tramp.t)                // If the t field of tramp is true (non-zero)
        $display("Result is as Expected = %0d actual ", tramp.q); // Display a message indicating the result is as expected
      else                       // If the t field of tramp is false (zero)
        $display("Wrong Result.\n\tExpected = %0d actual ", tramp.q); // Display a message indicating the result is wrong
      no_trans++;                // Increment the transaction count
      // tramp.display("[ Scoreboard ]"); // (Commented out) Optionally call a display method on tramp
      #10;                       // Wait for 10 time units
    end
  endtask                       // End of task declaration
  
endclass                        // End of class declaration
