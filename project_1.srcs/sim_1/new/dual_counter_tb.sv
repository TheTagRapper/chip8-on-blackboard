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

always #1ps clk <= ~clk;

initial begin
    en = 1;
    clk = 0;
    nReset = 1;
    
    #2ps nReset = 0;
    #2ps nReset = 1;
end

    
endmodule
