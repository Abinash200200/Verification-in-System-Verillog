module counter(
  input [3:0]data,      // Declare a 4-bit input named 'data'
  input load,           // Declare an input named 'load'
  input clk,            // Declare an input named 'clk' (clock)
  input rst,            // Declare an input named 'rst' (reset)
  input up_down,        // Declare an input named 'up_down' to control counting direction
  output reg [3:0]count // Declare a 4-bit output register named 'count'
);

  always@ (posedge clk) // Always block triggered on the positive edge of 'clk'
    begin
      if(rst)                 //  Check if 'rst' is high (reset is active)
        count <= 0;           //  If reset is active, set 'count' to 0
      else if(load)           //  Otherwise, check if 'load' is high
        count <= data;        //  If load is active, load 'data' into 'count'
      else if(up_down)        //  Otherwise, check if 'up_down' is high (count up)
        count <= count + 1;   //  If 'up_down' is high, increment 'count' by 1
      else                    //  If 'up_down' is low (count down)
        count <= count - 1;   //  Decrement 'count' by 1
    end                       //  End of the always block
endmodule                    //   End of the module definition
