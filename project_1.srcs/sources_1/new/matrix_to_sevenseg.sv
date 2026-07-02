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
        output logic [9:0] led,
        output logic [7:0] seg_cat,
        output logic [3:0] seg_an
        
    );
    

    logic ignore_input;
    logic [3:0] sel_number;
    
    logic clk_div;
    
    clk_div cd0 ( .clk(clk), .nReset(~btn[0]) ,  .clk_div(clk_div));
    
    matrix_decoder md0 ( .JC1(JC1), .JC2(JC2) , .JC3(JC3) , .JC4(JC4),
                         .JC7(JC7), .JC8(JC8) , .JC9(JC9) , .JC10(JC10),
                         .clk(clk_div), .nReset(~btn[0]), .ignore_input(ignore_input), .sel_number(sel_number) );
    
    logic [3:0] num_to_display;
    
    always_ff @(posedge clk) begin
        if (!ignore_input) num_to_display <= sel_number;
    end
    
    sevenseg_decoder ssd0 ( .hexval(num_to_display) , .cathodes(seg_cat[7:0]), .active(1'b1), .decimal(1'b0));
                         
    assign seg_an[3:0] = 4'b1110;

    assign led[0] = ignore_input;
    assign led[9:6] = sel_number;
    
endmodule
