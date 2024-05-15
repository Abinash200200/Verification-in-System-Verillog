class generator;
  trans pack;          // Declare a variable 'pack' of type 'trans'
  mailbox M1;          // Declare a mailbox 'M1'
  
  function new(mailbox M1); // Constructor function to initialize the mailbox
    this.M1 = M1;           // Assign the input mailbox 'M1' to the class's 'M1' variable
  endfunction               // End of the constructor function
  
  task geee;                // Define a task named 'geee'
    repeat(10)              // Repeat the following block 10 times
      begin
        pack = new();          // Create a new instance of 'trans' and assign it to 'pack'
        pack.randomize();      // Randomize the fields of 'pack'
        M1.put(pack);          // Put the randomized 'pack' into the mailbox 'M1'
      //  $display("data",pack.data); // Line 15: (Commented out) Display the 'data' field of 'pack'
      end
  endtask                  //  End of the task 'geee'
endclass                   //  End of the class definition
