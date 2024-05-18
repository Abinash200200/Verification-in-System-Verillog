module tff (
  input clk,    // Clock input
  input reset,  // Reset input (active-low)
  input t,      // T (toggle) input
  output reg q  // Output q
);
  
  // Always block triggered on the rising edge of the clock signal
  always @ (posedge clk) begin  
    if (!reset)  // Check if reset is active (active-low reset)
      q <= 0;    // If reset is active, set q to 0
    else  
      if (t)     // If reset is not active, check the T input
        q <= ~q; // If T is high, toggle the value of q
      else  
        q <= q;  // If T is low, retain the current value of q
  end  
endmodule
