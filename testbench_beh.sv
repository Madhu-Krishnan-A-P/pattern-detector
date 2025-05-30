`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.12.2024 01:03:26
// Design Name: 
// Module Name: testbench
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


module testbench;

reg in; reg clk=1'b0; wire out;

pattern_detector detect(clk, in, out);

initial begin
    #5;
    for (int i=0; i<50; i=i+1) begin
    in = $urandom_range(0, 1);
    #20;
    end

    $finish();
    end
    
    initial begin
    forever begin
    clk = !clk;
    #10;
    end
    end
 
endmodule
