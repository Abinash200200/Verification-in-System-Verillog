class trans;
  
  rand logic [3:0] data;  // Declare a 4-bit randomizable logic variable named 'data'
  rand bit clk;           // Declare a randomizable bit variable named 'clk'
  rand bit rst;           // Declare a randomizable bit variable named 'rst'
  rand bit load;          // Declare a randomizable bit variable named 'load'
  rand bit up_down;       // Declare a randomizable bit variable named 'up_down'
  reg [3:0] count;        // Declare a 4-bit register variable named 'count'
  
endclass                 //  End of the class definition
