`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2026 02:19:07 PM
// Design Name: 
// Module Name: bin_counter_tb
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


module bin_counter_tb;



logic nReset;
logic clk;
logic c_en;
logic [7:0] val;

bin_counter #(.MAX_COUNT(64) , .WIDTH(8)) bc0 (.*);

always #2ns clk <= ~clk;

initial begin
    clk = 0;
    nReset = 1;
    c_en = 1;
    
    #2ns nReset = 0;
    #2ns nReset = 1;
    
    #128ns c_en = 0;
    
    #10ns c_en = 1;
    
    #10ns nReset = 0;
    #2ns nReset  = 1;
end


endmodule
