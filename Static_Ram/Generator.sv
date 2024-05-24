class generator;
  trans tnx; // Assuming trans is another class for transactions
  mailbox mbx;
  
  // Constructor
  function new(mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  // Task to generate transactions
  task gntr;
    repeat (5) begin
      tnx = new(); // Create a new transaction
      tnx.randomize(); // Randomize the transaction
      mbx.put(tnx); // Put the transaction in the mailbox
      #5;
      $display("Data sent to the driver = %0d", tnx.din);
      #10;
    end
  endtask
endclass
