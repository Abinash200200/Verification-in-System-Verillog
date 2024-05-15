interface cou;
  logic [3:0] data;     // Declare a 4-bit logic signal named 'data'
  logic load;           // Declare a logic signal named 'load'
  logic clk;            // Declare a logic signal named 'clk' (clock)
  logic rst;            // Declare a logic signal named 'rst' (reset)
  logic up_down;        // Declare a logic signal named 'up_down' to control counting direction
  logic [3:0] count;    // Declare a 4-bit logic signal named 'count'
  
endinterface            // End of the interface definition
