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

// Commented out signals are internal to see on observation  

logic JC1, JC2, JC3, JC4; // JC1 is row 0 
logic JC7, JC8, JC9, JC10; // JC7 is col 0;
logic clk;
logic [3:0] sel_number;
//logic [1:0] row_no;
//logic [1:0] col_no;
logic nReset;
//logic col_on;
logic ignore_input;

matrix_decoder md0 (.*);

always #2ns clk <= ~clk;
  

// One thing this testbench doesn't account for is the fact that it will alternate between on and off for scanning rows

initial begin
  
    $dumpfile("dump.vcd");
  	$dumpvars(1);
    
    // Ensuring 0 is yielded
    JC7 = 1; JC8 = 0; JC9 = 0; JC10 = 0; nReset = 1;
        
    clk = 0;
  
  	#1ns nReset = 0;
  	#1ns nReset = 1;
    
    #62ns JC7 = 0; JC8 = 1;
    
    #64ns JC8 = 0; JC9 = 1;
    
    #64ns JC9 = 0; JC10 = 1;
    
    #64ns JC7 = 1;

end

endmodule
