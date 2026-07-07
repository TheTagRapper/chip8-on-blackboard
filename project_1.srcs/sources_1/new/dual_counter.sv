`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2026 02:46:45 PM
// Design Name: 
// Module Name: dual_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Part of Real Digital Project 1 VGA Step 1
// 
//////////////////////////////////////////////////////////////////////////////////


module dual_counter(
        input logic nReset, clk,
        output [9:0] a_val, b_val,
        input en,
        output A, B
    );
    
    logic clk_b;
    logic a_en, b_en;
    
    // Up to 823 (I assume this is for HSync?)
    bin_counter #(
        .MAX_COUNT(823), 
        .WIDTH(10)
    )
    counter_A(
        .nReset(nReset),
        .clk(clk),
        .c_en(a_en),
        .val(a_val)
    );
    
    // Up to 600 (I assume for VSync)
    bin_counter #(
            .MAX_COUNT(600),
            .WIDTH(10)
    ) 
    counter_B( 
            .nReset(nReset),
            .clk(clk),
            .c_en(b_en),
            .val(b_val)
    );
    
    assign a_en = 1'b1;
    
    assign b_en = (a_val==823); // Triggers on A limit reach
    
    
    // Turns off at half value (is this linked to the front porch and back porch concepts?)
    assign A = (a_val<=412);
    assign B = (b_val<=300);
    
endmodule
