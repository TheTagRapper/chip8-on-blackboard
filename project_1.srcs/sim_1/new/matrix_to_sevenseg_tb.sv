`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2026 12:45:22 PM
// Design Name: 
// Module Name: matrix_to_sevenseg_tb
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


module matrix_to_sevenseg_tb;

logic JC1, JC2, JC3, JC4;
logic JC7, JC8, JC9, JC10;
logic clk;
logic [3:0] btn;
logic [9:0] led;
logic [7:0] seg_cat;
logic [3:0] seg_an;

matrix_to_sevenseg mtss0 (.*);

always #2ns clk <= ~clk;

initial begin
    clk = 0;
    btn[0] = 1;
    JC7 = 1;
    JC8 = 0;
    JC9 = 0;
    JC10 = 0;
    
    
    #1ns btn[0] = 0;
    #1ns btn[0] = 1;
end
endmodule
