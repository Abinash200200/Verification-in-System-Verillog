class trans;
  rand bit[7:0] din;  // Randomized 8-bit data input
  rand bit[7:0] addr; // Randomized 8-bit address
  bit clk;            // Clock signal
  bit we;             // Write enable signal
  reg [7:0] dout;     // Data output
endclass
