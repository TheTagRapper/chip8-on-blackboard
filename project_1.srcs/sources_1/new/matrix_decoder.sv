`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2026 01:30:21 PM
// Design Name: 
// Module Name: matrix_decoder
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


module matrix_decoder(
        output logic JC1, JC2, JC3, JC4, 
        input logic JC7, JC8, JC9, JC10,
        input logic clk,
        output logic [3:0] sel_number
    );
    
    logic [3:0] rows;
    logic [3:0] columns;
    
    assign rows = {JC4, JC3, JC2, JC1};
    assign columns = {JC10, JC9, JC8, JC7};
    
    logic [2:0] row_no;
    
    logic [2:0] col_no;
    
    
    // Setting the col no so they can scan
    always_ff @(posedge clk) begin     
         col_no += 1;
         
         if (col_no == 2'b00) row_no += 1;
    end
       
       
    // Setting the row_number
    always_comb begin
        case (row_no)
            2'b00 : rows = 4'b0001;
            2'b01 : rows = 4'b0010;
            2'b10 : rows = 4'b0100;
            2'b11 : rows = 4'b1000;
        endcase
        
    end
    
    assign sel_number = (row_no << 2) + columns[col_no];
       
        
endmodule
