class score;
  mailbox mbx;
  int no_trans;
  trans tramp;
  
  // Constructor
  function new(mailbox mbx);
    this.mbx = mbx;
    this.no_trans = 0; // Initialize no_trans to 0
  endfunction
  
  // Task to process transactions and check results
  task main;
    forever begin
      mbx.get(tramp); // Line 1: Get a transaction from the mailbox
      if (tramp.din) // Line 2: Check if the transaction data input is valid
        $display("Result is as Expected = %0d", tramp.din); // Line 3: Display expected result
      else
        $display("Wrong Result.\n\tExpected = %0d", tramp.din); // Line 4: Display wrong result message
      
      no_trans++; // Line 5: Increment the transaction count
      // tramp.display("[ Scoreboard ]"); // Line 6: Optionally display transaction details (commented)
      // #10; // Line 7: Optional delay (commented)
    end
  endtask
  
endclass
