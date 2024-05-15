class driver;
  trans pack;                //  Declare a variable 'pack' of type 'trans'
  mailbox M1;                //  Declare a mailbox 'M1'
  virtual cou vintf;         //  Declare a virtual interface 'vintf' of type 'cou'
  
  function new(virtual cou vintf, mailbox M1);  //  Constructor function to initialize the driver class
    this.vintf = vintf;       // Assign the input virtual interface 'vintf' to the class's 'vintf' variable
    this.M1 = M1;             // Assign the input mailbox 'M1' to the class's 'M1' variable
  endfunction                 // End of the constructor function

  task driv;                  // Define a task named 'driv'
    repeat(5)                 // Repeat the following block 5 times
    begin
      pack = new();               // Create a new instance of 'trans' and assign it to 'pack'
      M1.get(pack);               // Retrieve a 'pack' from the mailbox 'M1'
      vintf.data = pack.data;     // Assign 'pack.data' to the interface 'vintf.data'
      vintf.load = pack.load;     // Assign 'pack.load' to the interface 'vintf.load'
      vintf.up_down = pack.up_down; // Assign 'pack.up_down' to the interface 'vintf.up_down'
      
      pack.count = vintf.count;   // Update 'pack.count' with the value of 'vintf.count'
      #3;                         // Wait for 3 time units
      $display("load", pack.data); // Display the 'data' field of 'pack'
    end
  endtask                     // End of the task 'driv'
endclass                      // End of the class definition
