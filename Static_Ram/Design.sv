module ram(
  input [7:0] din,
  input [7:0] addr,
  input clk,
  input rst,
  input we,
  output reg [7:0] dout);

  reg [7:0] memory [0:255];
  integer i;
  
  always @(posedge clk) begin
  /*  if (rst) begin
      for (i = 0; i < 256; i = i + 1) begin
        memory[i] <= 8'b0;  // Reset all memory locations
      end*/
    end else begin
      if (we) begin
        memory[addr] <= din;  // Write operation
      end else begin
        dout <= memory[addr];  // Read operation
      end
    end
  end
endmodule
