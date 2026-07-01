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
  		output logic [3:0] sel_number,
  		//output logic [1:0] row_no,
  		//output logic [1:0] col_no,
  		input logic nReset,
  		//output logic col_on,
  		output logic ignore_input
    );
    
   
   // Read from columns, write to rows
    
    
    logic [1:0] row_no;
    logic [1:0] col_no;
    
  		always_ff @(posedge clk or negedge nReset) begin
       
          
           // Setting iteration
        if (!nReset) begin  
          row_no <= 2'b00;
          col_no <= 2'b00;
        end
        else begin
          if (col_no == 2'b11) row_no <= row_no + 1;
          col_no <= col_no + 1;
        end
          
          
       
    end
    
    // Setting which row to write
    always_comb begin
        case (row_no)
            2'b00 : {JC1, JC2, JC3, JC4} = 4'b1000;
            2'b01 : {JC1, JC2, JC3, JC4} = 4'b0100;
            2'b10 : {JC1, JC2, JC3, JC4} = 4'b0010;
            2'b11 : {JC1, JC2, JC3, JC4} = 4'b0001;
        endcase
     end
     
  	// Setting from which column to read
  	
  	logic col_on;
  
  	always_comb begin
      case (col_no)
        2'b00 : col_on = JC7;
        2'b01 : col_on = JC8;
        2'b10 : col_on = JC9;
        2'b11 : col_on = JC10;
      endcase
    end
  
  
  // Parsing out to sel_number (TO CHANGE SO IT DEPENDS FROM COLUMN INPUT)]
  always_comb begin
    if (col_on) // Flag to ignore output from decoder as no input is appearing from columns
      begin
        if ((col_no != 2'b11) & (row_no != 2'b11)) sel_number <= ({2'b00, row_no} << 1) + (row_no + 1 + col_no); // Digits 
        else if (col_no == 2'b11) sel_number <= {2'b00, row_no} + 4'hC; // Last Column Hex Digits
    	else if (col_no[0] == 1'b0) sel_number <= ({2'b00 , col_no} >> 1) + 4'hA; // A and B
        else sel_number <= 4'b0000; // 0
        
        ignore_input <= 0;
      end 
    else ignore_input <= 1;
  
  end
        
        
     
endmodule
