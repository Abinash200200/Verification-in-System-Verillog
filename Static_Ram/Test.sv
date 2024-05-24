`include "Environment.sv"

class test;
  envii enr;
  virtual inter vif;
  mailbox mbx;
  
  // Constructor
  function new(virtual inter vif, mailbox mbx);
    this.vif = vif;
    this.mbx = mbx;
  endfunction
  
  // Task to initialize the environment
  task run;
    mbx = new(); // Initialize mailbox
    enr = new(vif, mbx); // Initialize the environment with virtual interface and mailbox
  endtask
  
  // Task to run the environment tasks
  task memm;
    fork
      enr.mem(); // Call the mem task to initialize all components
      enr.run(); // Call the run task to start all tasks in parallel
    join
  endtask
endclass
