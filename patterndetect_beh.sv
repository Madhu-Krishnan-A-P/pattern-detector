`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.12.2024 01:02:53
// Design Name: 
// Module Name: patterndetect
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module pattern_detector(
    input wire clk,           // Clock signal
    input wire data_in,       // Single-bit input data stream
    output reg detected       // Output signal indicating detection
);

    // Define the pattern to detect (example: 3-bit pattern 101)
    parameter [2:0] PATTERN = 3'b101;  // Pattern to detect (3 bits wide)
    reg [2:0] shift_reg;      // Shift register to store last 3 bits

    always @(posedge clk) begin
        // Shift the register and insert the new data bit
        shift_reg = {shift_reg[1:0], data_in};  // Shift left, insert new bit

        // Check if the pattern matches the shift register
        if (shift_reg == PATTERN) begin
            detected <= 1;  // Pattern detected
        end else begin
            detected <= 0;  // No pattern detected
        end
    end
endmodule