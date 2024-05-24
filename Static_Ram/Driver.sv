class dv;
  virtual inter vif; // Assuming 'inter' is your interface
  mailbox mbx;
  trans txn;
  
  // Constructor
  function new(virtual inter vif, mailbox mbx);
    this.vif = vif;
    this.mbx = mbx;
  endfunction
  
  // Task to drive the signals
  task drv;
    repeat (5) begin
      mbx.get(txn); // Get a transaction from the mailbox
      vif.din = txn.din; // Drive the interface signals
      vif.addr = txn.addr;
      vif.we = 1;
      // vif.rst = txn.rst; // Uncomment if necessary
      // vif.clk = txn.clk; // Uncomment if necessary
      #20 vif.we = 0; // De-assert the write enable after some delay
      txn.dout = vif.dout; // Capture the output data
      $display("Data received from generator: %0d", vif.din);
      // @(posedge vif.clk); // Uncomment if necessary
      #20;
    end
  endtask 
endclass
