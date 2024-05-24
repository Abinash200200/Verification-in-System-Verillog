class moni;
  mailbox mbx;
  virtual inter vif;
  trans tramp;
  
  // Constructor
  function new(virtual inter vif, mailbox mbx);
    this.vif = vif;
    this.mbx = mbx;
  endfunction
  
  // Task to monitor and transfer data
  task moon;
    tramp = new(); //  Create a new transaction
    mbx.put(tramp); //  Put the initial transaction into the mailbox
    
    //  Transfer data between the interface and the transaction
    vif.dout = tramp.dout;
    tramp.din = vif.din;
    tramp.addr = vif.addr; // Corrected to use vif.addr
    
    mbx.put(tramp); // Put the updated transaction back into the mailbox
    #10; // Wait for 10 time units
  endtask
endclass
