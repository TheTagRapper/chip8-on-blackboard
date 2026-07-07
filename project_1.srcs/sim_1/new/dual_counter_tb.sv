`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2026 03:10:01 PM
// Design Name: 
// Module Name: dual_counter_tb
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


module dual_counter_tb;

logic nReset, clk;
logic [9:0] a_val, b_val;
logic en;
logic A, B;


dual_counter dc0 (.*);

always #5ns clk <= ~clk;

initial begin
    en = 1;
    clk = 0;
    nReset = 1;
    
    #5ns nReset = 0;
    #5ns nReset = 1;
end

    
endmodule
