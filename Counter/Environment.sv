`include "Transaction.sv"  // Include the Transaction class definition
`include "Generator.sv"    // Include the Generator class definition
`include "Driver.sv"       // Include the Driver class definition

class envii;
  virtual cou vintf;       //  Declare a virtual interface 'vintf' of type 'cou'
  generator gen;           //  Declare a variable 'gen' of type 'generator'
  driver dri;              //  Declare a variable 'dri' of type 'driver'
  mailbox M1;              //  Declare a mailbox 'M1'
  trans tr;                //  Declare a variable 'tr' of type 'trans'
  
  function new(virtual cou vintf, mailbox M1); // Constructor function to initialize the environment class
    this.vintf = vintf;    // Assign the input virtual interface 'vintf' to the class's 'vintf' variable
    this.M1 = M1;          // Assign the input mailbox 'M1' to the class's 'M1' variable
  endfunction              // End of the constructor function
  
  task mem;                // Define a task named 'mem'
    M1 = new();            // Create a new instance of the mailbox 'M1'
    gen = new(M1);         // Create a new instance of 'generator' and pass the mailbox 'M1'
    dri = new(vintf, M1);  // Create a new instance of 'driver' and pass the virtual interface 'vintf' and mailbox 'M1'
  endtask                  // End of the task 'mem'

  task run;                // Define a task named 'run'
    fork                   // Start parallel execution
      gen.geee;            // Run the 'geee' task of the generator
      dri.driv;            // Run the 'driv' task of the driver
    join                   // End of parallel execution
  endtask                  // End of the task 'run'
endclass                   // End of the class definition
