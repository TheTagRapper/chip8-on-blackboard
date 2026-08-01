`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2026 05:07:42 PM
// Design Name: 
// Module Name: display_controller_tb
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


module display_controller_tb;

logic clk;
logic [3:0] btn;

logic hdmi_clk_n, hdmi_clk_p;
logic [2:0] hdmi_tx_n;
logic [2:0] hdmi_tx_p;
logic hdmi_out_en;
logic hdmi_hpd;
logic [9:0] led;

display_controller dc0 (.*);

always #5ns clk <= ~clk;

initial begin
    clk = 0;
    btn[0] = 0;
    hdmi_hpd = 1;
    
    #5ns btn[0] = 1;
    #5ns btn[0] = 0;
    
    #2000ns btn[0] = 1;
    #5ns btn[0] = 0;
end
endmodule
