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
    
    logic [3:0] row_drive, column_drive;
    
    assign {JC4, JC3, JC2, JC1} = row_drive;
    assign column_drive = {JC10, JC9, JC8, JC7};
    
    logic [1:0] row_no;
    
    logic [1:0] col_no;
    
    
    // Setting the col no so they can scan
    always_ff @(posedge clk) begin     
         if (col_no == 2'b00) row_no += 1;
         col_no += 1;
    end
       
       
    // Setting the row_number
    always_comb begin
        case (row_no)
            2'b00 : row_drive = 4'b0001;
            2'b01 : row_drive = 4'b0010;
            2'b10 : row_drive = 4'b0100;
            2'b11 : row_drive = 4'b1000;
        endcase
        
    end
    
    //sel_number <= (((row_no_comp[7:4] - 1) >> 1) + 1 + row_no_comp[3:0]);
    
    logic [7:0] row_no_comp;
    assign row_no_comp = { ((row_drive - 1) << 2), ((column_drive -1) << 2)};
   
   always_ff  @(posedge clk) begin
        if (row_no_comp != 8'hCC) begin // Catch Exception
            if ( row_no_comp[3:0] != 4'h4) sel_number <= 4'hB + row_no_comp[7:4];
            else if ( row_no_comp[7:4] != 4'h4 ) sel_number <= (((row_no_comp[7:4] - 1) >> 1) + 1 + row_no_comp[3:0] );
            else if ( row_no_comp[4] == 1'b1) sel_number <= 4'h9 + ( row_no_comp[3:0] >> 1 ) + 1;
            else sel_number <= 4'h0;
        end
   end
        
endmodule
