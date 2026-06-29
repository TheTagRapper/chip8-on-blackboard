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

initial #200ns $finish;

logic r1, r2, r3, r4, c1, c2, c3, c4;
logic clk;

always #2ns clk <= ~clk;

logic [3:0] end_number;

matrix_decoder md0 ( .JC1(r1), .JC2(r2), .JC3(r3), .JC4(r4),
         .JC7(c1), .JC8(c2), .JC9(c3), .JC10(c4), 
         .clk(clk), 
         .sel_number(end_number)
         );

//string status;

initial begin

    clk = 0;
    //c1 = 0;
    c2 = 0;
    c3 = 0;
    c4 = 0;
    //status = "IDLE";
    
    
    // Testing Basic Input
    c1 = 1; //status = "TESTING BASIC INPUT";
    
    #8ns c1 = 0; c2 = 1; 
    
    #16ns c2 = 0; c3 = 1;
    
    #24ns c3 = 0; c4 = 1;
     
    // Testing multiple columns pressed
end

endmodule
