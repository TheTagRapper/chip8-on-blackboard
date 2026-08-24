`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2026 11:01:48 AM
// Design Name: 
// Module Name: program_counter_tb
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


module program_counter_tb;

// Increment
logic ALU_Increment, KPU_Increment;
logic enable_increment;
logic increment_source; // (0 - ALU | 1 - KPU)

// New Address
logic [15:0] stack_address, register_address;
logic enable_address_replace;
logic address_source; // 

logic clk;
logic nReset;
logic [15:0]  Output_Address;

program_counter pc0 (.*);

always #5ns clk <= ~clk;

initial begin
    clk = 0;
    ALU_Increment = 0;
    KPU_Increment = 0;
    enable_increment = 0;
    increment_source = 0;
    
    stack_address = 12'h340;
    register_address = 12'h430;
    enable_address_replace = 0;
    address_source = 0;
    nReset = 1;
    
    #5ns nReset = 0;
    #5ns nReset = 1;
    
    // Testing address replacement - 20ns
    #10ns enable_address_replace = 1;
    #20ns address_source = 1;
    #5ns stack_address = 12'h110; address_source = 1;
    
    // Testing increment - 70ns
    #15ns enable_increment = 1; ALU_Increment = 1; enable_address_replace = 0;
    
    #20ns increment_source = 1;
    #10ns enable_increment = 0;
    #10ns KPU_Increment = 1;
end
endmodule
