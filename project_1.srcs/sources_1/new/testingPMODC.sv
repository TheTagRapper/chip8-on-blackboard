`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2026 01:18:15 PM
// Design Name: 
// Module Name: testingPMODC
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


module testingPMODC(
        output logic JC1,
        input logic [3:0] btn
    );
    
    assign JC1 = btn[0];

endmodule
