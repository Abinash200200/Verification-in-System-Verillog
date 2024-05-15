`include "envii.sv"  // Include the environment class definition

class tee;
  envii enb;             // Declare a variable 'enb' of type 'envii'
  virtual cou vintf;     // Declare a virtual interface 'vintf' of type 'cou'
  mailbox M1;            // Declare a mailbox 'M1'
  
  function new(virtual cou vintf, mailbox M1); // Constructor function to initialize the testbench class
    this.vintf = vintf;  // Assign the input virtual interface 'vintf' to the class's 'vintf' variable
    this.M1 = M1;        // Assign the input mailbox 'M1' to the class's 'M1' variable
  endfunction            // End of the constructor function 
  
  task memm;             // Define a task named 'memm'
    M1 = new();          // Create a new instance of the mailbox 'M1'
    enb = new(vintf, M1); // Create a new instance of 'envii' and pass the virtual interface 'vintf' and mailbox 'M1'
  endtask                // End of the task 'memm'
  
  task run;              //  Define a task named 'run'
    fork                 //  Start parallel execution
      enb.mem;           //  Run the 'mem' task of the environment
      enb.run;           //  Run the 'run' task of the environment
    join                 //  End of parallel execution
  endtask                //  End of the task 'run'
endclass                 //  End of the class definition
