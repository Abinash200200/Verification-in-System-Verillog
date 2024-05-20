interface inter;
  logic [7:0] din;   // Data input
  logic [7:0] addr;  // Address input
  logic clk;         // Clock signal
  logic we;          // Write enable signal
  logic rst;         // Reset signal
  logic [7:0] dout;  // Data output
endinterface
