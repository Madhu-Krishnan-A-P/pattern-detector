`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2024 20:45:09
// Design Name: 
// Module Name: 101detect
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

module d_flipflop (
    input wire D,
    input wire clk,
    output reg Q
);
    always @(posedge clk) begin
        Q <= D;
    end
endmodule

module pattern_detector (
    input wire clk,    // Clock input
    input wire in,     // Input bit stream
    output wire z      // Output signal (1 when pattern 101 is detected)
);

    wire q1, q2, q3;

    // Instantiate D flip-flops
    d_flipflop dff1 (.D(in), .clk(clk), .Q(q1));
    d_flipflop dff2 (.D(q1), .clk(clk), .Q(q2));
    d_flipflop dff3 (.D(q2), .clk(clk), .Q(q3));

    // Detect pattern "101"
    not not_1(q2inv, q2);
    and and_1(z, q3, q2inv, q1);

endmodule
