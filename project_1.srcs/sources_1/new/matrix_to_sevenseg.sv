`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2026 05:47:04 PM
// Design Name: 
// Module Name: matrix_to_sevenseg
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


module matrix_to_sevenseg(
        output logic JC1, JC2, JC3, JC4,
        input logic JC7, JC8, JC9, JC10,
        input logic clk,
        input logic [3:0] btn,
        output logic [7:0] seg_cat,
        output logic [3:0] seg_an
        
    );
    

    logic ignore_input;
    logic [3:0] sel_number;
    
    matrix_decoder md0 ( .JC1(JC1), .JC2(JC2) , .JC3(JC3) , .JC4(JC4),
                         .JC7(JC7), .JC8(JC8) , .JC9(JC9) , .JC10(JC10),
                         .clk(clk), .nReset(btn[0]), .ignore_input(ignore_input) );
    
    sevenseg_decoder ssd0 ( .hexval(sel_number) , .cathodes(seg_cat[7:0]), .active(~ignore_input), .decimal(0));
                         
    assign seg_an[3:0] = 4'b1110;
    
endmodule
