`include "Transaction.sv"
`include "Generator.sv"
`include "Driver.sv"
`include "Scoreboard.sv"
`include "Monitor.sv"

class envii;
  trans tramp;
  mailbox mbx;
  generator genn;
  dv drxx;
  virtual inter vif;
  score sc;
  moni mo;
  
  // Constructor
  function new(virtual inter vif, mailbox mbx);
    this.vif = vif;
    this.mbx = mbx;
  endfunction  
  
  // Task to initialize components
  task mem;
    mbx = new(); // Initialize mailbox
    genn = new(mbx); //  Initialize generator
    drxx = new(vif, mbx); //  Initialize driver
    sc = new(mbx); // Initialize scoreboard
    mo = new(vif, mbx); // Initialize monitor
  endtask
  
  // Task to run the simulation
  task run;
    fork
      genn.gntr(); //  Start generator task
      drxx.drv(); //  Start driver task
      sc.main(); //  Start scoreboard task
      mo.moon(); // Start monitor task
    join
  endtask
endclass
