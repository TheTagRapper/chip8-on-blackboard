`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2026 09:37:03 PM
// Design Name: 
// Module Name: matrix_decoder_tb
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


module matrix_decoder_tb;

logic JC1, JC2, JC3, JC4; // JC1 is row 0 
logic JC7, JC8, JC9, JC10; // JC7 is col 0;
logic clk;
logic [3:0] sel_number;

matrix_decoder md0 (.*);

always #2ns clk <= ~clk;

initial begin
    
    // Ensuring 0 is yielded
    JC7 = 0; JC8 = 0; JC9 = 0; JC10 = 0;
        
    clk = 0;
    
    #64ns JC7 = 1;

end

endmodule
